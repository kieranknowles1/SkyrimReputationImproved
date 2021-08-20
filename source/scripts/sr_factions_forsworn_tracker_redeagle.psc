Scriptname SR_Factions_Forsworn_Tracker_RedEagle extends Quest  
; See DA10 tracker for information on changes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Actor Property PlayerRef Auto
GlobalVariable Property SR_FactionAuras_Forsworn_ReactionTheft  Auto
SR_ForswornAllegianceCheck_Scr Property SR_Factions_Response_Forsworn Auto
Quest Property SR_Factions_Response_Forsworn_Hostile Auto
Quest Property dunRebelsCairnQST Auto; Rebel's Cairn

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
		if(dunRebelsCairnQST.GetStageDone(30) == false)
			if(dunRebelsCairnQST.GetStage() > 20)
				SR_FactionAuras_Forsworn_ReactionTheft.SetValue(1)
				SR_Factions_Response_Forsworn_Hostile.Start()
				SR_Factions_Response_Forsworn.SetForswornTempEnemy()
				gotoState("QuestChecked")
			else
				RegisterForSingleUpdate(3)
			endif
		else
			gotoState("QuestChecked")
		endif
	EndEvent
EndState

State QuestChecked
; Do nothing here
EndState
