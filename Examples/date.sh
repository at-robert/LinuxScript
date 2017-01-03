#!/bin/bash

filename="filename"

date1=$(date --date='2 days ago' +%Y%m%d)  # 前兩天的日期
date2=$(date --date='1 days ago' +%Y%m%d)  # 前一天的日期
date3=$(date +%Y%m%d)                      # 今天的日期
file1=${filename}${date1}                  # 底下三行在設定檔名
file2=${filename}${date2}
file3=${filename}${date3}


echo "${file1}"                           # 底下三行在建立檔案
echo "${file2}"
echo "${file3}"