//
// Created by kiker on 15.05.2024.
//

#ifndef EXAMPLECLASS_H
#define EXAMPLECLASS_H

#include <iostream>

class ExampleClass {

public:
    ExampleClass() {
        std::cout << "Class was constructed!" << std::endl;
    }

    ~ExampleClass() {
        std::cout << "Object was destructed!" << std::endl;
    }
};

#endif //EXAMPLECLASS_H
