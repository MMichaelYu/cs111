#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define SUPEROFFSET 1024
#define INODESIZE 128
#define DIRECTORYENTRYSIZE 32

int block_size;
int total_blocks;
int total_groups;
int total_inodes;
int blocks_per_group;
int inodes_per_group;
int fd;
int inode_count = 0;
int dir_count = 0;
int *directories;
int *dir_ids;
int *inodes;
uint32_t *block_bitmaps;
uint32_t *inode_bitmaps;
uint32_t *inode_tables;

void indirect_info()
{
  FILE *indirect_file = fopen("indirect.csv", "w");
  int entry_num;
  int contain_block;
  int blockin1;
  int blockin2;
  int blockin3;
  uint32_t buf4;
  for (int i = 0; i < inode_count; i++)
    {
      //indirect
      entry_num = 0;
      pread(fd, &buf4, 4, inodes[i] + 40 + (4*12));
      contain_block = buf4;
      if (contain_block == 0)
      	continue;
      for (int j = 0; j < 256; j++)
	{
	  pread(fd, &buf4, 4, (block_size * contain_block) + (j * 4));
	  blockin1 = buf4;
	  if (blockin1)
	    {
	      //containing block number
	      fprintf(indirect_file, "%x,", contain_block);
	      //entry number
	      fprintf(indirect_file, "%d,", entry_num);
	      entry_num++;
	      //block pointer value
	      fprintf(indirect_file, "%x\n", blockin1);
	    }
	}
      
      //doubly indirect
      entry_num = 0;
      pread(fd, &buf4, 4, inodes[i] + 40 + (4*13));
      contain_block = buf4;
         if (contain_block == 0)
	    continue;
      for (int j = 0; j < 256; j++)
	{
	  pread(fd, &buf4, 4, (block_size * contain_block) + (j*4));
	  blockin1 = buf4;
	  if (blockin1)
	    {
	      
	      //containing block number
	      fprintf(indirect_file, "%x,", contain_block);
	      //entry number
	      fprintf(indirect_file, "%d,", entry_num);
	      entry_num++;
	      //block pointer value
	      fprintf(indirect_file, "%x\n", blockin1);
	      
	      int entry_num2 = 0;
	      for (int k = 0; k < 256; k++)
		{
		  pread(fd, &buf4, 4, (blockin1 * block_size) + (k*4));
		  blockin2 = buf4;
		  if (blockin2 == 0)
		    {
		      entry_num2++;
		      continue;
		    }
		  //containing block number
		  fprintf(indirect_file, "%x,", blockin1);
		  //entry number
		  fprintf(indirect_file, "%d,", entry_num2);
		  entry_num2++;
		  //block pointer value
		  fprintf(indirect_file, "%x\n", blockin2);
		}
	    }
	}
      
      //triply indirect
      entry_num = 0;
      pread(fd, &buf4, 4, inodes[i] + 40 + (4*14));
      contain_block = buf4;
        if (contain_block == 0)
      	continue;
      for (int j = 0; j < 256; j++)
	{
	  pread(fd, &buf4, 4, (block_size * contain_block) + (j*4));
	  blockin1 = buf4;
	  if (blockin1)
	    {
	      //containing block number
	      fprintf(indirect_file, "%x,", contain_block);
	      //entry number
	      fprintf(indirect_file, "%d,", entry_num);
	      entry_num++;
	      //block pointer value
	      fprintf(indirect_file, "%x\n", blockin1);
	      int entry_num2 = 0;
	      for (int k = 0; k < 256; k++)
		{
		  pread(fd, &buf4, 4, (blockin1 * block_size) + (k*4));
		  blockin2 = buf4;
		  if (blockin2 == 0)
		    {
		      //containing block number
		      fprintf(indirect_file, "%x,", blockin1);
		      //entry number
		      fprintf(indirect_file, "%d,", entry_num2);
		      entry_num2++;
		      //block pointer value
		      fprintf(indirect_file, "%x\n", blockin2);
		      int entry_num3 = 0;
		      for (int m = 0; m < 256; m++)
			{
			  pread(fd, &buf4, 4, (blockin2 * block_size) + (m*4));
			  blockin3 = buf4;
			  if (blockin3 == 0)
			    {
			      entry_num3++;
			      continue;
			    }
			  //containing block number
			  fprintf(indirect_file, "%x,", blockin2);
			  //entry number
			  fprintf(indirect_file, "%d,", entry_num3);
			  entry_num3++;
			  //block pointer value
			  fprintf(indirect_file, "%x\n", blockin3);	      
			}
		    }
		}
	    }
	}    
    }
  fclose(indirect_file);
}

void directory_info()
{
  FILE *directory_file = fopen("directory.csv", "w");
  void *theentry = malloc(DIRECTORYENTRYSIZE);
  int entry_num;
  uint16_t offset = 0;
  uint32_t *ptr4;
  uint32_t address;
  uint32_t buf4;
  uint16_t *ptr2;
  uint8_t *ptr1;
  char *name;
  for (int i = 0; i < dir_count; i++)
    {
      entry_num = 0;
      //direct blocks
      for (int k = 0; k < 12; k++)
	{
	  pread(fd, &buf4, 4, (directories[i] + (k*4) + 40));
	  if (buf4)
	    {
	      offset = 0;
	      address = buf4 * block_size;
	      while (offset < block_size)
		{
		  pread(fd, theentry, DIRECTORYENTRYSIZE, address + offset);
		  //entry number
		  ptr2 = theentry + 4;
		  ptr4 = theentry;
		  if (*ptr4 == 0)
		    {
		      offset += *ptr2;
		      entry_num++;
		      continue;
		    }
		  //parent inode number
		  fprintf(directory_file, "%d,", dir_ids[i]);
		  fprintf(directory_file, "%d,", entry_num);
		  entry_num++;
		  //entry length
		  fprintf(directory_file, "%d,", *ptr2);
		  //name length
		  ptr1 = theentry + 6;
		  int name_len = *ptr1;
		  fprintf(directory_file, "%d,", *ptr1);
		  //inode number of the file entry
		  fprintf(directory_file, "%d,", *ptr4);
		  //name
		  //name = malloc(name_len+1);
		  uint8_t buf1;
		  fprintf(directory_file,"\"");
		  for (int p = 0; p < name_len; p++)
		    {
		      pread(fd, &buf1, 1, address+offset+8+p);
		      fprintf(directory_file,"%c", buf1);
		    }
		  offset += *ptr2;
		  //fprintf(stdout, "%d\n", offset);
		  fprintf(directory_file, "\"\n");		  
		}
	    }
	}
      //indirect
      pread(fd, &buf4, 4, directories[i] + 40 + 48);
      address = buf4;
      if (address)
	{
	  for (int j = 0; j < 256; j++)
	    {
	      int block_offset = block_size * address + (j*4);
	      pread(fd, &buf4, 4, block_offset);
	      int blockin1 = buf4;
	      if (blockin1)
		{
		  int offset = 0;
		  block_offset = blockin1 * block_size;
		  while (offset < block_size)
		    {
		      pread(fd, theentry, DIRECTORYENTRYSIZE, block_offset + offset);
		      //entry number
		      ptr2 = theentry + 4;
		      ptr4 = theentry;
		      if (*ptr4 == 0)
			{
			  offset += *ptr2;
			  entry_num++;
			  continue;
			}
		      //parent inode number
		      fprintf(directory_file, "%d,", dir_ids[i]);
		      fprintf(directory_file, "%d,", entry_num);
		      entry_num++;
		      //entry length
		      fprintf(directory_file, "%d,", *ptr2);
		      //name length
		      ptr1 = theentry + 6;
		      int name_len = *ptr1;
		      fprintf(directory_file, "%d,", *ptr1);
		      //inode number of the file entry
		      fprintf(directory_file, "%d,", *ptr4);		      
		      //name = malloc(name_len+1);
		      uint8_t buf1;
		      fprintf(directory_file,"\"");
		      for (int p = 0; p < name_len; p++)
			{
			  pread(fd, &buf1, 1, block_offset+offset+8+p);
			  fprintf(directory_file,"%c", buf1);
			}
		      offset += *ptr2;
		      //fprintf(stdout, "%d\n", offset);
		      fprintf(directory_file, "\"\n");
		    }		  		  
		}
	    }
	}
      //doubly indirect
      pread(fd, &buf4, 4, directories[i] + 40 + 52);
      address = buf4;
      if (address)
	{
	  for (int j = 0; j < 256; j++)
	    {
	      int block_offset = block_size * address + (j*4);
	      pread(fd, &buf4, 4, block_offset);
	      int blockin1 = buf4;
	      if (blockin1)
		{
		  for (int k = 0; k < 256; k++)
		    {
		      pread(fd, &buf4, 4, blockin1 * block_size + (k*4));
		      int blockin2 = buf4;
		      if (blockin2)
			{
			  int offset = 0;
			  block_offset = blockin2 * block_size;
			  while (offset < block_size)
			    {
			       pread(fd, theentry, DIRECTORYENTRYSIZE, block_offset + offset);
			       //parent inode number
			       fprintf(directory_file, "%d,", dir_ids[i]);
			       //entry number
			       ptr2 = theentry + 4;
			       ptr4 = theentry;
			       if (*ptr4 == 0)
				 {
				   offset += *ptr2;
				   entry_num++;
				   continue;
				 }
			       fprintf(directory_file, "%d,", entry_num);
			       entry_num++;
			       //entry length
			       fprintf(directory_file, "%d,", *ptr2);
			       //name length
			       ptr1 = theentry + 6;
			       int name_len = *ptr1;
			       fprintf(directory_file, "%d,", *ptr1);
			       //inode number of the file entry
			       fprintf(directory_file, "%d,", *ptr4);
			       
			       //name = malloc(name_len+1);
			       uint8_t buf1;
			       fprintf(directory_file,"\"");
			       for (int p = 0; p < name_len; p++)
				 {
				   pread(fd, &buf1, 1, block_offset+offset+8+p);
				   fprintf(directory_file,"%c", buf1);
				 }
			       offset += *ptr2;
			       //fprintf(stdout, "%d\n", offset);
			       fprintf(directory_file, "\"\n");
			    }
			}
		    }
		}
	    }
	}
      //triply indirect
      pread(fd, &buf4, 4, directories[i] + 40 + 52);
      address = buf4;
      if (address)
	{
	  for (int j = 0; j < 256; j++)
	    {
	      int block_offset = block_size * address + (j*4);
	      pread(fd, &buf4, 4, block_offset);
	      int blockin1 = buf4;
	      if (blockin1)
		{
		  for (int k = 0; k < 256; k++)
		    {
		      pread(fd, &buf4, 4, blockin1 * block_size + (k*4));
		      int blockin2 = buf4;
		      if (blockin2)
			{
			  for (int n = 0; n < 256; n++)
			    {
			      pread(fd, &buf4, 4, blockin2 * block_size + (n*4));
			      int blockin3 = buf4;
			      if (blockin3)
				{
				  int offset = 0;
				  block_offset = blockin3 * block_size;
				  while (offset < block_size)
				    {
				      pread(fd, theentry, DIRECTORYENTRYSIZE, block_offset + offset);
				      //parent inode number
				      fprintf(directory_file, "%d,", dir_ids[i]);
				      //entry number
				      ptr2 = theentry + 4;
				      ptr4 = theentry;
				      if (*ptr4 == 0)
					{
					  offset += *ptr2;
					  entry_num++;
					  continue;
					}
				      fprintf(directory_file, "%d,", entry_num);
				      entry_num++;
				      //entry length
				      fprintf(directory_file, "%d,", *ptr2);
				      //name length
				      ptr1 = theentry + 6;
				      int name_len = *ptr1;
				      fprintf(directory_file, "%d,", *ptr1);
				      //inode number of the file entry
				      fprintf(directory_file, "%d,", *ptr4);
				      
				      //name = malloc(name_len+1);
				      uint8_t buf1;
				      fprintf(directory_file,"\"");
				      for (int p = 0; p < name_len; p++)
					{
					  pread(fd, &buf1, 1, block_offset+offset+8+p);
					  fprintf(directory_file,"%c", buf1);
					}
				      offset += *ptr2;
				      //fprintf(stdout, "%d\n", offset);
				      fprintf(directory_file, "\"\n");
				    }
				}
			    }
			}
		    }
		}
	    }
	}
    }
  fclose(directory_file);
}

void inode_info()
{
  FILE *inode_file = fopen("inode.csv", "w");
  void *theinodemap = malloc(block_size);
  void *theinode = malloc(INODESIZE);
  void *blockarray = malloc(15*4);
  inodes = malloc(sizeof(int) * total_inodes);
  directories = malloc(sizeof(int) * total_inodes);
  dir_ids = malloc(sizeof(int) * total_inodes);
  uint8_t *ptr1;
  uint16_t *ptr2;
  uint32_t *ptr4;
  for (int i = 0; i < total_groups; i++)
    {
      pread(fd, theinodemap, block_size, inode_bitmaps[i] * block_size);
      for (int j = 0; j < block_size; j++)
	{
	  //1 byte from the inode map
	  ptr1 = theinodemap+j;
	  int8_t mask = 1;
	  for (int k = 0; k < 8; k++)
	    {
	      int result = mask & *ptr1;
	      //if the inode is allocated
	      if (result != 0 && j*8+k < inodes_per_group)
		{
		  pread(fd, theinode, INODESIZE, inode_tables[i] * block_size + INODESIZE * (k + j * 8));
		  //inode number
		  fprintf(inode_file, "%d,", i * inodes_per_group + k + 1 + j * 8);
		  inodes[inode_count] = inode_tables[i] * block_size + INODESIZE * (k+j*8);
		  inode_count++;
		  //file type
		  ptr2 = theinode;
		  if ((*ptr2 & 0x8000) == 0x8000)
		      fprintf(inode_file, "f,");		   
		  else if ((*ptr2 & 0x4000) == 0x4000)
		    {
		      directories[dir_count] = inode_tables[i] * block_size + INODESIZE * (k+j*8);
		      dir_ids[dir_count] = i * inodes_per_group + k + 1 + j * 8;
		      dir_count++;
		      fprintf(inode_file, "d,");
		    }
		  else if ((*ptr2 & 0xA000) == 0xA000)
		    fprintf(inode_file, "s,");
		  else
		    fprintf(inode_file, "?,");
		  //mode
		  fprintf(inode_file, "%o,", *ptr2);
		  //owner
		  ptr2 = theinode+2;
		  fprintf(inode_file, "%d,", *ptr2);
		  //group
		  ptr2 = theinode+24;
		  fprintf(inode_file, "%d,", *ptr2);
		  //link count
		  ptr2 = theinode+26;
		  fprintf(inode_file, "%d,", *ptr2);
		  //creation time
		  ptr4 = theinode+12;
		  fprintf(inode_file, "%x,", *ptr4);
		  //modification time
		  ptr4 = theinode+16;
		  fprintf(inode_file, "%x,", *ptr4);
		  //access time
		  ptr4 = theinode+8;
		  fprintf(inode_file, "%x,", *ptr4);
		  //file size
		  ptr4 = theinode+4;
		  fprintf(inode_file, "%d,", *ptr4);
		  //number of blocks
		  ptr4 = theinode+28;
		  fprintf(inode_file, "%d,", *ptr4/(2<<block_size));
		  //block pointers x 15
		  pread(fd, blockarray, 60, inode_tables[i] * block_size + (k+j*8) * INODESIZE + 40);
		  for (int p = 0; p < 15; p++)
		    {
		      ptr4 = blockarray + p*4;
		      if (p == 14)
			fprintf(inode_file, "%x\n", *ptr4);
		      else
			fprintf(inode_file, "%x,", *ptr4);		      
		    }	 				
		}
	      mask <<= 1;
	    }
	}
    }
  free(blockarray);
  free(theinodemap);
  free(theinode);
  fclose(inode_file);
			       
}

void bitmap_info()
{
  FILE *bitmap_file = fopen("bitmap.csv", "w");
  void *thebitmap = malloc(block_size);
  void *theinodemap = malloc(block_size);
  uint8_t *ptr1;
  for (int i = 0; i < total_groups; i++)
    {
      pread(fd, thebitmap, block_size, block_bitmaps[i] * block_size);
      int j;
      for (j = 0; j < block_size; j++)
	{
	  //1 byte from the bitmap
	  ptr1 = thebitmap+j;
	  int8_t mask = 1;
	  for (int k = 1; k < 9; k++)
	    {
	      int result = mask & *ptr1;
	      if (result == 0)
		{
		  fprintf(bitmap_file, "%x,%d\n", block_bitmaps[i], k+j*8+(i*blocks_per_group));
		  
		}
	      mask <<= 1;
	    }
	}
      pread(fd, theinodemap, block_size, inode_bitmaps[i] * block_size);
      for (j = 0; j < block_size; j++)
	{
	  //1 byte from the inode map
	  ptr1 = theinodemap+j;
	  int8_t mask = 1;
	  for (int k = 1; k < 9; k++)
	    {
	      int result = mask & *ptr1;
	      if (result == 0)
		{
		  fprintf(bitmap_file, "%x,%d\n", inode_bitmaps[i], k+j*8+i*inodes_per_group);
		}
	      mask <<= 1;
	    }
	}
    }
  free(thebitmap);
  free(theinodemap);
  fclose(bitmap_file);
}

void group_info()
{
  FILE *group_file = fopen("group.csv", "w");
  void *thegroup = malloc(block_size);
  uint16_t *ptr2;
  uint32_t *ptr4;
  pread(fd, thegroup, block_size, SUPEROFFSET+1024);
  total_groups = total_blocks / blocks_per_group;
  block_bitmaps = malloc(sizeof(uint32_t) * total_groups);
  inode_bitmaps = malloc(sizeof(uint32_t) * total_groups);
  inode_tables = malloc(sizeof(uint32_t) * total_groups);
  for (int i = 0; i < total_groups; i++)
    {
      int offset = 32*i;
      //number of contained blocks
      fprintf(group_file, "%d,", blocks_per_group);
      //number of free blocks
      ptr2 = thegroup+offset+12;
      fprintf(group_file, "%d,", *ptr2);
      //number of free inodes
      ptr2 = thegroup+offset+14;
      fprintf(group_file, "%d,", *ptr2);
      //number of directories
      ptr2 = thegroup+offset+16;
      fprintf(group_file, "%d,", *ptr2);
      //free inode bitmap block
      ptr4 = thegroup+offset+4;
      inode_bitmaps[i] = *ptr4;
      fprintf(group_file, "%x,", *ptr4);
      //free block bitmap block
      ptr4 = thegroup+offset;
      block_bitmaps[i] = *ptr4;
      fprintf(group_file, "%x,", *ptr4);
      //inode table start block
      ptr4 = thegroup+offset+8;
      inode_tables[i] = *ptr4;
      fprintf(group_file, "%x\n", *ptr4);
    }
  //close
  free(thegroup);
  fclose(group_file);
}

void super_info()
{
  FILE *super_file = fopen("super.csv", "w");
  void *thesuper = malloc(1024);
  uint16_t *ptr2;
  uint32_t *ptr4;
  int32_t *s_ptr4;
  uint16_t buf16;
  uint32_t buf32;
  int32_t s_buf32;
  pread(fd, thesuper, 1024, SUPEROFFSET);
  //magic
  ptr2 = thesuper+56;
  fprintf(super_file, "%x,", *ptr2);
  //total inodes
  ptr4 = thesuper;
  total_inodes = *ptr4;
  fprintf(super_file, "%d,", *ptr4);
  //total blocks
  ptr4 = thesuper+4;
  total_blocks = *ptr4;
  fprintf(super_file, "%d,", *ptr4);
  //block size
  ptr4 = thesuper+24;
  block_size = (1024 << *ptr4);
  fprintf(super_file, "%d,", 1024 << *ptr4);
  //fragment size
  s_ptr4 = thesuper+28;
  if (*ptr4 > 0)
    fprintf(super_file, "%d,", 1024 << *ptr4);
  else
    fprintf(super_file, "%d,", 1024 >> -(*ptr4));
  //blocks per group
  ptr4 = thesuper+32;
  blocks_per_group = *ptr4;
  fprintf(super_file, "%d,", *ptr4);
  //inodes per group
  ptr4 = thesuper+40;
  inodes_per_group = *ptr4;
  fprintf(super_file, "%d,", *ptr4);
  //fragments per group
  ptr4 = thesuper+36;
  fprintf(super_file, "%d,", *ptr4);
  //first data block
  ptr4 = thesuper+20;
  fprintf(super_file, "%d\n", *ptr4);
  //close
  free(thesuper);
  fclose(super_file);
}
int main(int argc, char **argv)
{
  if (argc != 2)
    {
      fprintf(stderr, "Bad number of arguments");
      exit(1);
    }
  fd = (open(argv[1], O_RDONLY));
  if (fd == -1)
    {
      fprintf(stderr, "Error opening disk image.");
      exit(1);
    }
  super_info();
  group_info();
  bitmap_info();
  inode_info();
  directory_info();
  indirect_info();
}
 
