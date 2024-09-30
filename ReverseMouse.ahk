#Persistent
CoordMode, Mouse, Screen
SetTimer, ReverseMouseX, 1
MouseGetPos, lastX, lastY
return

ReverseMouseX:
    ; Get the current mouse position
    MouseGetPos, currentX, currentY

    ; Calculate the difference from the last position
    deltaX := currentX - lastX

    ; Only move if there is a detectable change
    if (deltaX != 0) {
        ; Move the mouse in the opposite direction on the X-axis
        newX := currentX - 2 * deltaX

        ; Ensure the new X position is within screen bounds
        if (newX < 0)
            newX := 1
        else if (newX > 1919) ; 1920 - 1 to stay within screen
            newX := 1918

        ; Use DllCall to set the cursor position
        DllCall("SetCursorPos", "int", newX, "int", currentY)

        ; Update the last known position
        lastX := newX
        lastY := currentY
    }
return

; Hotkey to stop the script
q::ExitApp