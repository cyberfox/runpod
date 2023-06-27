FROM runpod/oobabooga:1.1.0

RUN python3 -m pip install --upgrade pip
RUN apt-get update
RUN apt -y install python3.10-dev emacs-nox tmux silversearcher-ag ruby

#    cat /workspace/ssh/authorized_keys >> ~/.ssh/authorized_keys
#    cp /workspace/ssh/id_rsa* ~/.ssh
#    chmod og-rwx ~/.ssh/id_rsa
#    chmod og-wx ~/.ssh/id_rsa.pub
#    cp /workspace/gitconfig ~/.gitconfig
#    apt-get update
#    apt -y install python3.10-dev emacs-nox tmux silversearcher-ag ruby
#    python3 -m pip install --upgrade pip
#    git pull
#    pip install -r requirements.txt
#    pip install -r extensions/superbooga/requirements.txt
#    cd /workspace/text-generation-webui/repositories/GPTQ-for-LLaMa
#    python setup_cuda.py install
#    cp -aRv /workspace/root/.{conda,condarc,bashrc,netrc} ~/
#    touch ~/.presetup_done

RUN rm -rf /usr/local/lib/python3.10/dist-packages/bitsandbytes-0.38.1.dist-info
RUN pip uninstall -y bitsandbytes torch
RUN pip install --no-cache-dir --upgrade torch torchvision torchaudio langchain openai Mastodon.py tiktoken unstructured tabulate pdf2image libmagic wandb loralib bitsandbytes==0.39.1
RUN pip install xformers
