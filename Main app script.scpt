# Disk Menu
# Copyright (c) 2019, chris1111 All Rights reserved
# Set the Name         ⬇︎
#                              ⬇︎		
set diskName to "DISK" -- volume names
tell current application
	set device to (do shell script "diskutil list | grep \"" & diskName & "\" | awk '{ print substr($0,69,9) }'")
	if device = "" then
		display dialog "The disk \"" & diskName & "\"cannot be found, is your disk properly inserted ? 
If you have inserted an external disk with a different name, edit the script with the right name." buttons {"Quit", "Edit the script"} cancel button "Quit" default button 2 with title "(Error Disk not found)" with icon caution
		set theFile to POSIX file "/Applications/Disk Menu.app/Contents/Resources/Scripts/main.scpt"
		tell application "Finder" to open theFile
		
	end if
	set foundDisks to paragraphs of device
end tell

tell application "Finder"
	if disk diskName exists then
		# Set the Name         ⬇︎
		#                              ⬇︎		
		set diskName to {"DISK"} -- volume names
		tell application "Finder"
			repeat with foundDisks in diskName
				do shell script "diskutil Unmount " & diskName
				do shell script "afplay '/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/System/Volume Unmount.aif' &> /dev/null &"
			end repeat
		end tell
		
	else
		tell application "Finder"
			# Set the Name         ⬇︎
			#                              ⬇︎
			set diskName to {"DISK"} -- volume names
			tell application "Finder"
				repeat with foundDisks in diskName
					do shell script "diskutil Mount " & diskName
					do shell script "afplay '/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/System/Volume Mount.aif' &> /dev/null &"
				end repeat
			end tell
			
			
			
		end tell
	end if
end tell
