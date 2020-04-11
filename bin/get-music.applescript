

tell application "Swinsian"
	set thestatus to player state
	if ((thestatus equal to playing) or (thestatus equal to paused)) then
        set info to thestatus
        -- get the currently playing track
        set thetrack to current track
        -- get properties of the track
        set trackname to name of thetrack
        set trackartist to artist of thetrack
        set trackalbum to album of thetrack
        set info to "{\"track\": \"" & trackname & "\", \"artist\": \"" & trackartist & "\", \"status\": \"" & thestatus & "\"}"
	else
        set info to "{}"
    end if
end tell
