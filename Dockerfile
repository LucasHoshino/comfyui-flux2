FROM runpod/worker-comfyui:5.5.1-base

RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/cubiq/ComfyUI_essentials comfyui_essentials && \
    git clone https://github.com/yolain/ComfyUI-Easy-Use comfyui-easy-use && \
    git clone https://github.com/rgthree/rgthree-comfy && \
    git clone https://github.com/chrisgoringe/cg-use-everywhere && \
    git clone https://github.com/kijai/ComfyUI-KJNodes && \
    cd comfyui-easy-use && pip install -r requirements.txt 2>/dev/null || true && \
    cd ../comfyui_essentials && pip install -r requirements.txt 2>/dev/null || true

COPY extra_model_paths.yaml /comfyui/extra_model_paths.yaml
