#!/bin/bash

if [[ $PUBLIC_KEY ]]
then
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    cd ~/.ssh
    echo $PUBLIC_KEY >> authorized_keys
    # If the user provides authorized_keys files, add them.
    if [ -e /workspace/.ssh/authorized_keys ]
    then
        cat /workspace/.ssh/authorized_keys >> authorized_keys
    fi
    # If the user provides an SSH key to use, use that.
    if [ -e /workspace/.ssh/id_rsa ]
    then
        cp /workspace/.ssh/id_rsa* .
        chmod og-rwx id_rsa
        chmod og-wx id_rsa.pub
    fi
    chmod 700 -R ~/.ssh
    cd /
    service ssh start
fi

for i in .gitconfig .bashrc .netrc
do
    if [ -e /workspace/$i ]
    then
        cp /workspace/$i ~/$i
    fi
done

cd /workspace/text-generation-webui/

echo "Switching to textgen"
conda activate textgen

if [ ! -z "$LOAD_MODEL" ] && [ "$LOAD_MODEL" != "PygmalionAI/pygmalion-6b" ]; then
    rm -rf /text-generation-webui/models/pygmalion-6b
    python /text-generation-webui/download-model.py $LOAD_MODEL
fi

if [[ $JUPYTER_PASSWORD ]]
then
  echo "Launching Jupyter Lab"
  cd /
  nohup jupyter lab --allow-root --no-browser --port=8888 --ip=* --ServerApp.token=$JUPYTER_PASSWORD --ServerApp.allow_origin=* --ServerApp.preferred_dir=/workspace &
fi

echo "Launching Server"
#python server.py --listen # runs Oobabooga text generation webui on port 7860
if [ "$WEBUI" == "chatbot" ]; then
    /workspace/text-generation-webui/start_chatbot_server.sh
else
    /workspace/text-generation-webui/start_textgen_server.sh
fi

sleep infinity
