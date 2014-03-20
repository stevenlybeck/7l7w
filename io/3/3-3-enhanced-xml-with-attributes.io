// code to allow {} hash syntax
# START:range
OperatorTable addAssignOperator(":", "atPutNumber")
# END:range
# START:curlyBrackets
curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
  	   // changed from doMessage to doString Io re-parses with the updated operator table
  	   // otherwise we get << Exception: Sequence does not respond to ':' >>
       r doString(arg asString)
       )
  r
)
# END:curlyBrackets
# START:atPutNumber
Map atPutNumber := method(
  self atPut(
       call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
       call evalArgAt(1))
)
# END:atPutNumber

Builder := Object clone
Builder forward := method(
  self _indent := if (self hasSlot("_indent"), self _indent .. "  ", "");
  openTag := self _indent .. "<" .. call message name
  call message arguments foreach(
	idx, arg, 
	content := self doMessage(arg); 
	
	if(idx == 0,
		openTag = openTag .. if(content type == "Map",
			// if it's a map, add attributes to opening tag
			" " .. (content map(arg1, arg2, "\"" .. arg1 .. "\"=\"" .. arg2 .. "\"") join(" "))
			// otherwise, add nothing
			, ""
		 ) .. ">"
		// make sure to append closing bracket to tag
		

		writeln(openTag)
	)

	if(content type == "Sequence", writeln(self _indent .. "  " .. content)))
  writeln(self _indent .. "</", call message name, ">")
  self _indent := self _indent exSlice(0, self _indent size - 2)
  )
Builder ul({ "test": "attribute", "another": "attribute", "width":100 },
	li("Io"), 
	li("Lua"), 
	li("JavaScript"))
