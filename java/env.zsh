if [ -z "$JAVA_VERSION" ]; then
  export JAVA_VERSION=17
fi

export JAVA_HOME=/Library/Java/JavaVirtualMachines/sapmachine-${JAVA_VERSION}.jdk/Contents/Home
export MAVEN_VERSION=3.8.8