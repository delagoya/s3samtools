FROM amazonlinux:2018.03
LABEL software="samtools" \
      software.version="1.8" \
      description="Samtools 1.8 with built in support for private S3 buckets via ECS Task Roles" \
      tags="genomics, aws"
MAINTAINER Angel Pizarro <delagoya@gmail.com>
RUN yum install -y jq && yum clean all
COPY samtools-ecs-s3 /usr/local/bin/samtools-ecs-s3
COPY samtools-wrapper.sh /usr/local/bin/samtools
CMD ["samtools"]
