import core.stdc.stdio;
import core.exception;
import core.stdc.stdlib;

class A {}

extern(C++) class C {}

struct S {}

interface I {}

class L: I {}

class N {
    int a = 0;
    string s;
    this(int a, string s) {this.a = a; this.s = s;}
}

class K: N {

    int* r;
    this(int a, string s) {super(a, s); r = cast(int*) malloc(int.sizeof * a);}
    ~this() { free(cast(int*) r); }
}

void test(N n) {
    printf("Class is %s, %d\n", n.s.ptr, n.a);
}

struct T {
    int* a;
    this(int c) { a = cast(int*) malloc(int.sizeof * c); }

    ~this() { free(cast(int*) a); }
}

// extern(C) __gshared bool rt_cmdline_enabled = false;
// extern(C) __gshared string[] rt_options = [ "gcopt=disable:1" ];
// extern(C) void* register_default_gcs();

// extern (C) int main(int argc, char** argv) {
// int main() {
int main(string[] args) {
    // write("asdf");
    printf("Hello World\n");
    A a = new A();
    // a.destroy();
    destroy(a);
    C c = new C();
    c.destroy();
    S* s = new S();
    // s.destroy();
    free(s);
    S ss = S();

    N n = new N(2, "test");
    printf("Class is %s, %d\n", n.s.ptr, n.a);
    destroy(n);
    K k = new K(42, "something");
    test(k);
    destroy(k);
    // k.__xdtor();

    T t = T(4);
    // destroy(t);

    // int[] arr = [1, 2, 3];
    // arr ~= 5;

    T* tp = new T();
    free(tp);

    // throw new Exception("asdf");
    // struct S {
    //     bool opEquals(ref const S rhs) const {
    //         return false;
    //     }
    // }
    // S s;
    // S n;
    // printf("%d\n", typeid(S).equals(&n, &s) == true ? 1 : 0);
    // s.destroy();
    // L l = new L();
    // l.destroy();
    // i.destroy!(false, I)();
    // free(*abc);
    // abc.__xdtor();
    // free(cast(void*) abc);
    // abc = new ABC();
    // free(cast(void**) argv);
    // free(cast(char**) args);
    return 0;
}

