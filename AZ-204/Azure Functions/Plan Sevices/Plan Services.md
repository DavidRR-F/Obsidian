Consumption Plan (Serverless) (Cold-Starts)
- You only pay for the time your code or application is running
- Billing Based on the number of executions, the duration of each execution, and the amount of memory used
- Just pay while you have functions running and scale-out automatically, even though long loading times.
Premium Plan (Functions Premium) Pre-Warmed
- The user deignates a set of pre-warmed cases, which are already online and ready to react
- Azure provides any additional computing services that are required when your function is running
- You pay from constantly pre-warmed instances including any additional instances needed to scale the Azure app I/O
- Azure functions host instances are added and removed based on the number of incoming events
Dedicated Plan (App Service Plan)
- When you use App service for other apps, your functions will run on the same plan (VMs) at no extra cost
- You may scale it out manually by adding more VM instances for an App Service plan
- You may also have autoscale enabled
- Optimized when you have existing underutilized VMs, which also operate other instances of the App Service

Links:
[[Storage Consideration]]
[[Function as a Service]]
[[Serverless Applications]]
[[Durable Functions]]
[[Azure Functions on Kubernetes]]
