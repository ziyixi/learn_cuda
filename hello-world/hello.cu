#include <stdio.h>
#include <cuda_runtime.h>

__global__ void helloCUDA() {
    printf("Hello from GPU!\n");
}

int main() {
    printf("Hello from CPU!\n");

    // Launch Kernel
    helloCUDA<<<1, 1>>>();

    // 1. Check if the kernel launch itself failed (e.g. invalid arguments)
    cudaError_t err = cudaGetLastError();
    if (err != cudaSuccess) {
        printf("Kernel Launch Error: %s\n", cudaGetErrorString(err));
    }

    // 2. Wait for GPU to finish and check for execution errors
    err = cudaDeviceSynchronize();
    if (err != cudaSuccess) {
        printf("Runtime Error: %s\n", cudaGetErrorString(err));
    }

    return 0;
}