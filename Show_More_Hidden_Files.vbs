Hidden = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden"
SSHidden = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden"

Menu1 = "HKEY_CLASSES_ROOT\Directory\Background\shell\"
Menu2 = "HKEY_CLASSES_ROOT\LibraryFolder\Background\shell\"

More = "Show More Hidden Files\"

Set Command = WScript.CreateObject("WScript.Shell")

Command.RegWrite Hidden, 1, "REG_DWORD"
Command.RegWrite SSHidden, 1, "REG_DWORD"

On Error Resume Next

Command.RegDelete Menu1 & More & "command\"
Command.RegDelete Menu2 & More & "command\"

Command.RegDelete Menu1 & More
Command.RegDelete Menu2 & More

On Error Goto 0

Command.SendKeys "{F5}"
