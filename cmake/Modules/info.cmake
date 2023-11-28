get_target_property(DEFINES OpenSCAD COMPILE_DEFINITIONS)
get_target_property(LINK_OPTS OpenSCAD LINK_OPTIONS)

message(STATUS " ")
message(STATUS "====================================")
message(STATUS "OpenSCAD Build Configuration Summary")
message(STATUS "====================================")
message(STATUS " ")
if (MXECROSS)
  message(STATUS "Environment: MXE")
elseif (APPLE)
  message(STATUS "Environment: macOS")
elseif (WIN32)
  if (MINGW)
    message(STATUS "Environment: msys2")
  else()
    message(STATUS "Environment: Windows")
  endif()
elseif (LINUX)
  message(STATUS "Environment: Linux")
elseif(UNIX)
  message(STATUS "Environment: Unknown Unix")
else()
  message(STATUS "Environment: Unknown")
endif()
message(STATUS " ")
message(STATUS "CMAKE_VERSION:         ${CMAKE_VERSION}")
message(STATUS "CMAKE_TOOLCHAIN_FILE:  ${CMAKE_TOOLCHAIN_FILE}")
message(STATUS "CMAKE_GENERATOR:       ${CMAKE_GENERATOR}")
message(STATUS "CPACK_CMAKE_GENERATOR: ${CPACK_CMAKE_GENERATOR}")
message(STATUS "CMAKE_BUILD_TYPE:      ${CMAKE_BUILD_TYPE}")
message(STATUS "CMAKE_PREFIX_PATH:     ${CMAKE_PREFIX_PATH}")
message(STATUS "CMAKE_CXX_COMPILER_ID: ${CMAKE_CXX_COMPILER_ID}")
message(STATUS "CMAKE_CXX_COMPILER_VERSION: ${CMAKE_CXX_COMPILER_VERSION}")
message(STATUS " ")

if(SANITIZE_MEMORY)
  list(APPEND SANITIZERS "MSAN")
endif()
if(SANITIZE_ADDRESS)
  list(APPEND SANITIZERS "ASAN")
endif()
if(SANITIZE_THREAD)
  list(APPEND SANITIZERS "TSAN")
endif()
if(SANITIZE_UNDEFINED)
  list(APPEND SANITIZERS "UBSAN")
endif()
if(SANITIZERS)
  list(JOIN SANITIZERS " " SANITIZERS_STRING)
  message(STATUS "Sanitizers: ${SANITIZERS_STRING}")
  message(STATUS " ")
endif()

  message(STATUS "SUFFIX:                ${SUFFIX}")
if (APPLE)
message(STATUS "CMAKE_OSX_DEPLOYMENT_TARGET: ${CMAKE_OSX_DEPLOYMENT_TARGET}")
message(STATUS "CMAKE_OSX_ARCHITECTURES:     ${CMAKE_OSX_ARCHITECTURES}")
endif()
if (OPENSCAD_LIBRARIES)
  message(STATUS "OPENSCAD_LIBRARIES:    $ENV{OPENSCAD_LIBRARIES}")
endif()
message(STATUS " ")
message(STATUS "Experimental Features: ${EXPERIMENTAL}")
message(STATUS "Snapshot build:        ${SNAPSHOT}")
message(STATUS "CGAL enabled:          ${ENABLE_CGAL}")
message(STATUS "WASM build:            ${WASM}")
message(STATUS "Headless build:        ${HEADLESS}")
message(STATUS "NULLGL build:          ${NULLGL}")
if (USE_GLAD)
  set(WRANGLER "GLAD")
else()
  set(WRANGLER "glew")
endif()
message(STATUS "OpenGL wrangler:       ${WRANGLER}")
message(STATUS "Profiling/coverage:    ${PROFILE}")
message(STATUS "Use mimalloc:          ${USE_MIMALLOC}")
message(STATUS "Use built-in OpenCSG:  ${USE_BUILTIN_OPENCSG}")
message(STATUS "CSG node id-prefix:    ${IDPREFIX}")
message(STATUS "Offline documentation: ${OFFLINE_DOCS}")
message(STATUS " ")
message(STATUS "GL Offscreen Context:  ${OFFSCREEN_METHOD}")
message(STATUS "lib3mf:                ${LIB3MF_API}")
message(STATUS " ")
message(STATUS "Input Drivers")
if("ENABLE_HIDAPI" IN_LIST DEFINES)
  message(STATUS "- HID API Driver (enabled)")
else()
  message(STATUS "- HID API Driver (disabled)")
endif()
if("ENABLE_SPNAV" IN_LIST DEFINES)
  message(STATUS "- Space Navigator Library Driver (enabled)")
else()
  message(STATUS "- Space Navigator Library Driver (disabled)")
endif()
if("ENABLE_JOYSTICK" IN_LIST DEFINES)
  message(STATUS "- Joystick Driver (enabled)")
else()
  message(STATUS "- Joystick Driver (disabled)")
endif()
if("ENABLE_DBUS" IN_LIST DEFINES)
  message(STATUS "- DBus Remote Driver (enabled)")
else()
  message(STATUS "- DBus Remote Driver (disabled)")
endif()
message(STATUS " ")
message(STATUS "DEFINES = ${DEFINES}")
message(STATUS "LINK OPTIONS = ${LINK_OPTS}")
message(STATUS " ")
