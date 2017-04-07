set(EXEC hello_fft.bin)
set(EXEC2D hello_fft_2d.bin)
set(SRCS mailbox.c gpu_fft.c gpu_fft_base.c gpu_fft_twiddles.c gpu_fft_shaders.c)
set(HELLO_FFT_LIBS rt m dl)
#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0 -g")

add_executable(${EXEC} hello_fft.c ${SRCS})
add_executable(${EXEC2D} hello_fft_2d.c ${SRCS} gpu_fft_trans.c)
target_link_libraries(${EXEC} ${HELLO_FFT_LIBS})
target_link_libraries(${EXEC2D} ${HELLO_FFT_LIBS})

install(TARGETS ${EXEC} ${EXEC2D}
        RUNTIME DESTINATION bin)
