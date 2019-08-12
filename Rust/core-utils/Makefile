all: echo touch cat

echo: echo.rs
	rustc -o bin/echo echo.rs

touch: touch.rs
	rustc -o bin/touch touch.rs

cat: cat.rs
	rustc -o bin/cat cat.rs

build:	echo touch cat

clean:
	rm bin/*
