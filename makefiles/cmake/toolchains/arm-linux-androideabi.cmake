# CMake defines to cross-compile to ARM/Linux for Android.

set(BRILLO 1)
SET(CMAKE_SYSTEM_NAME Linux)
SET(ANDROID_TOOLCHAIN /chrome/brillo/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin)
SET(CMAKE_C_COMPILER ${ANDROID_TOOLCHAIN}/arm-linux-androideabi-gcc)
SET(CMAKE_CXX_COMPILER ${ANDROID_TOOLCHAIN}/arm-linux-androideabi-g++)
SET(CMAKE_ASM_COMPILER ${ANDROID_TOOLCHAIN}/arm-linux-androideabi-gcc)
SET(CMAKE_SYSTEM_PROCESSOR arm)

# avoids annoying and pointless warnings from gcc
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -U_FORTIFY_SOURCE")
SET(CMAKE_SYSROOT "/chrome/brillo/out/target/product/gert/obj")
SET(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -c")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I/chrome/brillo/bionic/libc/include/")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I/chrome/brillo/system/core/include/")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I/chrome/brillo/bionic/libm/include/")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I/chrome/brillo/bionic/libc/kernel/uapi/")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I/chrome/brillo/bionic/libc/kernel/uapi/asm-arm/")
