# Test execution and comments
"hello world" print
"\n\n" print


("1 + 1 = " .. (1 + 1)) print
"\n\n" print


"Io is strongly typed because you cannot combine two differently-typed objects with arithmatic." print
"\n\n" print

"0 is true = because (0 and true) evaluates to true, and (false or 0) evaluates to true." print
"\n\n" print

"Supported slots on an object can be determined like this (Object proto slotNames), for example (2 proto slotNames)" print
"\n" print
"Supported slots on an object can be determined like this (Object hasSlot(slotName)), for example (2 hasSlot(\"asString\"))" print

"\n\n" print

"= assigns a value to a slot if it already exists, throws an error otherwise. (Compiles to updateSlot(\"name\", value))\n" print
":= creates a slot and assigns a value to it. (Compiles to setSlot(\"name\", value))\n" print
"::= creates a slot, create a setter and assigns a value to the slot. (Compiles to newSlot(\"name\", value))\n" print
"\n\n" print

"Call a method in a slot by name: (Object getSlot(\"name\") call)" print
"\n\n" print

