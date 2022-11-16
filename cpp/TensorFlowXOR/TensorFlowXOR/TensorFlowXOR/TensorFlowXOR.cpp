// TensorFlowXOR.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

#include <tensorflow/c/c_api.h>

int main() {
    std::cout << TF_Version() << "\n";

    TF_Graph* Graph = TF_NewGraph();
    TF_Status* Status = TF_NewStatus();
    TF_SessionOptions* SessionOpts = TF_NewSessionOptions();
    TF_Buffer* RunOpts = NULL;

}