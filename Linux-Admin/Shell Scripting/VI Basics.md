Vi is the premiere text editing tool or linux systems. The following is a list of the most command commands used for text editing files with vi
### **Normal Mode**:
    
- **h, j, k, l**: Navigate left, down, up, and right, respectively.
- **w, b**: Move forward by word (w) or backward by word (b).
- **0, $**: Move to the beginning (0) or end ($) of the current line.
- **^**: Move to the first non-whitespace character in the line.
### **Insert Mode**:
    
- **i**: Enter insert mode before the cursor.
- **I**: Enter insert mode at the beginning of the current line.
- **a**: Enter insert mode after the cursor.
- **A**: Enter insert mode at the end of the current line.
- **esc**: Exit insert mode
- **o, O**: Open a new line below (o) or above (O) the current line and enter insert mode.
### **Visual Mode**:
    
- **v**: Start character-wise visual mode.
- **V**: Start line-wise visual mode.
- **Ctrl-v**: Start block-wise visual mode.
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