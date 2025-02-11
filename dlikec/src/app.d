import clib;

import core.time;

class Test {

}

mixin DISABLE_GC;

void main(string[] args) @nogc nothrow {
	printf("Edit to start your project.\n");
    abs(dur!"weeks"(299));
    Test test = _new!Test();
    _free(test);
    list!int l = list!int();
    l.push_front(1, 4, 8, 82);
    printf("%d ", l.pop_front());
    printf("%d ", l.pop_front());
    printf("%d ", l.pop_front());
    printf("%d ", l.pop_front());
    printf("%d\n", l.pop_front());
    printf("argc = %d\n", args.length);
    printf("%s\n", cstring(args[0]).stringz.data);
}

