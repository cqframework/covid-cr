@ECHO OFF
SET tooling_jar=tooling-1.1.0-SNAPSHOT-jar-with-dependencies.jar
SET input_cache_path=%~dp0input-cache
SET datadictionary_filename=Covid.xlsx
SET datadictionary_sheetname=input
SET scope=CR

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%tooling_jar%" (
	ECHO running: JAVA -jar "%input_cache_path%\%tooling_jar%" -ProcessAcceleratorKit -s=%scope% -pts="%~dp0input\datadictionary\%datadictionary_filename%" -dep=%datadictionary_sheetname% -op=%~dp0
	JAVA -jar "%input_cache_path%\%tooling_jar%" -ProcessAcceleratorKit -s=%scope% -pts="%~dp0input\datadictionary\%datadictionary_filename%" -dep=%datadictionary_sheetname% -op=%~dp0
) ELSE If exist "..\%tooling_jar%" (
	ECHO running: JAVA -jar "..\%tooling_jar%"  -ProcessAcceleratorKit -s=%scope% -pts="%~dp0input\datadictionary\%datadictionary_filename%" -dep=%datadictionary_sheetname% -op=%~dp0
	JAVA -jar "..\%tooling_jar%"  -ProcessAcceleratorKit -s=%scope% -pts="%~dp0input\datadictionary\%datadictionary_filename%" -dep=%datadictionary_sheetname% -op=%~dp0
) ELSE (
	ECHO IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
)

PAUSE
