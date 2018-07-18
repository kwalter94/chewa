main: build-parser build-lexer
	cc calc.tab.o calc.yy.o -lfl -ly -o calc

build-lexer: calc.l
	flex -o calc.yy.c --yylineno calc.l
	cc -c calc.yy.c

build-parser: calc.y
	bison -d calc.y
	cc -c calc.tab.c

clean:
	rm *.[coh] calc
