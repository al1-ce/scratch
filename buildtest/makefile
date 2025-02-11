.PHONY: all

all: out/abc.txt

test TEXT:
	echo "$TEXT"

clean:
	rm out/*

src/a.txt:
	echo "some_a" > src/a.txt

src/b.txt:
	echo "some_b" > src/b.txt

src/c.txt:
	echo "some_c" > src/c.txt

out/ab.txt: src/a.txt src/b.txt
	cat src/a.txt > out/ab.txt
	cat src/b.txt >> out/ab.txt

out/abc.txt: out/ab.txt
	cat out/ab.txt > out/abc.txt
	cat src/c.txt >> out/abc.txt

