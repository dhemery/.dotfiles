envs() { env | sort; }
la() { ls -GFlas "$@" ; }
path() { echo -e ${PATH//:/\\n}; }
jdk () { export JAVA_HOME=$(/usr/libexec/java_home -v 1."$@") ; }

