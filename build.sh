#!/bin/sh
clean() {
  if [ -d "./build" ]; then
    rm -rf ./build
  fi
  if [ -d "./bin" ];then
    rm -f ./bin/cmake_demo
  fi
}

cleanall() {
  if [ -d "./build" ]; then
    rm -rf ./build
  fi
  if [ -d "./bin" ];then
    rm -rf ./bin/
  fi
}

build() {
  mkdir ./build
  cd build
  cmake ..
  make -j8 VERBOSE=1 || exit 1
  make install
  cd -
  if [ ! -d "./bin" ];then
    mkdir ./bin
  fi
    
  #fit ci pack
  cp -f build/cmake_demo ./bin/
}

if [ -n "$1" ];then
  if [ "$1" = "clean" ];then
    clean
  elif [ "$1" = "cleanall" ];then
    cleanall
  else
    echo "Error option! "$1
  fi
else
  clean
  build
fi
