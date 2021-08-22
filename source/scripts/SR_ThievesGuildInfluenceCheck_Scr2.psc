Scriptname SR_ThievesGuildInfluenceCheck_Scr2 extends Quest  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Location Property MarkarthLocation Auto
Location Property RiftenLocation Auto
Location Property SolitudeLocation Auto
Location Property WhiterunLocation Auto
Location Property WindhelmLocation Auto

;FORMLIST PROPERTIES
;FormList Property SR_Formlist_Location_Markarth auto
;FormList Property SR_Formlist_Location_Riften auto
;FormList Property SR_Formlist_Location_Solitude auto
;FormList Property SR_Formlist_Location_Whiterun auto
;FormList Property SR_Formlist_Location_Windhelm auto

;GLOBAL PROPERTIES
GlobalVariable property SR_Global_ThievesGuildHasInfluence auto
GlobalVariable Property SR_MCM_Factions_TG_InfluenceWindhelm Auto; Summerset Shadows (Windhelm) 200
GlobalVariable Property SR_MCM_Factions_TG_InfluenceSolitude Auto; The Dainty Sload (Solitude) 200
GlobalVariable Property SR_MCM_Factions_TG_InfluenceMarkarth Auto; Silver Lining (Markarth) 200
GlobalVariable Property SR_MCM_Factions_TG_InfluenceWhiterun Auto; Imitation Amnesty (Whiterun) 200
GlobalVariable Property SR_MCM_Factions_TG_InfluenceRiften Auto; Under New Management (Riften) 200

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnUpdate()
	if(ThievesGuildInfluenceCheck() == true)
		SR_Global_ThievesGuildHasInfluence.SetValue(1)
		;debug.trace ("SR_ThaneCheck marked player as thane in current location")
	else
		SR_Global_ThievesGuildHasInfluence.SetValue(0)
	endif
	Stop()
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Bool Function ThievesGuildInfluenceCheck()
	Actor playerRef = Game.GetPlayer()

	;Location CurrentLocation = Game.GetPlayer().GetCurrentLocation()
	;bool PlayerInWindhelm 	= LocationCheckEastmarch(CurrentLocation)
	;bool PlayerInMarkarth	= LocationCheckReach(CurrentLocation)
	;bool PlayerInRiften		= LocationCheckRift(CurrentLocation)
	;bool PlayerInSolitude 	= LocationCheckHaafingar(CurrentLocation)
	;bool PlayerInWhiterun 	= LocationCheckWhiterun(CurrentLocation)
	if(playerRef.IsInLocation(MarkarthLocation))
		if(SR_MCM_Factions_TG_InfluenceMarkarth.GetValue() == 1); Thieves Guild Infuence the Reach (Markarth)
			Return true
		else
			Return false
		endif
	elseif(playerRef.IsInLocation(RiftenLocation))
		if(SR_MCM_Factions_TG_InfluenceRiften.GetValue() == 1); Thieves Guild Infuence the Rift (Riften)
			Return true
		else
			Return false
		endif
	elseif(playerRef.IsInLocation(SolitudeLocation))
		if(SR_MCM_Factions_TG_InfluenceSolitude.GetValue() == 1); Thieves Guild Infuence Haafingar (Solitude)
			Return true
		else
			Return false
		endif
	elseif(playerRef.IsInLocation(WindhelmLocation))
		if(SR_MCM_Factions_TG_InfluenceWindhelm.GetValue() == 1); Thieves Guild Infuence Eastmarch (Windhelm)
			Return true
		else
			Return false
		endif
	elseif(playerRef.IsInLocation(WhiterunLocation))
		if(SR_MCM_Factions_TG_InfluenceWhiterun.GetValue() == 1); Thieves Guild Infuence Whiterun
			Return true
		else
			Return false
		endif
	else
		Return false
	endif
EndFunction