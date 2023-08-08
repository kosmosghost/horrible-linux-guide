## Detach processes from shell

### disown
Disown will detach a process from the shell allowing you to exit the server and allow the process to continue running.

An example of use:

```
rsync <OPTION> <SOURCE> <DEST>
```

Once running suspend the process using ^Z. Then use the “bg” command to run in the process in the background. Afterwards use the command “disown” to detach the process from the active shell.

### nohup
Nohup does the same as disown. For example:

```
nohup apt upgrade 
```
