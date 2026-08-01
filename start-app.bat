@ecREM Set JVM options for Hadoop RPC configuration
set "JAVA_OPTS=-Dipc.maximum.data.length=1073741824 -Dipc.server.max.response.size=1073741824 -Dhadoop.ipc.client.connection.maxidletime=30000 -Dhadoop.ipc.client.connect.timeout=120000 -Dhadoop.ipc.client.connect.max.retries=100 -Dspark.rpc.message.maxSize=2047 -Dspark.rpc.askTimeout=600s -Dspark.network.timeout=800s -Dspark.sql.execution.arrow.maxRecordsPerBatch=10000 -Xmx8g -Xms2g -XX:+UseG1GC -XX:MaxGCPauseMillis=200" off
REM Windows batch script to run SkinCancerApp with proper JVM configuration

REM Set JVM options for Hadoop RPC configuration
set "JAVA_OPTS=-Dipc.maximum.data.length=536870912 -Dipc.server.max.response.size=536870912 -Dhadoop.ipc.client.connection.maxidletime=10000 -Dhadoop.ipc.client.connect.timeout=60000 -Dhadoop.ipc.client.connect.max.retries=50 -Dspark.rpc.message.maxSize=1024 -Dspark.rpc.askTimeout=600s -Dspark.network.timeout=800s -Dspark.sql.execution.arrow.maxRecordsPerBatch=10000 -Xmx8g -Xms2g -XX:+UseG1GC -XX:MaxGCPauseMillis=200"

REM Set SBT options
set "SBT_OPTS=%JAVA_OPTS%"

echo Starting SkinCancerApp with RPC configuration...
echo JVM Options: %JAVA_OPTS%

REM Run the application
sbt run