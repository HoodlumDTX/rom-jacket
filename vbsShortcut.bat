echo ' >"%GBC%\%DTSC%.vbs"
echo. Set WshShell = WScript.CreateObject("WScript.Shell") >>"%GBC%\%DTSC%.vbs"
echo. Set lnk = WshShell.CreateShortcut("%GBC%\%DTS%.lnk") >>"%GBC%\%DTSC%.vbs"
echo. lnk.TargetPath = "%GBC%\%DTSC%.bat">>"%GBC%\%DTSC%.vbs"
echo. lnk.Arguments = %OUTP%%GBC%\logs\%DTS%.log">>"%GBC%\%DTSC%.vbs"
echo. lnk.Description = "%DTS%">>"%GBC%\%DTSC%.vbs"
echo. lnk.IconLocation = "%GBC%\%ICON%, 0">>"%GBC%\%DTSC%.vbs"
echo. lnk.WindowStyle = "7">>"%GBC%\%DTSC%.vbs"
echo. lnk.WorkingDirectory = "%GBC%">>"%GBC%\%DTSC%.vbs"
echo lnk.Save  >>"%GBC%\%DTSC%.vbs"
echo 'Clean up  >>"%GBC%\%DTSC%.vbs"
echo. Set lnk = Nothing >>"%GBC%\%DTSC%.vbs"	
exit