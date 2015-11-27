satellite_cv-tool
=================

Wrapper tool around hammer to manage content views in Satellite 6

How to use these scripts
========================
publish-promote-cv.sh
---------------------

* Update vars file
* Set USERNAME to a user with sufficient privileges
* Set ORGANIZATION to the name of the organization you wish to manipulate

Example run:

```
$ ./publish-promote-cv.sh
Password: 
----------------|---------------------------|---------------------------|-----------|---------------
CONTENT VIEW ID | NAME                      | LABEL                     | COMPOSITE | REPOSITORY IDS
----------------|---------------------------|---------------------------|-----------|---------------
7               | RHEL7-core                | RHEL7-core                |           | 3             
----------------|---------------------------|---------------------------|-----------|---------------
Content view to publish [id]: 7
[................................................................................................................................] [100%]
Task bcf28cd9-3c93-40ff-940f-bf96564864a7: success
---|--------------|---------|-----------------|-------------------|-------------------
ID | NAME         | VERSION | CONTENT VIEW ID | CONTENT VIEW NAME | CONTENT VIEW LABEL
---|--------------|---------|-----------------|-------------------|-------------------
23 | RHEL7-core 6 | 6       | 7               | RHEL7-core        | RHEL7-core        
22 | RHEL7-core 5 | 5       | 7               | RHEL7-core        | RHEL7-core        
21 | RHEL7-core 4 | 4       | 7               | RHEL7-core        | RHEL7-core        
18 | RHEL7-core 3 | 3       | 7               | RHEL7-core        | RHEL7-core        
17 | RHEL7-core 2 | 2       | 7               | RHEL7-core        | RHEL7-core        
16 | RHEL7-core 1 | 1       | 7               | RHEL7-core        | RHEL7-core        
---|--------------|---------|-----------------|-------------------|-------------------
Promote version [id]: 23
---|-------------|------------
ID | NAME        | PRIOR      
---|-------------|------------
2  | Development | Library    
1  | Library     |            
4  | Production  | QA         
3  | QA          | Development
---|-------------|------------
Promote to environment [id]: 2
[................................................................................................................................] [100%]
Task 7b72c426-9f6c-4059-8cf0-be6b8a9fa2e8: success
```
Results
-------
Content view published with new version and promoted to environment of choice.


