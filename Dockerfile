# Use official Tomcat base image
FROM tomcat:9.0.102-jdk17

# Remove default Tomcat page
RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

# Copy your index.html to ROOT folder
COPY index.html /usr/local/tomcat/webapps/ROOT/index.html

# Expose port 8080
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
