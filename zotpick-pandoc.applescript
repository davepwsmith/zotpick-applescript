tell application "System Events"
	try
		set appName to (the name of every process whose frontmost is true) as string
	on error errMsg
		display alert "Problem" message "Could not get the name of the frontmost application."
		error number -128
	end try
end tell
set zotRunning to do shell script "/usr/bin/curl 'http://localhost:23119/better-bibtex/cayw?probe=probe' 2>/dev/null; exit 0"
if zotRunning is "" then
	display alert "This script will not work unless Zotero is running. Please launch Zotero and try again"
	tell application appName
		activate
	end tell
	error number -128
else if zotRunning is "No endpoint found" then
	display alert "This script will not work unless Better BibTeX is installed. Please make sure that Better BibTeX is installed in the running instance of Zotero"
	tell application appName
		activate
	end tell
	error number -128
else if zotRunning is "ready" then
	set theReference to do shell script "/usr/bin/curl 'http://localhost:23119/better-bibtex/cayw?format=pandoc' 2>/dev/null; exit 0"
	tell application appName
		activate
		repeat until application appName is frontmost
		end repeat
		tell application "System Events"
			keystroke theReference
		end tell
	end tell
end if
