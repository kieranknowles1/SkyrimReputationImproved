Scriptname SR_RQC_SCR_MQ104 extends Quest  
{This script adds the reputation contribution for the completed quest}

Quest Property MQ104 Auto; Dragon Rising
GlobalVariable property SR_MCM_Factions_Thane_Whiterun auto
GlobalVariable Property SR_PluginEnabled_SkyrimUnbound Auto
SR_RQC_SCR Property SR_RQC_QST Auto

Event OnInit()
	RegisterForSingleUpdateGameTime(Utility.RandomFloat(2.0, 4.0))
EndEvent

auto State MQ104QuestUnchecked; The quest will be continually checked on UpdateGameTime
	Event OnUpdateGameTime()
		if (MQ104.IsStageDone(160))
			; Remove all reputation when using skyirm unbound, as this quest is skipped entirely
			If SR_PluginEnabled_SkyrimUnbound.GetValue() == 0
				SR_RQC_QST.IncrementQuestFame(3)
				SR_RQC_QST.IncrementQuestAedric(1)
				SR_RQC_QST.IncrementQuestDependability(2)
;				if(SR_PluginEnabled_SkyrimUnbound.GetValue() == 0)
				SR_MCM_Factions_Thane_Whiterun.SetValue(1)
;				endif
				debug.trace ("Skyrim Reputation marked quest MQ104 as completed")
			Else
				Debug.Trace("Skyrim Reputation marked quest MQ104 as skipped (skyrim unbound")
			EndIf
			gotoState("MQ104QuestChecked")
		else
			RegisterForSingleUpdateGameTime(Utility.RandomFloat(2.0, 4.0))
		endIf
	EndEvent
EndState

State MQ104QuestChecked; The quest was checked as completed and contibuted its reputation points
; Do nothing here
EndState