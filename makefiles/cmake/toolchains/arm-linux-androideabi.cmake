# CMake defines to cross-compile to ARM/Linux for Android.

set(BRILLO 1)
SET(CMAKE_SYSTEM_NAME Linux)
SET(ANDROID_ROOT $ENV{ANDROID_BUILD_TOP})
SET(ANDROID_TOOLCHAIN $ENV{ANDROID_TOOLCHAIN})

SET(CMAKE_C_COMPILER ${ANDROID_TOOLCHAIN}/arm-linux-androideabi-gcc)
SET(CMAKE_CXX_COMPILER ${ANDROID_TOOLCHAIN}/arm-linux-androideabi-g++)
SET(CMAKE_ASM_COMPILER ${ANDROID_TOOLCHAIN}/arm-linux-androideabi-gcc)
SET(CMAKE_SYSTEM_PROCESSOR arm)

# avoids annoying and pointless warnings from gcc
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DNDEBUG -U_FORTIFY_SOURCE")

# Brillo will only run position independent code
SET(CMAKE_SKIP_RPATH TRUE)
SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fPIE -pie")

# Root FS is not built until after 3rd-party apps
SET(CMAKE_SYSROOT $ENV{ANDROID_PRODUCT_OUT}/obj/)
SET(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -c")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I${ANDROID_ROOT}/bionic/libc/include/")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I${ANDROID_ROOT}/system/core/include/")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I${ANDROID_ROOT}/bionic/libm/include/")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I${ANDROID_ROOT}/bionic/libc/kernel/uapi/")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I${ANDROID_ROOT}/bionic/libc/kernel/android/uapi/")
SET(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -I${ANDROID_ROOT}/bionic/libc/kernel/uapi/asm-arm/")

