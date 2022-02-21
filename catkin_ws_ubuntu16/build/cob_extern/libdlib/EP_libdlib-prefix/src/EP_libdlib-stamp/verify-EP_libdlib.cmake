set(file "/home/ubuntu/catkin_ws/build/cob_extern/libdlib/EP_libdlib-prefix/src/dlib-19.9.tar.bz2")
message(STATUS "verifying file...
     file='${file}'")
set(expect_value "4a3868a1e88721b68ccfb0567eaac87b")
set(attempt 0)
set(succeeded 0)
while(${attempt} LESS 3 OR ${attempt} EQUAL 3 AND NOT ${succeeded})
  file(MD5 "${file}" actual_value)
  if("${actual_value}" STREQUAL "${expect_value}")
    set(succeeded 1)
  elseif(${attempt} LESS 3)
    message(STATUS "MD5 hash of ${file}
does not match expected value
  expected: ${expect_value}
    actual: ${actual_value}
Retrying download.
")
    file(REMOVE "${file}")
    execute_process(COMMAND ${CMAKE_COMMAND} -P "/home/ubuntu/catkin_ws/build/cob_extern/libdlib/EP_libdlib-prefix/src/EP_libdlib-stamp/download-EP_libdlib.cmake")
  endif()
  math(EXPR attempt "${attempt} + 1")
endwhile()

if(${succeeded})
  message(STATUS "verifying file... done")
else()
  message(FATAL_ERROR "error: MD5 hash of
  ${file}
does not match expected value
  expected: ${expect_value}
    actual: ${actual_value}
")
endif()
