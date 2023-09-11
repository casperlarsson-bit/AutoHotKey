#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Write template coordinate on #koord
::#koord::N xx xx.xxx E xxx xx.xxx
return

; Auto date when doing ctrl+m
^m::
    Send, % A_YYYY . "-" . A_MM "-" . A_DD

return

; Auto add trackable to visited, ctrl+<
^<::
    MouseClick, left
    Send {Down 2}
    Send {Enter}
    MouseMove, 0, 40 , 1, R
return

; ### MINECRAFT ###

; Auto crafting 15 times, ctrl+k
;(X: 555, Y: 430) recipe book coordinate
;(X: 1330, Y: 430) crafting coordinate
^k::
    Send {Shift down}
    Loop, 15 {
        MouseClick, left, 555, 430
        Sleep 10
        MouseClick, left, 1330, 430
        Sleep 50
    }

    Send {Shift up}
return

; Auto farming, once, hold for multiple, ctrl+.
^.::
    Loop, 4 {
        Send {RButton}
    }

    Send {LButton}
return

; Open calculator on win+C
#c::
    Run calc.exe
return

; Search for todays day in kalendermatris
^!f::
    Send, ^f 
    Send, % A_MMMM . " " . LTrim(A_DD, "0")
return

; Remove ° symbol from clipboard when performing ctrl+alt+V and print it out
^!v::
    degree = % chr(176)
    nonDegree = % StrReplace(Clipboard, degree , "")
    Send, % StrReplace(nonDegree, "'" , "")
return

^!c::
    MouseMove, 483, 470, 1
    Click, Down
    MouseMove, 671, 470, 1
    Click, Up
    Send, ^c
    MouseClick, left, 506, 690, 1, 1
    Sleep, 50
    Send, ^!v
    Sleep, 50
    MouseClick, left, 511, 786, 1, 1
return