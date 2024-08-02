#!/bin/bash
mvn -s /workspace/.m2/settings.xml clean install -Dorg.slf4j.simpleLogger.log.org.apache.maven.cli.transfer.Slf4jMavenTransferListener=warn