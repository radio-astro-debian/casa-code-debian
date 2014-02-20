#!/bin/bash

INSTALLED=`pwd`/installed

pushd release-4_2_0
mkdir -p installed

pushd casacore
mkdir -p build

pushd build
cmake .. -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=${INSTALLED} -DCMAKE_C_FLAGS=-fPIC -DCMAKE_CXX_FLAGS=-fPIC
make -j install
popd

popd

pushd code
mkdir -p build
cd build

pushd build
cmake .. -DCASACORE_ROOT_DIR=${INSTALLED} -DSKIP_PGPLOT=ON

