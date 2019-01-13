#include <stdio.h>

const char FIZZ[5] = "fizz\0";
const char BUZZ[5] = "buzz\0";

int main(void) {
    for (int i = 1; i <= 100; ++i) {
        if (i % 15 == 0) {
            printf("%s%s\n", FIZZ, BUZZ);
        } else if (i % 3 == 0) {
            printf("%s\n", FIZZ);
        } else if (i % 5 == 0) {
            printf("%s\n", BUZZ);
        } else {
            printf("%d\n", i);
        }
    }
}
