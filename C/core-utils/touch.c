#include "stdio.h"

int main(int argc, char* argv[]) {
    for (int i = 1; i < argc; ++i) {
        FILE* file = fopen(argv[i], "w");
        fputs("", file);
        fclose(file);
    }
}
