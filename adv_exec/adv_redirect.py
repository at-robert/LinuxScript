import os
import sys
import re
import shutil

#----------------------------------------------------------------------
def search_file(type):

    file_type = '.' + type
    folder = os.path.dirname(os.path.realpath(__file__))

    for file in os.listdir(folder):
        if file.endswith(file_type):
            episode = re.findall(r'S[0-9][0-9]E[0-9][0-9]',file)
            # print ("Episode = {0}, File = {1}".format(episode[0][-2:],file))
            src_file = folder+'/'+file
            dst_file = folder+'/'+episode[0][-2:]+ '/' + file
            print ("src_file = {0} \n dst_file = {1}".format(src_file,dst_file))
            shutil.move(src_file,dst_file)

#----------------------------------------------------------------------
if __name__ == "__main__":

    if len(sys.argv) < 2:
        type = 'mkv'
    else:
        type = sys.argv[1]

    print ("The file type = {0}".format(type))

    search_file(type)
