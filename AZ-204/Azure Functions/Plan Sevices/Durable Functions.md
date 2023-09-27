is a serverless compute extension of azure functions that allows you to write stateful function

- Orchestrator function: define stateful workflows (impicitly representing state via control flow)
- Entity function: manage the state of an entity (explicitly representing state)

- These workflows are defined in code, No JSON schemas or designers are needed
- The can call other functions synchronously and asynchronously
	- The output from the called functions can be saved to local variables
- They automatically checkpoint their progress whenever the function awaits.
	- Local state is never lost if the process or VM reboots

Language Support:
- C#
- F# 
- Javascript 
- Powershell

Patterns:
- Function chaining: pattern of executing a squence of functions in a specific order. Often the output of one function needs to be applied to the input of another function
![[Pasted image 20230725155630.png]]
- Fan-out/Fan-in: pattern of executing multiple functions in parallel and then waiting from them all to finish
	- Fanning out can be completed with normal functions by having the function send multiple messages to a queue
	- Fanning in is much more difficult because we have to write code to track when the queue-triggered functions end and store function outputs
![[Pasted image 20230725155956.png]]
- Async HTTP API: pattern addresses the problem of coordinating the state of long-running operations with external clients
	- http call trigger the long running action then redirect the client to a status endpoint that they can poll to learn when the operation is complete
	- provide built in APIs that simplify the code we write for interacting with long-running function executions
![[Pasted image 20230725160527.png]]
- Monitor: parttern refers to a flexible recurring process in a workflow such as polling until certain conditions are met
	- good for periodic cleanup jobs
	- can be addressed with regular timer-triggers, but its interval is fixed, making managing instance lifetimes difficult
![[Pasted image 20230725160801.png]]
- Aggregator: pattern is about aggregating event data over a period of time into a single addressable entity
	- The data being aggregated may come from multiple sources, be delivered in batches, or may be scattered over long periods of time
	- The aggregator may need to act on event data as it arrives external clients may need to query the aggregated data
![[Pasted image 20230725161227.png]]
