#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <string.h>

static int verbose_flag = 0;

int main(int argc, char* argv[]){
  int return_num = 0;
  int c;
  int ifd = 0;
  int file_num = 0;
  int* file_list = (int*) malloc(argc*sizeof(int));

  static struct option long_options[]=
    {
      {"rdonly", required_argument, 0, 'r'},
      {"wronly", required_argument, 0, 'w'},
      {"command", required_argument, 0, 'c'},
      {"verbose", no_argument, &verbose_flag, 1},
      {0,0,0,0}
    };
  while (1)
    {
      int option_index = 0;
      c = getopt_long(argc, argv, "", long_options, &option_index);

      if (c == -1)
	break;

      if (c == '?')
	{
	fprintf(stderr, "Error with option %s", long_options[option_index].name);
	continue;
	}

      switch (c)
	{
	case '?':
	  return_num = 1;
	  break;
	case 'r':
	  if(verbose_flag) 
	    printf("--%s %s\n", long_options[option_index].name, optarg);

	  ifd = open(optarg, O_RDONLY);
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
	case 'w':
	  if(verbose_flag) 
	    printf("--%s %s\n", long_options[option_index].name, optarg);

	  ifd = open(optarg, O_WRONLY);
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
	case 'c': ;

      if(verbose_flag) 
	printf("--%s %s", long_options[option_index].name, optarg);
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
		fprintf(stderr, "Command argument %d is invalid", index);
		ifd_check = 1;
		break;
	      }
	    if (file_list[index] == -1)
	      {
		fprintf(stderr, "Command argument %d is invalid", index);
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
	      command_args[arg_index] = NULL;
	      execvp(command, command_args);
	      //if code reaches here, there was an error
	      fprintf(stderr, "error executing command %s\n", command);
	      return 1;

	    }
	  
	  break;
	default:
	  break;
	}
    }
  return return_num;
}
