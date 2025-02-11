import "dart:html";
// import "dart:js";
// import "dart:js_interop";
import "package:js/js.dart";

typedef string = String;
typedef char = int;

@JS() external string something(string a, int b);

@JS() class console {
    external static void log(Object);
}
// string something(string a, int b) { return context.callMethod("something", [a, b]); }

void main() {
    print("hello");
    console.log(something("helol", 25565));
    print(something("helol", 25565));
    something("helol", 26676);
    document.createElement("a");
}

