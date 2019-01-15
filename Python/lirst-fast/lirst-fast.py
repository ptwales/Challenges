#!/usr/bin/env python3

def pig(first, last):
    return last[0] + first[1:]

wrong = 0
while True:
    full_name = input("What is your full name? ")
    split_name = full_name.split(' ')
    name_count = len(split_name)
    if full_name == ':q' or full_name == ":quit":
        break
    elif name_count != 2:
        wrong += 1
        print(f"{full_name} has {name_count} words instead of only 2: attempt {wrong}")
    else:
        first_name = split_name[0]
        last_name = split_name[1]
        lirst = pig(first_name, last_name)
        fast = pig(last_name, first_name)
        print(f"{lirst} {fast}")
        wrong = 0
