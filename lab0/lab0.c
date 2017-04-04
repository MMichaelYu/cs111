#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
//Flag set by '--segfault'
static int segfault_flag = 0;

void handler(int sig)
{
  if (sig == SIGSEGV)
    {
      fprintf(stderr, "Segmentation fault caught.\n");
      exit(3);
    }
}

int main(int argc, char **argv)
{
  int c;
  int ifd = 0;
  int ofd = 1;
  while (1)
    {
      static struct option long_options[] = 
	{
	  //These options set a flag.
	  {"segfault", no_argument, &segfault_flag, 1},
	  //These options don't set a flag
	  {"input", required_argument, 0, 'i'},
	  {"output", required_argument, 0, 'o'},
	  {"catch", no_argument, 0, 'c'}
	};
      //getopt_long stores the option index here
      int option_index = 0;
      c = getopt_long(argc, argv, "ci:o:", long_options, &option_index);

      //Detect the end of the options
      if (c == -1)
	break;
      
      switch (c)
	{
	case 'i':
	  ifd = open(optarg, O_RDONLY);
	  if (ifd >= 0) 
	    {
	      close(0);
	      dup(ifd);
	      close(ifd);
	    }
	  else
	    {
	      fprintf(stderr, "Unable to open specified input file %s\n", optarg);
	      perror("Unable to open specified input file");
	      exit(1);
	    }
	  break;

	case 'o':
	  ofd = creat(optarg, 0666);
	  if (ofd >= 0) 
	    {
	      close(1);
	      dup(ofd);
	      close(ofd);
	    }
	  else
	    {
	      fprintf(stderr, "Unable to create specified output file %s\n", optarg);
	      perror("Unable to create specified output file");
	      exit(2);
	    }
	  break;

	case 'c':
	  signal(SIGSEGV, handler);
	  break;

	default:
	  break;
	}
    }

  if (segfault_flag)
    {
      char *bad_ptr = NULL;
      *bad_ptr = 'a';
    }

  char buff[256];
  int read_size = 0;
  while (read_size = read(0, buff, 1) != 0)
    {
      write(1, buff, read_size);
    }

  exit(0);
}
