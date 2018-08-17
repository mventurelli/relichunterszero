// real file_copy_fmns(string source,string destination)

if (os_type == os_windows)
    return external_call(external_define("libfmns.dll","file_copy",dll_cdecl,ty_real,2,ty_string,ty_string),argument0,argument1);

if (os_type == os_macosx)
    return external_call(external_define("libfmns.dylib","file_copy",dll_cdecl,ty_real,2,ty_string,ty_string),argument0,argument1);
    
if (os_type == os_linux)
    return external_call(external_define("libfmns.so","file_copy",dll_cdecl,ty_real,2,ty_string,ty_string),argument0,argument1);