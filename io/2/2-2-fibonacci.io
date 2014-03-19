// fibonacci: 1, 1, 2, 3, 5, 8, 13, 21, 34
fib := method(idx,
    if(idx == 1 or idx == 2,
        1, 
        fib(idx - 1) + fib(idx - 2)
    )
)

for (i, 1, 20,
    ("fib(" .. (i asString) .. ") = " .. (fib(i) asString)) println
)
