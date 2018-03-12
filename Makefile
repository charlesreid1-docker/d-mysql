default: build run

disk:
	./make_mysql_volume.sh
	@echo " [+] make_disk task complete"

rm_disk:
	./erase_mysql_volume.sh
	@echo " [+] rm_disk task complete"

build:
	./build_super_mysql.sh

run:
	./run_super_mysql.sh
	@echo " [+] run task complete"

clean:
	./clean.sh
	@echo " [+] clean task complete"

cleanreally: clean rm_disk
	@echo " [+] cleanreally task complete"

