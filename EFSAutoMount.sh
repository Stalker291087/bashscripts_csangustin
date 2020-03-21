#!/bin/bash

# To Mount the EFS file systems at reboot

sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-7db1fc64.efs.us-west-1.amazonaws.com:/ /mnt/MoodleData

sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-48a9e451.efs.us-west-1.amazonaws.com:/ /mnt/MoodleCode