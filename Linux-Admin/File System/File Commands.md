
## I/O Commands
### Pipes
A pipe is used by the shell to connect the output of one commmand directly to the input of another command

	  - command1 [arguements] | command2 [arguements]

```bash
$ ls -l | more
```
### Redirects
-  ***>*** (stdout) - write output over file

```bash
$ echo "Hello World" > my_file
```

- ***>>*** (stdout) - append output to file

```bash
$ echo "Hello Again" >> my_file
```

- ***<*** (stdin) - output file to terminal

```bash
$ mail "Hello World" example@example.com < my_file
```

- ***2>*** (stder) - output error to file 

```bash
$ rmdir not/my/dir 2> errorfile
```
#### tee
used to store and view (both at the same time) the output of any command i.e. send outputs to both a file and the terminal

![[Pasted image 20231016205601.png]]
##### Overwrite with tee:

```bash
$ echo "Hello World" | tee message
```

##### Append with tee

```bash
$ echo "Hello World" | tee -a message
```

##### Output to multiple files

```bash
$ echo "Hello World" | tee -a file1 file2 file3
```

## File Editor Commands

- ***vi***
- ***nano***
### Help Commands

- ***whatis*** command
- command ***--help*** 
- ***man*** command

## File Maintenance Commands


| Command | Description | Example |
|:------------|:--------------|:---------|
|cp| copy file | cp source destination |
|rm| remove file | rm file |
|mv| mv file | mv source destination |
|mkdir | make directory | mkdir my_dir |
|rmdir (rm -r)| remove directory | rmdir my_dir|

## File Display Commands


| Command | Description | Example |
|:------------|:--------------|:---------|
|cat| view text file | cat file |
|less| view text file page by page | less file |
|more| view text file page by page | more file |
|head| view top n lines in file | head -10 file |
|tail| view bottom n lines in file | tail -10 file|

## Text Processing Commands

### cut
allows you to cut parts of lines from specified files or piped data and print the results to a stdout

| Option | Description | Example |
|:------------|:--------------|:---------|
| -c1 | list one charater | cut -cl file |
| -c1,2,4| pick and choose characters | cut -cl,2,4 file |
| -c1-3| pick a range of charaters | cut -c1-10 file |
| -c1-3,6-8| list specific range of charaters | cut -c1-10,20-34 file |
| -d: -f 6 | list of columns by a delimiter | cut -d: -f 2 file|

Also works on the output of a command

```bash
$ ls -l | cut -c2-4
```

