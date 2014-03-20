Builder := Object clone
Builder forward := method(
  self _indent := if (self hasSlot("_indent"), self _indent .. "  ", "");
  writeln(self _indent .. "<", call message name, ">")
  call message arguments foreach(
	arg, 
	content := self doMessage(arg); 
	if(content type == "Sequence", writeln(self _indent .. "  " .. content)))
  writeln(self _indent .. "</", call message name, ">")
  self _indent := self _indent exSlice(0, self _indent size - 2)
  )
Builder ul(
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))
