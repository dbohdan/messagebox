CC = mingw32-gcc

messagebox.exe: messagebox.c resources.o
	$(CC) resources.o -std=c99 $< -o $@
resources.o: resources.rc
	windres $< -o $@
clean:
	rm messagebox.exe *.o
test: messagebox.exe
	./tests.sh
.PHONY: clean test
