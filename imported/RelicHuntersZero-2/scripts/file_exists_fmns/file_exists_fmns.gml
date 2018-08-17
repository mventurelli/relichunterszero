// real file_exists_fmns(string filename)

if (os_type == os_windows)
    return external_call(external_define("libfmns.dll","file_exists",dll_cdecl,ty_real,1,ty_string),argument0);

if (os_type == os_macosx)
    return external_call(external_define("libfmns.dylib","file_exists",dll_cdecl,ty_real,1,ty_string),argument0);
    
if (os_type == os_linux)
    return external_call(external_define("libfmns.so","file_exists",dll_cdecl,ty_real,1,ty_string),argument0);