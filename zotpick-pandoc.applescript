set zotRunning to do shell script "/usr/bin/curl 'http://localhost:23119/better-bibtex/cayw?probe=probe' 2>/dev/null; exit 0"
if zotRunning is "" then
	display alert "This script will not work unless Zotero is running. Please launch Zotero and try again"
	tell application "Scrivener"
		activate
	end tell
	error number -128
else if zotRunning is "No endpoint found" then
	display alert "This script will not work unless Better BibTeX is installed. Please make sure that Better BibTeX is installed in the running instance of Zotero"
	tell application "Scrivener"
		activate
	end tell
	error number -128
else if zotRunning is "ready" then
	set theReference to do shell script "/usr/bin/curl 'http://localhost:23119/better-bibtex/cayw?format=pandoc'"
	tell application "Scrivener"
		activate
		repeat until application "Scrivener" is frontmost
		end repeat
		tell application "System Events"
			keystroke theReference
		end tell
		do shell script "/usr/bin/pbcopy < /dev/null"
	end tell
end if
