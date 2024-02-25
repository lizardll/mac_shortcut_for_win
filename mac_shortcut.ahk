LWin & Tab::AltTab
#c::Send "^{c}"
#v::Send "^{v}"
#`::Send "^{Tab}"
#x::Send "^x"
#s::Send "^s"
#z::Send "^z"
#y::Send "^y"
#a::Send "^a"
#f::Send "^f"
#h::Send "^h"
#+t::Send "^+t"
#r::Send "^r"
!h::Send "#{h}"
; alt+c for clipboard history
!c::{
  Send "{LWin Down}"
  Sleep 100
  Send "v"
  Send "{LWin Up}"
  return
}


CapsLock::{
    ; Start a timer
    keyWaitTimer := A_TickCount
    ; Wait for Caps Lock to be released
    KeyWait('CapsLock')
    ; Calculate how long Caps Lock was held down
    keyWaitTime := A_TickCount - keyWaitTimer
    ; If Caps Lock was held down for less than 500 ms, switch input method
    if (keyWaitTime < 500) {
        Send('{Shift Down}')
        Sleep 100  ; You might need to adjust this delay depending on your needs
        Send('{Shift Up}')
    } else {
        ; Otherwise, toggle Caps Lock
        SetCapsLockState(GetKeyState('CapsLock', 'T') ? 'Off' : 'On')
    }
return
}
