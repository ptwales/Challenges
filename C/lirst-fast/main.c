#include <stdio.h>
#include <string.h>
#include <ctype.h>

int count_words(const char str[]) {
    const int size = strlen(str);
    int count = 1;
    for (int i = 0; i < size; ++i) {
        if (isspace(str[i])) {
            count = count + 1;
        }
    }
    return count;
}


int is_quit(const char* str) {
    return (strcmp(str, ":q") == 0) 
        || (strcmp(str, ":quit") == 0);
}

void lirst_fast(char first[], char last[]) {
    char head = first[0];
    first[0] = last[0];
    last[0] = head;
}

int main(void) {

    const int MAX_SIZE = 64;
    char first_last[MAX_SIZE];

    int wrong = 0;
    for (;;) {

        printf("What is your full name? ");
        fgets(first_last, MAX_SIZE, stdin);
        first_last[strcspn(first_last, "\r\n")] = 0;

        if (is_quit(first_last)) { 
            return 0;
        } 

        int word_count = count_words(first_last);

        if (word_count == 2) {
            wrong = 0;
            char *first = strtok(first_last, " ");
            char *last = strtok(NULL, " ");
            lirst_fast(first, last);
            printf("Your name is: %s %s\n", first, last);
        } else {
            wrong = wrong + 1;
            printf("%s has %d words instead of only 2: attempt %d\n", 
                    first_last,
                    word_count,
                    wrong
                  );
        }
    }
}
