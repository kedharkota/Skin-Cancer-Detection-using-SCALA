@echo off
echo === Starting Skin Cancer App with Java 17 Module Fixes ===
set HADOOP_CONF_DIR=C:\Users\DHEERAJ\Documents\SkinCancerApp\conf

sbt ^
-J--add-opens=java.base/java.lang=ALL-UNNAMED ^
-J--add-opens=java.base/java.lang.reflect=ALL-UNNAMED ^
-J--add-opens=java.base/java.util=ALL-UNNAMED ^
-J--add-opens=java.base/java.util.concurrent=ALL-UNNAMED ^
-J--add-opens=java.base/java.io=ALL-UNNAMED ^
-J--add-opens=java.base/java.net=ALL-UNNAMED ^
-J--add-opens=java.base/java.nio=ALL-UNNAMED ^
-J--add-opens=java.base/sun.nio.ch=ALL-UNNAMED ^
run