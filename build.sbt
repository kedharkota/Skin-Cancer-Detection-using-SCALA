fork in run := true

javaOptions ++= Seq(
  "--add-opens=java.base/java.lang=ALL-UNNAMED",
  "--add-opens=java.base/java.lang.invoke=ALL-UNNAMED",
  "--add-opens=java.base/java.util=ALL-UNNAMED",
  "--add-opens=java.base/java.io=ALL-UNNAMED",
  "--add-opens=java.base/java.net=ALL-UNNAMED",
  "--add-opens=java.base/sun.nio.ch=ALL-UNNAMED",
  "--add-opens=java.base/java.lang.reflect=ALL-UNNAMED",
  // Hadoop RPC Configuration - Updated to 2GB
  "-Dipc.maximum.data.length=2147483648",
  "-Dipc.server.max.response.size=2147483648",
  "-Dhadoop.ipc.client.connection.maxidletime=30000",
  "-Dhadoop.ipc.client.connect.timeout=120000",
  "-Dhadoop.ipc.client.connect.max.retries=100",
  // Spark RPC Configuration
  "-Dspark.rpc.message.maxSize=2047",
  "-Dspark.rpc.askTimeout=600s",
  "-Dspark.network.timeout=800s",
  "-Dspark.sql.execution.arrow.maxRecordsPerBatch=10000",
  // Memory settings
  "-Xmx8g",
  "-Xms2g"
)
enablePlugins(PlayScala)
name := "SkinCancerApp"

version := "0.1"

scalaVersion := "2.13.10"

libraryDependencies ++= Seq(
  "com.typesafe.play" %% "play" % "2.8.20",
  "com.typesafe.play" %% "play-guice" % "2.8.20",
  ("org.apache.spark" %% "spark-core" % "3.4.1")
    .exclude("org.slf4j", "slf4j-log4j12")
    .exclude("org.apache.logging.log4j", "log4j-slf4j-impl"),
  ("org.apache.spark" %% "spark-sql" % "3.4.1")
    .exclude("org.slf4j", "slf4j-log4j12")
    .exclude("org.apache.logging.log4j", "log4j-slf4j-impl"),
  ("org.apache.spark" %% "spark-mllib" % "3.4.1")
    .exclude("org.slf4j", "slf4j-log4j12")
    .exclude("org.apache.logging.log4j", "log4j-slf4j-impl"),
  ("org.apache.hadoop" % "hadoop-client" % "3.3.6")
    .exclude("org.apache.logging.log4j", "log4j-slf4j-impl"),
  "javax.inject" % "javax.inject" % "1",
  "ch.qos.logback" % "logback-classic" % "1.2.11"
)

ThisBuild / evictionErrorLevel := Level.Warn

dependencyOverrides ++= Seq(
  "org.scala-lang.modules" %% "scala-xml" % "2.1.0",
  "org.scala-lang.modules" %% "scala-parser-combinators" % "2.1.1"
)
dependencyOverrides += "org.slf4j" % "slf4j-api" % "1.7.36"
dependencyOverrides += "org.slf4j" % "slf4j-log4j12" % "1.7.36" % "provided"
dependencyOverrides += "org.apache.logging.log4j" % "log4j-slf4j-impl" % "2.17.1" % "provided"

// Add configuration directory to classpath
Compile / unmanagedResourceDirectories += baseDirectory.value / "conf"
Runtime / unmanagedClasspath += baseDirectory.value / "conf"

