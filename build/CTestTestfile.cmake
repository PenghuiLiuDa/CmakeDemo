# CMake generated Testfile for 
# Source directory: /data/woodrowliu/workspace/cmake_demo
# Build directory: /data/woodrowliu/workspace/cmake_demo/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_5_2 "cmake_demo" "5" "2")
set_tests_properties(test_5_2 PROPERTIES  PASS_REGULAR_EXPRESSION "is 25" _BACKTRACE_TRIPLES "/data/woodrowliu/workspace/cmake_demo/CMakeLists.txt;44;add_test;/data/woodrowliu/workspace/cmake_demo/CMakeLists.txt;49;do_test;/data/woodrowliu/workspace/cmake_demo/CMakeLists.txt;0;")
add_test(test_10_5 "cmake_demo" "10" "5")
set_tests_properties(test_10_5 PROPERTIES  PASS_REGULAR_EXPRESSION "is 100000" _BACKTRACE_TRIPLES "/data/woodrowliu/workspace/cmake_demo/CMakeLists.txt;44;add_test;/data/woodrowliu/workspace/cmake_demo/CMakeLists.txt;50;do_test;/data/woodrowliu/workspace/cmake_demo/CMakeLists.txt;0;")
add_test(test_2_10 "cmake_demo" "2" "10")
set_tests_properties(test_2_10 PROPERTIES  PASS_REGULAR_EXPRESSION "is 1024" _BACKTRACE_TRIPLES "/data/woodrowliu/workspace/cmake_demo/CMakeLists.txt;44;add_test;/data/woodrowliu/workspace/cmake_demo/CMakeLists.txt;51;do_test;/data/woodrowliu/workspace/cmake_demo/CMakeLists.txt;0;")
subdirs("math")
