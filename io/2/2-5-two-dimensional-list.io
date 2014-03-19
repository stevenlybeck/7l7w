debug := method(msg,
    if(false, msg println)
)

2dList := List clone

2dList save := method(filename,
    w := self size - 1
    fileContents := ""

    for (i, 0, w,
        fileContents = fileContents .. self at(i) serialized .. "\n"
    )

    File with(filename) open write(fileContents) close
)

2dList load := method(filename,
    f := File with(filename) open
    fl := f readLines
    f close

    w := fl size
    h := doString(fl at(0)) size

    self dim(w, h)
    for (i, 0, w - 1,
        for (j, 0, h - 1,
            lst := doString(fl at(i))
            self set(i, j, lst at(j)) 
        )
    )
)

2dList dim := method(x, y,
    debug("dimming " .. x asString .. ", " .. y asString)
    for (i, 0, x-1,
        self append(list())
        for (j, 0, y-1,
            self at(i) append(nil)
        )
    )
)

// todo: add bounds checking
2dList set := method(x, y, val,
    debug("set " .. x asString .. ", " .. y asString .. ", " .. val)
    self at(x) atPut(y, val)
)

2dList get := method(x, y,
    debug("get " .. x asString .. ", " .. y asString)
    debug("self is: " .. self asString)
    self at(x) at(y)
)

2dList transpose := method(
    nl := 2dList clone
    w := self size
    h := self at(0) size

    nl dim(h, w)

    for (i, 0, w - 1,
        for (j, 0, h - 1,
            nl set(j, i, self get(i, j))
        )
    )

    nl
)

ll := 2dList clone
("before dim: " .. ll asString) println
ll dim(2,2)
("after dim: " .. ll asString) println
ll set(0, 0, "one")
ll set(0, 1, "two")
ll set(1, 0, "three")
ll set(1, 1, "four")
("after set: " .. ll asString) println
("ll get(0, 1): " .. ll get(0, 1) asString) println
("ll get(0, 0): " .. ll get(0, 0) asString) println

("ll transpose: " .. (ll transpose) asString) println

ll save("test.txt")
("ll saved to test.txt") println

lll := 2dList clone
lll load("test.txt")
("lll loaded from test.txt: " .. lll asString) println