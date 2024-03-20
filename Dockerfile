FROM ubuntu:22.04

RUN apt update && apt install -y \
    curl \
    software-properties-common \
    sudo \
    python3 \
    python3-pip \
    python3-dev \
    python3-venv \
    git \
    git-flow \
    build-essential \
    procps \
    file \
    wget \
    unzip \
    libssl-dev \
    libffi-dev \
    libkrb5-dev \
    jq

ARG TARGETARCH 

# Install terraform
RUN curl "https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_linux_${TARGETARCH}.zip" -o "terraform_1.7.2_linux.zip"
RUN unzip terraform_1.7.2_linux && sudo mv terraform /usr/local/bin/ \
    && terraform --version


#COPY requirements.txt .
#RUN sudo pip3 install -r requirements.txt 

#install zsh
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -t https://github.com/spaceship-prompt/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEW_LINE="true"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="true"' \
    -a 'ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"' \
    -a 'SPACESHIP_USER_SHOW="true=5"' \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p git \
    -p git-flow \
    -p aws \
    -p terraform 

WORKDIR /home/ubuntu/work