Number defaultDivision := Number getSlot("/")
Number / := method(denom,
    if (denom == 0,
        0,
        self defaultDivision(denom)
    )
)

for (i, 0, 20,
    ("(10 / " .. (i asString) .. ") = " .. ((10 / i) asString)) println
)
