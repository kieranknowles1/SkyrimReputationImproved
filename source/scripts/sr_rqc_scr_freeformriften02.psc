Scriptname SR_RQC_SCR_FreeformRiften02 extends Quest  
{This script adds the reputation contribution for the completed quest}

Quest Property FreeformRiften02 Auto; The Lover's Requital
SR_RQC_SCR Property SR_RQC_QST Auto

; Tweaks - Fixex not betraying Lynly increasing crime and ambition

; Player killed Lynly
GlobalVariable Property FFRiften02LynlyDead Auto

; Player sided with Lynly
GlobalVariable Property FFRiften02LynlyFriend Auto

Event OnInit()
	RegisterForSingleUpdateGameTime(Utility.RandomFloat(2.0, 4.0))
EndEvent

auto State FreeformRiften02QuestUnchecked; The quest will be continually checked on UpdateGameTime
	Event OnUpdateGameTime()
		if (FreeformRiften02.IsStageDone(200))
			Bool lynlyDead = FFRiften02LynlyDead.GetValue()
			Bool lynlyFriend = FFRiften02LynlyFriend.GetValue()
			
			If lynlyDead
				SR_RQC_QST.IncrementQuestCrime(5)
				SR_RQC_QST.IncrementQuestAmbition(5)
				debug.trace ("Skyrim Reputation marked quest FreeformRiften02 as completed, you killed Lynly, you monster!")
				gotoState("FreeformRiften02QuestChecked")
			ElseIf !lynlyFriend
				SR_RQC_QST.IncrementQuestCrime(3)
				SR_RQC_QST.IncrementQuestAmbition(3)
				Debug.Trace("Skyrim Reputation marked quest FreeformRiften02 as completed, you betrayed Lynly, you monster!")
				gotoState("FreeformRiften02QuestChecked")
			Else
				SR_RQC_QST.IncrementQuestLaw(1)
				SR_RQC_QST.IncrementQuestDependability(1)
				Debug.Trace("Skyrim Reputation marked quest FreeformRiften02 as completed, you lied to Sibbi, good.")
				gotoState("FreeformRiften02QuestChecked")
			EndIf
		else
			RegisterForSingleUpdateGameTime(Utility.RandomFloat(2.0, 4.0))
		endIf
	EndEvent
EndState

State FreeformRiften02QuestChecked; The quest was checked as completed and contibuted its reputation points
; Do nothing here
EndState