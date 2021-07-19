Scriptname SR_RQC_SCR_DBDestroy extends Quest  
{This script adds the reputation contribution for the completed quest}

Quest Property DBDestroy Auto; Destroy the Dark Brotherhood!
SR_RQC_SCR Property SR_RQC_QST Auto

Event OnInit()
	RegisterForSingleUpdateGameTime(1)
EndEvent

auto State DBDestroyQuestUnchecked; The quest will be continually checked on UpdateGameTime
	Event OnUpdateGameTime()
		; Tweaks - fix incorrect increment
		; Int DarkBrotherhoodQuests = SR_RQC_QST.DarkBrotherhoodScore()
		if (DBDestroy.IsStageDone(200))
			SR_RQC_QST.IncrementQuestFame(5)
			SR_RQC_QST.IncrementQuestLaw(5)
			SR_RQC_QST.IncrementQuestDependability(5)
			;SR_RQC_QST.IncrementDiscountedDarkBrotherhoodQuests(DarkBrotherhoodQuests)
			SR_RQC_QST.IncrementDiscountedDarkBrotherhoodQuests(1)
			debug.trace ("Skyrim Reputation marked quest DBDestroy as completed")
			gotoState("DBDestroyQuestChecked")
		else
			RegisterForSingleUpdateGameTime(1)
		endIf
	EndEvent
EndState

State DBDestroyQuestChecked; The quest was checked as completed and contibuted its reputation points
; Do nothing here
EndState