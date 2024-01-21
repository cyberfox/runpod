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

for i in .gitconfig .bashrc .netrc .tmux.conf
do
    if [ -e /workspace/$i ]
    then
        cp /workspace/$i ~/$i
    fi
done

cd /workspace/text-generation-webui/

echo "Loading Conda into the script"
source miniconda3/etc/profile.d/conda.sh

echo "Switching to textgen"
conda activate textgen
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/workspace/miniconda3/envs/textgen/lib

tmux new-session -d -s MLSession

sleep infinity
