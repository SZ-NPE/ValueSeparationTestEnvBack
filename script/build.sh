#!/bin/bash
set -x
export LC_ALL=C
export SCRIPT_HOME=$(pwd)
export ROCKSDB_HOME=$(pwd)/../rocksdb
export HASHKV_HOME=$(pwd)/../HashKV
export DIFFKV_HOME=$(pwd)/../diffkv
export TERARKDB_HOME=$(pwd)/../terarkdb


# # rocksdb
# mkdir ${ROCKSDB_HOME}/build
# cd ${ROCKSDB_HOME}/build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j32

# #hashkv
# cd ${HASHKV_HOME}/lib/HdrHistogram_c-0.9.4 && cmake . && make -j32
# chmod 777 ${HASHKV_HOME}/lib/leveldb/build_detect_platform
# cd ${HASHKV_HOME}/lib/leveldb &&  make -j32 
# cd ${HASHKV_HOME} && make 

# # diffkv
# cd ${DIFFKV_HOME}/dep/rocksdb && make static_lib -j32
# mkdir ${DIFFKV_HOME}/build
# cd ${DIFFKV_HOME}/build && cmake -DROCKSDB_DIR=${DIFFKV_HOME}/dep/rocksdb -DCMAKE_BUILD_TYPE=Release .. && make -j32

# terarkdb
mkdir ${TERARKDB_HOME}/build
cd ${TERARKDB_HOME}/build && cmake -DCMAKE_BUILD_TYPE=Release .. && make -j32

# git config --global http.proxy http://127.0.0.1:1080
# git config --global https.proxy http://127.0.0.1:1080
# git config --global --unset http.proxy
# git config --global --unset https.proxy