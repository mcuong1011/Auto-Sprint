; ─── CONFIG ───────────────────────────────────────────────────────────────────

global SprintModifier := "LAlt"   ; ← your hold to sprint key: "Ctrl", "Space", "LAlt", etc.
global ScriptActive   := true
global ShiftHeld      := true


; ─── EMERGENCY EXIT HOTKEY ─────────────────────────────────────────────────────

RCtrl::ExitApp() ; ← change to whatever key u like , this exists to prevent any possible bugs that u can encounter while playing


; ─── GUI ─────────────────────────────────────────────────────────────────────

MyGui := Gui()
MyGui.Add("Text",, "Auto Sprint now running")
MyGui.Add("Button",, "Exit Program").OnEvent("Click", (*) => ExitApp())
MyGui.Show()

; Always exit the program after playing 


; ─── TOGGLE SPRINT ────────────────────────────────────────────────────────────

LShift::       ; ← Change to whatever key u like but must be different from ur hold to sprint keybind
{
    global ScriptActive
    ScriptActive := !ScriptActive
    Return
}


; ─── CORE HANDLERS ────────────────────────────────────────────────────────────

HandleKey(key) {
    global SprintModifier, ShiftHeld, ScriptActive
    if (ScriptActive) {
        if (ShiftHeld) {
            if !GetKeyState(SprintModifier, "P") {
                Send("{" . SprintModifier . " down}")
            }
        }
        Send("{" . key . " down}")
    }
}


HandleKeyRelease(key) {
    global SprintModifier, ShiftHeld
    if (ShiftHeld) {
        Send("{" . SprintModifier . " up}")
    }
    Send("{" . key . " up}")
}


; ─── MOVEMENT BINDS ───────────────────────────────────────────────────────────

~w::       HandleKey("w")
~w up::    HandleKeyRelease("w")

~a::       HandleKey("a")
~a up::    HandleKeyRelease("a")

~s::       HandleKey("s")
~s up::    HandleKeyRelease("s")

~d::       HandleKey("d")
~d up::    HandleKeyRelease("d")
