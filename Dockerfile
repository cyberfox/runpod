FROM cyberfox/runpod-oobabooga:0.5

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV NVARCH=x86_64
ENV NVIDIA_REQUIRE_CUDA="cuda>=11.6 brand=tesla,driver>=418,driver<419 brand=tesla,driver>=450,driver<451 brand=tesla,driver>=470,driver<471 brand=unknown,driver>=470,driver<471 brand=nvidia,driver>=470,driver<471 brand=nvidiartx,driver>=470,driver<471 brand=geforce,driver>=470,driver<471 brand=geforcertx,driver>=470,driver<471 brand=quadro,driver>=470,driver<471 brand=quadrortx,driver>=470,driver<471 brand=titan,driver>=470,driver<471 brand=titanrtx,driver>=470,driver<471"
ENV NV_CUDA_CUDART_VERSION=11.6.55-1
ENV NV_CUDA_COMPAT_PACKAGE=cuda-compat-11-6
ENV CUDA_VERSION=11.6.2
ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NV_CUDA_LIB_VERSION=11.6.2-1
ENV NV_NVTX_VERSION=11.6.124-1
ENV NV_LIBNPP_VERSION=11.6.3.124-1
ENV NV_LIBNPP_PACKAGE=libnpp-11-6=11.6.3.124-1
ENV NV_LIBCUSPARSE_VERSION=11.7.2.124-1
ENV NV_LIBCUBLAS_PACKAGE_NAME=libcublas-11-6
ENV NV_LIBCUBLAS_VERSION=11.9.2.110-1
ENV NV_LIBCUBLAS_PACKAGE=libcublas-11-6=11.9.2.110-1
ENV NV_LIBNCCL_PACKAGE_NAME=libnccl2
ENV NV_LIBNCCL_PACKAGE_VERSION=2.12.10-1
ENV NCCL_VERSION=2.12.10-1
ENV NV_LIBNCCL_PACKAGE=libnccl2=2.12.10-1+cuda11.6
ENV NVIDIA_PRODUCT_NAME=CUDA
ENV NV_CUDA_CUDART_DEV_VERSION=11.6.55-1
ENV NV_NVML_DEV_VERSION=11.6.55-1
ENV NV_LIBCUSPARSE_DEV_VERSION=11.7.2.124-1
ENV NV_LIBNPP_DEV_VERSION=11.6.3.124-1
ENV NV_LIBNPP_DEV_PACKAGE=libnpp-dev-11-6=11.6.3.124-1
ENV NV_LIBCUBLAS_DEV_VERSION=11.9.2.110-1
ENV NV_LIBCUBLAS_DEV_PACKAGE_NAME=libcublas-dev-11-6
ENV NV_LIBCUBLAS_DEV_PACKAGE=libcublas-dev-11-6=11.9.2.110-1
ENV NV_NVPROF_VERSION=11.6.124-1
ENV NV_NVPROF_DEV_PACKAGE=cuda-nvprof-11-6=11.6.124-1
ENV NV_LIBNCCL_DEV_PACKAGE_NAME=libnccl-dev
ENV NV_LIBNCCL_DEV_PACKAGE_VERSION=2.12.10-1
ENV NV_LIBNCCL_DEV_PACKAGE=libnccl-dev=2.12.10-1+cuda11.6
ENV LIBRARY_PATH=/usr/local/cuda/lib64/stubs
ENV NV_CUDNN_VERSION=8.4.0.27
ENV NV_CUDNN_PACKAGE_NAME=libcudnn8
ENV NV_CUDNN_PACKAGE=libcudnn8=8.4.0.27-1+cuda11.6
ENV NV_CUDNN_PACKAGE_DEV=libcudnn8-dev=8.4.0.27-1+cuda11.6
ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/bin/bash

CMD ["/start.sh"]

WORKDIR /text-generation-webui

COPY start.sh /

ENTRYPOINT ["/opt/nvidia/nvidia_entrypoint.sh"]
