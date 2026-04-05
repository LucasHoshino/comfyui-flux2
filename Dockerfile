FROM runpod/worker-comfyui:5.5.1-base

RUN rm -rf /comfyui && \
    git clone --depth 1 https://github.com/comfyanonymous/ComfyUI /comfyui && \
    cd /comfyui && pip install --no-cache-dir -r requirements.txt

RUN cd /comfyui/custom_nodes && \
    git clone --depth 1 https://github.com/cubiq/ComfyUI_essentials && \
    git clone --depth 1 https://github.com/yolain/ComfyUI-Easy-Use && \
    git clone --depth 1 https://github.com/kijai/ComfyUI-KJNodes && \
    for dir in /comfyui/custom_nodes/*/; do \
      [ -f "$dir/requirements.txt" ] && pip install --no-cache-dir -r "$dir/requirements.txt" || true; \
    done

RUN printf 'runpod_volume:\n\
    base_path: /runpod-volume/models\n\
    diffusion_models: diffusion_models/\n\
    clip: text_encoders/\n\
    vae: vae/\n' > /comfyui/extra_model_paths.yaml

RUN grep -r "EmptyFlux2LatentImage" /comfyui/comfy_extras/ && \
    grep -r "ReferenceLatent" /comfyui/comfy_extras/ && \
    echo "All required Flux2 nodes found"
