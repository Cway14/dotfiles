if [ -z "$JAVA_VERSION" ]; then
  export JAVA_VERSION=17
fi

# Set JAVA_HOME based on platform
if [[ "$(uname -s)" == "Darwin" ]]; then
  # macOS: SAP Machine JDK
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/sapmachine-${JAVA_VERSION}.jdk/Contents/Home
elif [[ "$(uname -s)" == "Linux" ]]; then
  # Linux: Look for OpenJDK in common locations
  if [[ -d "/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-amd64" ]]; then
    export JAVA_HOME="/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-amd64"
  elif [[ -d "/usr/lib/jvm/java-${JAVA_VERSION}-openjdk" ]]; then
    export JAVA_HOME="/usr/lib/jvm/java-${JAVA_VERSION}-openjdk"
  elif [[ -d "/usr/lib/jvm/java-${JAVA_VERSION}" ]]; then
    export JAVA_HOME="/usr/lib/jvm/java-${JAVA_VERSION}"
  fi
fi

export MAVEN_VERSION=3.8.8

if [[ -n "$JAVA_HOME" ]]; then
  export PATH=${JAVA_HOME}/bin:${PATH}
fi
export PATH=${HOME}/bin/apache-maven-${MAVEN_VERSION}/bin:${PATH}
