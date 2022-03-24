
cmake_minimum_required(VERSION 3.15)

set(command "C:/Program Files/CMake/bin/cmake.exe;-DCMAKE_INSTALL_PREFIX=E:/git/WindowsResearch/retdec-master/deps/install/yaramod;-DCMAKE_BUILD_TYPE=Release;-DCMAKE_CXX_FLAGS_RELEASE=/MD /O2 /Ob2 /DNDEBUG;-DCMAKE_CXX_FLAGS_DEBUG=/MDd /Zi /Ob0 /Od /RTC1;-DCMAKE_C_COMPILER=C:/Program Files (x86)/Microsoft Visual Studio/2017/Enterprise/VC/Tools/MSVC/14.16.27023/bin/Hostx86/x86/cl.exe;-DCMAKE_CXX_COMPILER=C:/Program Files (x86)/Microsoft Visual Studio/2017/Enterprise/VC/Tools/MSVC/14.16.27023/bin/Hostx86/x86/cl.exe;-DCMAKE_POSITION_INDEPENDENT_CODE=ON;-GVisual Studio 15 2017;-DCMAKE_GENERATOR_INSTANCE:INTERNAL=C:/Program Files (x86)/Microsoft Visual Studio/2017/Enterprise;E:/git/WindowsResearch/retdec-master/external/src/yaramod-project")
set(log_merged "")
set(log_output_on_failure "")
set(stdout_log "E:/git/WindowsResearch/retdec-master/external/src/yaramod-project-stamp/yaramod-project-configure-out.log")
set(stderr_log "E:/git/WindowsResearch/retdec-master/external/src/yaramod-project-stamp/yaramod-project-configure-err.log")
execute_process(
  COMMAND ${command}
  RESULT_VARIABLE result
  OUTPUT_FILE "${stdout_log}"
  ERROR_FILE "${stderr_log}"
  )
macro(read_up_to_max_size log_file output_var)
  file(SIZE ${log_file} determined_size)
  set(max_size 10240)
  if (determined_size GREATER max_size)
    math(EXPR seek_position "${determined_size} - ${max_size}")
    file(READ ${log_file} ${output_var} OFFSET ${seek_position})
    set(${output_var} "...skipping to end...\n${${output_var}}")
  else()
    file(READ ${log_file} ${output_var})
  endif()
endmacro()
if(result)
  set(msg "Command failed: ${result}\n")
  foreach(arg IN LISTS command)
    set(msg "${msg} '${arg}'")
  endforeach()
  if (${log_merged})
    set(msg "${msg}\nSee also\n  ${stderr_log}")
  else()
    set(msg "${msg}\nSee also\n  E:/git/WindowsResearch/retdec-master/external/src/yaramod-project-stamp/yaramod-project-configure-*.log")
  endif()
  if (${log_output_on_failure})
    message(SEND_ERROR "${msg}")
    if (${log_merged})
      read_up_to_max_size("${stderr_log}" error_log_contents)
      message(STATUS "Log output is:\n${error_log_contents}")
    else()
      read_up_to_max_size("${stdout_log}" out_log_contents)
      read_up_to_max_size("${stderr_log}" err_log_contents)
      message(STATUS "stdout output is:\n${out_log_contents}")
      message(STATUS "stderr output is:\n${err_log_contents}")
    endif()
    message(FATAL_ERROR "Stopping after outputting logs.")
  else()
    message(FATAL_ERROR "${msg}")
  endif()
else()
  set(msg "yaramod-project configure command succeeded.  See also E:/git/WindowsResearch/retdec-master/external/src/yaramod-project-stamp/yaramod-project-configure-*.log")
  message(STATUS "${msg}")
endif()