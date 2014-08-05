Hidden = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden"
SSHidden = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden"

Menu1 = "HKEY_CLASSES_ROOT\Directory\Background\shell\"
Menu2 = "HKEY_CLASSES_ROOT\LibraryFolder\Background\shell\"

Script = "WScript C:\\Windows\\Toggle_Hidden_Files.vbs"

Set Command = WScript.CreateObject("WScript.Shell")

Check = Command.RegRead(Hidden)

If Check = 2 Then
	Command.RegWrite Hidden, 1, "REG_DWORD"
	Command.RegWrite SSHidden, 0, "REG_DWORD"

	Title = "Hide Hidden Files\"
	Old = "Show Hidden Files\"
Else
	Command.RegWrite Hidden, 2, "REG_DWORD"
	Command.RegWrite SSHidden, 0, "REG_DWORD"

	Title = "Show Hidden Files\"
	Old = "Hide Hidden Files\"
End If

Command.RegWrite Menu1 & Title & "command\", Script, "REG_SZ"
Command.RegWrite Menu2 & Title & "command\", Script, "REG_SZ"

On Error Resume Next

Command.RegDelete Menu1 & Old & "command\"
Command.RegDelete Menu2 & Old & "command\"

Command.RegDelete Menu1 & Old
Command.RegDelete Menu2 & Old

On Error Goto 0

Command.SendKeys "{F5}"
