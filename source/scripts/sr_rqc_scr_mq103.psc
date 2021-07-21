Scriptname SR_RQC_SCR_MQ103 extends Quest  
{This script adds your reputation contribution for the completed quest}

Quest Property MQ103 Auto; Bleak Falls Barrow
SR_RQC_SCR Property SR_RQC_QST Auto

GlobalVariable Property SR_PluginEnabled_SkyrimUnbound Auto

Event OnInit()
	RegisterForSingleUpdateGameTime(Utility.RandomFloat(2.0, 4.0))
EndEvent

auto State MQ103QuestUnchecked; The quest will be continually checked on UpdateGameTime
	Event OnUpdateGameTime()
		if (MQ103.IsStageDone(190))
			If SR_PluginEnabled_SkyrimUnbound.GetValue() == 0.0
				SR_RQC_QST.IncrementQuestDependability(1)
				debug.trace ("Skyrim Reputation marked quest MQ103 as completed")
			Else
				Debug.Trace("Skyrim reputation marked quest MQ103 as skipped (skyrim unbound")
			EndIf
			gotoState("MQ103QuestChecked")
		else
			RegisterForSingleUpdateGameTime(Utility.RandomFloat(2.0, 4.0))
		endIf
	EndEvent
EndState

State MQ103QuestChecked; The quest was checked as completed and contibuted its reputation points
; Do nothing here
EndState