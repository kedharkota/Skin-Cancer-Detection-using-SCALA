# PowerShell script to run the application with complete Java 17 + Spark module fixes
Write-Host "=== Starting Skin Cancer App with Java 17 + Spark Module Fixes ===" -ForegroundColor Green

# Set environment variables
$env:HADOOP_CONF_DIR = "C:\Users\DHEERAJ\Documents\SkinCancerApp\conf"

# Complete Java module system fixes + Memory optimization for large dataset
$env:SBT_OPTS = @(
    "-Xmx16g",
    "-Xms8g", 
    "-XX:+UseG1GC",
    "-XX:G1HeapRegionSize=16m",
    "-XX:+UseStringDeduplication",
    "-XX:MaxGCPauseMillis=200",
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

Write-Host "SBT_OPTS: $env:SBT_OPTS" -ForegroundColor Yellow
Write-Host "HADOOP_CONF_DIR: $env:HADOOP_CONF_DIR" -ForegroundColor Cyan
Write-Host "Starting application..." -ForegroundColor Green

# Run SBT with all module fixes
sbt run