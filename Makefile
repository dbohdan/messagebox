messagebox.exe: messagebox.c resources.o
	gcc resources.o -std=c99 $< -o $@
resources.o: resources.rc
	windres $< -o $@
clean:
	rm messagebox.exe *.o
.PHONY: clean
