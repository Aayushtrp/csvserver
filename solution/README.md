 ####Solutions for part1 ######
1:- Commands executed are below
#docker run docker.io/infracloudio/csvserver 
#docker ps 
#docker ps -a
#docker logs <container id>

2:- Container is not running as its trying to find the file inputdata (whereas file mentioned in question 3 is inputFile which is wrong even if you create input file the app csv server will fail)
2021/04/04 21:17:21 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

3:- Script gencsv.sh (created on centos and working inside the conatiner)
cat gencsv.sh
#!/bin/bash
>inputFile
RANDOM=$$
for i in {0..9}
do
 echo "$i", "$RANDOM" >> inputFile
done

# creates the file inputFile in same directory with permission 644 which is readable by other user

4:- #docker run -it docker.io/infracloudio/csvserver /bin/bash
# copied script inside the container to check the script and create the file (can also use docker cp command to copy the script inside but did it manually)
# tried starting the application csvserver and it was trying to find file inputdata instead of inputFile

 2021/04/04 21:57:44 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory
^C
[2]+  Exit 1                  ./csvserver

5:- Application was running on port 9300 

[root@c941036aab93 csvserver]# netstat -tnlp
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp6       0      0 :::9300                 :::*                    LISTEN      25/./csvserver


6:-  docker run -it -p 9393:9300 docker.io/infracloudio/csvserver /bin/bash

# copied script inside the container to check the script and create the file (can also use docker cp command to copy the script inside but did it manually)
# tried starting the application csvserver and it was trying to find file inputdata instead of inputFile

 2021/04/04 21:57:44 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory
^C
[2]+  Exit 1                  ./csvserver

# added the environment variable 
# export CSVSERVER_BORDER=orange
# started the application ./csvserver &
# tried accessing it via browser

#below is text output for web page

Welcome to the CSV Server
Index	Value
0	22729
1	29728
2	8386
3	13948
4	16550
5	4483
6	30663
7	20824
8	10472
9	699



