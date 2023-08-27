all: clean create

create:
	mkdir direct1
	mkdir direct2
	touch ./direct1/test1.log
	touch ./direct1/test2.log
	touch ./direct1/test3.log
	touch ./direct1/test4.txt
	touch ./direct2/test5.conf
	touch ./direct2/test6.conf
	touch ./direct2/test7.exe
	chmod +x ./direct2/test7.exe
	ln -s ./direct1/test1.log ./direct1/link1
	ln -s ./direct2/test7.exe ./direct2/link2
	ln -s ./direct2/test6.conf link3

clean:
	rm -rf *.log *.conf direct* link*