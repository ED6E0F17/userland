SET( MMAL_TOP ../../.. )

include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)

SET( MMALPLAY_TOP ${MMAL_TOP}/host_applications/vmcs/test_apps/mmalplay )
add_executable(mmalplay ${MMALPLAY_TOP}/playback.c ${MMALPLAY_TOP}/mmalplay.c)
target_link_libraries(mmalplay mmal_core mmal_util bcm_host mmal_vc_client)
target_link_libraries(mmalplay -Wl,--whole-archive mmal_components containers -Wl,--no-whole-archive mmal_core)
target_link_libraries(mmalplay vcos)

SET( MMALCAM_TOP ${MMAL_TOP}/host_applications/vmcs/test_apps/mmalcam )
add_executable(mmalcam ${MMALCAM_TOP}/viewfinder.c ${MMALCAM_TOP}/mmalcam.c)
target_link_libraries(mmalcam mmal_core mmal_util bcm_host mmal_vc_client)
target_link_libraries(mmalcam -Wl,--whole-archive mmal_components -Wl,--no-whole-archive mmal_core)
target_link_libraries(mmalcam vcos)
