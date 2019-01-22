#include "stdio.h"

int main(int argc, char *argv[]) {
    int last = argc - 1;
    for (int i = 1; i < last; ++i) {
        printf("%s ", argv[i]);
    }
    if (last > 0) {
        printf("%s", argv[last]);
    }
    printf("\n");
}
