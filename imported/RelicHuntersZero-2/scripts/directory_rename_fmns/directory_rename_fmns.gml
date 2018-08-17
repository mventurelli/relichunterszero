// real directory_rename_fmns(string oldname,string newname)

if (os_type == os_windows)
    return external_call(external_define("libfmns.dll","directory_rename",dll_cdecl,ty_real,2,ty_string,ty_string),argument0,argument1);

if (os_type == os_macosx)
    return external_call(external_define("libfmns.dylib","directory_rename",dll_cdecl,ty_real,2,ty_string,ty_string),argument0,argument1);
    
if (os_type == os_linux)
    return external_call(external_define("libfmns.so","directory_rename",dll_cdecl,ty_real,2,ty_string,ty_string),argument0,argument1);