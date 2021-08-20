Scriptname SR_Factions_Forsworn_Tracker_DA10 extends Quest  

; The SR_Factions_Forsworn_Tracker scripts are only supposed to run after MS02 stage 100 (Madanach escapes)
; Due to a misunderstanding of OnInit, which runs when the quest starts AND on new game, these scripts run before MS02
; Changes -
; Changed OnInit to OnStoryChangeLocation, which is only sent when the quest starts
; Added an IsRunning check to clear registrations on existing saves


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Actor Property PlayerRef Auto
SR_ForswornAllegianceCheck_Scr Property SR_Factions_Response_Forsworn Auto
GlobalVariable Property SR_FactionAuras_Forsworn_ReactionTheft  Auto
Quest Property SR_Factions_Response_Forsworn_Hostile Auto
Quest Property DA10 Auto; The House of Horrors

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;EVENT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Event OnInit()
Event OnStoryChangeLocation(ObjectReference akActor, Location akOldLocation, Location akNewLocation)
	RegisterForSingleUpdate(3)
EndEvent

auto State QuestUnchecked
	Event OnUpdate()
		If !IsRunning()
			Debug.Trace("Cleared update registration on " + self As String)
			UnregisterForUpdate()
			Return
		EndIf

		if(DA10.GetStageDone(200) == false)
			if(DA10.GetStage() > 80)
				SR_FactionAuras_Forsworn_ReactionTheft.SetValue(1)
				SR_Factions_Response_Forsworn_Hostile.Start()
				SR_Factions_Response_Forsworn.SetForswornTempEnemy()
				gotoState("QuestChecked")
			else
				RegisterForSingleUpdate(3)
			endif
		else
			Stop()
			gotoState("QuestChecked")
		endif
	EndEvent
EndState

State QuestChecked
; Do nothing here
EndState