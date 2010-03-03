all: lib_mysqludf_json.so

clean:
	rm -f *.so

lib_mysqludf_json.so:
	$(CC) -Wall `mysql_config --include --libs` -shared lib_mysqludf_json.c -o lib_mysqludf_json.so

install: lib_mysqludf_json.so
	cp lib_mysqludf_json.so `mysql_config --plugindir`
	mysql -u root mysql < lib_mysqludf_json.sql
