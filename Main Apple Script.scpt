# Disk Menu
# Copyright (c) 2019, chris1111 All Rights reserved.
display dialog "
You must first install Disk Menu.app in your Applications.
You just have to click once on the status bar icon to mount or unmount any Disk


Secondly edit the script to simply put the exact name of your Disk ➢ Save and this is done! 
Eject the Disk Menu.dmg

Note: This Utility works for any internal Disk or USB external Disk, Thunderbolt Disk, SD Card Disk.
Works for any File System
============================" with icon note
--display dialog source
set source to path to me as string
set source to POSIX path of source & "Contents/Resources/Install/Disk Menu.app"
set source to quoted form of source
set cmd to "cp -R " & source & " /Applications"

--display dialog cmd
do shell script cmd
delay 2

tell application "System Events"
	get full name of current user
	make new login item at end of login items with properties ¬
		{path:"/Applications/Disk Menu.app"}
	
end tell
set theFile to POSIX file "/Applications/Disk Menu.app"
tell application "Finder" to open theFile
do shell script "open -a '/Applications/Disk Menu.app'"
