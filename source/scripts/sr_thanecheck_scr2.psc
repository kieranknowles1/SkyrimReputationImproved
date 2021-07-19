Scriptname SR_ThaneCheck_Scr2 extends Quest   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Tweaks - Use IsInLocation instead of formlists
; Should this use the holds?
Location Property DawnstarLocation Auto
Location Property FalkreathLocation Auto
Location Property MarkarthLocation Auto
Location Property MorthalLocation Auto
Location Property RiftenLocation Auto
Location Property SolitudeLocation Auto
Location Property WhiterunLocation Auto
Location Property WindhelmLocation Auto
Location Property WinterholdLocation Auto

;GLOBAL PROPERTIES
GlobalVariable property SR_Global_ThaneInCurrentLocation auto
GlobalVariable property SR_MCM_Factions_Thane_Eastmarch auto
GlobalVariable property SR_MCM_Factions_Thane_Falkreath auto
GlobalVariable property SR_MCM_Factions_Thane_Haafingar auto
GlobalVariable property SR_MCM_Factions_Thane_Hjaalmarch auto
GlobalVariable property SR_MCM_Factions_Thane_Pale auto
GlobalVariable property SR_MCM_Factions_Thane_Reach auto
GlobalVariable property SR_MCM_Factions_Thane_Rift auto
GlobalVariable property SR_MCM_Factions_Thane_Whiterun auto
GlobalVariable property SR_MCM_Factions_Thane_Winterhold auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnUpdate()
	if(ThaneCheck() == true)
		SR_Global_ThaneInCurrentLocation.SetValue(1)
		;debug.trace ("SR_ThaneCheck marked player as thane in current location")
	else
		SR_Global_ThaneInCurrentLocation.SetValue(0)
	endif
	Stop()
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Bool Function ThaneCheck()
	Actor player = Game.GetPlayer()

	if(player.IsInLocation(DawnstarLocation))
		if(SR_MCM_Factions_Thane_Pale.GetValue() == 1); Thane of the Pale (Dawnstar)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(MarkarthLocation))
		if(SR_MCM_Factions_Thane_Reach.GetValue() == 1); Thane of the Reach (Markarth)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(RiftenLocation))
		if(SR_MCM_Factions_Thane_Rift.GetValue() == 1); Thane of the Rift (Riften)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(FalkreathLocation))
		if(SR_MCM_Factions_Thane_Falkreath.GetValue() == 1); Thane of Falkreath
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(SolitudeLocation))
		if(SR_MCM_Factions_Thane_Haafingar.GetValue() == 1); Thane of Haafingar (Solitude)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(MorthalLocation))
		if(SR_MCM_Factions_Thane_Hjaalmarch.GetValue() == 1); Thane of Hjaalmarch (Morthal)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(WinterholdLocation))
		if(SR_MCM_Factions_Thane_Winterhold.GetValue() == 1); Thane of Winterhold
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(WindhelmLocation))
		if(SR_MCM_Factions_Thane_Eastmarch.GetValue() == 1); Thane of Eastmarch (Windhelm)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(WhiterunLocation))
		if(SR_MCM_Factions_Thane_Whiterun.GetValue() == 1); Thane of Whiterun
			Return true
		else
			Return false
		endif
	else
		Return false
	endif
EndFunction

; This was repeated for every hold
; It doesn't even work properly
; Only the last element of the form list is checked
; Other options: HasForm, IsInLocation (used, checks child locations)
;bool Function LocationCheckEastmarch(Location CurrentLocation)
;	Int iIndex = SR_Formlist_Location_Windhelm.GetSize()
;	While iIndex
;		iIndex -= 1
;		Location LocationCheck = SR_Formlist_Location_Windhelm.GetAt(iIndex) as Location
;		if LocationCheck
;			if LocationCheck == CurrentLocation
;				return true
;			else
;				return false ; <-- Remove this
;			endif
;		else
;			return false ; <-- Also remove this
;		endIf
;	EndWhile
;	
;	; Return False here
;EndFunction