FROM maven:3.8-openjdk-8 AS devcontainer
# Set working directory
WORKDIR /workspace

# Copy Maven settings file into the container
COPY settings.xml /root/.m2/settings.xml

# Install required tools and dependencies
RUN apt-get update && apt-get install -y \
    wget \
    subversion \
    git \
    && rm -rf /var/lib/apt/lists/*


# Install Tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.98/bin/apache-tomcat-9.0.98.tar.gz && \
    tar -xzf apache-tomcat-9.0.98.tar.gz -C /opt/ && \
    mv /opt/apache-tomcat-9.0.98 /opt/tomcat && \
    rm apache-tomcat-9.0.98.tar.gz

# Manually install itext-2.1.7.js1.jar to local Maven repository
COPY itext-2.1.7.js1.jar /workspace/
RUN mvn install:install-file -Dfile=/workspace/itext-2.1.7.js1.jar \
    -DgroupId=com.lowagie \
    -DartifactId=itext \
    -Dversion=2.1.7.js1 \
    -Dpackaging=jar

# Install MySQL JDBC connector
COPY mysql-connector-java.jar /opt/tomcat/lib/mysql-connector-java.jar

# Set environment variables
ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

# Expose the default Tomcat port
EXPOSE 8080

# Copy project files (optional for local mounting)
COPY . /workspace

# Command to start Tomcat in development mode
CMD ["catalina.sh", "run"]
