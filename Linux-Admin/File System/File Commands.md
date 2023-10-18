
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

### awk

utility/language designed for data extraction. Most of the time it is used to extract fields from a file or from an output

|Option|Description|Example|
|:--|:--|:--|
| '{print $1}' |list field from a file/output |awk '{print $1}' file|
|'{print $1, $3}'|list multiple fields from file/output|ls -l \| awk '{print $1, $3}'|
|'{print $NF}'|list last field of the output|ls -l \| awk '{print $NF}'|
| '/search_word/ {print}'|search fields for a specific word|awk '/Hello/ {print}' file|
|-F: '{print $1}'|list field seperated by a delimiter|awk -F: '{print $1}' file|
| '{$2="Word"; print $0}'| replace words field words| echo "Hello Tom" \| awk '{$2="Adam"; print $0}'|
|'length($0) > n'| get lines that have more then n byte size|awk 'length($0) > 15' file|
|'{if $n == 'word'} print $0'| if field n == word print row| ls -l \| awk '{if($9 == "Hello") print $0}'|
|'{print NF}'| get the number of fields | ls -l \| awk '{print NF}'|

### grep/egrep

(global regular expression print) processes text line by line and prints any lines which match a specific pattern

|Option|Description|Example|
|:--|:--|:--|
| <keyword_name>  | search for rows with a specific keyword |grep Hello file|
| -c| search for keyword and count times it shows up| grep -c Hello file|
|-i| search for keyword ignore case-sensitive| grep -i hello file|
|-n| display the matched lines and their line numbers| grep -n hello file|
|-v|display everything but the keyword|grep -v Hello file|

You can pipe grep outputs with other commands and you can combine the options behind a single ***-***

**Example**: Get the first 3 characters from the first fields in a file were hello is in the line

```bash
$ grep -ni hello file | awk '{print $1}' | cut -c1-3
```


***egrep***: allows you to search multiple keywords

```bash
$ egrep -i "keyword|keyword2" file
```

### sort/uniq

- ***sort*** - sorts in alphabetical order

|Option|Description|Example|
|:--|:--|:--|
|-r| sort in desc order| sort -r file|
|-k| sort by specific field| sort -k2 file|

- ***uniq*** - filters out the repeated or duplicate lines

|Option|Description|Example|
|:--|:--|:--|
|-c |list count| sort file \| uniq -c |
|-d| show only repeated lines| uniq -d|

### wc
(word count) reads either input or a list of files (directory) and generates:
	- newline count
	- word count
	- byte count
	- 
`[line] [words] [bytes] [file_name]`

|Option|Description|Example|
|:--|:--|:--|
|-l|only line count|wc -l file|
|-w|only word count|wc -w file|
|-c|only byte count|wc -c file|

### Compare Files

- ***diff*** - compares files line by line

```bash
$ diff file file2
```

- ***cmp*** - compares files byte by byte

```bash
$ cmp file file2
```

### Compressing and Uncompressing files

1. `tar` (Tape Archive):
    
    - `tar` is a command-line utility used for creating and extracting compressed archive files, often referred to as "tarballs."
    - It does not compress files by itself; instead, it bundles multiple files and directories into a single archive file.
    - Commonly used options:
        - `-c`: Create a new archive.
        - `-x`: Extract files from an archive.
        - `-f`: Specifies the archive file name.
        - `-v`: Verbose mode (optional, for displaying progress).
        - `-z`: Compress the archive using gzip.
        - `-j`: Compress the archive using bzip2.
    - Example of creating a tar archive:
        
```bash
$ tar -czvf archive.tar.gz /path/to/files
```
        
- Example of extracting files from a tar archive:
        
```bash
$ tar -xzvf archive.tar.gz
```
        
2. `gzip` (GNU Zip):
    
    - `gzip` is a compression utility used to compress files into a compressed format with the `.gz` extension.
    - It replaces the original file with a compressed version, typically reducing its size.
    - Example of compressing a file:
        
```bash
$ gzip filename.txt
```
        
- This will create a compressed file named `filename.txt.gz` and remove the original `filename.txt`.

3. `gunzip`:
    
    - `gunzip` is the counterpart to `gzip` and is used to decompress `.gz` files created by `gzip`.
    - It restores the original file from its compressed version.
    - Example of decompressing a file:
        
```bash
$ gunzip filename.txt.gz
```
  
- This will decompress `filename.txt.gz` and restore the original `filename.txt` file.

### Truncate
used to shrink or extend the size of a file to the specified size. Unlike compressing `truncate` chops or cuts a files content to fit the specified size which can cause lose of content in a file.

```bash
$ truncate -s 10 file
```

### Combining and Splitting Files

Splitting and combining files are common operations in Linux and other operating systems, and they are useful for various purposes, such as managing large files, transferring data, or creating archives. Here's an explanation of both processes with examples:

**Splitting Files:**

Splitting a file involves breaking it into smaller pieces. This can be helpful when you need to distribute or transfer large files or when you want to fit a file onto multiple storage devices. In Linux, the `split` command is used for this purpose.

Syntax of the `split` command:

```bash
$ split [options] [input_file] [output_prefix]
```

- `[input_file]`: The file you want to split.
- `[output_prefix]`: A prefix for the output file segments.
- `[options]`: Various options for specifying the size and naming of the output segments.

Example of splitting a file into smaller segments with a specific size:

```bash 
$ split -b 10M largefile.txt segment_
```

This command splits `largefile.txt` into segments of 10 megabytes each, and the output files will be named `segment_aa`, `segment_ab`, `segment_ac`, and so on.

**Combining Files:**

Combining files involves merging multiple smaller files back into a single larger file. This is useful when you need to reconstruct the original file from its split segments. In Linux, the `cat` command is commonly used for this purpose.

Syntax of the `cat` command:

```bash
$ cat [options] [input_files] > [output_file]
```

- `[input_files]`: The list of input files that you want to combine.
- `[output_file]`: The name of the output file where the combined data will be stored.
- `[options]`: Various options for controlling the behavior of `cat`.

Example of combining split segments into a single file:

```bash
$ cat segment_* > recombined_file.txt
```

This command concatenates all files matching the pattern `segment_*` into a single file named `recombined_file.txt`.