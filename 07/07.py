#!/usr/bin/env python3

ops = ["+", "*"]

def generate_nested_combinations(elements, ops):
    if len(elements) == 2:
        return [(elements[0], op, elements[1]) for op in ops]
    previous_combinations = generate_nested_combinations(elements[:-1], ops)
    return [
        (prev_combo, op, elements[-1])
        for prev_combo in previous_combinations
        for op in ops
    ]

def compute(expr):
    result = 0
    op = ""
    for ch in (((expr.replace("(", "")).replace(")", "")).replace("'", "")).split(", "):
        if result == 0:
            result = int(ch)
        match ch:
            case "+":
                op = "+"
            case "*":
                op = "*"
            case _:
                if op == "+":
                    result = result + int(ch)

                if op == "*":
                    result = result * int(ch)

    return result

fh = open("test.txt")

sum = 0

for line in fh:
    value, rest = line.split(":")
    xs = rest[1:-1].split(" ")

    combinations = generate_nested_combinations(xs, ops)

    good_ones = []
    for combo in combinations:
        result = compute(str(combo))

        if result == int(value):
            good_ones.append(result)

    if len(good_ones) > 0:
        sum = sum + good_ones[0]

print(f"sum {sum}")

fh.close()
