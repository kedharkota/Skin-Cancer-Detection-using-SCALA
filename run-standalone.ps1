# Start Spark Standalone Cluster and Skin Cancer App

Write-Host "=== Starting Spark Standalone Cluster ===" -ForegroundColor Green

# Set Spark environment
$env:SPARK_HOME = "C:\spark\spark-3.5.0-bin-hadoop3"
$env:PATH = "$env:PATH;$env:SPARK_HOME\bin"

Write-Host "Starting Spark Master..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$env:SPARK_HOME\bin'; .\spark-class.cmd org.apache.spark.deploy.master.Master"

Start-Sleep -Seconds 5

Write-Host "Starting Spark Worker..." -ForegroundColor Yellow  
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$env:SPARK_HOME\bin'; .\spark-class.cmd org.apache.spark.deploy.worker.Worker spark://localhost:7077"

Start-Sleep -Seconds 5

Write-Host "Spark Cluster Started!" -ForegroundColor Green
Write-Host "Master UI: http://localhost:8080" -ForegroundColor Cyan
Write-Host "Master URL: spark://localhost:7077" -ForegroundColor Cyan

# Set environment for app to use standalone Spark
$env:SPARK_MASTER_URL = "spark://localhost:7077"
$env:HADOOP_CONF_DIR = "C:\Users\DHEERAJ\Documents\SkinCancerApp\conf"

# Java module fixes
$env:SBT_OPTS = @(
    "--add-opens=java.base/java.lang=ALL-UNNAMED",
    "--add-opens=java.base/java.lang.reflect=ALL-UNNAMED", 
    "--add-opens=java.base/java.lang.invoke=ALL-UNNAMED",
    "--add-opens=java.base/java.util=ALL-UNNAMED",
    "--add-opens=java.base/java.util.concurrent=ALL-UNNAMED",
    "--add-opens=java.base/java.util.concurrent.atomic=ALL-UNNAMED",
    "--add-opens=java.base/java.io=ALL-UNNAMED",
    "--add-opens=java.base/java.net=ALL-UNNAMED",
    "--add-opens=java.base/java.nio=ALL-UNNAMED",
    "--add-opens=java.base/sun.nio.ch=ALL-UNNAMED",
    "--add-opens=java.base/sun.security.action=ALL-UNNAMED",
    "--add-opens=java.base/sun.util.calendar=ALL-UNNAMED",
    "--add-exports=java.base/sun.nio.ch=ALL-UNNAMED",
    "--add-exports=java.base/sun.security.util=ALL-UNNAMED",
    "--add-exports=java.base/sun.nio.cs=ALL-UNNAMED"
) -join " "

Write-Host "Starting Skin Cancer Detection App with Standalone Spark..." -ForegroundColor Green
Write-Host "SPARK_MASTER_URL: $env:SPARK_MASTER_URL" -ForegroundColor Yellow

sbt run