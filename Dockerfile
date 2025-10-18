# از ایمیج رسمی Tomcat استفاده می‌کنیم
FROM tomcat:latest

# کاری به نصب JDK و Tomcat نداریم چون توی Image هست
# فقط فایل‌های خودمون یا تنظیمات اضافه رو میاریم
WORKDIR /usr/local/tomcat

# اگه بخوای وب‌اپلیکیشن WAR رو بریزی داخل Tomcat
# فرض کنیم فایل app.war کنار Dockerfile هست
COPY app.war webapps/

# اگه بخوای فایل sshd_config اضافه کنی (اختیاری)
# COPY sshd_config /etc/ssh/sshd_config

# پورت Tomcat
EXPOSE 8080

# دستور پیش‌فرض Tomcat رو نگه می‌داریم
CMD ["catalina.sh", "run"]
