#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <sys/resource.h>

static int verbose_flag = 0, append_flag = 0, cloexec_flag = 0, creat_flag = 0, 
  directory_flag = 0, dsync_flag = 0, excl_flag = 0, nofollow_flag = 0, nonblock_flag = 0,
  rsync_flag = 0, sync_flag = 0, trunc_flag = 0, profile_flag = 0;

struct cmd
{
  int pid;
  char* name;
  char args[128];
  //char* args;
};

void handler(int sig, siginfo_t *dum1, void *dum2)
{
  fprintf(stderr, "%d caught\n", sig);
  exit(sig);
}

int main(int argc, char* argv[])
{
  int return_num = 0;
  int c;
  int ifd = 0;
  int file_num = 0;
  int cmd_num = 0;
  int pipe_check[argc];
  int file_list[argc];
  //char* argz[argc];
  char arg[128] = "";
  struct rusage usage, c_usage;
  struct cmd cmd_list[argc];
  //rusage variables
  struct timeval utime_after, stime_after, utime_before, stime_before;
  double utime, stime, utime_total = 0, stime_total = 0;
  static struct option long_options[]=
    {
      {"append", no_argument, &append_flag, 1},
      {"cloexec", no_argument, &cloexec_flag, 1},
      {"creat", no_argument, &creat_flag, 1},
      {"directory", no_argument, &directory_flag, 1},
      {"dsync", no_argument, &dsync_flag, 1},
      {"excl", no_argument, &excl_flag, 1},
      {"nofollow", no_argument, &nofollow_flag, 1},
      {"nonblock", no_argument, &nonblock_flag, 1},
      {"rsync", no_argument, &rsync_flag, 1},
      {"sync", no_argument, &sync_flag, 1},
      {"trunc", no_argument, &trunc_flag, 1},
      {"rdonly", required_argument, 0, 'r'},
      {"wronly", required_argument, 0, 'w'},
      {"rdwr", required_argument, 0, 'a'},
      {"command", required_argument, 0, 'c'},
      {"abort", no_argument, 0, 'd'},
      {"verbose", no_argument, &verbose_flag, 1},
      {"close", required_argument, 0, 'b'},
      {"catch", required_argument, 0, 'e'},
      {"default", required_argument, 0, 'f'},
      {"ignore", required_argument, 0, 'g'},
      {"pause", no_argument, 0, 'h'},
      {"wait", no_argument, 0, 'i'},
      {"pipe", no_argument, 0, 'j'},
      {"profile", no_argument, 0, 'x'},
      {0,0,0,0}
    };
  while (1)
    {
      int option_index = 0;
      c = getopt_long(argc, argv, "", long_options, &option_index);

      if (c == -1)
	break;

      if (getrusage(RUSAGE_SELF, &usage) == -1)
	{
	  fprintf(stderr, "Error with getrusage()\n");
	  return_num = 1;
	}
      utime_before = usage.ru_utime;
      stime_before = usage.ru_stime;
      if (verbose_flag)
	{
	  printf("--%s %s", long_options[option_index].name, optarg);
	  if (c != 'c')
	    printf("\n");
	}
      switch (c)
	{
	  //pipe
	case 'j':;
	  int pipefd[2];
	  if (pipe(pipefd) != 0)
	    {
	      fprintf(stderr, "Error while creating pipe\n");
	      return_num = 1;
	      continue;
	    }
	  file_list[file_num] = pipefd[0];
	  pipe_check[file_num] = 1;
	  file_num++;
	  file_list[file_num] = pipefd[1];
	  pipe_check[file_num] = 1;
	  file_num++;
	  break;
	  //wait
	case 'i':;
	  int status;
	  double c_utime = 0;
	  double c_stime = 0;
	  for (int m = 0; m < file_num; m++)
	    {
	      close(file_list[m]);
	    }
	  for (int i = 0; i < cmd_num; i++)
	    {
	      waitpid(cmd_list[i].pid, &status, 0);
	      if(WIFEXITED(status))
		{
		  fprintf(stdout, "%d %s %s\n" , WEXITSTATUS(status), cmd_list[i].name, cmd_list[i].args);
		}
	      else
		{
		  fprintf(stderr, "Error terminating child %s", cmd_list[i].name);
		} 
	    }
	      if (profile_flag)
		{
		  //get childrens' time
		  if (getrusage(RUSAGE_CHILDREN, &c_usage) == -1)
		    {
		      fprintf(stderr, "Error with getrusage()\n");
		      return_num = 1;
		    }
		  else
		    {
		      utime_after = c_usage.ru_utime;
		      stime_after = c_usage.ru_stime;
		      c_utime = (double)utime_after.tv_sec + (double)utime_after.tv_usec/1000000.0;
		      c_stime = (double)stime_after.tv_sec + (double)stime_after.tv_usec/1000000.0;
		    }
		  //get parent's time
		  if (getrusage(RUSAGE_SELF, &usage) == -1)
		    {
		      fprintf(stderr, "Error with getrusage()\n");
		      return_num = 1;
		    }
		  else
		    {
		      utime_after = usage.ru_utime;
		      stime_after = usage.ru_stime;
		      utime = c_utime + (double)utime_after.tv_sec + (double)utime_after.tv_usec/1000000.0
			- (double)utime_before.tv_sec - (double)utime_before.tv_usec/1000000.0;
		      stime = c_stime + (double)stime_after.tv_sec + (double)stime_after.tv_usec/1000000.0
			- (double)stime_before.tv_sec - (double)stime_before.tv_usec/1000000.0;
		      utime_total += utime;
		      stime_total += stime;
		      fprintf(stdout, "user %f sys %f\n", utime, stime);
		    }
		
		}
	  break;
	  //pause
	case 'h':
	  pause();
	  break;
	  //ignore
	case 'g':{
	  struct sigaction sig;
	  sig.sa_handler = SIG_IGN;
	  sigaction(strtol(optarg, NULL, 10), &sig, NULL);
	  break;}
	  //default
	case 'f':{
	  struct sigaction sig;
	  sig.sa_handler = SIG_DFL;
	  sigaction(strtol(optarg, NULL, 10), &sig, NULL);
	  break;}
	  //catch
	case 'e':{
	  struct sigaction sig;
	  sig.sa_sigaction = handler;
	  sigaction(strtol(optarg, NULL, 10), &sig, NULL);
	  break;}
	  //abort
	case 'd':;
	  char *bad_ptr = NULL;
	  *bad_ptr = 'a';
	  break;
	  //close
	case 'b':;
	  int nth_file = strtol(optarg, NULL, 10);
	  if (file_num < nth_file)
	    {
	      fprintf(stderr, "Unable to close the %dth file because less than %d files have been opened", nth_file, nth_file);
	    return_num = 1;
	    continue;
	    }
	  else
	    {
	      int check = close(file_list[nth_file-1]);
	      file_list[nth_file-1] = -1;
	      if (check != 0)
		{
		  fprintf(stderr, "Error closing %dth file", nth_file);
		  return_num = 1;
		  continue;
		}
	    }
	  break;
	  //rdwr
	case 'a':

	  ifd = open(optarg, O_RDWR | append_flag * O_APPEND | cloexec_flag * O_CLOEXEC | creat_flag * O_CREAT 
		     | directory_flag * O_DIRECTORY | dsync_flag * O_DSYNC | excl_flag * O_EXCL 
		     | nofollow_flag * O_NOFOLLOW | nonblock_flag * O_NONBLOCK | rsync_flag * O_RSYNC 
		     | sync_flag * O_SYNC | trunc_flag * O_TRUNC, 0666);

	  append_flag = cloexec_flag = creat_flag = directory_flag = dsync_flag = excl_flag 
	    = nofollow_flag = nonblock_flag = rsync_flag = sync_flag = trunc_flag = 0;

	  pipe_check[file_num] = 0;
	  if (ifd >= 0)
	    {
	      file_list[file_num] = ifd;
	      file_num++;
	    }
	  else
	    {
	      fprintf(stderr, "Unable to open file %s in read and write mode.\n", optarg);
	      file_list[file_num] = -1;
	      return_num = 1;
	      continue;
	    }
	  break;
	case '?':
	  fprintf(stderr, "Error with option %s", long_options[option_index].name);
	  return_num = 1;
	  break;
	  //rdonly
	case 'r':

	  ifd = open(optarg, O_RDONLY | append_flag * O_APPEND | cloexec_flag * O_CLOEXEC 
		     | creat_flag * O_CREAT | directory_flag * O_DIRECTORY 
		     | dsync_flag * O_DSYNC | excl_flag * O_EXCL | nofollow_flag * O_NOFOLLOW 
		     | nonblock_flag * O_NONBLOCK | rsync_flag * O_RSYNC 
		     | sync_flag * O_SYNC | trunc_flag * O_TRUNC, 0666);

	  append_flag = cloexec_flag = creat_flag = directory_flag = dsync_flag = excl_flag 
	    = nofollow_flag = nonblock_flag = rsync_flag = sync_flag = trunc_flag = 0;

	  pipe_check[file_num] = 0;
	  if (ifd >= 0)
	    {
	      file_list[file_num] = ifd;
	      file_num++;
	    }
	  else
	    {
	      fprintf(stderr, "Unable to open file %s in read-only.\n", optarg);
	      file_list[file_num] = -1;
	      return_num = 1;
	      continue;
	    }
	  break;
	  //wronly
	case 'w':

	  ifd = open(optarg, O_WRONLY | append_flag * O_APPEND | cloexec_flag * O_CLOEXEC 
		     | creat_flag * O_CREAT | directory_flag * O_DIRECTORY 
		     | dsync_flag * O_DSYNC | excl_flag * O_EXCL | nofollow_flag * O_NOFOLLOW 
		     | nonblock_flag * O_NONBLOCK | rsync_flag * O_RSYNC 
		     | sync_flag * O_SYNC | trunc_flag * O_TRUNC, 0666);

	  append_flag = cloexec_flag = creat_flag = directory_flag = dsync_flag = excl_flag 
	    = nofollow_flag = nonblock_flag = rsync_flag = sync_flag = trunc_flag = 0;

	  pipe_check[file_num] = 0;
	  if (ifd >= 0)
	    {
	      file_list[file_num] = ifd;
	      file_num++;
	    }
	  else
	    {
	      fprintf(stderr, "Unable to open file %s in write-only.\n", optarg);
	      file_list[file_num] = -1;
	      return_num = 1;
	      continue;
	    }
	  break;
	  //command
	case 'c': ;

	  int opt_end = optind;
	  for (int j = optind; j < argc; j++)
	    {
	      if (strstr(argv[j], "--") != NULL)
		{
		  opt_end = j;
		  break;
		}
	      else if (verbose_flag)
		printf(" %s", argv[j]);
	      if (j == (argc - 1))
		opt_end = argc;
	    }
	  if(verbose_flag)
	    printf("\n");
	  //check invalid files
	  int ifd_index = optind-1;
	  int ifd_check = 0;
	  for (int i = 0; i < 3; i++)
	    {
	    int index = strtol(argv[ifd_index+i], NULL, 10);
	    if (file_num <= index)
	      {
		fprintf(stderr, "Command argument \'%d\' is invalid\n", index);
		ifd_check = 1;
		break;
	      }
	    if (file_list[index] == -1)
	      {
		fprintf(stderr, "Command argument \'%d\' is invalid\n", index);
		ifd_check = 1;
		break;
	      }
	    }
	  if (ifd_check)
	    break;

	  pid_t child = fork();
	  if (child == 0)
	    {
	      int arg_iter = optind-1;
	      for (int k = 0; k < 3; k++)
		{
		  int index = strtol(argv[arg_iter], NULL, 10);
		  arg_iter++;
		  dup2(file_list[index], k);
		}
	      int num_args = opt_end - arg_iter;
	      int arg_index; 
	      char* command = argv[arg_iter];
	      arg_iter++;
	      //add +1 to argSize for malloc for null
	      char** command_args = (char**)malloc((num_args+1)*sizeof(char*));
	      command_args[0] = command;
	      for (arg_index = 1; arg_index < num_args; arg_index++)
		{
		  command_args[arg_index] = argv[arg_iter];
		  arg_iter++;
		}
	      
	       for (int n = 0; n < file_num; n++)
		 {
		   close (file_list[n]);
		 }
	      
	      command_args[arg_index] = NULL;
	      execvp(command, command_args);
	      //if code reaches here, there was an error
	      fprintf(stderr, "error executing command %s\n", command);
	      return 1;

	    }
	  char arg[128] = "";
	  int l = 0;
	  for (l = optind+3; l < opt_end; l++)
	    {
	      strcat(arg, argv[l]);
	      strcat(arg, " ");
	      //strcat(argz[cmd_num], argv[l]);
	      //strcat(argz[cmd_num], " ");
	    }

	  cmd_list[cmd_num].pid = child;
	  cmd_list[cmd_num].name = argv[optind+2];
	  strcpy (cmd_list[cmd_num].args, arg);
	  //cmd_list[cmd_num].args = argz[cmd_num];

	  cmd_num++;
	  //fprintf(stdout,"%d",cmd_num);
	  break;
	default:
	  break;
	}
      if (profile_flag)
	{
	  if (c != 'i')
	    {
	      if (getrusage(RUSAGE_SELF, &usage) == -1)
		{
		  fprintf(stderr, "Error with getrusage()");
		  return_num = 1;
		}
	      else
		{
		  utime_after = usage.ru_utime;
		  stime_after = usage.ru_stime;
		  utime = (double)utime_after.tv_sec + (double)utime_after.tv_usec/1000000.0
		    - (double)utime_before.tv_sec - (double)utime_before.tv_usec/1000000.0;
		  stime = (double)stime_after.tv_sec + (double)stime_after.tv_usec/1000000.0
		    - (double)stime_before.tv_sec - (double)stime_before.tv_usec/1000000.0;
		  utime_total += utime;
		  stime_total += stime;
		  fprintf(stdout, "user %f sys %f\n", utime, stime);
		  
		}
	    }
	}
      if (c == 'x')
	profile_flag = 1;
    }
  fprintf(stdout, "user total %f sys total %f\n", utime_total, stime_total);
  return return_num;
}
