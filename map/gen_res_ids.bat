for /l %%i in (0,1,63) do @echo ^<bitmap id="m%%i" filename="m\%%i.png"^>^<palette disableTransparency="true"^>^<color^>000000^</color^>^<color^>FFFFFF^</color^>^</palette^>^</bitmap^>>>r.txt

for /l %%i in (0,1,63) do @call set "VarRes=%%VarRes%%,m%%i"
@echo %VarRes:~1%>rs.txt

pause