REGISTRY='delagoya'
SAMTOOLS_VERSION='1.8'
VERSION="0.0.2"

samtools-build:
	docker run -it --rm -v `pwd`:`pwd` -w `pwd` amazonlinux sh build-samtools-ecs-s3.sh ${SAMTOOLS_VERSION}

docker-build:
	docker build -t samtools-ecs-s3:${VERSION} -t samtools-ecs-s3:latest -f samtools-ecs-s3.dockerfile .

docker-push:
	docker tag samtools-ecs-s3:latest  ${REGISTRY}/samtools-ecs-s3:${VERSION}
	docker tag samtools-ecs-s3:latest  ${REGISTRY}/samtools-ecs-s3:latest
	docker push ${REGISTRY}/samtools-ecs-s3:${VERSION}
	docker push ${REGISTRY}/samtools-ecs-s3:latest

all: samtools-build docker-build
