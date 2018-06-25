# S3 Samtools

This is a example of how to build a Docker container for [Samtools](http://www.htslib.org) that has support for Amazon S3 in a way that works for Amazon ECS and AWS Batch. Two requirements were needed to be satisfied:


1. The build needed to include support for `libcurl` and for the `plugin-dir` to include S3 functionality.
2. A wrapper script needed to be written to pull AWS credentials from instance metadata so that Samtools is able to create the right signature for the S3 API.


Also, in order to have as small a container as possible, I separated the build of the `samtools` binary from the creation of the `samtools-ecs-s3` container.

## USAGE

You can simply get the latest version from Docker hub:

## Building

To build the project, usage `make`

```shell
# default version is 1.8
make VERSION=1.8
```

If you want to push out to your own Docker registry, set the `REGISTRY` make variable:

```shell
make docker-push VERSION=1.8 REGISTRY=my.awesome.docker.registry
```

## Developing

This repository is licensed under MIT and can be freely used provided that the license terms are respected, refer to the [`LICENSE`](./LICENSE) file. So fork away and have at it.
