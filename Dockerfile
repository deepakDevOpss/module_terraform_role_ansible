FROM alpine

RUN apk add --update wget unzip aws-cli

RUN wget https://releases.hashicorp.com/terraform/0.14.3/terraform_0.14.3_linux_amd64.zip \
    && unzip terraform_0.14.3_linux_amd64.zip && rm terraform_0.14.3_linux_amd64.zip \
    && mv terraform /usr/bin/terraform

WORKDIR /root

COPY Terraform_Code .


