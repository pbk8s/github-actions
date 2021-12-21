FROM ubuntu:bionic
RUN useradd -s /bin/bash -d /home/runner/ -m -G sudo runner RUN apt-get update -y
RUN apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
lsb-release \ software-properties-common \ jq \
zip \ expect
COPY . /home/runner/actions-runner/
RUN chown -R runner /home/runner/actions-runner/
RUN /home/runner/actions-runner/selfconfig.sh
ENTRYPOINT ["/bin/bash", "/home/runner/actions-runner/myrunner.sh"]
