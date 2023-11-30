FROM amazonlinux:2023

ENV PATH "/root/.local/bin:/root/.local/share/pnpm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

RUN yum install -y nodejs git python3-devel pip jq gcc-c++
RUN npm install -g aws-cdk
RUN curl -fsSL https://get.pnpm.io/install.sh | sh -
RUN curl -sSL https://install.python-poetry.org | python3 -
RUN git clone https://github.com/aws-samples/aws-iot-twinmaker-samples.git
RUN ./aws-iot-twinmaker-samples/src/workspaces/cookiefactoryv3/assistant/install.sh

RUN pip install -r ./aws-iot-twinmaker-samples/src/workspaces/cookiefactoryv3/assistant/requirements.txt
RUN echo 'PATH="/root/.local/bin:$PATH"' >> /root/.bashrc

EXPOSE 8000

ENV AWS_REGION us-east-1
ENV WORKSPACE_ID cookiefactoryv3
COPY ./entrypoint.sh ./

ENTRYPOINT ["./entrypoint.sh"]