Hidden = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden"
SSHidden = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden"

Menu1 = "HKEY_CLASSES_ROOT\Directory\Background\shell\"
Menu2 = "HKEY_CLASSES_ROOT\LibraryFolder\Background\shell\"

More = "Show More Hidden Files\"

Set Shell = WScript.CreateObject("WScript.Shell")

Shell.RegWrite Hidden, 1, "REG_DWORD"
Shell.RegWrite SSHidden, 1, "REG_DWORD"

On Error Resume Next

Shell.RegDelete Menu1 & More & "command\"
Shell.RegDelete Menu2 & More & "command\"

Shell.RegDelete Menu1 & More
Shell.RegDelete Menu2 & More

On Error Goto 0

Shell.SendKeys "{F5}"
