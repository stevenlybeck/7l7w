squareBrackets := method(
  l := List clone
  call message arguments foreach(arg,
       l append (doMessage(arg))
       )
  l
)

myList := [1, 2, 3, "four", [1,2,3]]
("List:" .. myList serialized) println