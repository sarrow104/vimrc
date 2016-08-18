pushd %1
FOR /F "usebackq delims=" %%i IN (`dir /b`) do (
		pushd "%%i"
		wget -i 1.lst
		popd
)
popd
