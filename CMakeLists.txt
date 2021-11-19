# CMake 最低版本号要求
cmake_minimum_required(VERSION 2.8)

# 项目信息
project(CMAKE_DEMO)
set (CMAKE_DEMO_VERSION_MAJOR 1)   # 项目主版本号
set (CMAKE_DEMO_VERSION_MINOR 0)   # 项目副版本号


# 检查系统是否支持pow函数
include (${CMAKE_ROOT}/Modules/CheckFunctionExists.cmake)
check_function_exists (pow HAVE_POW)

# 加入一个配置头文件，用于处理 CMake 对源码的设置
configure_file (
  "${PROJECT_SOURCE_DIR}/config.h.in"
  "${PROJECT_BINARY_DIR}/config.h"
)

# 是否加入 MathFunctions 库
if (NOT HAVE_POW)
  include_directories ("${PROJECT_SOURCE_DIR}/math")
  add_subdirectory(math)
  set (EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
endif (NOT HAVE_POW)

# 查找当前目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(. DIR_SRCS)

# 指定生成目标
add_executable(cmake_demo ${DIR_SRCS})
# 添加链接库
target_link_libraries(cmake_demo ${EXTRA_LIBS})

# 指定安装路径
install (TARGETS cmake_demo DESTINATION "${PROJECT_SOURCE_DIR}/bin")

# 启用测试
enable_testing()

# 定义测试宏
macro (do_test arg1 arg2 result)
  add_test (test_${arg1}_${arg2} cmake_demo ${arg1} ${arg2})
  set_tests_properties (test_${arg1}_${arg2} PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endmacro (do_test)

#测试案例
do_test (5 2 "is 25")
do_test (10 5 "is 100000")
do_test (2 10 "is 1024")
