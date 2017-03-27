# Jenkins JNLP DinD slave

Based on https://github.com/jenkinsci/docker-jnlp-slave
But with `Docker` installed in order to build and publish images.

## Running

To run a Docker container

    docker run -v /var/run/docker.sock:/var/run/docker.sock plugandtrade/jenkins-jnlp-dind-slave -url http://jenkins-server:port <secret> <agent name>

In order for `docker run`, `docker build` to work inside the container the host socket needs to be mounted to the container with:

  -v /var/run/docker.sock:/var/run/docker.sock

Optional environment variables:

* `JENKINS_URL`: url for the Jenkins server, can be used as a replacement to `-url` option, or to set alternate jenkins URL
* `JENKINS_TUNNEL`: (`HOST:PORT`) connect to this agent host and port instead of Jenkins server, assuming this one do route TCP traffic to Jenkins master. Useful when when Jenkins runs behind a load balancer, reverse proxy, etc.
* `JENKINS_SECRET`: agent secret, if not set as an argument
* `JENKINS_AGENT_NAME`: agent name, if not set as an argument
