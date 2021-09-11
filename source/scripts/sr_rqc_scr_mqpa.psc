Scriptname SR_RQC_SCR_MQPa extends Quest  
{This script adds the reputation contribution for the completed quest}

Quest Property MQPaarthurnax Auto; Kill Paarthurnax (optional)
SR_RQC_SCR Property SR_RQC_QST Auto

Actor Property PaarthurnaxRef Auto

Event OnInit()
	RegisterForSingleUpdateGameTime(Utility.RandomFloat(2.0, 4.0))
EndEvent

auto State MQPaQuestUnchecked; The quest will be continually checked on UpdateGameTime
	Event OnUpdateGameTime()
		; Paarthurnax alternative mods (confirmed with Paarthurnax quest expansion and should apply to The Paarthurnax Dilemma)
		; may reuse stage 100, so give reputation when Paarthurnax dies instead of at stage 100
		;if (MQPaarthurnax.IsStageDone(100))
		If PaarthurnaxRef.IsDead()
			SR_RQC_QST.IncrementQuestAmbition(5)
			SR_RQC_QST.IncrementQuestLaw(2)
			;debug.trace ("Skyrim Reputation marked quest MQPaarthurnax as completed")
			Debug.Trace("Skyrim Reputation marked Paarthurnax as dead")
			gotoState("MQPaQuestChecked")
		;ElseIf MQPaarthurnax.IsCompleted() ; Treating this the same as never completing the quest
		
		else
			RegisterForSingleUpdateGameTime(Utility.RandomFloat(2.0, 4.0))
		endIf
	EndEvent
EndState

State MQPaQuestChecked; The quest was checked as completed and contibuted its reputation points
; Do nothing here
EndState