#!/usr/bin/env python3

def lirst_fast(first_name, last_name):
    f = first_name[0]
    irst = first_name[1:]
    l = last_name[0]
    ast = last_name[1:]
    return (l + irst, f + ast)

wrong = 0
while True:
    full_name = input("What is your full name? ")
    split_name = full_name.split(' ')
    name_count = len(split_name)
    if full_name == ':q' or full_name == ":quit":
        break
    elif name_count != 2:
        print(f"{full_name} has {name_count} words instead of only 2: attempt {wrong}")
        wrong += 1
    else:
        first_name = split_name[0]
        last_name = split_name[1]
        (lirst_name, fast_name) = lirst_fast(first_name, last_name)
        print(f"{lirst_name} {fast_name}")
        wrong = 0
