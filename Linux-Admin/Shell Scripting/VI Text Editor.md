Vi is the premiere text editing tool or linux systems. The following is a list of the most command commands used for text editing files with vi
### **Normal Mode**:
    
| Key         | Action                              |
|-------------|-------------------------------------|
| `h`         | Move cursor left                    |
| `j`         | Move cursor down                    |
| `k`         | Move cursor up                      |
| `l`         | Move cursor right                   |
| `0`         | Move to the beginning of a line     |
| `$`         | Move to the end of a line           |
| `w`         | Jump forwards to the start of a word|
| `b`         | Jump backwards to the start of a word|
| `G`         | Go to the last line of the file     |
| `gg`        | Go to the first line of the file    |
| `dd`        | Delete line                         |
| `yy`        | Yank (copy) line                    |
| `p`         | Paste after the cursor              |
| `/`         | Search for a pattern                |
| `n`         | Repeat the last search              |
| `u`         | Undo                                |
| `Ctrl` + `r`| Redo                                |
| `:`         | Enter command line mode             |
| `i`         | Switch to insert mode               |
| `v`         | Switch to visual mode               |
| `V`         | Switch to visual line mode          |
| `Esc`       | Exit to normal mode                 |

### **Insert Mode**:
    
| Key         | Action                                  |
|-------------|-----------------------------------------|
| `Esc`       | Return to normal mode                   |
| Any Letter/Character | Insert the character at cursor  |
| `Backspace` | Delete the character before the cursor  |
| `Enter`     | Insert newline                          |
| `Ctrl` + `h`| Delete the character before the cursor  |
| `Ctrl` + `w`| Delete the word before the cursor       |
| `Ctrl` + `u`| Delete to the start of the line         |

### **Visual Mode**:
    
| Key         | Action in Visual Mode                   | Action in Visual Line Mode     |
|-------------|-----------------------------------------|--------------------------------|
| `h`, `j`, `k`, `l` | Extend selection characterwise    | Extend selection linewise      |
| `w`, `b`, `0`, `$` | Extend selection by word, to line start/end | Extend selection in line units|
| `y`         | Yank (copy) selection                    | Yank (copy) selected lines     |
| `d`         | Delete selection                        | Delete selected lines          |
| `>`         | Indent selection right                  | Indent selected lines right    |
| `<`         | Indent selection left                   | Indent selected lines left     |
| `Esc`       | Exit to normal mode                     | Exit to normal mode            |

### **Copy and Paste**:
    
- **y**: Yank (copy) selected text.
- **d**: Delete (cut) selected text.
- **p**: Paste the last yanked or deleted text after the cursor.
- **P**: Paste the last yanked or deleted text before the cursor.
### **Undo and Redo**:
    
- **u**: Undo the last change.
- **Ctrl-r**: Redo the last undo.
### **Search and Replace**:
    
- **/pattern**: Search forward for "pattern."
- **?pattern**: Search backward for "pattern."
- **:s/old/new**: Replace "old" with "new" on the current line.
- **:%s/old/new/g**: Replace "old" with "new" globally in the file.
### **File Operations**:
    
- **:w**: Save the file.
- **:q**: Quit Vi.
- **:wq**: Save and quit.
- **:q!**: Quit without saving (force quit).
### **Navigation**:
    
- **:n**: Go to the next line number.
- **:N**: Go to the previous line number.
- **:e filename**: Edit a new file.
- **:bnext, :bprev**: Switch between open buffers.
### **Miscellaneous**:
    
- **ZZ**: Save and quit (equivalent to :wq).
- **.**: Repeat the last change.
- **Ctrl-g**: Show file status and cursor position.