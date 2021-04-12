#include <iostream>
class CallLibraryInfo
{
public:
    uint64_t instruction_pointer;
    std::string function_name;
    uint64_t function_offset;

    CallLibraryInfo(uint64_t instruction_pointer, std::string function_name, uint64_t function_offset)
    {
        this->instruction_pointer = instruction_pointer;
        this->function_name = function_name;
        this->function_offset = function_offset;
    }
};