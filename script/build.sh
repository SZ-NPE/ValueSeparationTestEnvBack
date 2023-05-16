#!/bin/bash
set -x
export LC_ALL=C
export SCRIPT_HOME=$(pwd)
export ROCKSDB_HOME=$(pwd)/../rocksdb
export HASHKV_HOME=$(pwd)/../HashKV
export DIFFKV_HOME=$(pwd)/../diffkv
export TERARKDB_HOME=$(pwd)/../terarkdb


# rocksdb
mkdir ${ROCKSDB_HOME}/build
cd ${ROCKSDB_HOME}/build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j32

# #hashkv
# cd ${HASHKV_HOME}/lib/HdrHistogram_c-0.9.4 && cmake . && make -j32
# chmod 777 ${HASHKV_HOME}/lib/leveldb/build_detect_platform
# cd ${HASHKV_HOME}/lib/leveldb &&  make -j32 
# cd ${HASHKV_HOME} && make 

# diffkv
cd ${DIFFKV_HOME}/dep/rocksdb && make static_lib -j32
mkdir ${DIFFKV_HOME}/build
cd ${DIFFKV_HOME}/build && cmake -DROCKSDB_DIR=${DIFFKV_HOME}/dep/rocksdb -DCMAKE_BUILD_TYPE=Release .. && make -j32

# terarkdb
mkdir ${TERARKDB_HOME}/build
cd ${TERARKDB_HOME}/build && cmake ../ \
  -DCMAKE_BUILD_TYPE=Release \
  -DWITH_TESTS=OFF \
  -DWITH_ZENFS=OFF \
  -DWITH_BYTEDANCE_METRICS=OFF \
  -DWITH_TOOLS=ON \
  -DWITH_TERARK_ZIP=OFF \
  && make -j32