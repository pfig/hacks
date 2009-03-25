using terms from application "Mail"
	tell application "Mail"
		set theMessages to the selection
		repeat with thisMessage in theMessages
			set msgAccount to name of account of mailbox of thisMessage
			set msgMailbox to name of mailbox of thisMessage
			set mboxName to "Archive"
			tell account "personal"
				try
					set mbox to mailbox named mboxName
					get name of mbox
				on error
					make new mailbox with properties {name:mboxName}
					set mbox to mailbox named mboxName
				end try
				move thisMessage to mbox
			end tell
		end repeat
	end tell
end using terms from