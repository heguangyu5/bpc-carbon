libcarbon.so:
	./bpc-prepare.sh src.list
	$(MAKE) -C ./Carbon libcarbon

libcarbon:
	bpc -v \
		-c bpc.conf  \
		-l carbon \
		-u symfony-polyfill-php80           \
		-u symfony-contracts-translation    \
		-u php-hash                         \
		-u symfony-component-translation    \
		--input-file src.list

install-libcarbon:
	cd Carbon && bpc -l carbon --install
