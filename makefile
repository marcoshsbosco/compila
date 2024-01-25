make:
	@clear
	bison -Wcounterexamples -d bosk.y
	flex lex.l
	gcc -w bosk.tab.c lex.yy.c -lfl
	./a.out

clean:
	@clear
	rm -f a.out lex.yy.c bosk.tab.c bosk.tab.h
