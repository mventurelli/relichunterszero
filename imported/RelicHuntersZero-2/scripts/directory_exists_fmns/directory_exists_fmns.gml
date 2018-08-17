// real directory_exists_fmns(string pathname)

if (os_type == os_windows)
    return external_call(external_define("libfmns.dll","directory_exists",dll_cdecl,ty_real,1,ty_string),argument0);

if (os_type == os_macosx)
    return external_call(external_define("libfmns.dylib","directory_exists",dll_cdecl,ty_real,1,ty_string),argument0);
    
if (os_type == os_linux)
    return external_call(external_define("libfmns.so","directory_exists",dll_cdecl,ty_real,1,ty_string),argument0);