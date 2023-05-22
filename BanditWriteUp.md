# Level 0
- Connect to ssh
`ssh bandit0@bandit.labs.overthewire.org -p2220`

# Level 0 -> 1
- List files in current directory
`ls`
- Read contents of readme file
`cat readme`
>Password obtained is "NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL".

# Level 1 -> 2
- Read contents of  **-** file 
`cat /home/bandit1/-` or `cat ./-`
>Password obtained is "rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi".

# Level 2 -> 3
- Items listed in directory are "spaces in this filename".
- Two ways to read the contents of file:
  ` cat ./spaces\ in\ this\ filename`  or `cat 'spaces in this filename'`
  >Password obtained is "aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG".
  

# Level 3 -> 4
`cd inhere`
`ls -l`
`cat ./.hidden`
- Change directory to inhere.
- ls doesnot show anything, so we type `ls -a` or `ls -A` to show hidden file types.
- Read the file via`cat ./.hidden` or `cat '.hidden'`.
>Password obtained is "2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe".

# Level 4 -> 5
`cd inhere`
`file./*`
- Change directory to inhere.
- Display file types using `file ./*`.
- Only `-file/07` is human-readable ASCII   text file.

>Password obtained is "lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR".
# Level 5 -> 6

`find . -size 1033c -type f ! -executable `
- Change directory to inhere.
- This command finds all files in current directory which are 1033bytes in size and are not executable.

>Password obtained is "P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU".
# Level 6 -> 7
`cd ../../`
`find . -user bandit7 -group bandit6 -size 33c 2>/dev/null `
 - Change directory upwards by two levels. `cd ../../`
- A lot of files come up, but most have **Permission denied**, so we direct the error stream(2) to null device(/dev/null) which discards. 
- This leaves us with one file `./var/lib/dpkg/info/bandit7.password`.
- So we cat that file and obtain the password.
 >Password obtained is "z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S".
 
 
# Level 7 -> 8

`grep -h "millionth" data.txt`
`grep -w "millionth" data.txt`
`grep -n "millionth" data.txt`
>Password obtained is "TESKZC0XvTetK0S9xNwm25STk5iWrBvP".

# Level 8 -> 9
`cat data.txt | sort | uniq -u`
- We first pipe the output of `cat data.txt ` to `sort` which sorts the contents of data.txt alphabetically. 
- Then we pipe the output of above step to `uniq` which checks for duplicates in adjacent lines and `-u` displays only unique lines.
>Password obtained is "EN632PlfYiZbn3PhVK3XOGSlNInNE00t".

# Level 9 -> 10
`strings data.txt | grep "=="`
- The strings command outputs the human readable characters to grep commmand which searches for "==".
>Password obtained is "G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s".

# Level 10 -> 11
`base64 -d data.txt`
- It decodes data.txt which is base64 encoded.
>Password obtained is "6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM".

# Level 11 -> 12
`cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'`
- The tr command translates output of cat command. 
- Here, corresponding letters inthe first set are translated to corresponding letters in second set.
>Password obtained is "JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv".

# Level 12 -> 13

`cd /`
- Change to root directory

 `cp /home/bandit12/data.txt .//tmp/nyname123`
 -  Copy data.txt to a new directory in /tmp/nyname123
 
 `xxd -r data.txt > myOutput1 `
 - xxd -r reverses the hex dump file and outputs the data into myOutput1 file
 
 `mv myOutput1 myOutput1.gz`
 `gunzip myOutput1.gz`
 -  myOutput1 file is a gzip compressed file, so we first rename it to add the extension and extract it.
 - After extracting it creates a file called myOutput1 in current directory.
 
 `mv myOutput1 myOutput1.bz2`
 `bzcat myOutput1.bz2 > myOutput2`
 -  Now this file(myOutput1) is a bzip2 compressed file, so we extract its contents into myOutput2 file.
  
 `mv myOutput2 myOutput2.gz`
 `gunzip myOutput2.gz `
 -  myOutput2 file is a gzip compressed file, so we first rename it to add the extension and extract it.
 - After extracting it creates a file called myOutput1 in current directory.
 
  `tar -xf myOutput2`
 - Now this file(myOutput2) is a tar archive. We extract it using `tar -xf` command. 
 - After extracting it gives another file data5.bin which is tar archive file.
 
  `tar -xf data5.bin`
 -  Now this file(data5.bin) is a tar archive. We extract it using `tar -xf` command. 
 
 `mv data6.bin data6.bin.bz2`
 `bzcat data6.bin.bz2 > myOutput3`
 - Now this file(data6.bin) is a bzip2 compressed file, so we extract its contents into myOutput3 file.
 
  `tar -xf myOutput3`
  `mv data8.bin data8.bin.gz`
  `gunzip data8.bin.gz`
 - Finally myOutput3 is a tar archive which on extraction gives data8.bin, which is again a gzip compressed file.
 - On extraction of data8.bin, we get a file with ASCII text. We cat the file and viola!.
 
 >Password obtained is "wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw".
 
# Level 13 -> 14
 `ssh bandit14@bandit.labs.overthewire.org -i sshkey.private -p2220`
 - We have logged in as bandit14 user by using the private sshkey we we given.
 
 `cd /`
 `cd /etc/bandit_pass/`
 `cat bandit14`
 - We can now read the password for bandit14 from `/etc/bandit_pass/bandit14`, as we have the read permissions for it.
 >Password obtained is "fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq".
 
# Level 14 -> 15
 `telnet localhost 30000`
 - We use the telnet command to connect to localhost on port number 30000.
 - After we are connected and the server is listening, we type the previous password.
 >Password obtained is "jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt".
 
# Level 15 -> 16
 `openssl s_client -connect localhost:30001`
 - We have connected to localhost on port 30001 usinng SSL Encryption.
 - After we are connected and the server is listening, we type the previous password.
 >Password obtained is "JQttfApK4SeyHwDlI9SXGR50qclOAil1".
 
# Level 16 -> 17
 `nmap --script ssl-cert -p 31000-32000 localhost`
 - Through this commnd we use nmap tool to map all ports from 31000-32000 of the localhost which are runnning and which have SSL-Certification.
 -  We find that only two ports satisfy above conditions: port 31518 and **31790**.
 - We connect to both of the ports and type previous password. But we get  right output from Port 31790 only.
 - We store the RSA Key in a new file called bandit17.key and change its permissions to 600 using `chmod 600 bandit17.key` command.
 >Password obtained is "RSA PRIVATE KEY(which is used to connect to next level)".
 
# Level 17 -> 18

`ssh -i bandit17.key bandit17@bandit.labs.overthewire.org -p2220`
- We are now logged in as bandit17 user.
- Now on doing ls we find two files `passwords.old` and `passwords.new`.

 `diff passwords.new passwords.old`
 - This command compares both files line by line and outputs the one that are different.
 - The password for the next level is the one which comes first as we have written passwords.new before passwords.old.
 >Password obtained is "hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg".

# Level 18 -> 19
`ssh bandit18@bandit.labs.overthewire.org -p2220 cat readme`
 - We are logged as soon as we log in,  so we use cat command while connecting to the server.
 - cat command gets executed at the moment server is connected and is executed before we are logged out
 >Password obtained is "awhqfNnAbc1naukrpqDYcF95h7HoMTrC".
 
 
# Level 19 -> 20
 `./bandit20-do cat /etc/bandit_pass/bandit20`
 - In the current directory we have `bandit20-cat` file.
 - After running `./bandit20-do id` command we find that `euid or effective user id` of bandit20-do is bandit20. 
 - Means if we run any program through ./bandit20-do the server would  believe as if bandit20 user is executing the programs.
 - In simple words, we are able to exercise permissions of bandit20 user via ./bandit20-do file.
 >Password obtained is "VxCazJaVykI6W36BkBU0mJTCM8rR95XT".

# Level 20 -> 21
- For this  level we first open two windows of bandit20.

- In one window we use nc to listen to a port by using `nc -l 6969` command. Now nc listend to port no. 6969.
- In the other window we connect to this port through `./suconnect 6969`
- When both are connected the send the password of the previous level to both and them, and then we get the new password.
>Password obtained is "NvEJF7oVjkddltPSrdKEFOllh9V1IBcq".

 
