Scriptname SR_Factions_Dragonborn_Scr2 extends Quest  
{This script makes some of the thalmor factions a player enemy}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GlobalVariable Property SRTThalmorKillMult Auto
GlobalVariable Property SRTThalmorQuestMult Auto

;Quests
;Quest Property MS09 Auto

;Factions
Faction Property MarkarthThalmorFaction Auto
Faction Property WEThalmorFaction Auto
Faction Property MS09NorthwatchFaction Auto

;Globals
GlobalVariable Property SR_MCM_Factions_Thalmor Auto
GlobalVariable Property SR_Global_PlayerIsThalmorEnemy Auto

;Scripts
SR_RQC_SCR Property SR_RQC_QST Auto

Int Property ThalmorEnemyThreshold = 5 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;EVENT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	if(SR_MCM_Factions_Thalmor.GetValue() == 1)
		if(ThalmorEmemyCheck() == true)
			SetThalmorEnemyFactions()
		else
			ResetThalmorEnemyFactions()
		endif
	endif
	Stop()
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetThalmorEnemyFactions()
		MarkarthThalmorFaction.SetPlayerEnemy()
		WEThalmorFaction.SetPlayerEnemy()
		MS09NorthwatchFaction.SetPlayerEnemy()
		SR_Global_PlayerIsThalmorEnemy.SetValue(1)
		;debug.trace ("Faction reactions for Dragonborn set")
EndFunction

Function ResetThalmorEnemyFactions()
		; Tweaks - Remove this, MCM option doesn't work otherwise
;		If(MS09.IsStageDone(110) == false)
			WEThalmorFaction.SetPlayerEnemy(false)
;		EndIf
		MarkarthThalmorFaction.SetPlayerEnemy(false)
		MS09NorthwatchFaction.SetPlayerEnemy(false)
		SR_Global_PlayerIsThalmorEnemy.SetValue(0)
		;debug.trace ("Faction reactions for Thalmor are reset")
EndFunction

bool Function ThalmorEmemyCheck()
	; Rewritten to use floats and added quest enemy mult
	Float killScore = ThalmorKillCheck()
	Float questScore = (SR_RQC_QST.ThalmorQuestEnemy As Float) * SRTThalmorQuestMult.GetValue()
	
	Float totalScore = killScore + questScore

	Return totalScore > ThalmorEnemyThreshold
EndFunction

Float Function ThalmorKillCheck()
	Int kills = SR_RQC_QST.KillsThalmor as Int
	
	Return (kills As Float) * SRTThalmorKillMult.GetValue()
EndFunction

Function SetThalmorEnemyThreshold(int NewValue)
	ThalmorEnemyThreshold = NewValue
EndFunction
