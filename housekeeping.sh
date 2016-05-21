#!/bin/bash
cd /home/sinkhole

#Copy new content

for i in `ls -U /home/sinkhole/data/8080/`; do cp /home/sinkhole/data/8080/$i /home/sinkhole/data/archive/8080 && rm /home/sinkhole/data/8080/$i; done;
for i in `ls -U /home/sinkhole/data/110/`; do cp /home/sinkhole/data/110/$i /home/sinkhole/data/archive/110 && rm /home/sinkhole/data/110/$i; done;
for i in `ls -U /home/sinkhole/data/1863/`; do cp /home/sinkhole/data/1863/$i /home/sinkhole/data/archive/1863 && rm /home/sinkhole/data/1863/$i; done;
for i in `ls -U /home/sinkhole/data/25/`; do cp /home/sinkhole/data/25/$i /home/sinkhole/data/archive/25 && rm /home/sinkhole/data/25/$i; done;
for i in `ls -U /home/sinkhole/data/443/`; do cp /home/sinkhole/data/443/$i /home/sinkhole/data/archive/443 && rm /home/sinkhole/data/443/$i; done;
for i in `ls -U /home/sinkhole/data/5331/`; do cp /home/sinkhole/data/5331/$i /home/sinkhole/data/archive/5331 && rm /home/sinkhole/data/5331/$i; done;
for i in `ls -U /home/sinkhole/data/80/`; do cp /home/sinkhole/data/80/$i /home/sinkhole/data/archive/80 && rm /home/sinkhole/data/80/$i; done;
for i in `ls -U /home/sinkhole/data/8080/`; do cp /home/sinkhole/data/8080/$i /home/sinkhole/data/archive/8080 && rm /home/sinkhole/data/8080/$i; done;
for i in `ls -U /home/sinkhole/data/8081/`; do cp /home/sinkhole/data/8081/$i /home/sinkhole/data/archive/8081 && rm /home/sinkhole/data/8081/$i; done;
for i in `ls -U /home/sinkhole/data/8088/`; do cp /home/sinkhole/data/8088/$i /home/sinkhole/data/archive/8088 && rm /home/sinkhole/data/8088/$i; done;
for i in `ls -U /home/sinkhole/data/81/`; do cp /home/sinkhole/data/81/$i /home/sinkhole/data/archive/81 && rm /home/sinkhole/data/81/$i; done;
for i in `ls -U /home/sinkhole/data/9200/`; do cp /home/sinkhole/data/9200/$i /home/sinkhole/data/archive/9200 && rm /home/sinkhole/data/9200/$i; done;
for i in `ls -U /home/sinkhole/data/5938/`; do cp /home/sinkhole/data/5938/$i /home/sinkhole/data/archive/5938 && rm /home/sinkhole/data/5938/$i; done;
for i in `ls -U /home/sinkhole/data/2000/`; do cp /home/sinkhole/data/2000/$i /home/sinkhole/data/archive/2000 && rm /home/sinkhole/data/2000/$i; done;
for i in `ls -U /home/sinkhole/data/2049/`; do cp /home/sinkhole/data/2049/$i /home/sinkhole/data/archive/2049 && rm /home/sinkhole/data/2049/$i; done;
for i in `ls -U /home/sinkhole/data/6699/`; do cp /home/sinkhole/data/6699/$i /home/sinkhole/data/archive/6699 && rm /home/sinkhole/data/6699/$i; done;

filedate=$(date -d yesterday +"%m-%d-%Y")

# Zip up new content
cd /home/sinkhole/data/archive/8080 && tar -cvzf $filedate.tar.gz *.data 
cd /home/sinkhole/data/archive/110 && tar -cvzf $filedate.tar.gz *.data 
cd /home/sinkhole/data/archive/1863 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/25 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/443 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/5331 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/80 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/8080 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/8081 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/8088 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/81 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/9200 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/5938 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/2000 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/2049 && tar -cvzf $filedate.tar.gz *.data
cd /home/sinkhole/data/archive/6699 && tar -cvzf $filedate.tar.gz *.data

# Remove old content

for i in `find /home/sinkhole/data/archive/110 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/1863 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/25 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/443 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/5331 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/80 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/8080 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/8081 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/8088 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/81 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/9200 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/5938 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/2000 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/2049 -type f -name '*data'`; do rm $i; done;
for i in `find /home/sinkhole/data/archive/6699 -type f -name '*data'`; do rm $i; done;

