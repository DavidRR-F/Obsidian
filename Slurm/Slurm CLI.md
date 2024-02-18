### 1. `sacct`

**Description**: Used to report job or job step accounting information about active or completed jobs.

|Option|Description|
|---|---|
|`-j`, `--jobs`|Specify the jobs or job steps to report on.|
|`--format`|Specify the information to display.|
|`--starttime`, `--endtime`|Specify the time range for the report.|

### 2. `salloc`

**Description**: Allocates resources for a job in real time, typically used to allocate resources and spawn a shell for executing `srun` commands.

|Option|Description|
|---|---|
|`-N`, `--nodes`|Specify the minimum and maximum number of nodes.|
|`-n`, `--ntasks`|Specify the number of tasks to run.|
|`--mem`|Specify the amount of memory required per node.|

### 3. `sattach`

**Description**: Attaches standard input, output, and error, plus signal capabilities to a currently running job or job step.

|Option|Description|
|---|---|
|`--jobid`|Specify the job or job step to attach to.|
|`--input`|Redirect job's standard input from a file.|
|`--output`, `--error`|Redirect job's standard or error output to a file.|

### 4. `sbatch`

**Description**: Submits a job script for later execution, containing `srun` commands to launch tasks.

|Option|Description|
|---|---|
|`--job-name`|Specify a name for the job.|
|`--output`|Specify the file for standard output.|
|`--error`|Specify the file for standard error.|
|`--partition`|Specify the partition to submit the job to.|

### 5. `sbcast`

**Description**: Transfers a file from local disk to nodes allocated to a job, useful for diskless compute nodes or improving performance.

|Option|Description|
|---|---|
|`--jobid`|Specify the job to transfer files to.|
|`--input`|Specify the local file to transfer.|
|`--output`|Specify the destination path on the node(s).|

### 6. `scancel`

**Description**: Cancels a pending or running job or job step, or sends an arbitrary signal to all associated processes.

|Option|Description|
|---|---|
|`--job`|Specify the job or job step to cancel.|
|`--signal`|Send a signal to all processes of the job or job step.|

### 7. `scontrol`

**Description**: An administrative tool to view or modify SLURM state, primarily used by root.

|Option|Description|
|---|---|
|`show`|Display information about jobs, nodes, partitions, etc.|
|`update`|Modify the properties of jobs, nodes, partitions, etc.|

### 8. `sinfo`

**Description**: Reports the state of partitions and nodes, with various options for filtering and formatting.

|Option|Description|
|---|---|
|`--summarize`|Provide a summary of node availability.|
|`--nodes`|Show detailed status for specified nodes.|
|`--partitions`|Show detailed status for specified partitions.|

### 9. `sprio`

**Description**: Displays a detailed view of the components affecting a job's priority.

|Option|Description|
|---|---|
|`--job`|Specify the job to display priority information for.|

### 10. `squeue`

**Description**: Reports the state of jobs or job steps, with options for filtering, sorting, and formatting.

|Option|Description|
|---|---|
|`--start`|Show jobs that are expected to start in the future.|
|`--long`|Provide detailed information about each job.|

### 11. `srun`

**Description**: Submits a job for execution or initiates job steps in real time, with extensive options for specifying resources.

|Option|Description|
|---|---|
|`-N`, `--nodes`|Specify the number of nodes.|
|`-n`, `--ntasks`|Specify the number of tasks to run.|
|`--exclusive`|Allocate nodes for exclusive use by this job.|

### 12. `sshare`

**Description**: Displays information about fairshare usage on the cluster.

|Option|Description|
|---|---|
|`--user`|Display fairshare information for a specific user.|

### 13. `sstat` 

**Description**: used to get information about the resources utilized by a running job or job step.

|Option|Description|
|---|---|
|`-a, --allsteps`|Print all steps for the given job(s) when no step is specified.|
|`-e, --helpformat`|Print a list of fields that can be specified with the `--format` option.|
|`-h, --help`|Print this description of use.|
|`-i, --pidformat`|Predefined format to list the PIDs running for each job step. (JobId, Nodes, Pids)|
|`-j, --jobs`|Format is `<job(.step)>`. Stat this job step or comma-separated list of job steps. This option is required. The step portion will default to the lowest numbered (not batch, extern, etc) step running if not specified, unless the `--allsteps` flag is set where not specifying a step will result in all running steps to be displayed. A step id of 'batch' will display the information about the batch step. A step id of 'extern' will display the information about the extern step when using PrologFlags=contain.|
|`-n, --noheader`|No header will be added to the beginning of output. The default is to print a header.|
|`--noconvert`|Don't convert units from their original type (e.g., 2048M won't be converted to 2G).|
|`-o, --format`|Comma-separated list of fields. (use `--helpformat` for a list of available fields).|
|`-p, --parsable`|Output will be '|
|`-P, --parsable2`|Output will be '|
|`--usage`|Display brief usage message.|
|`-v, --verbose`|Primarily for debugging purposes, report the state of various variables during processing.|
|`-V, --version`|Print version.|

### 14. `strigger` 

**Description**: used to set, get or view event triggers. Event triggers include things such as nodes going down or jobs approaching their time limit.

|Option|Description|
|---|---|
|`--set`|Create a trigger|
|`--get`|Get trigger information|
|`--clear`|Delete a trigger|
|`--burst_buffer`|Trigger event on burst buffer error|
|`--front_end`|Trigger event on FrontEnd node state changes|
|`-a, --primary_slurmctld_failure`|Trigger event when primary slurmctld fails|
|`-A, --primary_slurmctld_resumed_operation`|Trigger event on primary slurmctld resumed operation after failure|
|`-b, --primary_slurmctld_resumed_control`|Trigger event on primary slurmctld resumed control|
|`-B, --backup_slurmctld_failure`|Trigger event when backup slurmctld fails|
|`-c, --backup_slurmctld_resumed_operation`|Trigger event when backup slurmctld resumed operation after failure|
|`-C, --backup_slurmctld_assumed_control`|Trigger event when backup slurmctld assumed control|
|`-d, --down`|Trigger event when node goes DOWN|
|`-D, --drained`|Trigger event when node becomes DRAINED|
|`--draining`|Trigger event when node is DRAINING but not already DRAINED|
|`-e, --primary_slurmctld_acct_buffer_full`|Trigger event when primary slurmctld acct buffer full|
|`-F, --fail`|Trigger event when node is expected to FAIL|
|`-f, --fini`|Trigger event when job finishes|
|`--flags=perm`|Trigger event flag (perm = permanent)|
|`-g, --primary_slurmdbd_failure`|Trigger when primary slurmdbd fails|
|`-G, --primary_slurmdbd_resumed_operation`|Trigger when primary slurmdbd resumed operation after failure|
|`-h, --primary_database_failure`|Trigger when primary database fails|
|`-H, --primary_database_resumed_operation`|Trigger when primary database resumed operation after failure|
|`-i, --id=#`|A trigger's ID number|
|`-I, --idle`|Trigger event when node remains IDLE|
|`-j, --jobid=#`|Trigger related to specific jobid|
|`-M, --cluster=name`|Cluster to issue commands to. Default is current cluster. Reset to default with no name. Note: SlurmDBD must be up.|
|`-n, --node[=host]`|Trigger related to specific node, all nodes by default|
|`-N, --noheader`|Do not print the message header|
|`-o, --offset=#`|Trigger's offset time from event, negative to precede|
|`-p, --program=path`|Pathname of program to execute when triggered|
|`-Q, --quiet`|Quiet mode (suppress informational messages)|
|`-r, --reconfig`|Trigger event on configuration changes|
|`-R, --resume`|Trigger event when node is set to RESUME state|
|`-t, --time`|Trigger event on job's time limit|
|`-u, --up`|Trigger event when node returned to service from DOWN state|
|`--user`|A user name or ID to filter triggers by|
|`-v, --verbose`|Print detailed event logging|
|`-V, --version`|Print version information and exit|

### 15. `sview` 

**Description**: a graphical user interface to get and update state information for jobs, partitions, and nodes managed by Slurm.