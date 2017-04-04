#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <pthread.h>
#include <math.h>
#include <mraa/aio.h>
#include <sys/time.h>
#include <string.h>

#define BUFSIZE 1024

FILE *logfile;
int T = 3;
int sockfd;
int cont = 1;
int skip = 1;
int use_F = 1;
/* 
 *  * error - wrapper for perror
 *   */
void error(char *msg) {
	perror(msg);
	exit(0);
}

float convert_reading(int reading)
{
	int B = 4275;
	float R = 1023.0/((float) reading)-1.0;
	R = 100000.0*R;
	float temperature=1.0/(log(R/100000.0)/B+1/298.15)-273.15;
	if (use_F)
		temperature = temperature * 9 / 5 + 32;
	return temperature;
}

void *receive_thread(void *x)
{
	//fprintf(stdout, "receive\n");

	int n;
	//printf("about to enter loop\n");
	while (cont)
	{

		//logfile = fopen("abc.txt", "a+");
		char buff[50];
		memset(buff,0, 50);
		//printf("before read\n");	
		n = read(sockfd, buff, 50);

		if (n < 0)
			error("Error reading from socket");
		//printf("after read\n");
		//fprintf(logfile, "%s\n", buff)



		if (strcmp(buff, "OFF") == 0)
		{
			fprintf(logfile, "%s\n", buff);
			printf("%s\n", buff);
			exit(0);
		}
		else if(strcmp(buff, "START") == 0)
		{
			fprintf(logfile, "%s\n", buff);
			skip = 1;
		}
		else if(strcmp(buff, "STOP") == 0)
		{
			fprintf(logfile, "%s\n", buff);
			skip = 0;
		}
		else if(strcmp(buff, "SCALE=F") == 0)
		{
			fprintf(logfile, "%s\n", buff);
			use_F = 1;
		}
		else if(strcmp(buff, "SCALE=C") == 0)
		{
			fprintf(logfile, "%s\n", buff);
			use_F = 0;
		}
		else if(strcmp(buff, "DISP Y") == 0)
		{
			fprintf(logfile, "%s\n", buff);
		}
		else if(strcmp(buff, "DISP N") == 0)
		{
			fprintf(logfile, "%s\n", buff);
		}
		else if(strncmp(buff, "PERIOD=", 7) == 0)
		{	int i = 7;
			while(buff[i] == '0')
				i++;
			if(buff[i] == '\0')
				fprintf(logfile, "%s I\n", buff);
			else
			{
				long num = strtol(buff+i, NULL, 10);
				if (num <= 0 || num > 36000)
					fprintf(logfile, "%s I\n", buff);
				else
				{
					fprintf(logfile, "%s\n", buff);
					T = (int)num;
				}
			}
		}
		else
		{
			fprintf(logfile, "%s I\n", buff);
		}
		printf("%s\n", buff);

		fflush(logfile);
		//fclose(logfile);

	}
	return NULL;
}

void *send_thread(void *x)
{
	//printf("sendthread");
	uint16_t value;
	mraa_aio_context tmpr;
	tmpr = mraa_aio_init(0);
	int n;
	char buf[10];
	memset(buf, 0, 10);
	strcpy(buf, "704637121");
	char sendbuf[50];
	n = write(sockfd, buf, strlen(buf));
	if (n < 0)
		error("Error writing to socket");
	//logfile = fopen("part2_log.txt", "a+");
	while (cont)
	{
		if (skip)
		{
			value = mraa_aio_read(tmpr);
			float converted_tmpr = convert_reading(value);
			time_t current_time = time(NULL);
			struct tm *formatted_time;
			formatted_time = localtime(&current_time);
			char time_str[10];
			memset(time_str, 0, 10);
			strftime(time_str, 9, "%H:%M:%S", formatted_time);
			memset(sendbuf, 0, 50);
			strcpy(sendbuf, "704637121 TEMP=");
			sprintf(sendbuf+15, "%.1f", converted_tmpr);
			fprintf(logfile, "%s %.1f\n", time_str, converted_tmpr);
			printf("%s\n", sendbuf);	
			n = write(sockfd, sendbuf, 20);
			if (n < 0)
				error("Error writing to socket");

			fflush(logfile);
		}
		sleep(T);
	}

	//fclose(logfile);
	return NULL;
}

int main(int argc, char **argv)
{
	int portno, n;
	struct sockaddr_in serveraddr;
	struct hostent *server;
	char *hostname;
	char buf[BUFSIZE];

	logfile = fopen("lab4_2.log", "w+");
	if (logfile == NULL)
		fprintf(stderr, "Error creating logfile.\n");
	/* check command line arguments */
	if (argc != 3) {
		fprintf(stderr,"usage: %s <hostname> <port>\n", argv[0]);
		exit(0);
	}
	hostname = argv[1];
	portno = atoi(argv[2]);

	/* socket: create the socket */
	sockfd = socket(AF_INET, SOCK_STREAM, 0);
	if (sockfd < 0) 
		error("ERROR opening socket");

	/* gethostbyname: get the server's DNS entry */
	server = gethostbyname(hostname);
	if (server == NULL) {
		fprintf(stderr,"ERROR, no such host as %s\n", hostname);
		exit(0);
	}

	/* build the server's Internet address */
	bzero((char *) &serveraddr, sizeof(serveraddr));
	serveraddr.sin_family = AF_INET;
	bcopy((char *)server->h_addr, 
			(char *)&serveraddr.sin_addr.s_addr, server->h_length);
	serveraddr.sin_port = htons(portno);

	/* connect: create a connection with the server */
	if (connect(sockfd,(struct sockaddr *) &serveraddr, sizeof(serveraddr)) < 0) 
		error("ERROR connecting");

	//printf("socket created\n");
	//fprintf(stdout,"creating threads");
	pthread_t sending_thread;
	pthread_t receiving_thread;

	if(pthread_create(&sending_thread, NULL, send_thread, NULL))
	{
		fprintf(stderr, "Error creating thread\n");
		return 1;
	}


	if(pthread_create(&receiving_thread, NULL, receive_thread, NULL))
	{
		fprintf(stderr, "Error creating thread\n");
		return 2;
	}


	if(pthread_join(sending_thread, NULL))
	{
		fprintf(stderr, "Error joining threads\n");
		return 1;
	}


	if(pthread_join(receiving_thread, NULL))
	{
		fprintf(stderr, "Error joining threads\n");
		return 2;
	}
	//printf("closing socket");
	fclose(logfile);
	close(sockfd);
	return 0;
}
