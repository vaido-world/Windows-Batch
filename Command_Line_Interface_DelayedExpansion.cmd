@ECHO OFF
SETLOCAL EnableDelayedExpansion
FOR %%A IN (%*) DO (
	SET "command_line_argument=%%A"

	REM short parameter -
	REM long name parameter --
	REM argument
	IF NOT DEFINED line IF "!command_line_argument:~0,2!"=="--" SET "line=long_parameter"
	IF NOT DEFINED line IF "!command_line_argument:~0,1!"=="-" SET "line=short_parameter"
	IF NOT DEFINED line SET "line=argument"

	IF "!line!"=="long_parameter" (
		ECHO long parameter !command_line_argument!
		ECHO long extract !command_line_argument:~0,2!
		ECHO long name !command_line_argument:~2!
		SET "!command_line_argument:~2!=toggled"
	) 
	
	IF "!line!"=="short_parameter" (
		ECHO short parameter !command_line_argument!
		ECHO short extract !command_line_argument:~0,1!
		ECHO short name !command_line_argument:~1!
		SET "!command_line_argument:~1!=toggled"
	)
	
	IF "!line!"=="argument" (
		SET /A "argument_count+=1"
		ECHO argument !command_line_argument!
		SET "argument_!argument_count!=%%~fA"
	)
	
	IF DEFINED line SET "line="
)
ECHO Parameter asd: %asd%
ECHO !argument_1!
ECHO !argument_2!

exit /B
SET "argument_1=%1"
SET "argument_1=asd"
IF DEFINED argument_1 ECHO %argument_1:~0,1% %argument_1%

REM IF "%argument_1%"
PAUSE
