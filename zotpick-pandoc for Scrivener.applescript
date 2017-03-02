# App to keystroke citations from Zotero into Scrivener

# Set a delay between keystrokes for OS Sienna bug
set keyDelay to 0.01

tell application "System Events"
	try
		-- Have to hardcode Scrivener here because it seems to make the script the frontmost app
		set appName to "Scrivener"
	on error errMsg
		display alert "Problem" message "Could not get the name of the frontmost application."
		error number -128
	end try
end tell

set zotRunning to do shell script "/usr/bin/curl 'http://localhost:23119/better-bibtex/cayw?probe=probe' 2>/dev/null; exit 0"
if zotRunning is "ready" then
	set theReference to do shell script "/usr/bin/curl 'http://localhost:23119/better-bibtex/cayw?format=pandoc' 2>/dev/null; exit 0"
	try
		repeat until application appName is frontmost
			tell application appName to activate
		end repeat
	on error errMsg
		display alert errMsg
	end try
	tell application "System Events"
		try
			repeat with letter in theReference
				keystroke letter
				delay keyDelay
			end repeat
		on error errMsg
			display alert errMsg
		end try
	end tell
else
	if zotRunning is "" then
		set alertTitle to "Zotero not running"
		set alertMessage to "This script will not work unless Zotero is running. Please launch Zotero and try again."
	else if zotRunning is "No endpoint found" then
		set alertTitle to "Better BibTeX not installed"
		set alertMessage to "This script will not work unless Better BibTeX is installed. Please make sure that Better BibTeX is installed in the running instance of Zotero."
	end if
	display alert alertTitle message alertMessage
	tell application appName
		activate
	end tell
	error number -128
end if
