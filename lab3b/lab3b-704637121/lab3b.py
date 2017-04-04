#!/usr/bin/python

class inodeClass():
    def __init__(self, inode_num, lc = 0):
        self.inode_num = inode_num
        self.link_count = lc
        self.pointers = []

class blockClass():
    def __init__(self, block_num):
        self.block_num = block_num
        self.pointers = []

def main():
    out_file = open("lab3b_check.txt", "w")
    bitmap_file = open("bitmap.csv", "r")
    directory_file = open("directory.csv", "r")
    group_file = open("group.csv", "r")
    indirect_file = open("indirect.csv", "r")
    inode_file = open("inode.csv", "r")
    super_file = open("super.csv","r")

    #super
    total_inodes = 0
    total_blocks = 0
    block_size = 0
    blocks_per_group = 0
    inodes_per_group = 0
    for line in super_file:
        superline = line.rstrip("\n").split(",")
        total_inodes = int(superline[1])
        total_blocks = int(superline[2])
        block_size = int(superline[3])
        blocks_per_group = int(superline[5])
        inodes_per_group = int(superline[6])

    #group
    allocated_blocks = {}
    inode_bitmap_blocks = []
    block_bitmap_blocks = []
    for line in group_file:
        groupline = line.rstrip("\n").split(",")
        temp1 = int(groupline[4],16)
        temp2 = int(groupline[5],16)
        allocated_blocks[temp1] = blockClass(temp1)
        allocated_blocks[temp2] = blockClass(temp2)
        inode_bitmap_blocks.append(temp1)
        block_bitmap_blocks.append(temp2)

    inode_free_list = []
    block_free_list = []
    #bitmap
    for line in bitmap_file:
        bitmapline = line.rstrip("\n").split(",")
        map_num = int(bitmapline[0],16)
        used_num = int(bitmapline[1])
        if map_num in inode_bitmap_blocks:
            inode_free_list.append(used_num)
        elif map_num in block_bitmap_blocks:
            block_free_list.append(used_num)   
            
    #indirect
    indirect_table = {}
    for line in indirect_file:
        indirectline = line.rstrip("\n").split(",")
        block_num = int(indirectline[0],16)
        entry_num = int(indirectline[1])
        ptr_val = int(indirectline[2],16)
        indirect_table[(block_num,entry_num)] = [ptr_val]

    #inode and invalid block pointer
    allocated_inodes = {}
    for line in inode_file:
        inodeline = line.rstrip("\n").split(",")
        inode_num = int(inodeline[0])
        link_count = int(inodeline[5])
        num_blocks = int(inodeline[10])
        allocated_inodes[inode_num] = inodeClass(inode_num, link_count)

        #direct
        ptr_max = 11 + min(12,num_blocks)
        for direct in range(11, ptr_max):
            block_num = int(inodeline[direct],16)
            if block_num == 0 or block_num > total_blocks:
                out_file.write("INVALID BLOCK < " + str(block_num) + " > IN INODE < " + str(inode_num) + " > ENTRY < " + str(direct-11) + " >\n")
            else:
                if block_num not in allocated_blocks:
                    allocated_blocks[block_num] = blockClass(block_num)
                allocated_blocks[block_num].pointers.append((inode_num, 0, direct-11))
                
        #indirect
        for i in range(23,26):
            if (num_blocks > 12):
                temp_block = int(inodeline[i],16)
                if temp_block > total_blocks:
                    out_file.write("INVALID BLOCK < " + str(temp_block) + " > IN INODE < " + str(inode_num) + " > INDIRECT BLOCK < " + str(0) + " > ENTRY < " + str(i-11) + " >\n")
                #single
                elif (i == 23):
                    if temp_block in [key[0] for key in indirect_table]:
                    #any (a == temp_block for (a, b) in indirect_table
                        value = indirect_table[(temp_block, key[1])]
                        if (int(value[0]) > int(total_blocks)):
                            out_file.write("INVALID BLOCK < " + str(value[0]) + " > IN INODE < " + str(inode_num) + " > INDIRECT BLOCK < " + str(temp_block) + " > ENTRY < " + str(key[1]) + " >\n")
                        else:
                            if value[0] not in allocated_blocks:
                                allocated_blocks[value[0]] = blockClass(value[0])
                            allocated_blocks[value[0]].pointers.append((inode_num, temp_block, key[1]))
                    num_blocks = num_blocks-1
                    
                #double
                elif (i == 24):
                    if (temp_block,i-11) in indirect_table:
                        value2 = indirect_table[temp_block,i-11]
                        if (value2 > total_blocks):
                            out_file.write("INVALID BLOCK < " + str(value2) + " > IN INODE < " + str(inode_num) +  " > INDIRECT BLOCK < " + temp_block + " > ENTRY < " + str(i-11) + " >\n")
                        else:
                            if (value2,i-11) in indirect_table:
                                value = indirect_table[temp_block,i-11]
                                if (value > total_blocks):
                                    out_file.write("INVALID BLOCK < " + str(value) + " > IN INODE < " + str(inode_num) + " > INDIRECT BLOCK < " + temp_block + " > ENTRY < " + str(i-11) + " >\n")
                            else:
                                out_file.write("INVALID BLOCK < " + str(value2) + " > IN INODE < " + str(inode_num) + " > INDIRECT BLOCK < " + str(0) + " > ENTRY < " + str(i-11) + " >\n")
                    num_blocks = num_blocks-2
                    
                    #triple
                elif (i == 25):
                    if (temp_block,i-11) in indirect_table:
                        value3 = indirect_table[temp_block,i-11]
                        if (value3 > total_blocks):
                            out_file.write("INVALID BLOCK < " + str(value3) + " > IN INODE < " + str(inode_num) +  " > INDIRECT BLOCK < " + temp_block + " > ENTRY < " + str(i-11) + " >\n")
                        else:
                            if (value3,i-11) in indirect_table:
                                value2 = indirect_table[temp_block,i-11]
                                if (value2 > total_blocks):
                                    out_file.write("INVALID BLOCK < " + str(value2) + " > IN INODE < " + str(inode_num) +  " > INDIRECT BLOCK < " + temp_block + " > ENTRY < " + str(i-11) + " >\n")
                                else:
                                    if (value2,i-11) in indirect_table:
                                        value = indirect_table[temp_block,i-11]
                                        if (value > total_blocks):
                                            out_file.write("INVALID BLOCK < " + str(value) + " > IN INODE < " + str(inode_num) + " > INDIRECT BLOCK < " + temp_block + " > ENTRY < " + str(i-11) + " >\n")
                                    else:
                                        out_file.write("INVALID BLOCK < " + str(value2) + " > IN INODE < " + str(inode_num) + " > INDIRECT BLOCK < " + str(0) + " > ENTRY < " + str(i-11) + " >\n")
                            else:
                                out_file.write("INVALID BLOCK < " + str(value3) + " > IN INODE < " + str(inode_num) + " > INDIRECT BLOCK < " + str(0) + " > ENTRY < " + str(i-11) + " >\n")
                    num_blocks = num_blocks-3
                    
    #directory and incorrect directory entry
    directory_table = {}
    for line in directory_file:
        directoryline = line.rstrip("\n").split(",")
        parent_num = int(directoryline[0])
        entry_num = int(directoryline[1])
        child_num = int(directoryline[4])
        name = str(directoryline[5])
        if child_num != parent_num or parent_num == 2:
            directory_table[child_num] = (parent_num, entry_num, name)
        if child_num in allocated_inodes:
            allocated_inodes[child_num].pointers.append((parent_num, entry_num))
        if entry_num == 0 and child_num != parent_num:
            out_file.write("INCORRECT ENTRY IN < " + str(parent_num) + " > NAME < " + name.strip('"') + " > LINK TO < " + str(child_num) + " > SHOULD BE < " + str(parent_num) + " >\n")
        elif entry_num == 1 and child_num != directory_table[parent_num][0]:
            out_file.write("INCORRECT ENTRY IN < " + str(parent_num) + " > NAME < " + name.strip('"') + " > LINK TO < " + str(child_num) + " > SHOULD BE < " + str(directory_table[parent_num][0]) + " >\n")
        
        
    #unallocated block
    for thing in (allocated_blocks):
        if thing in block_free_list:
            out_file.write("UNALLOCATED BLOCK < " + str(thing) + " > REFERENCED BY")
            for (a,b,c) in (allocated_blocks[thing].pointers):
                if int(b) == 0:
                    out_file.write(" INODE < " + str(a) + " > ENTRY < " + str(c) + " >")
                else:
                    out_file.write(" INODE < " + str(a) + " > INDIRECT BLOCK < " + str(b) + " > ENTRY <" + str(c) + " >")
            out_file.write("\n")
                    
    #duplicate allocated block
    for thing in (allocated_blocks):
        if len(allocated_blocks[thing].pointers) > 1:
            out_file.write("MULTIPLY REFERENCED BLOCK < " + str(thing) + " > BY")
            for (a,b,c) in allocated_blocks[thing].pointers:
                if b == 0:
                    out_file.write(" INODE < " + str(a) + " > ENTRY < " + str(c) + " >")
                else:
                    out_file.write(" INODE < " + str(a) + " > INDIRECT BLOCK < " + str(b) + " > ENTRY < " + str(c) + " >")
            out_file.write("\n")

    #unallocated inode
    for thing in inode_free_list:
        if thing in allocated_inodes:
            out_file.write("UNALLOCATED INODE < " + str(thing) + " > REFERENCED BY")
            for (a,b) in allocated_inodes[thing].pointers:
                out_file.write(" DIRECTORY < " + str(a) + " > ENTRY < " + str(b) + " >")
            out_file.write("\n")

    #missing inode
    for thing in range(11,total_inodes):
        if thing not in inode_free_list and thing not in allocated_inodes:
            out_file.write("MISSING INODE < " + str(thing) + " > SHOULD BE IN FREE LIST < " + str(block_bitmap_blocks[int(thing) / inodes_per_group]) + " >\n")
        elif thing in allocated_inodes and allocated_inodes[thing].link_count == 0:
            out_file.write("MISSING INODE < " + str(thing) + " > SHOULD BE IN FREE LIST < " + str(inode_bitmap_blocks[int(thing) / inodes_per_group]) + " >\n")

    #incorrect link count
    for thing in allocated_inodes:
        lc = len(allocated_inodes[thing].pointers)
        if lc != allocated_inodes[thing].link_count:
            out_file.write("LINKCOUNT < " + str(thing) + " > IS < " + str(allocated_inodes[thing].link_count) + " > SHOULD BE < " + str(lc) + " >\n")

    #incorrect directory entry
    
    
    out_file.close()
    bitmap_file.close()
    directory_file.close()
    group_file.close()
    indirect_file.close()
    inode_file.close()
    super_file.close()
                            
if __name__ == "__main__":
    main()
