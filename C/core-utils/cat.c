#include "stdio.h"

void cat(FILE* file) {
    int MAX = 1024;
    char buf[MAX];
    while (fgets(buf, sizeof buf, file) != NULL) {
        printf("%s", buf);
    }
}

int main(int argc, char* argv[]) {
    for (int i = 1; i < argc; ++i) {
        FILE* file = fopen(argv[i], "r");
        cat(file);
        fclose(file);
    }
}
