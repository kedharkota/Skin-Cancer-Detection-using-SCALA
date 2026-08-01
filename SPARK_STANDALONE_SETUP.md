# Spark Standalone Setup Guide for Windows

## Download and Install Spark
1. Download Spark from: https://spark.apache.org/downloads.html
   - Choose: Spark 3.5.0, Pre-built for Apache Hadoop 3.3 and later

2. Extract to: C:\spark\spark-3.5.0-bin-hadoop3

3. Set Environment Variables:
   ```powershell
   $env:SPARK_HOME = "C:\spark\spark-3.5.0-bin-hadoop3"
   $env:PATH = "$env:PATH;$env:SPARK_HOME\bin"
   ```

## Start Spark Cluster
```powershell
# Start Spark Master
cd C:\spark\spark-3.5.0-bin-hadoop3\bin
.\spark-class.cmd org.apache.spark.deploy.master.Master

# Start Spark Worker (in new terminal)
.\spark-class.cmd org.apache.spark.deploy.worker.Worker spark://localhost:7077
```

## Verify Cluster
- Spark Master UI: http://localhost:8080
- Your app will connect to: spark://localhost:7077