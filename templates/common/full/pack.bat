:: pack as rar archive
FOR /F "usebackq delims==" %%i IN (`dir /b /a:d`) DO (
	rar a -df "%%i.rar" "%%i"
)

