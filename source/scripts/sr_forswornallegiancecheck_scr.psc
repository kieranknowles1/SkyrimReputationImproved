Scriptname SR_ForswornAllegianceCheck_Scr extends Quest  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;ACTOR PROPERTIES
Actor Property PlayerRef auto
Actor Property MadanachREF auto

;FACTION PROPERTIES
Faction Property ForswornFaction auto
Faction Property ForswornDogFaction auto
Faction Property DruadachRedoubtFaction auto
Faction Property PlayerFaction auto
Faction Property CurrentFollowerFaction auto
Faction Property CurrentHireling auto
Faction Property PlayerHorseFaction auto

;GLOBAL PROPERTIES
GlobalVariable property SR_FactionAuras_Forsworn_TempEnemy auto
GlobalVariable property SR_FactionAuras_Forsworn_Area auto
GlobalVariable property SR_FactionAuras_Forsworn_HagravenArea auto
GlobalVariable Property SR_FactionAuras_Forsworn_MS02completed Auto
GlobalVariable property SR_FactionAuras_Forsworn auto
GlobalVariable Property SR_MCM_Factions_Forsworn auto
GlobalVariable Property SR_MS02ForswornLetterRecievedBool auto
GlobalVariable Property SR_MS02ForswornKilllCount auto
GlobalVariable Property SR_MS02CompletedTimeStamp auto
GlobalVariable Property GameDaysPassed Auto

;QUEST PROPERTIES
Quest Property MS02 Auto; No One Escapes Cidhna Mine
Quest Property DGIntimidateQuest Auto

Quest Property SR_Factions_Response_Forsworn_Quest_DA10 Auto
Quest Property SR_Factions_Response_Forsworn_Quest_Melka Auto
Quest Property SR_Factions_Response_Forsworn_Quest_RedEagle Auto
Quest Property SR_Factions_Response_Forsworn_Quest_T01 Auto
Quest Property SR_Factions_Response_Forsworn_AliasSet1 Auto
Quest Property SR_Factions_Response_Forsworn_AliasSet2 Auto

;SCRIPT PROPERTIES
SR_RQC_SCR Property SR_RQC_QST auto

;SPELL PROPERTIES
Spell Property SR_Factions_ForswornAura_Menu auto
Spell property SR_Factions_ForswornAllegiance_PerkAbility auto

;OTHER PROPERTIES
Int Property ForswornEnemyThreshold = 5 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; OnInit() is sent whenever the quest starts AND when starting a new game

;Event OnInit()
Event OnStoryChangeLocation(ObjectReference akActor, Location akOldLocation, Location akNewLocation)
	RegisterForSingleUpdateGameTime(0.1)
EndEvent

auto State ForswornReactionCriteriaCheck
	Event OnUpdateGameTime()
		if(ForswornReactionCriteriaMet() == true)
			if(ForswornDelayDone() == true)
				RegisterForSingleUpdateGameTime(0.1)
				gotoState("ForswornAllyCheck")
			else
				RegisterForSingleUpdateGameTime(1.0)
			endif
		else
			Stop()
		endif
	EndEvent
EndState

State ForswornAllyCheck
	Event OnUpdateGameTime()
		if(SR_MCM_Factions_Forsworn.GetValue() == 1)
			SetForswornAlly()
			RegisterForSingleUpdateGameTime(Utility.RandomFloat(5.0, 6.0))
		else
			Stop()
		endif
	EndEvent
EndState

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetForswornAlly()
	if (PlayerIsForswornAlly() == true)
		SetForswornAllyReactions()
		AddForswornSpells()
		SR_FactionAuras_Forsworn.SetValue(1)
		;Debug.trace ("SR_Forsworn Ally set aura as active")
	else
		SetForswornEnemyReactions()
		RemoveForswornSpells()
		SR_FactionAuras_Forsworn.SetValue(0)
		;Debug.trace ("SR_Forsworn Enemy set aura as inactive")
	endif
EndFunction

bool Function PlayerIsForswornAlly()
	bool MadanachDead = MadanachREF.IsDead() as bool
	Int ForswornKills		= ForswornKillCheck()
	Int ForswornQuestEnemy	= SR_RQC_QST.ForswornQuestEnemy as Int
	Int ForswornAllyCheck 	= ForswornKills+ForswornQuestEnemy
	if (MadanachDead == false)
		if(ForswornAllyCheck < ForswornEnemyThreshold)
			Return True
		else
			Return False
		endif
	else
		Return False
	endif
EndFunction

Int Function ForswornKillCheck()
	Int ForswornKills		= SR_RQC_QST.KillsForsworn as Int
	Int ForswornKillStore	= SR_MS02ForswornKilllCount.GetValue() as Int
	Int ForswornKillsNew	= ForswornKills - ForswornKillStore
	if(ForswornKillsNew >= 20)
		Return 5
	elseif(ForswornKillsNew >= 16)
		Return 4
	elseif(ForswornKillsNew >= 12)
		Return 3
	elseif(ForswornKillsNew >= 8)
		Return 2
	elseif(ForswornKillsNew >= 4)
		Return 1
	else
		Return 0
	endif
EndFunction

Function SetForswornAllyReactions()
	if(SR_FactionAuras_Forsworn_TempEnemy.GetValue() == 0)
	;ForswornFaction
		ForswornFaction.SetPlayerEnemy(false)
		ForswornFaction.SetAlly(PlayerFaction)
		ForswornFaction.SetAlly(PlayerHorseFaction, true, true)
		ForswornFaction.SetAlly(CurrentFollowerFaction, true, true)
		ForswornFaction.SetAlly(CurrentHireling, true, true)
	;ForswornDogFaction
		ForswornDogFaction.SetPlayerEnemy(false)
		ForswornDogFaction.SetAlly(PlayerHorseFaction, true, true)
		ForswornDogFaction.SetAlly(CurrentFollowerFaction, true, true)
		ForswornDogFaction.SetAlly(CurrentHireling, true, true)
	;DruadachRedoubtFaction
		DruadachRedoubtFaction.SetPlayerEnemy(false)
		DruadachRedoubtFaction.SetAlly(PlayerFaction)
		DruadachRedoubtFaction.SetAlly(PlayerHorseFaction, true, true)
		DruadachRedoubtFaction.SetAlly(CurrentFollowerFaction, true, true)
		DruadachRedoubtFaction.SetAlly(CurrentHireling, true, true)
	;message
		;Debug.trace ("SR_Forsworn SetForswornAllyReactions triggered")
	endif
EndFunction

Function SetForswornEnemyReactions()
	;ForswornFaction
		ForswornFaction.SetPlayerEnemy()
		ForswornFaction.SetEnemy(PlayerFaction)
		ForswornFaction.SetEnemy(PlayerHorseFaction)
		ForswornFaction.SetEnemy(CurrentFollowerFaction)
		ForswornFaction.SetEnemy(CurrentHireling)
	;ForswornDogFaction
		ForswornDogFaction.SetPlayerEnemy()
		ForswornDogFaction.SetEnemy(PlayerHorseFaction)
		ForswornDogFaction.SetEnemy(CurrentFollowerFaction)
		ForswornDogFaction.SetEnemy(CurrentHireling)
	;DruadachRedoubtFaction
		DruadachRedoubtFaction.SetPlayerEnemy()
		DruadachRedoubtFaction.SetEnemy(PlayerFaction)
		DruadachRedoubtFaction.SetEnemy(PlayerHorseFaction)
		DruadachRedoubtFaction.SetEnemy(CurrentFollowerFaction)
		DruadachRedoubtFaction.SetEnemy(CurrentHireling)
	;message
		;Debug.trace ("SR_Forsworn SetForswornEnemyReactions triggered")
EndFunction

Function ResetForswornReactions()
		ResetFactionReactions()
		ResetForswornGlobals()
		StopForswornQuests()
		RemoveForswornSpells()
EndFunction

Function ResetFactionReactions()
	;ForswornFaction
		ForswornFaction.SetPlayerEnemy()
		ForswornFaction.SetEnemy(PlayerFaction, true, true)
		ForswornFaction.SetEnemy(PlayerHorseFaction, true, true)
		ForswornFaction.SetEnemy(CurrentFollowerFaction, true, true)
		ForswornFaction.SetEnemy(CurrentHireling, true, true)
	;ForswornDogFaction
		ForswornDogFaction.SetPlayerEnemy()
		ForswornDogFaction.SetEnemy(PlayerHorseFaction, true, true)
		ForswornDogFaction.SetEnemy(CurrentFollowerFaction, true, true)
		ForswornDogFaction.SetEnemy(CurrentHireling, true, true)
	;DruadachRedoubtFaction
		if(MS02.IsStageDone(100) == true)
			DruadachRedoubtFaction.SetPlayerEnemy(false)
			DruadachRedoubtFaction.SetAlly(PlayerFaction)
		else
			DruadachRedoubtFaction.SetPlayerEnemy()
			DruadachRedoubtFaction.SetEnemy(PlayerFaction, true, true)
		endif
		DruadachRedoubtFaction.SetEnemy(PlayerHorseFaction, true, true)
		DruadachRedoubtFaction.SetEnemy(CurrentFollowerFaction, true, true)
		DruadachRedoubtFaction.SetEnemy(CurrentHireling, true, true)
EndFunction

Function StopForswornQuests()
	SR_Factions_Response_Forsworn_Quest_DA10.Stop()
	SR_Factions_Response_Forsworn_Quest_Melka.Stop()
	SR_Factions_Response_Forsworn_Quest_RedEagle.Stop()
	SR_Factions_Response_Forsworn_Quest_T01.Stop()
	SR_Factions_Response_Forsworn_AliasSet1.Stop()
	SR_Factions_Response_Forsworn_AliasSet2.Stop()
EndFunction

Function ResetForswornGlobals()
	SR_FactionAuras_Forsworn.SetValue(0)
	SR_FactionAuras_Forsworn_TempEnemy.SetValue(0)
	SR_FactionAuras_Forsworn_Area.SetValue(0)
	SR_FactionAuras_Forsworn_HagravenArea.SetValue(0)
EndFunction

Function AddForswornSpells()
	if(DGIntimidateQuest.IsRunning() == false)
		if (PlayerRef.HasSpell(SR_Factions_ForswornAura_Menu) == false)
			PlayerRef.AddSpell(SR_Factions_ForswornAura_Menu, false)
		endif
		
		if (PlayerRef.HasSpell(SR_Factions_ForswornAllegiance_PerkAbility) == false)
			PlayerRef.AddSpell(SR_Factions_ForswornAllegiance_PerkAbility, false)
		endif
	endif
EndFunction

Function RemoveForswornSpells()
	if (PlayerRef.HasSpell(SR_Factions_ForswornAura_Menu) == true)
		PlayerRef.RemoveSpell(SR_Factions_ForswornAura_Menu)
		endif
	if (PlayerRef.HasSpell(SR_Factions_ForswornAllegiance_PerkAbility) == true)
		PlayerRef.RemoveSpell(SR_Factions_ForswornAllegiance_PerkAbility)
		endif
EndFunction

Function SetForswornTempEnemy()
	; The Cidhna Mine hostility bug seems to be caused by this being called without being a forsworn ally
	; This leaves the player as an enemy of DruadachRedoubtFaction, of which the cidhna mine prisoners are members of
	; MS02 adds the player as a member of DruadachRedoubtFaction

	If MS02.IsStageDone(100)
		SR_FactionAuras_Forsworn_TempEnemy.SetValue(1)
		SetForswornEnemyReactions()
		;Debug.Trace("SR_Forsworn Temp-enemy function triggered")
	Else
		Debug.TraceStack("SR_Forsworn Temp-enemy triggered without completing MS02")
	EndIf
EndFunction

bool Function ForswornReactionCriteriaMet()
	bool MS02Madanach = MS02.IsStageDone(100) as bool
	int MCMbool = SR_MCM_Factions_Forsworn.GetValue() as int
	int MS02RegCompleted = SR_FactionAuras_Forsworn_MS02completed.GetValue() as int
	if(MCMbool == 1) && (MS02Madanach == true) && (MS02RegCompleted == 1)
		Return True
	else
		Return False
	endif
EndFunction

bool Function ForswornDelayDone()
	int MS02LetterRecieved = SR_MS02ForswornLetterRecievedBool.GetValue() as int
	float MS02Completed = SR_MS02CompletedTimeStamp.GetValue()
	float DaysPassed = GameDaysPassed.GetValue()
	if(MS02LetterRecieved == 1)
		Return True
	elseif(DaysPassed >= (MS02Completed + 0.5))
		Return True
	else
		Return False
	endif
EndFunction

Function SetForswornEnemyThreshold(int NewValue)
	ForswornEnemyThreshold = NewValue
EndFunction
