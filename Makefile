messagebox.exe: messagebox.c resources.o
	$(CC) resources.o -std=c99 $< -o $@
resources.o: resources.rc
	windres $< -o $@
sendkey.exe:
	wget https://web.archive.org/web/20190305143035/http://www.f2ko.de/downloads/cmdtools/sendkey.exe
	sha256sum -c sendkey.exe.sha256sum
clean:
	rm messagebox.exe *.o
test: messagebox.exe
	./tests.sh
.PHONY: clean test
