#!/bin/bash
B='http://169.254.169.254/latest/meta-data/iam/security-credentials/'
CREDS=''
if [ -n "${AWS_CONTAINER_CREDENTIALS_RELATIVE_URI}" ]; then
    CREDS=$(curl -s --connect-timeout 0.1 -s 169.254.170.2${AWS_CONTAINER_CREDENTIALS_RELATIVE_URI} |  jq -r "\"AWS_ACCESS_KEY_ID='\(.AccessKeyId)' AWS_SECRET_ACCESS_KEY='\(.SecretAccessKey)' AWS_SESSION_TOKEN='\(.Token)'\"")
elif [ -n "$(curl -s --connect-timeout 0.1 $B)" ]; then
    R=$(curl -s --connect-timeout 0.1 $B)
    CREDS=$(curl -s --connect-timeout 0.1 $B$R |  jq -r "\"AWS_ACCESS_KEY_ID='\(.AccessKeyId)' AWS_SECRET_ACCESS_KEY='\(.SecretAccessKey)' AWS_SESSION_TOKEN='\(.Token)'\"")
fi
eval ${CREDS} samtools-ecs-s3 $*
