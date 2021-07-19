Scriptname SR_LocationSideQuestDoneQst_Scr2 extends Quest  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Tweaks - Same as thane check
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
GlobalVariable property SR_Global_LocalSideQuestFame auto
GlobalVariable property SR_MCM_Factions_LocalQuest_Eastmarch auto
GlobalVariable property SR_MCM_Factions_LocalQuest_Haafingar auto
GlobalVariable property SR_MCM_Factions_LocalQuest_Hjaalmarch auto
GlobalVariable property SR_MCM_Factions_LocalQuest_Pale auto
GlobalVariable property SR_MCM_Factions_LocalQuest_Reach auto
GlobalVariable property SR_MCM_Factions_LocalQuest_Rift auto
GlobalVariable property SR_MCM_Factions_LocalQuest_Falkreath auto
GlobalVariable property SR_MCM_Factions_LocalQuest_Whiterun auto
GlobalVariable property SR_MCM_Factions_LocalQuest_Winterhold auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnUpdate()
	if(LocalSideQuestCheck() == true)
		SR_Global_LocalSideQuestFame.SetValue(1)
		;debug.trace ("SR_ThaneCheck marked player as thane in current location")
	else
		SR_Global_LocalSideQuestFame.SetValue(0)
	endif
	Stop()
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Bool Function LocalSideQuestCheck()
	Actor player = Game.GetPlayer()
	
	if(player.IsInLocation(DawnstarLocation))
		if(SR_MCM_Factions_LocalQuest_Pale.GetValue() == 1); Thane of the Pale (Dawnstar)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(MarkarthLocation))
		if(SR_MCM_Factions_LocalQuest_Reach.GetValue() == 1); Thane of the Reach (Markarth)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(RiftenLocation))
		if(SR_MCM_Factions_LocalQuest_Rift.GetValue() == 1); Thane of the Rift (Riften)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(FalkreathLocation))
		if(SR_MCM_Factions_LocalQuest_Falkreath.GetValue() == 1); Thane of Falkreath
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(SolitudeLocation))
		if(SR_MCM_Factions_LocalQuest_Haafingar.GetValue() == 1); Thane of Haafingar (Solitude)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(MorthalLocation))
		if(SR_MCM_Factions_LocalQuest_Hjaalmarch.GetValue() == 1); Thane of Hjaalmarch (Morthal)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(WinterholdLocation))
		if(SR_MCM_Factions_LocalQuest_Winterhold.GetValue() == 1); Thane of Winterhold
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(WindhelmLocation))
		if(SR_MCM_Factions_LocalQuest_Eastmarch.GetValue() == 1); Thane of Eastmarch (Windhelm)
			Return true
		else
			Return false
		endif
	elseif(player.IsInLocation(WhiterunLocation))
		if(SR_MCM_Factions_LocalQuest_Whiterun.GetValue() == 1); Thane of Whiterun
			Return true
		else
			Return false
		endif
	else
		Return false
	endif
EndFunction