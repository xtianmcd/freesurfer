project(mri_compute_structure_transforms)

include_directories(${FS_INCLUDE_DIRS})

add_executable(mri_compute_structure_transforms mri_compute_structure_transforms.c)
target_link_libraries(mri_compute_structure_transforms utils)

install(TARGETS mri_compute_structure_transforms DESTINATION bin)
