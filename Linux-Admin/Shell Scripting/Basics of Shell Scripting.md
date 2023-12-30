A shell script is an executable file containing multiple shell commands that are executed sequentially. The file can contain:

- Shell (#!/bin/bash)
- Comments (# commment)
- Commands (echo, cp, grep, etc...)
- Statements (if, while, for etc...)

**Note**: 
- Shell scripts should have executable permissions (e.g. -rwxr-xr-x)
- Shell script has to be called from the absolute path

**Example**

```bash
#!/bin/bash

echo "Hello World"
```

## Input/Output Scripts

Scripts can take an input from the user using **read**

```bash
#!/bin/bash

host=hostname

echo Hello I am $host
echo What is your name?
read name
echo Hello $name!
```

## If/Then Scripts

You can use conditional statements in bash scripts

```bash
#!/bin/bash

echo Enter a number:
read number

if[ $number -eq 100 ]
then 
	echo number is 100
else
	echo number is not 100
fi
```

1. **Numeric Comparisons**:
    
    - `-eq`: Equal to (e.g., `[ "$a" -eq "$b" ]`)
    - `-ne`: Not equal to (e.g., `[ "$a" -ne "$b" ]`)
    - `-lt`: Less than (e.g., `[ "$a" -lt "$b" ]`)
    - `-le`: Less than or equal to (e.g., `[ "$a" -le "$b" ]`)
    - `-gt`: Greater than (e.g., `[ "$a" -gt "$b" ]`)
    - `-ge`: Greater than or equal to (e.g., `[ "$a" -ge "$b" ]`)
    
1. **String Comparisons**:
    
    - `=`: Equal to (e.g., `[ "$a" = "$b" ]`)
    - `!=`: Not equal to (e.g., `[ "$a" != "$b" ]`)
    - `<`: Less than (in lexicographical order, e.g., `[ "$a" \< "$b" ]`)
    - `>`: Greater than (in lexicographical order, e.g., `[ "$a" \> "$b" ]`)
    
1. **File and Directory Tests**:
    
    - `-e`: File or directory exists (e.g., `[ -e "$file" ]`)
    - `-f`: File exists and is a regular file
    - `-d`: Directory exists
    - `-s`: File exists and has a size greater than zero
    - `-r`: File is readable
    - `-w`: File is writable
    - `-x`: File is executable
    - `-z`: String is empty
    
1. **Logical Operators**:
    
    - `-a` (AND): Combines two conditions (e.g., `[ "$a" -eq 1 -a "$b" -eq 2 ]`)
    - `-o` (OR): Combines two conditions (e.g., `[ "$a" -eq 1 -o "$b" -eq 2 ]`)
    - `!` (NOT): Negates a condition (e.g., `[ ! -e "$file" ]`)
    
1. **Compound Conditions**:
    
    - Use parentheses to group conditions (e.g., `[ "$a" -eq 1 ] && [ "$b" -eq 2 ]` for AND, `[ "$a" -eq 1 ] || [ "$b" -eq 2 ]` for OR).
    
1. **Pattern Matching**:
    
    - `==`: Matches a pattern (e.g., `[[ "$string" == "pattern" ]]`)
    - `=~`: Matches a regular expression (e.g., `[[ "$string" =~ ^[0-9]+$ ]]`)

## For Loop Scripts

You can invoke for loop inside of you bash scripts as well as indexed and associative arrays

1. **Indexed Arrays**:

Indexed arrays are arrays where elements are accessed by their position or index, starting from 0. Here's how you can define and initialize an indexed array:

```bash
#!/bin/bash

my_array=("apple" "banana" "cherry" "date")

echo "${my_array[0]}"

for item in "${my_array[@]}"; 
do 
	echo "$item" 
done
```

2. **Associative Arrays**:

Associative arrays, also known as dictionaries or maps, allow you to use arbitrary keys to access elements. They were introduced in Bash 4.0 and later versions. Here's how you can define and initialize an associative array:

You can access elements by their keys:

```bash
#!/bin/bash

declare -A my_assoc_array 
my_assoc_array["name"]="John" 
my_assoc_array["age"]=30

echo "${my_assoc_array["name"]}"
echo "${my_assoc_array["age"]}"

for key in "${!my_assoc_array[@]}"; 
do 
	echo "Key: $key, Value: ${my_assoc_array[$key]}" 
done
```

Double quotes around array elements and keys to ensure proper handling of whitespace and special characters. Bash arrays are versatile and useful for storing collections of data in your scripts.
## Do While Scripts

you can use the `while` loop to repeatedly execute a block of code as long as a specified condition is true

**Examples**

```bash
#!/bin/bash

count=0
num=10
while [ $count -lt 10 ] 
do
	echo $num seconds left to stop this process $count
	sleep 1
	count=$(count + 1)
	num=$((num -1))
done
```

```bash
#!/bin/bash

while true; 
do 
	echo "Iteration $counter" # Increment the counter 
	((counter++)) # This is the "while" part, which checks the condition 
	if [ "$counter" -le 5 ]; then 
		continue # Continue the loop if the condition is met 
	else 
		break # Exit the loop if the condition is not met 
	fi 
done
```


**When to Use a "do-while" Loop in Bash:**

1. **Menu-driven Scripts**: You can use a `do-while` loop to create menu-driven scripts where you repeatedly display a menu to the user and execute their choice until they choose to exit.
    
2. **Data Validation**: If you need to repeatedly prompt a user for input until they provide valid data, a `do-while` loop can be helpful. For example, you might ask a user to enter a positive number, and you keep asking until they provide a valid input.
    
3. **Iterating Over Data**: When you need to iterate over a dataset that may have an unknown number of elements, a `do-while` loop can be used to continue processing until you reach the end of the data.
    
4. **Handling Dynamic Conditions**: Sometimes, the condition for terminating a loop depends on the result of a calculation or external factors. In such cases, you can use a `do-while` loop to keep checking the condition after executing a block of code.
## Case Statement Scripts

Bash provides the `case` statement to perform different actions based on the value of a variable

```bash
#!/bin/bash

echo
echo Command Options:
echo 'a: Display Date and Time'
echo 'b: List file and directories'
echo 'c: List users logged in'
echo 'd: Check System uptime'
echo
read choice

case $choice in
	a) date;;
	b) ls;;
	c who;;
	d) uptime;;
	*) echo invalid choice
esac

```


## Aliases

alias is a user-defined shortcut or abbreviation for a longer command or a series of commands. Aliases are particularly useful for simplifying complex or frequently used commands, making them easier to remember and type. Aliases are typically defined in configuration files like `.bashrc` or `.bash_aliases` for the Bash shell. Here's a description and some examples of aliases in Linux:

**Description**:

- An alias is a custom command that you create to replace longer or more complex commands with a shorter and more convenient name.
- Aliases are defined using the `alias` command followed by the alias name, an equal sign, and the command(s) you want to associate with the alias.
- Aliases are especially helpful for reducing the typing effort required to run frequently used commands and for creating personalized shortcuts in your shell environment.

**Examples of Aliases**:

1. **Basic Aliases**:
    
    - Here's a simple example of creating an alias to display a list of files with long format and human-readable file sizes:
        
		`alias l="ls -lh"`
        
        After defining this alias, you can use `l` instead of `ls -lh` to list files.
        
2. **Aliases with Arguments**:
    
    - You can create aliases that accept arguments. For instance, creating an alias to search for files with a specific extension:
        
        `alias findext="find . -type f -name"`
        
        Now, you can use `findext .txt` to search for all `.txt` files in the current directory and its subdirectories.
        
3. **Complex Aliases**:
    
    - Aliases can encompass more complex commands. For example, creating an alias to compress a directory into a tarball and move it to a backup folder:
        
        `alias backup="tar -czvf /path/to/backup/folder/backup_$(date +'%Y%m%d_%H%M%S').tar.gz"`
        
        This alias will create a compressed backup with a timestamp in the filename each time you run `backup`.
        
4. **Combining Multiple Commands**:
    
    - You can use aliases to chain multiple commands together. Here's an alias that updates your package manager and upgrades all packages:
        
        `alias updateall="sudo apt update && sudo apt upgrade -y"`
        
        Running `updateall` will execute both update and upgrade commands in one go.
        
5. **Removing an Alias**:
    
    - To remove an alias, you can use the `unalias` command followed by the alias name. For example:
        
        `unalias l`
        
        This removes the `l` alias defined earlier.
        
6. **Persistent Aliases**:
    
    - To make aliases persistent across sessions, you can define them in your shell configuration file (e.g., `.bashrc`, `.bash_aliases`, `.zshrc`). These files are typically located in your home directory.

**User-Specific Aliases**:

User-specific aliases are aliases that are defined for a particular user and apply only when that user is logged in. These aliases are typically defined in the user's shell configuration file, such as `.bashrc`, `.bash_aliases`, or `.zshrc`, located in the user's home directory. Each user can have their own set of custom aliases tailored to their needs.

For example, if you have a user named "john," you can define user-specific aliases in John's `.bashrc` file:

```bash
alias ll="ls -l"
alias h="history"
```

These aliases will only be available to the "john" user when they log in.

**Global Aliases**:

Global aliases, also known as system-wide aliases, are aliases that apply to all users on the system. They are defined in system-wide shell configuration files, such as `/etc/bashrc`, `/etc/profile`, or `/etc/zshrc`. Global aliases are not limited to a specific user and are available to all users who log in to the system.

Here's an example of a global alias defined in `/etc/bashrc`:

```bash
alias alert="echo -e '\a'
```

This alias will be available to all users on the system.

**Usage Considerations**:

- User-specific aliases are convenient for allowing each user to customize their shell environment according to their preferences and needs.
    
- Global aliases can be useful for defining system-wide shortcuts or standard commands that should be available to all users. However, you should use caution when defining global aliases, as they affect all users and can potentially lead to conflicts or unexpected behavior.
    
- When defining global aliases, it's essential to be aware of the potential impact on system behavior and to choose alias names that are not likely to conflict with existing commands or aliases used by users.

## Shell History

A shell history refers to a log or record of commands and actions executed by a user in a command-line shell or terminal session. The shell history keeps track of the commands that have been typed, along with their associated timestamps. Shell histories are a valuable tool for several reasons:

**1. Command Recall**: One of the primary purposes of a shell history is to allow users to recall and repeat previously executed commands easily. Users can navigate through their command history to rerun specific commands without having to retype them, which can save time and reduce the likelihood of errors.

**2. Troubleshooting**: Shell history is a helpful resource for troubleshooting and diagnosing issues. If a problem occurs, users can review their command history to identify the sequence of commands leading up to the issue, helping them pinpoint the cause.

**3. Learning and Documentation**: Shell history serves as documentation of a user's interaction with the command-line interface. It can be a valuable resource for users who are learning to use the shell, as it provides a record of their previous actions and commands.

**4. Reproducibility**: In cases where specific sequences of commands need to be reproduced or shared with others, the shell history provides a straightforward way to document and share those sequences.

**5. Efficiency**: By using the history feature, users can avoid retyping long or complex commands and can quickly access frequently used commands.

Common shell history features and commands include:

- **Up and Down Arrow Keys**: Most command-line shells allow users to navigate through their command history using the up and down arrow keys.
    
- **`history` Command**: Typing `history` at the command prompt displays a numbered list of previous commands, often with timestamps.
    
- **`!!` and `!n`**: These shortcuts allow users to rerun the last command (`!!`) or a specific command by its number (`!n`) from the history.
    
- **`!string`**: This syntax allows users to rerun the most recent command that starts with a specific string. For example, `!ls` would rerun the most recent `ls` command.
    
- **`Ctrl+R`**: In many shells, pressing `Ctrl+R` initiates a reverse search through the command history, allowing users to search for and rerun previous commands by typing a portion of the command.
    
- **Customization**: Users can often customize their shell history settings, including the number of commands to retain in history, the format of the history file, and more.
    
- **History File**: The history is typically stored in a file (e.g., `~/.bash_history` for Bash) on the user's system.

```bash
$ history
```