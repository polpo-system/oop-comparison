"------------------------------------------------------"
"---------------  Database Definition -----------------"
"------------------------------------------------------"
traits bench _AddSlots: (|
    dbbench = (|
	dbTraits = ().
	personnelTraits = ().
	studentTraits = ().
	teacherTraits = ().
    |).
|)

prototypes bench _AddSlots: (|
    dbbench* = (|
	dbProto = ().
	personnelProto = ().
	studentProto = ().
	teacherProto = ().
    |).
|)

traits dbbench dbTraits _Define: (|
  _ parent* = traits clonable.
  ^ clone  = (_Clone).
  ^ print = ( | tmp |
		tmp: self.
		[tmp next = nil] whileFalse: [ tmp file print. tmp: tmp next ].
			self).
  ^ add: newfile = ( | tmp |
		tmp: self.
		[tmp next = nil] whileFalse: [ tmp: tmp next ].
		tmp file: newfile.
		tmp next: (dbProto clone).
		self).
  ^ locate: ssn = ( | tmp |
		tmp: self.
		[tmp file ssn = ssn] whileFalse: [ tmp: tmp next ].
		^tmp file ).
  ^ delete: ssn = ( | tmp |
		tmp: self.
		[tmp file ssn = ssn] whileFalse: [ tmp: tmp next ].
		tmp file: tmp next file.
		tmp next: tmp next next.
		self).
  ^ traverse = ( | tmp |
		tmp: self.
		[tmp next = nil] whileFalse: [
			numOperations do: [ tmp file voidEntry. ].
			tmp: tmp next.
		].
		self).
  ^ traverse: numOps = ( | tmp |
		tmp: self.
		[tmp next = nil] whileFalse: [
			numOps do: [ tmp file voidEntry. ].
			tmp: tmp next.
		].
		self).
|)

prototypes bench dbProto _Define: (|
  _ parent* = traits dbbench dbTraits.
  ^ file.
  ^ next.
|)



"------------------------------------------------------"
"------------  Personnel File Definition --------------"
"------------------------------------------------------"
traits dbbench personnelTraits _Define: (|
  _ parent* = traits clonable.
  ^ print = ( ssn print. ': ' print. 
  	    lastname print. ', ' print.
  	    firstname print. self).
  ^ voidEntry = ( valid: 0. self.).
|)

prototypes dbbench personnelProto _Define: (|
  _ parent* = traits dbbench personnelTraits.
  ^ ssn.
  ^ firstname.
  ^ lastname.
  ^ valid.
|)


"------------------------------------------------------"
"------------  Student File Definition ----------------"
"------------------------------------------------------"

traits dbbench studentTraits _Define: (|
  _ parent* = traits dbbench personnelTraits.
  ^ clone = ( _Clone classes: list copy ).
  ^ print = ( resend.print. 
  	    (classes isEmpty) ifTrue:  [ ' -- Not Enrolled\n' print. ]
  			      False:   [ ' -- Enrolled:' print. 
  					  printclasses.
  					  '\n' print. ]. self).
  _ printclasses = ( classes do: [| :c | ' ' print. c print]. self).
  ^ addclass: c = (classes add: c. self).
  ^ unenroll = (classes removeAll. self).
|)

prototypes dbbench studentProto _Define: personnelProto clone _AddSlots: (|
  _ parent* = traits dbbench studentTraits.
  ^ classes.
|)

"------------------------------------------------------"
"------------  Teacher File Definition ----------------"
"------------------------------------------------------"
traits dbbench teacherTraits _Define: (|
  _ parent* = traits dbbench  personnelTraits.
  ^ clone = ( _Clone ).
  ^ print = ( resend.print.
  	    ' -- Salary: ' print.
  	    salary print.
  	    '\n' print.
  	    self).
  ^ updatesalary: s = (salary: s. self).
|)

prototypes dbbench teacherProto _Define: personnelProto clone _AddSlots: (|
  _ parent* = traits dbbench teacherTraits.
  ^ salary.
|)
