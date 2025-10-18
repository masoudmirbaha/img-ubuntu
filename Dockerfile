FROM tomcat:latest

# پورت Tomcat
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
