#!/bin/sh
if [ -z "$1" ]; then
  VERSION=$1
else
  VERSION=1.8
fi

ORIG_DIR=$(basedir $0)

cd /tmp
# yum
yum update -y
yum install -y gcc \
               ncurses-devel \
               libcurl-devel \
               bzip2 \
               bzip2-devel \
               xz-devel \
               libzip-devel \
               openssl-devel

# download htslib & samtools
curl -L -O https://github.com/samtools/samtools/releases/download/${VERSION}/samtools-${VERSION}.tar.bz2

# unpack & move
tar -xjf samtools-${VERSION}.tar.bz2

# configure & build htslib
cd samtools-${VERSION}/htslib-${VERSION}
./configure --enable-plugins --enable-libcurl --with-plugin-dir=$(pwd)
make
cd .. && ./configure && make
cp samtools ${ORIG_DIR}/samtools-ecs-s3
