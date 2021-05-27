#!/bin/bash

# 编译Fortran代码

basepath=$(cd `dirname $0`; pwd)

cp ${basepath}/CMakeLists.txt ./ &&\
mkdir -p build &&\
cd build &&\
cmake .. &&\
make -j 20 &&\
cd .. &&\
rm -f CMakeLists.txt &&\
cp ${basepath}/sub ./ &&\
ln -sf build/unnamed.e unnamed.e

