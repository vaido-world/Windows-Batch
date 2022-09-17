@ECHO OFF

REM #1 Commmand Line Argument: Output

SETLOCAL EnableDelayedExpansion
FOR %%A IN (%*) DO (
	SET "command_line_argument=%%A"

	REM short parameter -
	REM long name parameter --
	REM argument
	IF "!command_line_argument:~0,2!"=="--" (
		ECHO parameter !command_line_argument!
		ECHO extract !command_line_argument:~0,2!
		SET "!command_line_argument:~2!=toggled"
	) ELSE (
		SET /A "argument_count+=1"
		ECHO argument !command_line_argument!
		SET "argument_!argument_count!=%%~fA"
	)
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
