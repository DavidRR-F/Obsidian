Azure VMs come in a variety of sizes that are also optimized for specific use cases.

### Azure VMs are grouped into:
- **Types**: General Purposes, Compute Optimized, etc...
- **Sizes**: B, Dsdv3, etc...

| Types | Use Cases | Sizes |
|:-------:|:-------------:|:-----:|
| General Purpose |Balanced CPU-to-Memory ratio. Testing and development, small to medium databases, and low to medium traffic web servers|B, Dsv3, Dv3, Dasv4, Dav4, DSv2, Dv2, Av2, DC, DCv2, Dv4, Ddv4, Ddsv4|
| Compute Optimized | High CPU-to-Memory ratio. Good for medium traffic web servers, network appliances, batch processes, and app servers | F, Fs, Fsv2 |
| Memory Optimized | High Memory-to-CPU ratio. Great for relational database servers, medium to large caches, and in-memory analytics | Esv3, Ev3, Easv4, Eav4, Ev4, Esv4, Edv4, Edsv4, Mv2, M, DSv2, Dv2 |
|Storage Optimized | High disk thoughput and IO ideal for Big Data, SQL, NoSQL databases, data warehousing and large transactional databases| Lsv2 |
| GPU Optimized | Specialized VMs for heavy graphic rendering and video editing, model training and inferencing (ND) with deep learning | NC, NCv2, NCv3, NCasT4_v3, ND, NDv2, NV, NVv3, NVv4 |
| High performance compute | Fastest and most powerful CPU VMs with optional high-throughput network interfaces (RDMA) | HB, HBv2, HC, H |