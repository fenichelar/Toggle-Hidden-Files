Hidden = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Hidden"
SSHidden = "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSuperHidden"

Menu1 = "HKEY_CLASSES_ROOT\Directory\Background\shell\"
Menu2 = "HKEY_CLASSES_ROOT\LibraryFolder\Background\shell\"

Script1 = "WScript C:\\Windows\\Toggle_Hidden_Files.vbs"
Script2 = "WScript C:\\Windows\\Show_More_Hidden_Files.vbs"

More = "Show More Hidden Files\"
File = "C:\Windows\Show_More_Hidden_Files.vbs"

Set Shell = WScript.CreateObject("WScript.Shell")
Set fileSystemObject = CreateObject("Scripting.FileSystemObject")

Check = Shell.RegRead(Hidden)

If Check = 2 Then
	Shell.RegWrite Hidden, 1, "REG_DWORD"
	Shell.RegWrite SSHidden, 0, "REG_DWORD"

	Title = "Hide Hidden Files\"
	Old = "Show Hidden Files\"

	If fileSystemObject.FileExists(File) Then
		Shell.RegWrite Menu1 & More & "command\", Script2, "REG_SZ"
		Shell.RegWrite Menu2 & More & "command\", Script2, "REG_SZ"
	End If
Else
	Shell.RegWrite Hidden, 2, "REG_DWORD"
	Shell.RegWrite SSHidden, 0, "REG_DWORD"

	Title = "Show Hidden Files\"
	Old = "Hide Hidden Files\"

	On Error Resume Next

	Shell.RegDelete Menu1 & More & "command\"
	Shell.RegDelete Menu2 & More & "command\"

	Shell.RegDelete Menu1 & More
	Shell.RegDelete Menu2 & More

	On Error Goto 0
End If

Shell.RegWrite Menu1 & Title & "command\", Script1, "REG_SZ"
Shell.RegWrite Menu2 & Title & "command\", Script1, "REG_SZ"

On Error Resume Next

Shell.RegDelete Menu1 & Old & "command\"
Shell.RegDelete Menu2 & Old & "command\"

Shell.RegDelete Menu1 & Old
Shell.RegDelete Menu2 & Old

On Error Goto 0

Shell.SendKeys "{F5}"
