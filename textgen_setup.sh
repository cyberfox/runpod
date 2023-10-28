#!/bin/bash -i
conda activate textgen
python3 -m pip install --upgrade pip
pip install -r /requirements.txt
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
conda install -y -c "nvidia/label/cuda-12.1.0" cuda-runtime
