# PowerShell script to set up Hadoop environment for SkinCancerApp
# Run this script before executing 'sbt compile run'

Write-Host "Setting up Hadoop environment variables..." -ForegroundColor Green

# Set HADOOP_CONF_DIR environment variable
$env:HADOOP_CONF_DIR = "C:\Users\DHEERAJ\Documents\SkinCancerApp\conf"
Write-Host "HADOOP_CONF_DIR set to: $env:HADOOP_CONF_DIR" -ForegroundColor Yellow

# Verify configuration files exist
if (Test-Path "$env:HADOOP_CONF_DIR\core-site.xml") {
    Write-Host "✓ core-site.xml found" -ForegroundColor Green
} else {
    Write-Host "✗ core-site.xml NOT found" -ForegroundColor Red
}

if (Test-Path "$env:HADOOP_CONF_DIR\hdfs-site.xml") {
    Write-Host "✓ hdfs-site.xml found" -ForegroundColor Green
} else {
    Write-Host "✗ hdfs-site.xml NOT found" -ForegroundColor Red
}

Write-Host "`nEnvironment setup complete!" -ForegroundColor Green
Write-Host "You can now run: sbt compile run" -ForegroundColor Cyan
Write-Host "`nKey configuration points:" -ForegroundColor Yellow
Write-Host "- HDFS URI: hdfs://localhost:9001 (namenode RPC port)" -ForegroundColor White
Write-Host "- RPC limits: 2GB (up from 1GB)" -ForegroundColor White
Write-Host "- Play Framework: http://localhost:9000" -ForegroundColor White