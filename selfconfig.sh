#!/bin/bash
mkdir /home/runner/selfconfig
cd /home/runner/selfconfig
/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | /usr/bin/apt-key add - /usr/bin/add-apt-repository \
"deb [arch=arm64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
/usr/bin/apt-get install docker-ce docker-ce-cli containerd.io
service docker start
/usr/bin/apt-get install docker-ce docker-ce-cli containerd.io -y
/usr/bin/curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \ /usr/bin/unzip awscliv2.zip && \
./aws/install
/usr/bin/curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes- release/release/stable.txt)/bin/linux/arm64/kubectl"
/bin/chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
