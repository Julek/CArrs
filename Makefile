all:
	gcc -c -O -std=gnu99 -o CArrs.o CArrs.c
	ghc --make -main-is Main main.hs CArrs.o -o test
	rm *.hi *.o
