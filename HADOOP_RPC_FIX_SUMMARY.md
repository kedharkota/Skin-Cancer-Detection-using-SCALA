# Hadoop RPC Configuration Fix - Summary

## Changes Made

### 1. Created Hadoop Configuration Files

**Created: `conf/core-site.xml`**
- Increased `ipc.maximum.data.length` from 1GB to 2GB (2147483648 bytes)
- Increased `ipc.server.max.response.size` from 1GB to 2GB (2147483648 bytes)
- Set `fs.defaultFS` to `hdfs://localhost:9001` (correct namenode RPC port)
- Added connection timeout and retry configurations

**Created: `conf/hdfs-site.xml`**
- Set `dfs.namenode.rpc.max.response.size` to 2GB (2147483648 bytes)
- Configured socket timeouts for HDFS operations
- Added block size and replication settings

### 2. Updated build.sbt

- Increased RPC limits in javaOptions from 1GB to 2GB
- Added configuration directory to classpath:
  ```scala
  Compile / unmanagedResourceDirectories += baseDirectory.value / "conf"
  Runtime / unmanagedClasspath += baseDirectory.value / "conf"
  ```

### 3. Updated PredictionController.scala

- **CRITICAL FIX**: Changed model path from `hdfs://localhost:9000` to `hdfs://localhost:9001`
- Added explicit environment variable setup:
  ```scala
  System.setProperty("HADOOP_CONF_DIR", "C:/Users/DHEERAJ/Documents/SkinCancerApp/conf")
  ```
- Added explicit configuration file loading:
  ```scala
  conf.addResource(new Path("C:/Users/DHEERAJ/Documents/SkinCancerApp/conf/core-site.xml"))
  conf.addResource(new Path("C:/Users/DHEERAJ/Documents/SkinCancerApp/conf/hdfs-site.xml"))
  ```
- Set configuration programmatically as backup
- Added debug logging for troubleshooting

### 4. Created Environment Setup Script

**Created: `setup-env.ps1`**
- PowerShell script to set HADOOP_CONF_DIR environment variable
- Verifies configuration files exist
- Provides clear instructions

## Key Port Configuration

- **Play Framework HTTP Server**: Port 9000
- **HDFS Namenode RPC**: Port 9001 (this is where "hrpc" requests should go)
- **Problem**: Previous configuration was sending HDFS RPC requests to port 9000 (Play HTTP)

## How to Use

1. Run the environment setup script:
   ```powershell
   .\setup-env.ps1
   ```

2. Compile and run the application:
   ```powershell
   sbt compile run
   ```

3. Monitor the console output for debug information:
   - `fs.defaultFS = hdfs://localhost:9001`
   - `ipc.maximum.data.length = 2147483648`
   - `HADOOP_CONF_DIR = C:/Users/DHEERAJ/Documents/SkinCancerApp/conf`

## Expected Results

- RPC requests now go to correct port (9001) instead of Play HTTP port (9000)
- Increased data limits (2GB) should handle larger responses
- Configuration files are properly loaded
- "RPC response exceeds maximum data length" errors should be resolved
- "hrpc" requests should no longer hit the Play Framework server

## Troubleshooting

If issues persist:
1. Verify HDFS is running on port 9001
2. Check that namenode is accessible: `telnet localhost 9001`
3. Monitor application logs for configuration values
4. Ensure HADOOP_CONF_DIR is set before starting the application