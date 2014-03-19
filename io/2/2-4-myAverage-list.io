List myAverage := method(
    arr := call target;
    sum := 0;
    denominator := 0;
    for (i, 0, arr size - 1,
        if (arr at(i) hasProto(Number),
                // then
                sum = sum + arr at(i)
                denominator = denominator + 1
                , // else
                Exception raise("Not a number: myAverage can only be called on lists of numbers.")
            );
    )
    (sum / denominator);
)

test := method(l,
    try(
        ("average of " .. (l asString) .. ": " .. (l myAverage asString)) println;
    ) catch(Exception,
        "Exception when summing" println
    )
)


test(list(list(1, 1), 1, list(1, 1)))
test(list(list(2, 2), 2, list(2, 2)))
test(l := list(list(2, list(1, 1)), 2, list(2, 2)))
test(list(0,1,2,3,4,5,6,7,8,9))
test(list(5,5))