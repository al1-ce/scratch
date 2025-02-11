namespace MyTest {
    public int test(string[] args) {
        Test test = new Test(4);
        stdout.printf("%s", test["test"]); // prints `test`
        stdout.printf("%d", test[42]); // prints `42`
        stdout.printf("%d", test.add(2)); // test + 2 ???????
        stdout.printf("\n");

        return 0;
    }

    class Test {
        int k;

        public Test(int t) {
            k = t;
        }

        public T get<T>(T a) requires(is_t<T, int>() || is_t<T, string>()) {
            return a;
        }

        public T add<T>(T a) requires(is_t<T, int>()) {
            if (is_t<T, int>()) {
                return k + (int) a;
            }
            return a;
        }
    }

    public static bool is_t<T, A>() { return typeof(T) == typeof(A); }
}
