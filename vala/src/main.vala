using GLib;

using std.io;

extern void printer();


int main(string[] args) {
    print("Hello");

    printer();
    something();
    std.io.something();

    MyTest.test(args);
    return 0;

}

struct vec2 {
    int x;
    int y;
}

class vec3 {}

