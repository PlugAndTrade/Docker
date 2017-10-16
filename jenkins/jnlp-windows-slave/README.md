# Jenkins JNLP Windows 2016 slave
Docker container for running Jenkins agent/slave on Windows 2016 Core

* Git for Windows 2.7.2
* OpenJDK 8u141
* Jenkins Remoting Agent 3.13

## Running

To run the container and connect to a Jenkins CI server using JNLP:

    docker run -d plugandtrade/jenkins-jnlp-windows-slave -jnlpUrl http://<server>:<port>/computer/<agent>/slave-agent.jnlp -secret <secret>