sumArr := method(arr,
    sum := 0;
    for (i, 0, arr size - 1,
        if (arr at(i) hasProto(Number), sum = sum + arr at(i));
        if (arr at(i) hasProto(List), sum = sum + sumArr(arr at(i)));
    );
    sum;
)


l := list(list(1, 1), 1, list(1, 1))
("summing " .. (l asString) .. ": " .. sumArr(l) asString) println;

l := list(list(2, 2), 2, list(2, 2))
("summing " .. (l asString) .. ": " .. sumArr(l) asString) println;

l := list(list(2, list(1, 1)), 2, list(2, 2))
("summing " .. (l asString) .. ": " .. sumArr(l) asString) println;
