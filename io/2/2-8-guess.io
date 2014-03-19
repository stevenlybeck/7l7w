debug := method(msg,
    if(false, msg println)
)

input := File standardInput open
winner := Random value(100) floor + 1
guess := -1
prevGuess := guess
done := false

("Winner is " .. winner asString) println
while (done == false,    
    if (guess == -1,
        "Guess a number between 1 and 100",
        if (prevGuess == -1 or ((winner - prevGuess) abs == (winner - guess) abs),
            "Guess again."
            ,
            // new error is less than previous
            if ((winner - prevGuess) abs < (winner - guess) abs, "Colder. Guess again.", "Warmer. Guess again.")
        )
    ) println

    prevGuess := guess
    guess := input readLine asNumber

    if (guess == winner,
        // if
        "Winner!" println
        done := true
    )
)
