Scriptname SR_Factions_Forsworn_Tracker_Melka extends Quest  
; See DA10 tracker for information on changes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SR_ForswornAllegianceCheck_Scr Property SR_Factions_Response_Forsworn Auto 
Quest Property dunBlindCliffQST Auto; The Affairs of Hagravens

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
		if(dunBlindCliffQST.GetStageDone(100) == false)
			if(dunBlindCliffQST.GetStage() > 15)
				SR_Factions_Response_Forsworn.SetForswornTempEnemy()
				Debug.trace ("SR_Forsworn Melka tracker set faction enemy")
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