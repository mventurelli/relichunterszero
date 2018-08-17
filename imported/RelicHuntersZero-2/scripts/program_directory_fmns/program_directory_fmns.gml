// string program_directory_fmns()

if (os_type == os_windows)
    return external_call(external_define("libfmns.dll","program_directory",dll_cdecl,ty_string,0));

if (os_type == os_macosx)
    return external_call(external_define("libfmns.dylib","program_directory",dll_cdecl,ty_string,0));
    
if (os_type == os_linux)
    return external_call(external_define("libfmns.so","program_directory",dll_cdecl,ty_string,0));