FROM cyberfox/runpod-oobabooga:latest

RUN rm -rf /text-generation-webui/models/PygmalionAI_pygmalion-6b

FROM scratch

RUN pip install xformers scipy accelerate && \
    git clone https://github.com/OpenAccess-AI-Collective/axolotl /axolotl && \
    pip install -e /axolotl && \
    accelerate config
