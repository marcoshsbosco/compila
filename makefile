make:
	@clear
	flex lex.l
	gcc lex.yy.c
	./a.out

clean:
	@clear
	rm a.out lex.yy.c
