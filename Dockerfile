FROM runpod/worker-comfyui:5.5.1-base

RUN cd /comfyui && git pull && pip install -r requirements.txt 2>/dev/null || true

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_essentials comfyui_essentials && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use comfyui-easy-use && \
    git clone https://github.com/rgthree/rgthree-comfy && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere && \
    git clone https://github.com/kijai/ComfyUI-KJNodes && \
    pip install -r /comfyui/custom_nodes/comfyui-easy-use/requirements.txt && \
    pip install -r /comfyui/custom_nodes/comfyui_essentials/requirements.txt

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
