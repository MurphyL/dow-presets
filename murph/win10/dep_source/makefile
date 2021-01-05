assembly: prepare java utils

.PHONY : prepare	
prepare:
	-rm .make.tmp
	-mkdir -p .make

.PHONY : java
java:
	echo "<!-- JDK - start -->" >> .make.tmp;
	awk -v RS="\r\n" -v group=jdk -f jdk/jdk.awk jdk/jdk.ini >> .make.tmp;
	echo "<!-- JDK - end -->" >> .make.tmp;
	
.PHONY : utils
utils:
	echo "<!-- utils - start -->" >> .make.tmp;
	echo "<!-- utils - start -->" >> .make.tmp;