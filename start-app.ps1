# Po# Set environment variables for JVM options
$env:JAVA_OPTS = "-Dipc.maximum.data.length=1073741824 -Dipc.server.max.response.size=1073741824 -Dhadoop.ipc.client.connection.maxidletime=30000 -Dhadoop.ipc.client.connect.timeout=120000 -Dhadoop.ipc.client.connect.max.retries=100 -Dspark.rpc.message.maxSize=2047 -Dspark.rpc.askTimeout=600s -Dspark.network.timeout=800s -Dspark.sql.execution.arrow.maxRecordsPerBatch=10000 -Xmx8g -Xms2g -XX:+UseG1GC -XX:MaxGCPauseMillis=200"rShell script to run SkinCancerApp with proper JVM configuration

Write-Host "Starting SkinCancerApp with RPC configuration..." -ForegroundColor Green

# Set environment variables for JVM options
$env:JAVA_OPTS = "-Dipc.maximum.data.length=536870912 -Dipc.server.max.response.size=536870912 -Dhadoop.ipc.client.connection.maxidletime=10000 -Dhadoop.ipc.client.connect.timeout=60000 -Dhadoop.ipc.client.connect.max.retries=50 -Dspark.rpc.message.maxSize=1024 -Dspark.rpc.askTimeout=600s -Dspark.network.timeout=800s -Dspark.sql.execution.arrow.maxRecordsPerBatch=10000 -Xmx8g -Xms2g -XX:+UseG1GC -XX:MaxGCPauseMillis=200"

$env:SBT_OPTS = $env:JAVA_OPTS

Write-Host "JVM Options: $env:JAVA_OPTS" -ForegroundColor Yellow

# Change to the application directory
Set-Location -Path "C:\Users\DHEERAJ\Documents\SkinCancerApp"

# Run the application
& sbt run