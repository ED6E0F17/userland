
# interface/vmcs_host

# not working in release build
# add_definitions(-Werror)

# vc_vchi_gencmd.c has a type-punning problem in vc_gencmd_read_response
add_definitions(-fno-strict-aliasing)

add_library(vchostif
            ${VMCS_TARGET}/vcmisc.c
            vc_vchi_gencmd.c vc_vchi_gpuserv.c
            vc_vchi_tvservice.c vc_vchi_cecservice.c
            vc_vchi_dispmanx.c vc_service_common.c)
#            ${VMCS_TARGET}/vmcs_main.c

# OpenMAX/IL component service
add_library(vcilcs
            vcilcs.c vcilcs_in.c vcilcs_out.c vcilcs_common.c)

# ILCS pulls in EGL for the ILCS/EGL surface API support
target_link_libraries(vcilcs brcmEGL brcmGLESv2 khrn_client vchiq_arm vcos)

# vchostif needs ilcore as well (vmcs_main pulls it in)
target_link_libraries(vchostif vchiq_arm vcos)

install(TARGETS vchostif vcilcs DESTINATION lib)

