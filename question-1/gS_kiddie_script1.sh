#!/bin/bash

if [ $# -ne 1 ]
then
echo "USAGE: ./<script_name> </path/to/file containing email list>"
exit $?
fi

rm -rf data

echo '' >> data

echo -e "Initialising @ `date +%T` .................. \n"
echo "current shell: $SHELL" >> data

echo '' >> data

echo -e "all users in the system:\n`cat /etc/passwd| cut -d":" -f1`" >> data

echo '' >> data

echo "current directory: `pwd`" >> data

echo '' >> data

echo "logged in user: `whoami`" > file

echo '' >> data

echo -e "Data saved in the file-\"$PWD/data\"\n"

w=`cat data|wc -w`
l=`cat data|wc -l`
c=`cat data|wc -m`
echo -e "the count of words, lines and characters in above file: \nwords=$w \nlines=$l \ncharacters=$c\n"

w_file=`cat file|wc -w`
l_file=`cat file|wc -l`
c_file=`cat file|wc -m`
echo "count of pattern file in $PWD/data is : $w_file words, $l_file lines $c_file characters"

rm -rf .com .net .org .other

sed 's/;/\n/g' $1 > /tmp/email.tmp
sed 's/,/\n/g' /tmp/email.tmp > /tmp/email_tmp

grep com$ /tmp/email_tmp >> .com
grep net$ /tmp/email_tmp >> .net
grep org$ /tmp/email_tmp >> .org
grep -v -E "com$|net$|org$" /tmp/email_tmp >> .other

rm -rf /tmp/email.tmp /tmp/email_tmp

echo ""
echo "All tasks completed @ `date +%T` " 




 

