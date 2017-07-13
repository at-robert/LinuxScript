import os
import sys
import re
import shutil

#----------------------------------------------------------------------
def search_file(type,path):

    file_type = '.' + type
    # folder = os.path.dirname(os.path.realpath(__file__))
    folder = path

    for file in os.listdir(folder):
        if file.endswith(file_type):
            episode = re.findall(r'[Ss][0-9][0-9][Ee][0-9][0-9]',file)
            # print ("Episode = {0}, File = {1}".format(episode[0][-2:],file))
            src_file = folder+'/'+file
            dst_file = folder+'/'+episode[0][-2:]+ '/' + file
            print ("src_file = {0} \n dst_file = {1}".format(src_file,dst_file))
            shutil.move(src_file,dst_file)

#----------------------------------------------------------------------
if __name__ == "__main__":

    if len(sys.argv) < 3:
        print ('no argument; Usage: python adv_redirect.py TYPE PATH')
        sys.exit()

    type = sys.argv[1]
    path = sys.argv[2]

    print ("The file type = {0}, path = {1}".format(type,path))

    search_file(type,path)
