|Trigger|Description|
|:-------|:------------|
|HTTP trigger|HTTP request and returns HTTP|
|Timer Trigger|based on a schedule|
|Blob Storage Trigger|when files are uploaded/updated in a blob storage container|
|Cosmos DB Trigger|when processing a new/modified comsmos db documents|
|Durable Functions activity||
|Durable Dunctions HTTP Starter||
|Durable Functions orchestrator||
|Event Grid Trigger|triggered by event grid|
|Event Hub Trigger|triggered by event hub event|
|IoT Hub||
|Queue Storage Trigger||
|SendGrid|triggered by an email event in third-party service SendGrid|
|Sevice Bus Queue trigger|triggered by a message in a Bus Queue(messaging)|
|Service Bus Topic trigger|triggered by event from bus topic (pub/sub)|

Supported Bindings
![[Pasted image 20230725140640.png]]
![[Pasted image 20230725140702.png]]
Binding Directions:
- The direction of triggers is always in
- Input and output bindings use In and/or Out
- Some bindings support a special direction In Out
![[Pasted image 20230725143106.png]]
Binding Expressions\
![[Pasted image 20230725145016.png]]
![[Pasted image 20230725145029.png]]
![[Pasted image 20230725145049.png]]
![[Pasted image 20230725145126.png]]
