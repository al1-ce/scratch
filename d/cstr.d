#!/usr/bin/env -S dmd -betterC -run

import core.stdc.stdio;
import core.stdc.stdlib;
import core.stdc.string;

struct cstr {
    char* ptr;

    alias ptr this;

    @disable this();

    this(size_t S)(char[S] a) {
        ptr = cast(char*) malloc((S + 1) * char.sizeof);
        memcpy(ptr, a.ptr, S * char.sizeof);
        ptr[S] = '\0';
    }

    this(char[] a) {
        ptr = cast(char*) malloc((a.length + 1) * char.sizeof);
        memcpy(ptr, a.ptr, a.length * char.sizeof);
        ptr[a.length] = '\0';
    }

    this(string a) {
        ptr = cast(char*) malloc((a.length + 1) * char.sizeof);
        memcpy(ptr, a.ptr, a.length * char.sizeof);
        ptr[a.length] = '\0';
    }

    ~this() {
        free(ptr);
    }
}

__gshared char* __cstr_ptr_alloc = null;
__gshared bool __cstr_ptr_atexit_registered = false;

// __gshared char[0x7fffffff] __cstr_static_arr = '\0';

extern(C) private void __cstr_ptr_atexit() {
    free(__cstr_ptr_alloc);
}

const(char*) cstr2(string a) {
    if (!__cstr_ptr_atexit_registered) {
        atexit(&__cstr_ptr_atexit);
        __cstr_ptr_atexit_registered = true;
    }

    __cstr_ptr_alloc = cast(char*) realloc(__cstr_ptr_alloc, (a.length + 1) * char.sizeof);
    memcpy(__cstr_ptr_alloc, a.ptr, a.length * char.sizeof);
    __cstr_ptr_alloc[a.length] = '\0';
    return __cstr_ptr_alloc;
}

// const(char*) cstr3(string a) {
//     // printf("memcpy\n");
//     // memcpy(__cstr_static_arr.ptr, a.ptr, a.length * char.sizeof);
//     printf("opeq\n");
//     printf("a.len = %zu, s.len = %zu\n", a.length, __cstr_static_arr.length);
//     __cstr_static_arr[0..a.length] = a;
//     __cstr_static_arr[a.length] = '\0';
//     printf("ptr\n");
//     return __cstr_static_arr.ptr;
// }

extern(C) int main(int argc, char** argv) {
    string str = "Hello World";
    // have to get .ptr because of #19696
    // otherwise it's straightforward toStringz without gc
    printf("Thing struct is: %s\n", str.cstr.ptr);
    // or if we have static storage that is realloced constantly
    printf("Thing shared is: %s\n", str.cstr2);
    // or this... can't get it to work tho
    // printf("Thing shared is: %s\n", str.cstr3);
    return 0;
}

