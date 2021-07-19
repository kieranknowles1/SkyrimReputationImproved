Scriptname SR_RQC_REF_SCR extends ReferenceAlias  
{This script applies the Skyrim reputation based player abilities}

GlobalVariable Property SRTWearingGreyCowl1 Auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;FLOAT VARIABLE PROPERTIES
float property BanditKillsLvl1 = 0.15 auto
float property BanditKillsLvl2 = 0.30 auto
float property BanditKillsLvl3 = 0.60 auto

float property DragonKillsLvl1 = 0.20 auto
float property DragonKillsLvl2 = 0.40 auto
float property DragonKillsLvl3 = 0.60 auto

float property MageKillsLvl1 = 0.20 auto
float property MageKillsLvl2 = 0.35 auto
float property MageKillsLvl3 = 0.50 auto

float property AntiMageLvl1 = 20.0 auto
float property AntiMageLvl2 = 25.0 auto
float property AntiMageLvl3 = 35.0 auto

float property UndeadKillsLvl1 = 0.20 auto
float property UndeadKillsLvl2 = 0.40 auto
float property UndeadKillsLvl3 = 0.60 auto

float property MageLvl1 = 50.0 auto
float property MageLvl2 = 70.0 auto
float property MageLvl3 = 90.0 auto

float property WarriorLvl2 = 45.0 auto

float property NecromancyLvl1 = 0.05 auto
float property NecromancyLvl2 = 0.10 auto
float property NecromancyLvl3 = 0.20 auto

float property ConjurationSkillLvl1 = 50.0 auto
float property ConjurationSkillLvl2 = 70.0 auto
float property ConjurationSkillLvl3 = 90.0 auto

float property VampireLvl1 = 4.0 auto
float property VampireLvl2 = 6.0 auto
float property VampireLvl3 = 7.0 auto

float property WerewolfLvl1 = 4.0 auto
float property WerewolfLvl2 = 6.0 auto
float property WerewolfLvl3 = 7.0 auto

float property MurderLvl1 = 20.0 auto
float property MurderLvl2 = 40.0 auto
float property DarkBrotherhoodQuestLvl2 = 0.3 auto
float property DarkBrotherhoodQuestLvl3 = 0.5 auto

float property AssaultsLvl1 = 6.0 auto
float property AssaultsLvl2 = 12.0 auto

float property MurdersLvl1 = 4.0 auto
float property MurdersLvl2 = 8.0 auto

float property TheftLvl1 = 8.0 auto
float property TheftLvl2 = 16.0 auto

float property WitchHunterLvl1 = 0.20 auto

;INT VARIABLE PROPERTIES
int property DwemerExplorerLvl1 = 3 auto
int property GhostHunterLvl1 = 4 auto

int property ReputationStorage = 0 auto

;ACTOR PROPERTIES
Actor Property PlayerRef Auto
Actor Property MadanachREF Auto
Actor Property MS08KematuREF Auto
Actor Property StalleoREF Auto

;QUEST PROPERTIES
Quest Property DGIntimidateQuest Auto
Quest Property PlayerVampireQuest Auto
Quest Property DLC1VQ08 Auto; Kindred Judgment
Quest Property DLC2MQ06 Auto; At the Summit of Apocrypha
Quest Property CWObj Auto; Civil War: Reunification/Liberation of Skyrim
Quest Property MQ105Ustengrav Auto; The Horn of Jurgen Windcaller
Quest Property MQ305 Auto; Dragonslayer
Quest Property DA04 Auto
Quest Property C00 Auto
Quest Property C04 Auto
Quest Property C06 Auto
Quest Property MS04 Auto
Quest Property MS06 Auto
Quest Property MS08 Auto
Quest Property MS09 Auto
Quest Property MS11 Auto
Quest Property MS11b Auto
Quest Property MS14Q Auto
Quest Property MG06 Auto
Quest Property MG08 Auto
Quest Property TG01 Auto
Quest Property T03 Auto
Quest Property dunTrevasWatchQST Auto
Quest Property dunDarklightQST Auto
Quest Property dunNchuandZelQst Auto
Quest Property FreeformRiften01 Auto
Quest Property FreeformSkyhavenTempleA Auto
Quest Property MGRArniel01 Auto
Quest Property MGRArniel02 Auto
Quest Property MGRArniel03 Auto
Quest Property MGRArniel04 Auto
Quest Property DLC1LD Auto
Quest Property FreeformRiften09 Auto
Quest Property T02 Auto
Quest Property MG07 Auto
Quest Property DLC1VQSaint Auto
Quest Property dunBardsLeapSummitQST Auto
Quest Property FreeformRiften21 Auto
Quest Property dunForelhostQuest Auto
Quest Property dunAnsilvundQST Auto
Quest Property dunValthumeQST Auto
Quest Property FreeformOldHroldanB Auto
Quest Property dunHunterQST Auto

;SCRIPT PROPERTIES
SR_RQC_SCR Property SR_RQC_Script Auto

;MESSAGE PROPERTIES
Message Property SR_Message_Worshipped1  Auto
Message Property SR_Message_Worshipped2  Auto
Message Property SR_Message_Worshipped3  Auto
Message Property SR_Message_Feared1  Auto
Message Property SR_Message_Feared2  Auto
Message Property SR_Message_Feared3  Auto
Message Property SR_Message_Admired1  Auto
Message Property SR_Message_Admired2  Auto
Message Property SR_Message_Admired3  Auto
Message Property SR_Message_Hated1  Auto
Message Property SR_Message_Hated2  Auto
Message Property SR_Message_Hated3  Auto
Message Property SR_Message_Liked1  Auto
Message Property SR_Message_Liked2  Auto
Message Property SR_Message_Liked3  Auto
Message Property SR_Message_Disliked1  Auto
Message Property SR_Message_Disliked2  Auto
Message Property SR_Message_Disliked3  Auto
Message Property SR_Message_Neutral1  Auto
Message Property SR_Message_Neutral2  Auto
Message Property SR_Message_Neutral3  Auto
Message Property SR_Message_Unknown  Auto

;GLOBAL VARIABLE PROPERTIES
GlobalVariable Property SR_Global_Reputation Auto
GlobalVariable Property SR_MCM_Reputation_Message Auto
GlobalVariable Property SR_Global_LawCrime Auto
GlobalVariable Property SR_Global_AedricDaedric Auto
GlobalVariable Property SR_Global_DependabilityAmbition Auto
GlobalVariable property SR_Global_VampireSuspicion auto
GlobalVariable property SR_Global_WerewolfSuspicion auto
GlobalVariable Property SR_Global_PlayerIsThalmorEnemy Auto
GlobalVariable Property SR_FactionAuras_Forsworn Auto
GlobalVariable Property DLC1PlayingVampireLine Auto
GlobalVariable property SR_Global_ThaneInCurrentLocation auto
GlobalVariable Property SR_Global_LastBigQuestFinished auto
GlobalVariable Property SR_Global_LabelOverride_Hero auto
GlobalVariable Property SR_Global_LabelOverride_Feared auto
GlobalVariable Property SR_Global_LabelOverride_Admired auto
GlobalVariable Property SR_Global_LabelOverride_Hated auto
GlobalVariable Property SR_Global_LabelOverride_Liked auto
GlobalVariable Property SR_Global_LabelOverride_Disliked auto
GlobalVariable Property SR_Global_LabelOverride_Neutral auto
GlobalVariable Property SR_Global_LabelOverride_Newcomer auto

;REPUTATION CHANGE VISUAL EFFECT SPELL PROPERTIES
Spell Property SR_RQC_SPELL_REPCHG_BAD AutO
Spell Property SR_RQC_SPELL_REPCHG_GOOD Auto

;WORSHIPPED SPELL PROPERTIES
Spell Property SR_RQC_ABLT_WORSHIPPED0 Auto; Default Worshipped
Spell Property SR_RQC_ABLT_WORSHIPPED1 Auto; High Law
Spell Property SR_RQC_ABLT_WORSHIPPED2 Auto; High Aedric
Spell Property SR_RQC_ABLT_WORSHIPPED3 Auto; High Dependability
Spell Property SR_RQC_ABLT_WORSHIPPED4 Auto; High Law AND Aedric
Spell Property SR_RQC_ABLT_WORSHIPPED5 Auto; High Law AND Dependability
Spell Property SR_RQC_ABLT_WORSHIPPED6 Auto; High Aedric AND Dependability

;WORSHIPPED SPELL PROPERTIES - SPECIAL
Spell Property SR_RQC_ABLT_WORSHIPPED_BANDITKILL Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_CIVILWAR Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_DAWNGUARD Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_DRAGONKILL Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_DRAGONBORN Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_ALDUINKILL Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_MAGEKILL Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_UNDEADKILL Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_COMPANIONS Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_COW Auto
Spell Property SR_RQC_ABLT_WORSHIPPED_BLADES Auto

;FEARED SPELL PROPERTIES
Spell Property SR_RQC_ABLT_FEARED0 Auto; Default Feared
Spell Property SR_RQC_ABLT_FEARED1 Auto; High Crime
Spell Property SR_RQC_ABLT_FEARED2 Auto; High Daedric
Spell Property SR_RQC_ABLT_FEARED3 Auto; High Ambition
Spell Property SR_RQC_ABLT_FEARED4 Auto; High Crime AND Daedric
Spell Property SR_RQC_ABLT_FEARED5 Auto; High Crime AND Ambition
Spell Property SR_RQC_ABLT_FEARED6 Auto; High Daedric AND Ambition

;FEARED SPELL PROPERTIES - SPECIAL
Spell Property SR_RQC_ABLT_FEARED_ASSASSIN Auto
Spell Property SR_RQC_ABLT_FEARED_NECROMANCER Auto
Spell Property SR_RQC_ABLT_FEARED_VAMPIRE Auto
Spell Property SR_RQC_ABLT_FEARED_WEREWOLF Auto
Spell Property SR_RQC_ABLT_FEARED_DRAGONBORN Auto
Spell Property SR_RQC_ABLT_FEARED_CIVILWAR Auto
Spell Property SR_RQC_ABLT_FEARED_DAWNGUARD Auto
Spell Property SR_RQC_ABLT_FEARED_DRAGONKILL Auto
Spell Property SR_RQC_ABLT_FEARED_MAGE Auto

;ADMIRED SPELL PROPERTIES
Spell Property SR_RQC_ABLT_ADMIRED0 Auto; Default Admired
Spell Property SR_RQC_ABLT_ADMIRED1 Auto; High Law
Spell Property SR_RQC_ABLT_ADMIRED2 Auto; High Aedric
Spell Property SR_RQC_ABLT_ADMIRED3 Auto; High Dependability
Spell Property SR_RQC_ABLT_ADMIRED4 Auto; High Law AND Aedric
Spell Property SR_RQC_ABLT_ADMIRED5 Auto; High Law AND Dependability
Spell Property SR_RQC_ABLT_ADMIRED6 Auto; High Aedric AND Dependability

;ADMIRED SPELL PROPERTIES - SPECIAL
Spell Property SR_RQC_ABLT_ADMIRED_BANDITKILL Auto
Spell Property SR_RQC_ABLT_ADMIRED_BLADES Auto
Spell Property SR_RQC_ABLT_ADMIRED_COMPANIONS Auto
Spell Property SR_RQC_ABLT_ADMIRED_COW Auto
Spell Property SR_RQC_ABLT_ADMIRED_DRAGONKILL Auto
Spell Property SR_RQC_ABLT_ADMIRED_MAGEKILL Auto
Spell Property SR_RQC_ABLT_ADMIRED_UNDEADKILL Auto

;HATED SPELL PROPERTIES
Spell Property SR_RQC_ABLT_HATED0 Auto; Default Hated
Spell Property SR_RQC_ABLT_HATED1 Auto; High Crime
Spell Property SR_RQC_ABLT_HATED2 Auto; High Daedric
Spell Property SR_RQC_ABLT_HATED3 Auto; High Dependability
Spell Property SR_RQC_ABLT_HATED4 Auto; High High Crime AND Daedric
Spell Property SR_RQC_ABLT_HATED5 Auto; High Crime AND Daedric
Spell Property SR_RQC_ABLT_HATED6 Auto; High Daedric AND Ambition

;HATED SPELL PROPERTIES - SPECIAL
Spell Property SR_RQC_ABLT_HATED_ASSASSIN Auto
Spell Property SR_RQC_ABLT_HATED_CRIMEASSAULT Auto
Spell Property SR_RQC_ABLT_HATED_CRIMEMURDER Auto
Spell Property SR_RQC_ABLT_HATED_CRIMEPETTY Auto
Spell Property SR_RQC_ABLT_HATED_MAGE Auto
Spell Property SR_RQC_ABLT_HATED_NECROMANCER Auto
Spell Property SR_RQC_ABLT_HATED_VAMPIRE Auto
Spell Property SR_RQC_ABLT_HATED_WEREWOLF Auto

;LIKED SPELL PROPERTIES
Spell Property SR_RQC_ABLT_LIKED0 Auto; Default Liked
Spell Property SR_RQC_ABLT_LIKED1 Auto; High Law
Spell Property SR_RQC_ABLT_LIKED2 Auto; High Aedric
Spell Property SR_RQC_ABLT_LIKED3 Auto; High Dependability
Spell Property SR_RQC_ABLT_LIKED4 Auto; High Law AND Aedric
Spell Property SR_RQC_ABLT_LIKED5 Auto; High Law AND Dependability
Spell Property SR_RQC_ABLT_LIKED6 Auto; High Aedric AND Dependability

;LIKED SPELL PROPERTIES - SPECIAL
Spell Property SR_RQC_ABLT_LIKED_BANDITKILL Auto
Spell Property SR_RQC_ABLT_LIKED_DRAGONKILL Auto
Spell Property SR_RQC_ABLT_LIKED_MAGEKILL Auto
Spell Property SR_RQC_ABLT_LIKED_MS01 Auto
Spell Property SR_RQC_ABLT_LIKED_MS06 Auto
Spell Property SR_RQC_ABLT_LIKED_MS09 Auto
Spell Property SR_RQC_ABLT_LIKED_MS11 Auto
Spell Property SR_RQC_ABLT_LIKED_MS14 Auto
Spell Property SR_RQC_ABLT_LIKED_DWEMEREXPLORER Auto
Spell Property SR_RQC_ABLT_LIKED_RIFTENSKOOMA Auto
Spell Property SR_RQC_ABLT_LIKED_GHOSTHUNTER Auto
Spell Property SR_RQC_ABLT_LIKED_TREVASWATCH Auto
Spell Property SR_RQC_ABLT_LIKED_UNDEADKILL Auto
Spell Property SR_RQC_ABLT_LIKED_WITCHKILL Auto
Spell Property SR_RQC_ABLT_LIKED_COW Auto
Spell Property SR_RQC_ABLT_LIKED_BLADES Auto
Spell Property SR_RQC_ABLT_LIKED_COMPANIONS Auto

;DISLIKED SPELL PROPERTIES
Spell Property SR_RQC_ABLT_DISLIKED0 Auto; Default Disliked
Spell Property SR_RQC_ABLT_DISLIKED1 Auto; High Crime
Spell Property SR_RQC_ABLT_DISLIKED2 Auto; High Daedric
Spell Property SR_RQC_ABLT_DISLIKED3 Auto; High Ambition
Spell Property SR_RQC_ABLT_DISLIKED4 Auto; High Crime AND Daedric
Spell Property SR_RQC_ABLT_DISLIKED5 Auto; High Crime AND Ambition
Spell Property SR_RQC_ABLT_DISLIKED6 Auto; High Daedric AND Ambition

;DISLIKED SPELL PROPERTIES - SPECIAL
Spell Property SR_RQC_ABLT_DISLIKED_CRIMEASSAULT Auto
Spell Property SR_RQC_ABLT_DISLIKED_CRIMEMURDER Auto
Spell Property SR_RQC_ABLT_DISLIKED_CRIMEPETTY Auto
Spell Property SR_RQC_ABLT_DISLIKED_MAGE Auto
Spell Property SR_RQC_ABLT_DISLIKED_MS01 Auto
Spell Property SR_RQC_ABLT_DISLIKED_MS08 Auto
Spell Property SR_RQC_ABLT_DISLIKED_NECROMANCER Auto
Spell Property SR_RQC_ABLT_DISLIKED_TG01 Auto
Spell Property SR_RQC_ABLT_DISLIKED_VAMPIRE Auto
Spell Property SR_RQC_ABLT_DISLIKED_WEREWOLF Auto

;NEUTRAL SPELL PROPERTIES
Spell Property SR_RQC_ABLT_NEUTRAL0 Auto; Default Neutral
Spell Property SR_RQC_ABLT_NEUTRAL1 Auto; High Crime
Spell Property SR_RQC_ABLT_NEUTRAL2 Auto; High Daedric
Spell Property SR_RQC_ABLT_NEUTRAL3 Auto; High Ambition

;UNKNOWN SPELL PROPERTIES
Spell Property SR_RQC_ABLT_UNKNOWN00 Auto; Default Unknown
Spell Property SR_RQC_ABLT_UNKNOWN01 Auto; High Crime
Spell Property SR_RQC_ABLT_UNKNOWN02 Auto; High Daedric
Spell Property SR_RQC_ABLT_UNKNOWN03 Auto; High Ambition
Spell Property SR_RQC_ABLT_UNKNOWN04 Auto; High Law
Spell Property SR_RQC_ABLT_UNKNOWN05 Auto; High Aedric
Spell Property SR_RQC_ABLT_UNKNOWN06 Auto; High Dependability

;UNKNOWN RACE PROPERTIES
Spell Property SR_RQC_ABLT_UNKNOWN_OTHERRACE Auto; Default Unknown - ZERO FAME OTHER RACE
Spell Property SR_RQC_ABLT_UNKNOWN_ARGONIAN Auto; Default Unknown - ZERO FAME ARGONIAN
Spell Property SR_RQC_ABLT_UNKNOWN_BRETON Auto; Default Unknown - ZERO FAME BRETON
Spell Property SR_RQC_ABLT_UNKNOWN_KHAJIIT Auto; Default Unknown - ZERO FAME KHAJIIT
Spell Property SR_RQC_ABLT_UNKNOWN_HIGHELF Auto; Default Unknown - ZERO FAME HIGHELF
Spell Property SR_RQC_ABLT_UNKNOWN_NORD Auto; Default Unknown - ZERO FAME NORD
Spell Property SR_RQC_ABLT_UNKNOWN_ORC Auto; Default Unknown - ZERO FAME ORC
Spell Property SR_RQC_ABLT_UNKNOWN_WOODELF Auto; Default Unknown - ZERO FAME WOODELF
Spell Property SR_RQC_ABLT_UNKNOWN_DARKELF Auto; Default Unknown - ZERO FAME DARKELF
Spell Property SR_RQC_ABLT_UNKNOWN_IMPERIAL Auto; Default Unknown - ZERO FAME IMPERIAL
Spell Property SR_RQC_ABLT_UNKNOWN_REDGUARD Auto; Default Unknown - ZERO FAME REDGUARD

;THANE SPELL PROPERTIES
Spell Property SR_RQC_ABLT_THANE Auto

;RACE PROPERTIES
Race Property ArgonianRace  Auto  
Race Property BretonRace  Auto  
Race Property KhajiitRace  Auto  
Race Property HighElfRace  Auto  
Race Property NordRace  Auto  
Race Property OrcRace  Auto  
Race Property WoodElfRace  Auto  
Race Property DarkElfRace  Auto  
Race Property ImperialRace  Auto  
Race Property RedguardRace  Auto  
Race Property ArgonianRaceVampire  Auto  
Race Property KhajiitRaceVampire  Auto  
Race Property OrcRaceVampire  Auto  
Race Property DarkElfRaceVampire  Auto  
Race Property WoodElfRaceVampire  Auto  
Race Property HighElfRaceVampire  Auto  
Race Property ImperialRaceVampire  Auto  
Race Property BretonRaceVampire  Auto  
Race Property NordRaceVampire  Auto  
Race Property RedguardRaceVampire  Auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
	RegisterForSingleUpdateGameTime(Utility.RandomFloat(10.0, 12.0))
EndEvent

Event OnUpdateGameTime()
	;Debug.Trace ("SR_RQC_REF_SCR is active")
	CheckLabelToggles()
	Utility.Wait(3)
	
	if(DGIntimidateQuest.IsRunning() == false)
		SetReputationAbility()
		SendReputationMessage()
	endif
	
	RegisterForSingleUpdateGameTime(Utility.RandomFloat(10.0, 12.0))
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetReputationAbility()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	Int Reputation	 		= SR_Global_Reputation.GetValue() as int
	int LastBigQuest		= SR_Global_LastBigQuestFinished.GetValue() as int; 1=MainQuest, 2=CivilWar, 3=Dawnguard DLC, 4=Dragonborn DLC
	int OverrideHero		= SR_Global_LabelOverride_Hero.GetValue() as int;
	int OverrideFeared		= SR_Global_LabelOverride_Feared.GetValue() as int;
	int OverrideAdmired		= SR_Global_LabelOverride_Admired.GetValue() as int;
	int OverrideHated		= SR_Global_LabelOverride_Hated.GetValue() as int;
	int OverrideLiked		= SR_Global_LabelOverride_Liked.GetValue() as int;
	int OverrideDisliked	= SR_Global_LabelOverride_Disliked.GetValue() as int;
	int OverrideNeutral		= SR_Global_LabelOverride_Neutral.GetValue() as int;
	int OverrideNewcomer	= SR_Global_LabelOverride_Newcomer.GetValue() as int;
	If (Reputation == 8); Worshipped
		if(OverrideHero > 0);Label override
			SetHeroOverrideReputation()
		elseif(LastBigQuest > 0);Quest label override
			SetHeroQuestReputation()
		else
			SetHeroReputation()
		endif
	ElseIf (Reputation == 7); Feared
		if(OverrideFeared > 0);Label override
			SetFearedOverrideReputation()
		elseif(LastBigQuest > 0);Quest label override
			SetFearedQuestReputation()
		else
			SetFearedReputation()
		endif
	ElseIf (Reputation == 6); Admired	
		if(OverrideAdmired > 0);Label override
			SetAdmiredOverrideReputation()
		else
			SetAdmiredReputation()
		endif
	ElseIf (Reputation == 5); Hated
		if(OverrideHated > 0);Label override
			SetHatedOverrideReputation()
		else
			SetHatedReputation()
		endif
	ElseIf (Reputation == 4); Liked
		if(OverrideLiked > 0);Label override
			SetLikedOverrideReputation()
		else
			SetLikedReputation()
		endif
	ElseIf (Reputation == 3); Disliked
		if(OverrideDisliked > 0);Label override
			SetDislikedOverrideReputation()
		else
			SetDislikedReputation()
		endif
	ElseIf (Reputation == 2); Neutral
		if(OverrideNeutral > 0);Label override
			SetNeutralOverrideReputation()
		else
			SetNeutralReputation()
		endif
	ElseIf (Reputation == 1); Newcomer
		if(OverrideNewcomer > 0);Label override
			SetNewcomerOverrideReputation()
		else
			SetNewcomerReputation()
		endif
	Elseif(Reputation == 0); Unknown
		SetUnknownReputation()
	EndIf
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OVERRIDE REPUTATION LABEL SET FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetHeroOverrideReputation()
	int OverrideHero	= SR_Global_LabelOverride_Hero.GetValue() as int;
	int BanditKill3 	= LabelToggle_BanditKiller3
	int DragonKill3 	= LabelToggle_DragonKiller3
	int MageKill3 		= LabelToggle_MageKiller3
	int UndeadKill3 	= LabelToggle_UndeadKiller3
	int Blade 			= LabelToggle_Blade
	int Harbinger 		= LabelToggle_Harbinger
	int ArchMage 		= LabelToggle_ArchMage
	int Alduin 			= LabelToggle_AlduinKilled
	int CivilWar 		= LabelToggle_CivilWar
	int Dawnguard 		= LabelToggle_DawnguardLineDone
	int Dragonborn 		= LabelToggle_DragonbornDLC
	if(OverrideHero == 1);Justice
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED1, false)
	elseif(OverrideHero == 2);Sage
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED2, false)
	elseif(OverrideHero == 3);Savior
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED3, false)
	elseif(OverrideHero == 4);Ysmir
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED5, false)
	elseif((OverrideHero == 5) && (Harbinger == 1));Harbinger
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_COMPANIONS, false)
	elseif((OverrideHero == 6) && (ArchMage == 1));Arch Mage
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_COW, false)
	elseif((OverrideHero == 7) && (Blade == 1));Dragonborn
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_BLADES, false)
	elseif((OverrideHero == 8) && (BanditKill3 == 1));Avenger
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_BANDITKILL, false)
	elseif((OverrideHero == 9) && (DragonKill3 == 1));Dragon Warrior
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_DRAGONKILL, false)
	elseif((OverrideHero == 10) && (MageKill3 == 1));Anti-Mage
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_MAGEKILL, false)
	elseif((OverrideHero == 11) && (UndeadKill3 == 1));Undead Vanquisher
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_UNDEADKILL, false)
	elseif((OverrideHero == 12) && (Alduin == 1)); Alduin's bane
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_ALDUINKILL, false)
	elseif((OverrideHero == 13) && (CivilWar == 1)); Peace bringer
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_CIVILWAR, false)
	elseif((OverrideHero == 14) && (Dawnguard == 1)); Champion
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_DAWNGUARD, false)
	elseif((OverrideHero == 15) && (Dragonborn == 1)); Dragon Rider
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_DRAGONBORN, false)
	else
		SetHeroQuestReputation()
	endif
EndFunction

Function SetFearedOverrideReputation()
	int OverrideFeared	= SR_Global_LabelOverride_Feared.GetValue() as int;
	int DragonKill3 	= LabelToggle_DragonKiller3
	int EvilMage3 		= LabelToggle_EvilMage3
	int Necro3 			= LabelToggle_Necromancer3
	int Vampire3 		= LabelToggle_Vampire3
	int Werewolf3 		= LabelToggle_Werewolf3
	int Assassin2 		= LabelToggle_Assassin2
	int Alduin 			= LabelToggle_AlduinKilled
	int CivilWar 		= LabelToggle_CivilWar
	int Volkihar 		= LabelToggle_VolkiharLineDone
	int Dragonborn 		= LabelToggle_DragonbornDLC
	if(OverrideFeared == 1);Crime Lord
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED1, false)
	elseif(OverrideFeared == 2);Priest of Darkness
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED2, false)
	elseif(OverrideFeared == 3);Betrayer
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED3, false)
	elseif(OverrideFeared == 4);Destroyer
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED4, false)
	elseif(OverrideFeared == 5);Tyrant
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED5, false)
	elseif(OverrideFeared == 6);Death Bringer
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED6, false)
	elseif((OverrideFeared == 7) && (EvilMage3 == 1));Dread Mage
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_MAGE, false)
	elseif((OverrideFeared == 8) && (Necro3 == 1));Lich King
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_NECROMANCER, false)
	elseif((OverrideFeared == 9) && (Vampire3 == 1)); Undead Scourge
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_VAMPIRE, false)
	elseif((OverrideFeared == 10) && (Werewolf3 == 1));Dread Wolf
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_WEREWOLF, false)
	elseif((OverrideFeared == 11) && (Assassin2 == 1));Shadow hunter
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_ASSASSIN, false)
	elseif((OverrideFeared == 12) && ((Alduin == 1) || (DragonKill3 == 1)));Devourer
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONKILL, false)
	elseif((OverrideFeared == 13) && (CivilWar == 1)); Warmonger
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_CIVILWAR, false)
	elseif(((OverrideFeared == 14) && (Volkihar == 1)) && (Vampire3 == 1));Undead Lord
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DAWNGUARD, false)
	elseif((OverrideFeared == 15) && (Dragonborn == 1)); Dragon Master
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONBORN, false)
	else
		SetFearedQuestReputation()
	endif
EndFunction

Function SetAdmiredOverrideReputation()
	int OverrideAdmired	= SR_Global_LabelOverride_Admired.GetValue() as int;
	int BanditKill2 	= LabelToggle_BanditKiller2
	int DragonKill2 	= LabelToggle_DragonKiller2
	int MageKill2 		= LabelToggle_MageKiller2
	int UndeadKill2 	= LabelToggle_UndeadKiller2
	int Blade 			= LabelToggle_Blade
	int Harbinger 		= LabelToggle_Harbinger
	int ArchMage 		= LabelToggle_ArchMage
	if(OverrideAdmired == 1); Lawspeaker
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED1, false)
	elseif(OverrideAdmired == 2); Paladin
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED2, false)
	elseif(OverrideAdmired == 3); Ranger
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED3, false)
	elseif(OverrideAdmired == 4); Inquisitor
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED4, false)
	elseif(OverrideAdmired == 5); Defender
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED5, false)
	elseif(OverrideAdmired == 6); Skald
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED6, false)	
	elseif((OverrideAdmired == 7) && (Harbinger == 1));Harbinger
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_COMPANIONS, false)
	elseif((OverrideAdmired == 8) && (ArchMage == 1));Arch Mage
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_COW, false)
	elseif((OverrideAdmired == 9) && (Blade == 1));Master Blade
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_BLADES, false)
	elseif((OverrideAdmired == 10) && (BanditKill2 == 1));Executioner
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_BANDITKILL, false)
	elseif((OverrideAdmired == 11) && (DragonKill2 == 1));Dragon slayer
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_DRAGONKILL, false)
	elseif((OverrideAdmired == 12) && (MageKill2 == 1));Mage slayer
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_MAGEKILL, false)
	elseif((OverrideAdmired == 13) && (UndeadKill2 == 1));Undead slayer
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_UNDEADKILL, false)
	else
		SetAdmiredReputation()
	endif
EndFunction

Function SetHatedOverrideReputation()
	int OverrideHated	= SR_Global_LabelOverride_Hated.GetValue() as int;
	int EvilMage2 		= LabelToggle_EvilMage2
	int Necro2 			= LabelToggle_Necromancer2
	int Vampire2 		= LabelToggle_Vampire2
	int Werewolf2 		= LabelToggle_Werewolf2
	int Assassin1 		= LabelToggle_Assassin1
	int Theft2 			= LabelToggle_Theft2
	int Assault2 		= LabelToggle_Assaults2
	int Murder2 		= LabelToggle_Murders2
	if(OverrideHated == 1);Outlaw
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED1, false)
	elseif(OverrideHated == 2);Cultist
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED2, false)
	elseif(OverrideHated == 3);Beguiler
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED3, false)
	elseif(OverrideHated == 4);Ravager
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED4, false)
	elseif(OverrideHated == 5);Prowler
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED5, false)
	elseif(OverrideHated == 6);Fiend
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED6, false)
	elseif((OverrideHated == 7) && (EvilMage2 == 1));Warlock
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED_MAGE, false)
	elseif((OverrideHated == 8) && (Necro2 == 1));Necromage
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED_NECROMANCER, false)
	elseif((OverrideHated == 9) && (Vampire2 == 1));Nightstalker
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED_VAMPIRE, false)
	elseif((OverrideHated == 10) && (Werewolf2 == 1));Shapeshifter
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED_WEREWOLF, false)
	elseif((OverrideHated == 11) && (Assassin1 == 1));Assassin
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED_ASSASSIN, false)
	elseif(OverrideHated == 12) && (Theft2 == 1); Rogue
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED_CRIMEPETTY, false)
	elseif((OverrideHated == 13) && (Assault2 == 1)); Marauder
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED_CRIMEASSAULT, false)		
	elseif((OverrideHated == 14) && (Murder2 == 1)); Murderer
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED_CRIMEMURDER, false)
	else
		SetHatedReputation()
	endif
EndFunction

Function SetLikedOverrideReputation()
	int OverrideLiked	= SR_Global_LabelOverride_Liked.GetValue() as int;
	int BanditKill1 	= LabelToggle_BanditKiller1
	int DragonKill1 	= LabelToggle_DragonKiller1
	int MageKill1 		= LabelToggle_MageKiller1
	int UndeadKill1 	= LabelToggle_UndeadKiller1
	int Blade 			= LabelToggle_Blade
	int Harbinger 		= LabelToggle_Harbinger
	int ArchMage 		= LabelToggle_ArchMage
	int MadanachKilled	= LabelToggle_MadanachKilled
	int PotemaDestroyed	= LabelToggle_PotemaDestroyed
	int ThalmorEnemy	= LabelToggle_ThalmorEnemy
	int WindhelmMurders	= LabelToggle_WindhelmMurderSolved
	int MorthalVampires	= LabelToggle_MorthalVampiresKilled
	int TrevasWatch		= LabelToggle_TrevasWatchSaved
	int RiftenSkooma	= LabelToggle_RiftenSkoomaTrade
	int WitchHunter		= LabelToggle_WitchHunter
	int DwemerExplorer	= LabelToggle_DwemerExplorer
	int GhostHunter 	= LabelToggle_GhostHunter
	if(OverrideLiked == 1);Enforcer
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED1, false)
	elseif(OverrideLiked == 2);Cleric
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED2, false)
	elseif(OverrideLiked == 3);Journeyman
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED3, false)
	elseif(OverrideLiked == 4);Warrior
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED4, false)
	elseif(OverrideLiked == 5);Soldier
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED5, false)
	elseif(OverrideLiked == 6);Pilgrim
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED6, false)	
	elseif((OverrideLiked == 7) && (Harbinger == 1));Harbinger
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_COMPANIONS, false)
	elseif((OverrideLiked == 8) && (ArchMage == 1));Arch Mage
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_COW, false)
	elseif((OverrideLiked == 9) && (Blade == 1));Blade
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_BLADES, false)
	elseif((OverrideLiked == 10) && (BanditKill1 == 1));Bounty hunter
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_BANDITKILL, false)
	elseif((OverrideLiked == 11) && (DragonKill1 == 1));Dragon hunter
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_DRAGONKILL, false)
	elseif((OverrideLiked == 12) && (MageKill1 == 1));Mage hunter
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MAGEKILL, false)
	elseif((OverrideLiked == 13) && (UndeadKill1 == 1)); Undead hunter
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_UNDEADKILL, false)
	elseif((OverrideLiked == 14) && (MadanachKilled == 1)); Kingslayer
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS01, false)
	elseif((OverrideLiked == 15) && (PotemaDestroyed == 1)); Savior of Solitude
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS06, false)
	elseif((OverrideLiked == 16) && (ThalmorEnemy == 1)); Thalmor Hunter
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS09, false)
	elseif((OverrideLiked == 17) && (WindhelmMurders == 1)); Windhelm Investigator
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS11, false)
	elseif((OverrideLiked == 18) && (MorthalVampires == 1)); Liberator of Morthal
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS14, false)
	elseif((OverrideLiked == 19) && (TrevasWatch == 1)); Deliverer of Treva's watch
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_TREVASWATCH, false)
	elseif((OverrideLiked == 20) && (RiftenSkooma == 1)); Lawman of Riften
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_RIFTENSKOOMA, false)
	elseif((OverrideLiked == 21) && (WitchHunter == 1)); Witch Hunter
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_WITCHKILL, false)
	elseif((OverrideLiked == 22) && (DwemerExplorer == 1)); Dwemer Explorer
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_DWEMEREXPLORER, false)
	elseif((OverrideLiked == 23) && (GhostHunter == 1)); Ghost Hunter
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_GHOSTHUNTER, false)
	else
		SetLikedReputation()
	endif
EndFunction

Function SetDislikedOverrideReputation()
	int OverrideDisliked = SR_Global_LabelOverride_Disliked.GetValue() as int;
	int EvilMage1 		= LabelToggle_EvilMage1
	int Necro1 			= LabelToggle_Necromancer1
	int Vampire1 		= LabelToggle_Vampire1
	int Werewolf1 		= LabelToggle_Werewolf1
	int Theft1 			= LabelToggle_Theft1
	int Murder1 		= LabelToggle_Murders1
	int Assault1 		= LabelToggle_Assaults1
	int ForswornAlly	= LabelToggle_ForswornAlly
	int TGRuffian 		= LabelToggle_TheivesGuildRuffian
	int SaadiaBetrayed	= LabelToggle_SaadiaBetrayed
	if(OverrideDisliked == 1);Lawless
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED1, false)
	elseif(OverrideDisliked == 2);Daedra worhipper
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED2, false)
	elseif(OverrideDisliked == 3);Fortune hunter
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED3, false)
	elseif(OverrideDisliked == 4);Blackguard
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED4, false)
	elseif(OverrideDisliked == 5);Trickster
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED5, false)
	elseif(OverrideDisliked == 6);Deceiver
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED6, false)
	elseif((OverrideDisliked == 7) && (EvilMage1 == 1));Wild mage
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_MAGE, false)
	elseif((OverrideDisliked == 8) && (Necro1 == 1));Necromancer
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_NECROMANCER, false)
	elseif((OverrideDisliked == 9) && (Vampire1 == 1));Nightwalker
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_VAMPIRE, false)
	elseif((OverrideDisliked == 10) && (Werewolf1 == 1));Night prowler
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_WEREWOLF, false)
	elseif(OverrideDisliked == 11) && (Theft1 == 1); Thief
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEPETTY, false)
	elseif(OverrideDisliked == 12) && (Assault1 == 1); Ruffian
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEASSAULT, false)
	elseif(OverrideDisliked == 13) && (Murder1 == 1); Killer
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEMURDER, false)
	elseif((OverrideDisliked == 14) && (ForswornAlly == 1)); Forsworn Agent
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_MS01, false)
	elseif((OverrideDisliked == 15) && (TGRuffian == 1)); Hired Thug
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_TG01, false)
	elseif(OverrideDisliked == 16) && (SaadiaBetrayed == 1); Conspiritor
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_MS08, false)
	else
		SetDislikedReputation()
	endif	
EndFunction

Function SetNeutralOverrideReputation()
	int OverrideNeutral	= SR_Global_LabelOverride_Neutral.GetValue() as int;
	if(OverrideNeutral == 1);Chaotic neutral
		PlayerRef.AddSpell(SR_RQC_ABLT_NEUTRAL0, false)
	elseif(OverrideNeutral == 2);Unruly
		PlayerRef.AddSpell(SR_RQC_ABLT_NEUTRAL1, false)
	elseif(OverrideNeutral == 3);Drifter
		PlayerRef.AddSpell(SR_RQC_ABLT_NEUTRAL2, false)
	elseif(OverrideNeutral == 4);Heedless
		PlayerRef.AddSpell(SR_RQC_ABLT_NEUTRAL3, false)
	else
		SetNeutralReputation()
	endif	
EndFunction

Function SetNewcomerOverrideReputation()
	int OverrideNewcomer	= SR_Global_LabelOverride_Newcomer.GetValue() as int;
	if(OverrideNewcomer == 1);Scoundrel
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN01, false)
	elseif(OverrideNewcomer == 2);Troublemaker
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN02, false)
	elseif(OverrideNewcomer == 3);Agitator
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN03, false)
	elseif(OverrideNewcomer == 4);Swashbuckler
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN04, false)
	elseif(OverrideNewcomer == 5);Novitiate
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN05, false)
	elseif(OverrideNewcomer == 6);Adventurer
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN06, false)
	else
		SetUnknownReputation()
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; QUEST REPUTATION LABEL SET FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetHeroQuestReputation()
	int LastBigQuest	= SR_Global_LastBigQuestFinished.GetValue() as int; 1=MainQuest, 2=CivilWar, 3=Dawnguard DLC, 4=Dragonborn DLC
	int Alduin 			= LabelToggle_AlduinKilled
	int CivilWar 		= LabelToggle_CivilWar
	int Dawnguard 		= LabelToggle_DawnguardLineDone
	int Dragonborn 		= LabelToggle_DragonbornDLC
	if (LastBigQuest == 1) && (Alduin == 1); Alduin's bane
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_ALDUINKILL, false)
	elseif(LastBigQuest == 2) && (CivilWar == 1); Peace bringer
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_CIVILWAR, false)
	elseif(LastBigQuest == 3) && (Dawnguard == 1); Champion
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_DAWNGUARD, false)
	elseif(LastBigQuest == 4) && (Dragonborn == 1); Dragon Rider
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_DRAGONBORN, false)
	else
		SetHeroReputation()
	endif
EndFunction

Function SetFearedQuestReputation()
	int LastBigQuest	= SR_Global_LastBigQuestFinished.GetValue() as int; 1=MainQuest, 2=CivilWar, 3=Dawnguard DLC, 4=Dragonborn DLC
	int Vampire3 		= LabelToggle_Vampire3
	int Alduin 			= LabelToggle_AlduinKilled
	int CivilWar 		= LabelToggle_CivilWar
	int Volkihar 		= LabelToggle_VolkiharLineDone
	int Dragonborn 		= LabelToggle_DragonbornDLC
	if (LastBigQuest == 1) && (Alduin == 1); Devourer
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONKILL, false)
	elseif(LastBigQuest == 2) && (CivilWar == 1); Warmonger
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_CIVILWAR, false)
	elseif((LastBigQuest == 3) && (Volkihar == 1) && (Vampire3 == 1));Undead Lord
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DAWNGUARD, false)
	elseif(LastBigQuest == 4) && (Dragonborn == 1); Dragon Master
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONBORN, false)
	else
		SetFearedReputation()
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; REGULAR REPUTATION LABEL SET FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetHeroReputation()
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	Int AedricDaedric = SR_Global_AedricDaedric.GetValue() as int
	Int DependabilityAmbition = SR_Global_DependabilityAmbition.GetValue() as int
	int LastBigQuest	= SR_Global_LastBigQuestFinished.GetValue() as int; 1=MainQuest, 2=CivilWar, 3=Dawnguard DLC, 4=Dragonborn DLC
	int BanditKill3 	= LabelToggle_BanditKiller3
	int DragonKill3 	= LabelToggle_DragonKiller3
	int MageKill3 		= LabelToggle_MageKiller3
	int UndeadKill3 	= LabelToggle_UndeadKiller3
	if (((LawCrime == 1) || (LawCrime == 2)) && ((AedricDaedric == 1) || (AedricDaedric == 2))); High Law AND Aedric Worshipped
		if(DragonKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_DRAGONKILL, false)
		elseif(BanditKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_BANDITKILL, false)
		elseif(UndeadKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_UNDEADKILL, false)			
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED4, false)
		endif
	elseif (((LawCrime == 1) || (LawCrime == 2)) && ((DependabilityAmbition == 1) || (DependabilityAmbition == 2))) ; High Law AND Dependability Worshipped
		if(BanditKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_BANDITKILL, false)
		elseif(MageKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_MAGEKILL, false)
		elseif(DragonKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_DRAGONKILL, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED5, false)
		endif
	elseif (((AedricDaedric == 1) || (AedricDaedric == 2)) && ((DependabilityAmbition == 1) || (DependabilityAmbition == 2))); High Aedric AND Dependability Worshipped
		if(UndeadKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_UNDEADKILL, false)
		elseif(DragonKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_DRAGONKILL, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED6, false)
		endif
	elseif (LawCrime == 1); High Law Worshipped
		if(BanditKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_BANDITKILL, false)
		elseif(MageKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_MAGEKILL, false)			
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED1, false)
		endif
	elseif (AedricDaedric == 1); High Aedric Worshipped
		if(UndeadKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_UNDEADKILL, false)
		elseif(MageKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_MAGEKILL, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED2, false)
		endif
	elseif (DependabilityAmbition == 1); High Dependability Worshipped
		if(DragonKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_DRAGONKILL, false)
		elseif(MageKill3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED_MAGEKILL, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED3, false)
		endif
	else
		PlayerRef.AddSpell(SR_RQC_ABLT_WORSHIPPED0, false); Default Worshipped
	endif
EndFunction

Function SetFearedReputation()
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	Int AedricDaedric = SR_Global_AedricDaedric.GetValue() as int
	Int DependabilityAmbition = SR_Global_DependabilityAmbition.GetValue() as int
	int LastBigQuest	= SR_Global_LastBigQuestFinished.GetValue() as int; 1=MainQuest, 2=CivilWar, 3=Dawnguard DLC, 4=Dragonborn DLC
	int Volkihar 		= LabelToggle_VolkiharLineDone
	int Dragonborn 		= LabelToggle_DragonbornDLC
	int DragonKill3 	= LabelToggle_DragonKiller3
	int EvilMage3 		= LabelToggle_EvilMage3
	int Necro3 			= LabelToggle_Necromancer3
	int Vampire3 		= LabelToggle_Vampire3
	int Werewolf3 		= LabelToggle_Werewolf3
	int Assassin2 		= LabelToggle_Assassin2
	if ((LawCrime > 4) && (AedricDaedric > 4)); High Crime AND Daedric Feared
		if(Necro3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_NECROMANCER, false)
		elseif(Assassin2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_ASSASSIN, false)
		elseif(Werewolf3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_WEREWOLF, false)
		elseif((Volkihar == 1)&&(Vampire3 == 1))
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DAWNGUARD, false)
		elseif(DragonKill3 == 1)	
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONKILL, false)
		elseif(EvilMage3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_MAGE, false)	
		elseif(Vampire3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_VAMPIRE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED4, false)
		endif
	elseif ((LawCrime > 4) && (DependabilityAmbition > 4)); High Crime AND Ambition Feared
		if(Necro3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_NECROMANCER, false)
		elseif(Assassin2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_ASSASSIN, false)
		elseif(Werewolf3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_WEREWOLF, false)
		elseif((Volkihar == 1)&&(Vampire3 == 1))
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DAWNGUARD, false)
		elseif(EvilMage3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_MAGE, false)
		elseif(Dragonborn == 1)	
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONBORN, false)
		elseif(Vampire3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_VAMPIRE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED5, false)
		endif
	elseif ((AedricDaedric > 4) && (DependabilityAmbition > 4)); High Daedric AND Ambition Feared
		if(Necro3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_NECROMANCER, false)
		elseif(Assassin2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_ASSASSIN, false)
		elseif(Werewolf3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_WEREWOLF, false)
		elseif((Volkihar == 1)&&(Vampire3 == 1))
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DAWNGUARD, false)
		elseif(DragonKill3 == 1)	
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONKILL, false)
		elseif(Dragonborn == 1)	
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONBORN, false)
		elseif(EvilMage3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_MAGE, false)
		elseif(Vampire3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_VAMPIRE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED6, false)
		endif
	elseif (LawCrime == 6); High Crime Feared
		if(Necro3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_NECROMANCER, false)
		elseif(Assassin2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_ASSASSIN, false)
		elseif(Werewolf3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_WEREWOLF, false)
		elseif((Volkihar == 1)&&(Vampire3 == 1))
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DAWNGUARD, false)
		elseif(EvilMage3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_MAGE, false)
		elseif(Vampire3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_VAMPIRE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED1, false)
		endif
	elseif (AedricDaedric == 6); High Daedric Feared
		if(Necro3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_NECROMANCER, false)
		elseif(Werewolf3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_WEREWOLF, false)
		elseif((Volkihar == 1)&&(Vampire3 == 1))
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DAWNGUARD, false)
		elseif(DragonKill3 == 1)	
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONKILL, false)
		elseif(EvilMage3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_MAGE, false)
		elseif(Vampire3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_VAMPIRE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED2, false)
		endif
	elseif (DependabilityAmbition == 6); High Ambition Feared
		if(Necro3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_NECROMANCER, false)
		elseif(Assassin2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_ASSASSIN, false)
		elseif(Werewolf3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_WEREWOLF, false)
		elseif((Volkihar == 1)&&(Vampire3 == 1))
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DAWNGUARD, false)
		elseif(DragonKill3 == 1)	
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONKILL, false)
		elseif(Dragonborn == 1)	
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_DRAGONBORN, false)
		elseif(EvilMage3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_MAGE, false)
		elseif(Vampire3 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED_VAMPIRE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_FEARED3, false)
		endif
	else
		PlayerRef.AddSpell(SR_RQC_ABLT_FEARED0, false); Default Feared
	endif
EndFunction

Function SetAdmiredReputation()
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	Int AedricDaedric = SR_Global_AedricDaedric.GetValue() as int
	Int DependabilityAmbition = SR_Global_DependabilityAmbition.GetValue() as int
	int BanditKill2 	= LabelToggle_BanditKiller2
	int DragonKill2 	= LabelToggle_DragonKiller2
	int MageKill2 		= LabelToggle_MageKiller2
	int UndeadKill2 	= LabelToggle_UndeadKiller2
	int Blade 			= LabelToggle_Blade
	int Harbinger 		= LabelToggle_Harbinger
	int ArchMage 		= LabelToggle_ArchMage
	if (((LawCrime == 1) || (LawCrime == 2)) && ((AedricDaedric == 1) || (AedricDaedric == 2))); High Law AND Aedric Admired
		if(BanditKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_BANDITKILL, false)
		elseif(MageKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_MAGEKILL, false)
		elseif(UndeadKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_UNDEADKILL, false)	
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED4, false)
		endif
	elseif (((LawCrime == 1) || (LawCrime == 2)) && ((DependabilityAmbition == 1) || (DependabilityAmbition == 2))); High Law AND Dependability Admired
		if(Harbinger == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_COMPANIONS, false)
		elseif(DragonKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_DRAGONKILL, false)
		elseif(BanditKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_BANDITKILL, false)	
		elseif(MageKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_MAGEKILL, false)	
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED5, false)
		endif
	elseif (((AedricDaedric == 1) || (AedricDaedric == 2)) && ((DependabilityAmbition == 1) || (DependabilityAmbition == 2))); High Aedric AND Dependability Admired
		if(DragonKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_DRAGONKILL, false)
		elseif(UndeadKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_UNDEADKILL, false)	
		elseif(MageKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_MAGEKILL, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED6, false)
		endif
	elseif (LawCrime == 1); High Law Admired
		if(BanditKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_BANDITKILL, false)
		elseif(MageKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_MAGEKILL, false)
		elseif(Harbinger == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_COMPANIONS, false)	
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED1, false)
		endif
	elseif (AedricDaedric == 1); High Aedric Admired
		if(DragonKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_DRAGONKILL, false)
		elseif(UndeadKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_UNDEADKILL, false)
		elseif(ArchMage == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_COW, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED2, false)
		endif
	elseif (DependabilityAmbition == 1); High Dependability Admired
		if(DragonKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_DRAGONKILL, false)
		elseif(MageKill2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_MAGEKILL, false)
		elseif(Blade == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED_BLADES, false)		
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED3, false)
		endif
	else
		PlayerRef.AddSpell(SR_RQC_ABLT_ADMIRED0, false); Default Admired
	endif
EndFunction

Function SetHatedReputation()
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	Int AedricDaedric = SR_Global_AedricDaedric.GetValue() as int
	Int DependabilityAmbition = SR_Global_DependabilityAmbition.GetValue() as int
	int EvilMage2 		= LabelToggle_EvilMage2
	int Necro2 			= LabelToggle_Necromancer2
	int Vampire2 		= LabelToggle_Vampire2
	int Werewolf2 		= LabelToggle_Werewolf2
	int Assassin1 		= LabelToggle_Assassin1
	int Assault2 		= LabelToggle_Assaults2
	int Murder2 		= LabelToggle_Murders2
	int Theft2 			= LabelToggle_Theft2
	if ((LawCrime > 4) && (AedricDaedric > 4)); High Crime AND Daedric Hated
		if(Werewolf2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_WEREWOLF, false)
		elseif(Vampire2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_VAMPIRE, false)	
		elseif(Necro2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_NECROMANCER, false)
		elseif(MurdersLvl2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_CRIMEMURDER, false)
		else	
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED4, false)
		endif
	elseif ((LawCrime > 4) && (DependabilityAmbition > 4)); High Crime AND Ambition Hated
		if(Assassin1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_ASSASSIN, false)
		elseif(Necro2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_NECROMANCER, false)
		elseif(Werewolf2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_WEREWOLF, false)
		elseif(Vampire2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_VAMPIRE, false)
		elseif(EvilMage2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_MAGE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED5, false)
		endif
	elseif ((AedricDaedric > 4) && (DependabilityAmbition > 4)); High Daedric AND Ambition Hated
		if(Werewolf2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_WEREWOLF, false)
		elseif(Vampire2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_VAMPIRE, false)
		elseif(Necro2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_NECROMANCER, false)
		elseif(EvilMage2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_MAGE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED6, false)
		endif
	elseif (LawCrime == 6); High Crime Hated
		if(Assassin1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_ASSASSIN, false)
		elseif(Murder2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_CRIMEMURDER, false)
		elseif(Assault2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_CRIMEASSAULT, false)
		elseif(Theft2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_CRIMEPETTY, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED1, false)
		endif
	elseif (AedricDaedric == 6); High Daedric Hated
		if(Werewolf2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_WEREWOLF, false)
		elseif(Vampire2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_VAMPIRE, false)
		elseif(Necro2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_NECROMANCER, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED2, false)
		endif
	elseif (DependabilityAmbition == 6); High Ambition Hated
		if(Necro2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_NECROMANCER, false)
		elseif(EvilMage2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_MAGE, false)
		elseif(Vampire2 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED_VAMPIRE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_HATED3, false)
		endif
	else
		PlayerRef.AddSpell(SR_RQC_ABLT_HATED0, false); Default Hated
	endif
EndFunction

Function SetLikedReputation()
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	Int AedricDaedric = SR_Global_AedricDaedric.GetValue() as int
	Int DependabilityAmbition = SR_Global_DependabilityAmbition.GetValue() as int
	int BanditKill1 	= LabelToggle_BanditKiller1
	int DragonKill1 	= LabelToggle_DragonKiller1
	int MageKill1 		= LabelToggle_MageKiller1
	int UndeadKill1 	= LabelToggle_UndeadKiller1
	int WitchHunter 	= LabelToggle_WitchHunter
	int SilverBlood 	= LabelToggle_MadanachKilled
	int Potema 			= LabelToggle_PotemaDestroyed
	int WindhelmMurders = LabelToggle_WindhelmMurderSolved
	int MorthalVampire 	= LabelToggle_MorthalVampiresKilled
	int TrevasWatchSave = LabelToggle_TrevasWatchSaved
	int RiftenSkooma 	= LabelToggle_RiftenSkoomaTrade
	int ThalmorDefier 	= LabelToggle_ThalmorEnemy
	int DwemerExplorer	= LabelToggle_DwemerExplorer
	int GhostHunter		= LabelToggle_GhostHunter
	if (((LawCrime == 1) || (LawCrime == 2)) && ((AedricDaedric == 1) || (AedricDaedric == 2))); High Law AND Aedric Liked
		if(DragonKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_DRAGONKILL, false)
		elseif(BanditKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_BANDITKILL, false)
		elseif(MageKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MAGEKILL, false)
		elseif(UndeadKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_UNDEADKILL, false)
		elseif(ThalmorDefier == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS09, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED4, false)
		endif
	elseif (((LawCrime == 1) || (LawCrime == 2)) && ((DependabilityAmbition == 1) || (DependabilityAmbition == 2))); High Law AND Dependability Liked 
		if(DragonKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_DRAGONKILL, false)
		elseif(BanditKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_BANDITKILL, false)
		elseif(MageKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MAGEKILL, false)
		elseif(SilverBlood == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS01, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED5, false)
		endif
	elseif (((AedricDaedric == 1) || (AedricDaedric == 2)) && ((DependabilityAmbition == 1) || (DependabilityAmbition == 2))); High Aedric AND Dependability Liked
		if(DragonKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_DRAGONKILL, false)
		elseif(UndeadKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_UNDEADKILL, false)		
		elseif(WitchHunter == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_WITCHKILL, false)
		elseif(GhostHunter == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_GHOSTHUNTER, false)
		elseif(Potema == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS06, false)		
		elseif(MorthalVampire == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS14, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED6, false)
		endif
	elseif (LawCrime == 1); High Law Liked
		if(BanditKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_BANDITKILL, false)
		elseif(RiftenSkooma == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_RIFTENSKOOMA, false)
		elseif(WindhelmMurders == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS11, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED1, false)
		endif
	elseif (AedricDaedric == 1); High Aedric Liked
		if(UndeadKill1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_UNDEADKILL, false)
		elseif(GhostHunter == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_GHOSTHUNTER, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED2, false)
		endif
	elseif (DependabilityAmbition == 1); High Dependability Liked
		if(DwemerExplorer == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_DWEMEREXPLORER, false)	
		elseif(Potema == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS06, false)		
		elseif(MorthalVampire == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_MS14, false)
		elseif(TrevasWatchSave == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED_TREVASWATCH, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_LIKED3, false)
		endif
	else
		PlayerRef.AddSpell(SR_RQC_ABLT_LIKED0, false); Default Liked
	endif
EndFunction

Function SetDislikedReputation()
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	Int AedricDaedric = SR_Global_AedricDaedric.GetValue() as int
	Int DependabilityAmbition = SR_Global_DependabilityAmbition.GetValue() as int
	int EvilMage1 	= LabelToggle_EvilMage1
	int Necro1 		= LabelToggle_Necromancer1
	int Vampire1 	= LabelToggle_Vampire1
	int Werewolf1 	= LabelToggle_Werewolf1
	int Assault1 	= LabelToggle_Assaults1
	int Murder1 	= LabelToggle_Murders1
	int Theft1 		= LabelToggle_Theft1
	int Kematu 		= LabelToggle_SaadiaBetrayed
	int Madanach 	= LabelToggle_ForswornAlly
	bool TheivesGuildCollector = TheivesGuildRuffian()
	if ((LawCrime > 4) && (AedricDaedric > 4)); High Crime AND Daedric Disliked
		if(Murder1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEMURDER, false)
		elseif(Werewolf1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_WEREWOLF, false)
		elseif(Vampire1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_VAMPIRE, false)
		elseif(Necro1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_NECROMANCER, false)
		elseif(Madanach == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_MS01, false)
		elseif(Assault1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEASSAULT, false)
		elseif(Theft1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEPETTY, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED4, false)
		endif
	elseif ((LawCrime > 4) && (DependabilityAmbition > 4)); High Crime AND Ambition Disliked
		if(Murder1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEMURDER, false)
		elseif(Necro1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_NECROMANCER, false)
		elseif(Vampire1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_VAMPIRE, false)
		elseif(Werewolf1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_WEREWOLF, false)
		elseif(EvilMage1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_MAGE, false)
		elseif(Kematu == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_MS08, false)
		elseif(Assault1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEASSAULT, false)
		elseif(Theft1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEPETTY, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED5, false)
		endif
	elseif ((AedricDaedric > 4) && (DependabilityAmbition > 4)); High Daedric AND Ambition Disliked
		if(Werewolf1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_WEREWOLF, false)
		elseif(Vampire1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_VAMPIRE, false)
		elseif(Necro1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_NECROMANCER, false)
		elseif(EvilMage1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_MAGE, false)
		elseif(Kematu == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_MS08, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED6, false)
		endif
	elseif (LawCrime == 6); High Crime Disliked
		if(Murder1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEMURDER, false)
		elseif(Assault1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEASSAULT, false)
		elseif(TheivesGuildCollector == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_TG01, false)
		elseif(Theft1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_CRIMEPETTY, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED1, false)
		endif
	elseif (AedricDaedric == 6); High Daedric Disliked
		if(Werewolf1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_WEREWOLF, false)
		elseif(Vampire1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_VAMPIRE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED2, false)
		endif
	elseif (DependabilityAmbition == 6); High Ambition Disliked
		if(Necro1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_NECROMANCER, false)
		elseif(EvilMage1 == 1)
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED_MAGE, false)
		else
			PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED3, false)
		endif
	else
		PlayerRef.AddSpell(SR_RQC_ABLT_DISLIKED0, false); Default Disliked
	endif
EndFunction

Function SetNeutralReputation()
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	Int AedricDaedric = SR_Global_AedricDaedric.GetValue() as int
	Int DependabilityAmbition = SR_Global_DependabilityAmbition.GetValue() as int
	Int Thane = SR_Global_ThaneInCurrentLocation.GetValue() as int
	if (Thane == 1)
		PlayerRef.AddSpell(SR_RQC_ABLT_THANE, false); Thane in current location
	elseif (LawCrime > 3)
		PlayerRef.AddSpell(SR_RQC_ABLT_NEUTRAL1, false); Crime Neutral
	elseif (AedricDaedric > 3)
		PlayerRef.AddSpell(SR_RQC_ABLT_NEUTRAL2, false); Daedric Neutral
	elseif (DependabilityAmbition > 3)
		PlayerRef.AddSpell(SR_RQC_ABLT_NEUTRAL3, false); Ambition Neutral
	else
		PlayerRef.AddSpell(SR_RQC_ABLT_NEUTRAL0, false); Default Neutral
	endif
EndFunction

Function SetNewcomerReputation()
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	Int AedricDaedric = SR_Global_AedricDaedric.GetValue() as int
	Int DependabilityAmbition = SR_Global_DependabilityAmbition.GetValue() as int
	Int Thane = SR_Global_ThaneInCurrentLocation.GetValue() as int
	if(Thane == 1)
		PlayerRef.AddSpell(SR_RQC_ABLT_THANE, false); Thane in current location
	elseif (LawCrime > 3)
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN01, false); Crime Unknown
	elseif (AedricDaedric > 3)
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN02, false); Daedric Unknown
	elseif (DependabilityAmbition > 3)
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN03, false); Ambition Unknown
	elseif ((LawCrime == 1)||(LawCrime == 2)||(LawCrime == 3))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN04, false); Law Unknown
	elseif ((AedricDaedric == 1)||(AedricDaedric == 2)||(AedricDaedric == 3))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN05, false); Aedric Unknown
	elseif ((DependabilityAmbition == 1)||(DependabilityAmbition == 2)||(DependabilityAmbition == 3))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN06, false); Dependability Unknown
	else
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN00, false); Default Unknown
	endif
EndFunction

Function SetUnknownReputation()
	Race PlayerRace = Game.GetPlayer().GetRace()
	Int Thane = SR_Global_ThaneInCurrentLocation.GetValue() as int
	if(Thane == 1)
		PlayerRef.AddSpell(SR_RQC_ABLT_THANE, false); Thane in current location
	elseif((PlayerRace == ArgonianRace)||(PlayerRace == ArgonianRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_ARGONIAN, false); Argonian Unknown
	elseif((PlayerRace == BretonRace)||(PlayerRace == BretonRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_BRETON, false); Breton Unknown
	elseif((PlayerRace == KhajiitRace)||(PlayerRace == KhajiitRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_KHAJIIT, false); Khajiit Unknown
	elseif((PlayerRace == HighElfRace)||(PlayerRace == HighElfRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_HIGHELF, false); HighElf Unknown
	elseif((PlayerRace == NordRace)||(PlayerRace == NordRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_NORD, false); Nord Unknown
	elseif((PlayerRace == OrcRace)||(PlayerRace == OrcRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_ORC, false); Orc Unknown
	elseif((PlayerRace == WoodElfRace)||(PlayerRace == WoodElfRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_WOODELF, false); WoodElf Unknown
	elseif((PlayerRace == DarkElfRace)||(PlayerRace == DarkElfRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_DARKELF, false); DarkElf Unknown
	elseif((PlayerRace == ImperialRace)||(PlayerRace == ImperialRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_IMPERIAL, false); Imperial Unknown
	elseif((PlayerRace == RedguardRace)||(PlayerRace == RedguardRaceVampire))
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_REDGUARD, false); RedGuard Unknown
	else
		PlayerRef.AddSpell(SR_RQC_ABLT_UNKNOWN_OTHERRACE, false); Other Race Unknown
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; REPUTATION MESSAGE SEND FUNCTION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SendReputationMessage()
	Int MessageMCMToggle = SR_MCM_Reputation_Message.GetValue() as int
	Int Reputation = SR_Global_Reputation.GetValue() as int
	Int ReputationStoreage = ReputationStorage as int
	IF ((Reputation != ReputationStoreage)&&(MessageMCMToggle == 1))
		If (Reputation == 8); Worshipped
			if((ReputationStoreage == 1)||(ReputationStoreage == 2)||(ReputationStoreage == 3)||(ReputationStoreage == 5)||(ReputationStoreage == 7))
				SR_Message_Worshipped3.Show()
				SR_RQC_SPELL_REPCHG_GOOD.Cast(PlayerRef, akTarget = None)
				SetReputationStorage(8)				
			elseif(Reputation > ReputationStoreage)
				SR_Message_Worshipped1.Show()
				SetReputationStorage(8)
			else
				SR_Message_Worshipped2.Show()
				SetReputationStorage(8)
			endif
		ElseIf (Reputation == 7); Feared
			if((ReputationStoreage == 1)||(ReputationStoreage == 2)||(ReputationStoreage == 4)||(ReputationStoreage == 6)||(ReputationStoreage == 8))
				SR_Message_Feared3.Show()
				SR_RQC_SPELL_REPCHG_BAD.Cast(PlayerRef, akTarget = None)
				SetReputationStorage(7)			
			elseif (Reputation > ReputationStoreage)
				SR_Message_Feared1.Show()
				SetReputationStorage(7)
			else
				SR_Message_Feared2.Show()
				SetReputationStorage(7)
			endif
		ElseIf (Reputation == 6); Admired
			if((ReputationStoreage == 0)||(ReputationStoreage == 1)||(ReputationStoreage == 2)||(ReputationStoreage == 3)||(ReputationStoreage == 5)||(ReputationStoreage == 7))
				SR_Message_Admired3.Show()
				SR_RQC_SPELL_REPCHG_GOOD.Cast(PlayerRef, akTarget = None)
				SetReputationStorage(8)		
			elseif(Reputation > ReputationStoreage)
				SR_Message_Admired1.Show()
				SetReputationStorage(6)
			elseif (Reputation < ReputationStoreage)
				SR_Message_Admired2.Show()
				SetReputationStorage(6)
			endif
		ElseIf (Reputation == 5); Hated
			if((ReputationStoreage == 0)||(ReputationStoreage == 1)||(ReputationStoreage == 2)||(ReputationStoreage == 4)||(ReputationStoreage == 6)||(ReputationStoreage == 8))
				SR_Message_Hated3.Show()
				SR_RQC_SPELL_REPCHG_BAD.Cast(PlayerRef, akTarget = None)
				SetReputationStorage(5)			
			elseif (Reputation > ReputationStoreage)
				SR_Message_Hated1.Show()
				SetReputationStorage(5)
			elseif (Reputation < ReputationStoreage)
				SR_Message_Hated2.Show()
				SetReputationStorage(5)
			endif
		ElseIf (Reputation == 4); Liked
			if((ReputationStoreage == 0)||(ReputationStoreage == 3)||(ReputationStoreage == 5)||(ReputationStoreage == 7))
				SR_Message_Liked3.Show()
				SR_RQC_SPELL_REPCHG_GOOD.Cast(PlayerRef, akTarget = None)
				SetReputationStorage(8)		
			elseif (Reputation > ReputationStoreage)
				SR_Message_Liked1.Show()
				SetReputationStorage(4)
			elseif (Reputation < ReputationStoreage)
				SR_Message_Liked2.Show()
				SetReputationStorage(4)
			endif
		ElseIf (Reputation == 3); Disliked
			if((ReputationStoreage == 0)||(ReputationStoreage == 4)||(ReputationStoreage == 6)||(ReputationStoreage == 8))
				SR_Message_Disliked3.Show()
				SR_RQC_SPELL_REPCHG_BAD.Cast(PlayerRef, akTarget = None)
				SetReputationStorage(7)	
			elseif (Reputation > ReputationStoreage)
				SR_Message_Disliked1.Show()
				SetReputationStorage(3)
			elseif (Reputation < ReputationStoreage)
				SR_Message_Disliked2.Show()
				SetReputationStorage(3)
			endif
		ElseIf (Reputation == 2); Neutral
			if (ReputationStoreage == 3)
				SR_Message_Neutral1.Show()
				SetReputationStorage(2)
			elseif (ReputationStoreage == 4)
				SR_Message_Neutral2.Show()
				SetReputationStorage(2)
			else
				SR_Message_Neutral3.Show()
				SetReputationStorage(2)
			endif
		ElseIf (Reputation == 1); Unknown
			if(ReputationStoreage == 0)
				SR_Message_Unknown.Show()
				SetReputationStorage(1)
			endif
		EndIf
	ENDIF
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CALCULATE FUNCTION FOR CHECKING REPUTATION LABEL APPROPRIATENESS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function CheckLabelToggles()
	CivilWarDone()
	AlduinKilled()
	DawnguardCompleted()
	VolkiharCompleted()
	DragonbornCompleted()
	BanditKiller()
	DragonKiller()
	MageKiller()
	UndeadKiller()
	EvilMage()
	Necromancer()
	Vampire()
	Werewolf()
	Assassin()
	CrimeAssaults()
	CrimeMurders()
	CrimeTheft()
	ForswornQuest()
	PotemaDestroyed()
	SaadiaBetrayed()
	ThalmorEnemy()
	WindhelmMurder()
	MorthalVampires()
	TheivesGuildRuffian()
	TrevasWatch()
	RiftenSkoomaTrade()
	WitchHunter()
	Blades()
	Harbinger()
	ArchMage()
	DwemerExploring()
	GhostHunting()
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR CHECKING REPUTATION LABEL APPROPRIATENESS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property LabelToggle_CivilWar = 0 auto 
int property LabelToggle_AlduinKilled = 0 auto 
int property LabelToggle_DawnguardLineDone = 0 auto 
int property LabelToggle_VolkiharLineDone = 0 auto 
int property LabelToggle_DragonbornDLC = 0 auto 
int property LabelToggle_BanditKiller1 = 0 auto 
int property LabelToggle_BanditKiller2 = 0 auto 
int property LabelToggle_BanditKiller3 = 0 auto 
int property LabelToggle_DragonKiller1 = 0 auto 
int property LabelToggle_DragonKiller2 = 0 auto 
int property LabelToggle_DragonKiller3 = 0 auto 
int property LabelToggle_MageKiller1 = 0 auto 
int property LabelToggle_MageKiller2 = 0 auto 
int property LabelToggle_MageKiller3 = 0 auto 
int property LabelToggle_UndeadKiller1 = 0 auto 
int property LabelToggle_UndeadKiller2 = 0 auto 
int property LabelToggle_UndeadKiller3 = 0 auto 
int property LabelToggle_EvilMage1 = 0 auto 
int property LabelToggle_EvilMage2 = 0 auto 
int property LabelToggle_EvilMage3 = 0 auto 
int property LabelToggle_Necromancer1 = 0 auto 
int property LabelToggle_Necromancer2 = 0 auto 
int property LabelToggle_Necromancer3 = 0 auto 
int property LabelToggle_Vampire1 = 0 auto 
int property LabelToggle_Vampire2 = 0 auto 
int property LabelToggle_Vampire3 = 0 auto 
int property LabelToggle_Werewolf1 = 0 auto 
int property LabelToggle_Werewolf2 = 0 auto 
int property LabelToggle_Werewolf3 = 0 auto 
int property LabelToggle_Assassin1 = 0 auto 
int property LabelToggle_Assassin2 = 0 auto 
int property LabelToggle_Assaults1 = 0 auto 
int property LabelToggle_Assaults2 = 0 auto 
int property LabelToggle_Murders1 = 0 auto 
int property LabelToggle_Murders2 = 0 auto 
int property LabelToggle_Theft1 = 0 auto 
int property LabelToggle_Theft2 = 0 auto 
int property LabelToggle_ForswornAlly = 0 auto 
int property LabelToggle_MadanachKilled = 0 auto 
int property LabelToggle_PotemaDestroyed = 0 auto 
int property LabelToggle_SaadiaBetrayed = 0 auto 
int property LabelToggle_ThalmorEnemy = 0 auto 
int property LabelToggle_WindhelmMurderSolved = 0 auto 
int property LabelToggle_MorthalVampiresKilled = 0 auto 
int property LabelToggle_TheivesGuildRuffian = 0 auto 
int property LabelToggle_TrevasWatchSaved = 0 auto 
int property LabelToggle_RiftenSkoomaTrade = 0 auto 
int property LabelToggle_WitchHunter = 0 auto 
int property LabelToggle_Blade = 0 auto 
int property LabelToggle_Harbinger = 0 auto 
int property LabelToggle_ArchMage = 0 auto 
int property LabelToggle_DwemerExplorer = 0 auto 
int property LabelToggle_GhostHunter = 0 auto 


Function CivilWarDone()
	if (CWObj.IsStageDone(255) == true)
		LabelToggle_CivilWar = 1
	endif
EndFunction

Function AlduinKilled()
	if (MQ305.IsStageDone(200) == true)
		LabelToggle_AlduinKilled = 1
	endif
EndFunction

Function DawnguardCompleted()
	if (DLC1VQ08.IsStageDone(200) == true) && (DLC1PlayingVampireLine.GetValue() == 0)
		LabelToggle_DawnguardLineDone = 1
	endif
EndFunction

Function VolkiharCompleted()
	if (DLC1VQ08.IsStageDone(200) == true) && (DLC1PlayingVampireLine.GetValue() == 1)
		LabelToggle_VolkiharLineDone = 1
	endif
EndFunction

Function DragonbornCompleted()
	if(DLC2MQ06.IsStageDone(550) == true)
		LabelToggle_DragonbornDLC = 1
	endif
EndFunction

Function BanditKiller()
	float BanditsKilled = SR_RQC_Script.BanditKillerScore() as float
	float BanditsKilledMax = SR_RQC_Script.BanditsKilledMax as float
	if(BanditsKilled > (BanditsKilledMax*BanditKillsLvl1))
		LabelToggle_BanditKiller1 = 1
	else
		LabelToggle_BanditKiller1 = 0
	endif
	
	if(BanditsKilled > (BanditsKilledMax*BanditKillsLvl2))
		LabelToggle_BanditKiller2 = 1
	else
		LabelToggle_BanditKiller2 = 0
	endif
	
	if(BanditsKilled > (BanditsKilledMax*BanditKillsLvl3))
		LabelToggle_BanditKiller3 = 1
	else
		LabelToggle_BanditKiller3 = 0
	endif
EndFunction

Function DragonKiller()
	float DragonsKilled = SR_RQC_Script.DragonKillScore() as float
	float DragonsKilledMax = SR_RQC_Script.DragonKillsMax as float
	if(DragonsKilled > (DragonsKilledMax*DragonKillsLvl1))
		LabelToggle_DragonKiller1 = 1
	else
		LabelToggle_DragonKiller1 = 0
	endif

	if(DragonsKilled > (DragonsKilledMax*DragonKillsLvl2))
		LabelToggle_DragonKiller2 = 1
	else
		LabelToggle_DragonKiller2 = 0
	endif	

	if(DragonsKilled > (DragonsKilledMax*DragonKillsLvl3))
		LabelToggle_DragonKiller3 = 1
	else
		LabelToggle_DragonKiller3 = 0
	endif
EndFunction

Function MageKiller()
	float MagesKilled = SR_RQC_Script.WizardKillerScore() as float
	float MagesKilledMax = SR_RQC_Script.WizardKillerMax as float
	float ArcaneMastery = SR_RQC_Script.ArcaneMasteryScore() as float
	if((MagesKilled > (MagesKilledMax*MageKillsLvl1)) && (ArcaneMastery < AntiMageLvl1))
		LabelToggle_MageKiller1 = 1
	else
		LabelToggle_MageKiller1 = 0
	endif

	if((MagesKilled > (MagesKilledMax*MageKillsLvl2)) && (ArcaneMastery < AntiMageLvl2))
		LabelToggle_MageKiller2 = 1
	else
		LabelToggle_MageKiller2 = 0
	endif	

	if((MagesKilled > (MagesKilledMax*MageKillsLvl3)) && (ArcaneMastery < AntiMageLvl3))
		LabelToggle_MageKiller3 = 1
	else
		LabelToggle_MageKiller3 = 0
	endif
EndFunction

Function UndeadKiller()
	Int VampireState = (PlayerVampireQuest as PlayerVampireQuestScript).VampireStatus as int
	float UndeadKilled = SR_RQC_Script.UndeadKilledScore() as float
	float UndeadKilledMax = SR_RQC_Script.UndeadKilledMax as float
	if(UndeadKilled > (UndeadKilledMax*UndeadKillsLvl1)) && (VampireState == 0)
		LabelToggle_UndeadKiller1 = 1
	else
		LabelToggle_UndeadKiller1 = 0
	endif

	if(UndeadKilled > (UndeadKilledMax*UndeadKillsLvl2)) && (VampireState == 0)
		LabelToggle_UndeadKiller2 = 1
	else
		LabelToggle_UndeadKiller2 = 0
	endif	

	if(UndeadKilled > (UndeadKilledMax*UndeadKillsLvl3)) && (VampireState == 0)
		LabelToggle_UndeadKiller3 = 1
	else
		LabelToggle_UndeadKiller3 = 0
	endif
EndFunction

Function EvilMage()
	float ArcaneMastery = SR_RQC_Script.ArcaneMasteryScore() as float
	if(ArcaneMastery > MageLvl1)
		LabelToggle_EvilMage1 = 1
	else
		LabelToggle_EvilMage1 = 0
	endif

	if(ArcaneMastery > MageLvl2)
		LabelToggle_EvilMage2 = 1
	else
		LabelToggle_EvilMage2 = 0
	endif	

	if(ArcaneMastery > MageLvl3)
		LabelToggle_EvilMage3 = 1
	else
		LabelToggle_EvilMage3 = 0
	endif
EndFunction

Function Necromancer()
	float Necromancer = SR_RQC_Script.NecroTimesScore() as float
	float NecromancerMax = SR_RQC_Script.ZombieTimeMax as float
	float ConjurationSkill = Game.GetPlayer().GetBaseActorValue("Conjuration") as float
	if((Necromancer > (NecromancerMax*NecromancyLvl1)) && (ConjurationSkill > ConjurationSkillLvl1))
		LabelToggle_Necromancer1 = 1
	else
		LabelToggle_Necromancer1 = 0
	endif

	if((Necromancer > (NecromancerMax*NecromancyLvl2)) && (ConjurationSkill > ConjurationSkillLvl2))
		LabelToggle_Necromancer2 = 1
	else
		LabelToggle_Necromancer2 = 0
	endif

	if((Necromancer > (NecromancerMax*NecromancyLvl3)) && (ConjurationSkill > ConjurationSkillLvl3))
		LabelToggle_Necromancer3 = 1
	else
		LabelToggle_Necromancer3 = 0
	endif
EndFunction

Function Vampire()
	Int VampireState = (PlayerVampireQuest as PlayerVampireQuestScript).VampireStatus as int
	float VampireScore = SR_Global_VampireSuspicion.GetValue() as float
	if(VampireScore > VampireLvl1)&&(VampireState >= 1)
		LabelToggle_Vampire1 = 1
	else
		LabelToggle_Vampire1 = 0
	endif

	if(VampireScore > VampireLvl2)&&(VampireState >= 1)
		LabelToggle_Vampire2 = 1
	else
		LabelToggle_Vampire2 = 0
	endif	

	if(VampireScore > VampireLvl3)&&(VampireState >= 1)
		LabelToggle_Vampire3 = 1
	else
		LabelToggle_Vampire3 = 0
	endif
EndFunction

Function Werewolf()
	bool WerewolfBlood = (C00 as CompanionsHousekeepingScript).PlayerHasBeastBlood
	float WerewolfScore = SR_Global_WerewolfSuspicion.GetValue() as float
	if(WerewolfScore > WerewolfLvl1) && (WerewolfBlood == True)
		LabelToggle_Werewolf1 = 1
	else
		LabelToggle_Werewolf1 = 0
	endif

	if(WerewolfScore > WerewolfLvl2) && (WerewolfBlood == True)
		LabelToggle_Werewolf2 = 1
	else
		LabelToggle_Werewolf2 = 0
	endif	

	if(WerewolfScore > WerewolfLvl3) && (WerewolfBlood == True)
		LabelToggle_Werewolf3 = 1
	else
		LabelToggle_Werewolf3 = 0
	endif
EndFunction

Function Assassin()
	float Murders = Game.QueryStat("Murders") as float
	float Backstabs = Game.QueryStat("Backstabs") as float
	float DarkBrotherhoodQuests = Game.QueryStat("The Dark Brotherhood Quests Completed") as float
	float DarkBrotherhoodQuestsMax = SR_RQC_Script.DarkBrotherhoodQuestsMax as float
	float SeenMurders = SR_RQC_Script.AdjSpottedMurderScore() as float
	float SpottedMurdersMin = SR_RQC_Script.SpottedMurdersMin as float
	if ((Murders >= MurderLvl1) && (Backstabs >= MurderLvl1) && (DarkBrotherhoodQuests >= (DarkBrotherhoodQuestsMax*DarkBrotherhoodQuestLvl2)) && (SeenMurders <= SpottedMurdersMin+5))
		LabelToggle_Assassin1 = 1
	else
		LabelToggle_Assassin1 = 0
	endif

	if((Murders >= MurderLvl2) && (Backstabs >= MurderLvl2) && (DarkBrotherhoodQuests >= (DarkBrotherhoodQuestsMax*DarkBrotherhoodQuestLvl3)) && (SeenMurders <= SpottedMurdersMin+5))
		LabelToggle_Assassin2 = 1 
	else
		LabelToggle_Assassin2 = 0
	endif
EndFunction

Function CrimeAssaults()
	float Assaults = SR_RQC_Script.SpottedAssaultScore() as float
	if(Assaults > AssaultsLvl1)
		LabelToggle_Assaults1 = 1
	else
		LabelToggle_Assaults1 = 0
	endif

	if(Assaults > AssaultsLvl2)
		LabelToggle_Assaults2 = 1
	else
		LabelToggle_Assaults2 = 0
	endif
EndFunction

Function CrimeMurders()
	float Murders = SR_RQC_Script.SpottedMurderScore() as float
	if(Murders > MurdersLvl1)
		LabelToggle_Murders1 = 1
	else
		LabelToggle_Murders1 = 0
	endif

	if(Murders > MurdersLvl2)
		LabelToggle_Murders2 = 1
	else
		LabelToggle_Murders2 = 0
	endif
EndFunction

Function CrimeTheft()
	float Theft = SR_RQC_Script.SpottedPettyCrimeScore() as float
	if(Theft > TheftLvl1)
		LabelToggle_Theft1 = 1
	else
		LabelToggle_Theft1 = 0
	endif

	if(Theft > TheftLvl2)
		LabelToggle_Theft2 = 1
	else
		LabelToggle_Theft2 = 0
	endif
EndFunction

Function ForswornQuest()
	int ForswornAlly = SR_FactionAuras_Forsworn.GetValue() as int
	bool MadanachDead = MadanachREF.IsDead() as bool
	if(ForswornAlly == 1)
		LabelToggle_ForswornAlly = 1
	else
		LabelToggle_ForswornAlly = 0
	endif

	if(MadanachDead == true)
		LabelToggle_MadanachKilled = 1
	endif
EndFunction

Function PotemaDestroyed()
	if (MS06.IsStageDone(250) == true)
		LabelToggle_PotemaDestroyed = 1
	endif
EndFunction

Function SaadiaBetrayed()
	bool KematuDead = MS08KematuREF.IsDead() as bool
	bool Kematu = MS08.IsStageDone(201) as bool
	if((Kematu == true) && (KematuDead == false))
		LabelToggle_SaadiaBetrayed = 1
	else
		LabelToggle_SaadiaBetrayed = 0
	endif
EndFunction

Function ThalmorEnemy()
	if (SR_Global_PlayerIsThalmorEnemy.GetValue() == 1)
		LabelToggle_ThalmorEnemy = 1
	else
		LabelToggle_ThalmorEnemy = 0
	endif
EndFunction

Function WindhelmMurder()
	if ((MS11.IsStageDone(250))||(MS11b.IsStageDone(20)))
		LabelToggle_WindhelmMurderSolved = 1
	endif
EndFunction

Function MorthalVampires()
	if (MS14Q.IsStageDone(200))
		LabelToggle_MorthalVampiresKilled = 1
	endif
EndFunction

Function TheivesGuildRuffian()
	if (TG01.IsStageDone(200))
		LabelToggle_TheivesGuildRuffian = 1
	endif
EndFunction

Function TrevasWatch()
	bool StalleoDead = StalleoREF.IsDead() as bool
	if ((dunTrevasWatchQST.IsStageDone(100)) && (StalleoDead == false))
		LabelToggle_TrevasWatchSaved = 1
	else
		LabelToggle_TrevasWatchSaved = 0
	endif
EndFunction

Function RiftenSkoomaTrade()
	if (FreeformRiften01.IsStageDone(200))
		LabelToggle_RiftenSkoomaTrade = 1
	endif
EndFunction

Function WitchHunter()
	float WitchHunter = SR_RQC_Script.WitchKillerScore() as float
	float WitchHunterMax = SR_RQC_Script.WitchKillerMax as float
	if (((T03.IsStageDone(100))||(T03.IsStageDone(105)))||(C04.IsStageDone(200))||(dunDarklightQST.IsStageDone(40)))
		LabelToggle_WitchHunter = 1
	elseif(WitchHunter > (WitchHunterMax*WitchHunterLvl1))
		LabelToggle_WitchHunter = 1
	else
		LabelToggle_WitchHunter = 0
	endif
EndFunction

Function Blades()
	float DragonsKilled = SR_RQC_Script.DragonKillScore() as float
	float DragonsKilledMax = SR_RQC_Script.DragonKillsMax as float
	if ((FreeformSkyhavenTempleA.IsStageDone(30)) && (DragonsKilled > (DragonsKilledMax*DragonKillsLvl1)))
		LabelToggle_Blade = 1
	else
		LabelToggle_Blade = 0
	endif
EndFunction

Function Harbinger()
	Float LightArmorSkill = Game.GetPlayer().GetBaseActorValue("LightArmor") as Float
	Float HeavyArmorSkill = Game.GetPlayer().GetBaseActorValue("HeavyArmor") as Float
	Float BlockSkill = Game.GetPlayer().GetBaseActorValue("Block") as Float
	Float MarksmanSkill = Game.GetPlayer().GetBaseActorValue("Marksman") as Float	
	Float OneHandedSkill = Game.GetPlayer().GetBaseActorValue("OneHanded") as Float
	Float TwoHandedSkill = Game.GetPlayer().GetBaseActorValue("TwoHanded") as Float
	Float WarriorSkill = ((LightArmorSkill+HeavyArmorSkill+BlockSkill+(MarksmanSkill/2)+(OneHandedSkill/2)+TwoHandedSkill)/5)
	if ((C06.IsStageDone(200)) && (WarriorSkill >= WarriorLvl2))
		LabelToggle_Harbinger = 1
	endif
EndFunction

Function ArchMage()
	Float IllusionSkill = Game.GetPlayer().GetBaseActorValue("Illusion") as Float
	Float DestructionSkill = Game.GetPlayer().GetBaseActorValue("Destruction") as Float
	Float AlterationSkill = Game.GetPlayer().GetBaseActorValue("Alteration") as Float
	Float ConjurationSkill = Game.GetPlayer().GetBaseActorValue("Conjuration") as Float
	Float RestorationSkill = Game.GetPlayer().GetBaseActorValue("Restoration") as Float
	Float EnchantingSkill = Game.GetPlayer().GetBaseActorValue("Enchanting") as Float
	Float ArcaneMasteryScore = ((IllusionSkill+DestructionSkill+AlterationSkill+ConjurationSkill+(RestorationSkill/2)+(EnchantingSkill/2))/5)
	if ((MG08.IsStageDone(200)) && (ArcaneMasteryScore >= MageLvl2))
		LabelToggle_ArchMage = 1
	endif
EndFunction

Function DwemerExploring()
	Int UnDepths = MS04Quest()
	Int Transmun = DA04Quest()
	Int Expediti = dunNchuandZelQuest()
	Int Revealin = MG06Quest()
	Int Grimseve = FreeformRiften09Quest()
	Int LostAges = DLC1LDQuest()
	Int Arniel = MGRArnielQuest()
	Int DwemerExploring = UnDepths+Transmun+Expediti+Revealin+Grimseve+LostAges+Arniel
	if (DwemerExploring >= DwemerExplorerLvl1)
		LabelToggle_DwemerExplorer = 1
	endif
EndFunction

Int Function MGRArnielQuest(); Arniel's Endeavor
	if(MGRArniel04.IsStageDone(200))
		Return 3
	elseif(MGRArniel03.IsStageDone(200))
		Return 2	
	elseif(MGRArniel02.IsStageDone(200))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function DLC1LDQuest();Lost to the Ages 
	if(DLC1LD.IsStageDone(225))
		Return 3
	else
		Return 0
	endif
EndFunction

Int Function FreeformRiften09Quest(); Grimsever's Return
	if(FreeformRiften09.IsStageDone(200))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function MG06Quest();Revealing the Unseen
	if(MG06.IsStageDone(200))
		Return 2
	else
		Return 0
	endif
EndFunction

Int Function dunNchuandZelQuest();The Lost Expedition
	if(dunNchuandZelQst.IsStageDone(110))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function DA04Quest();Discerning the Transmundane
	if(DA04.IsStageDone(100))
		Return 2
	else
		Return 0
	endif
EndFunction

Int Function MS04Quest();Unfathomable Depths
	if(MS04.IsStageDone(1000))
		Return 1
	else
		Return 0
	endif
EndFunction

Function GhostHunting()
	Int BookofLove 		= T02Quest()
	Int StaffofMagnus  	= MG07Quest()
	Int GloryDead 		= C06Quest()
	Int ImpatienceSaint = DLC1VQSaintQuest()
	Int BardsLeap 		= dunBardsLeapSummitQuest()
	Int ToyingWithDead 	= FreeformRiften21Quest()
	Int DragonCult 		= dunForelhostQuester()
	Int BeyondDeath 	= dunAnsilvundQuest()
	Int EvilWaiting 	= dunValthumeQuest()
	Int GhostHroldan 	= FreeformOldHroldanBQuest()
	Int KynesTrials 	= dunHunterQuest()
	Int Potema			= MS06Quest()
	Int GhostHunting 	= BookofLove+StaffofMagnus+GloryDead+ImpatienceSaint+BardsLeap+ToyingWithDead+DragonCult+BeyondDeath+EvilWaiting+GhostHroldan+KynesTrials+Potema
	if (GhostHunting >= GhostHunterLvl1)
		LabelToggle_GhostHunter = 1
	endif
EndFunction

Int Function T02Quest(); The Book of Love
	if(T02.IsStageDone(200))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function MG07Quest(); The Staff of Magnus 
	if(MG07.IsStageDone(200))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function C06Quest();Glory of the Dead
	if(C06.IsStageDone(200))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function DLC1VQSaintQuest(); Impatience of a Saint
	if(DLC1VQSaint.IsStageDone(200))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function dunBardsLeapSummitQuest(); Bard's Leap Summit
	if(dunBardsLeapSummitQST.IsStageDone(100))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function FreeformRiften21Quest(); Toying With The Dead
	if(FreeformRiften21.IsStageDone(200))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function dunForelhostQuester(); Siege on the Dragon Cult
	if(dunForelhostQuest.IsStageDone(100))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function dunAnsilvundQuest(); A Love Beyond Death
	if(dunAnsilvundQST.IsStageDone(100))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function dunValthumeQuest();Evil in Waiting
	if(dunValthumeQST.IsStageDone(60))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function FreeformOldHroldanBQuest(); The Ghost of Old Hroldan
	if(FreeformOldHroldanB.IsStageDone(100))
		Return 1
	else
		Return 0
	endif
EndFunction

Int Function dunHunterQuest(); Kyne's Sacred Trials
	if(dunHunterQST.IsStageDone(100))
		Return 2
	else
		Return 0
	endif
EndFunction

Int Function MS06Quest(); Potema the wolf queen
	if(MS06.IsStageDone(250))
		Return 2
	else
		Return 0
	endif
EndFunction



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING CALCULATION LEVEL VALUE PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetBanditKillsLvl1(float NewValue)
	BanditKillsLvl1 = NewValue
EndFunction

Function SetBanditKillsLvl2(float NewValue)
	BanditKillsLvl2 = NewValue
EndFunction

Function SetBanditKillsLvl3(float NewValue)
	BanditKillsLvl3 = NewValue
EndFunction

Function SetDragonKillsLvl1(float NewValue)
	DragonKillsLvl1 = NewValue
EndFunction

Function SetDragonKillsLvl2(float NewValue)
	DragonKillsLvl2 = NewValue
EndFunction

Function SetDragonKillsLvl3(float NewValue)
	DragonKillsLvl3 = NewValue
EndFunction

Function SetMageKillsLvl1(float NewValue)
	MageKillsLvl1 = NewValue
EndFunction

Function SetMageKillsLvl2(float NewValue)
	MageKillsLvl2 = NewValue
EndFunction

Function SetMageKillsLvl3(float NewValue)
	MageKillsLvl3 = NewValue
EndFunction

Function SetAntiMageLvl1(float NewValue)
	AntiMageLvl1 = NewValue
EndFunction

Function SetAntiMageLvl2(float NewValue)
	AntiMageLvl2 = NewValue
EndFunction

Function SetAntiMageLvl3(float NewValue)
	AntiMageLvl3 = NewValue
EndFunction

Function SetUndeadKillsLvl1(float NewValue)
	UndeadKillsLvl1 = NewValue
EndFunction

Function SetUndeadKillsLvl2(float NewValue)
	UndeadKillsLvl2 = NewValue
EndFunction

Function SetUndeadKillsLvl3(float NewValue)
	UndeadKillsLvl3 = NewValue
EndFunction

Function SetMageLvl1(float NewValue)
	MageLvl1 = NewValue
EndFunction

Function SetMageLvl2(float NewValue)
	MageLvl2 = NewValue
EndFunction

Function SetMageLvl3(float NewValue)
	MageLvl3 = NewValue
EndFunction

Function SetWarriorLvl2(float NewValue)
	WarriorLvl2 = NewValue
EndFunction

Function SetNecromancyLvl1(float NewValue)
	NecromancyLvl1 = NewValue
EndFunction

Function SetNecromancyLvl2(float NewValue)
	NecromancyLvl2 = NewValue
EndFunction

Function SetNecromancyLvl3(float NewValue)
	NecromancyLvl3 = NewValue
EndFunction

Function SetConjurationSkillLvl1(float NewValue)
	ConjurationSkillLvl1 = NewValue
EndFunction

Function SetConjurationSkillLvl2(float NewValue)
	ConjurationSkillLvl2 = NewValue
EndFunction

Function SetConjurationSkillLvl3(float NewValue)
	ConjurationSkillLvl3 = NewValue
EndFunction

Function SetVampireLvl1(float NewValue)
	VampireLvl1 = NewValue
EndFunction

Function SetVampireLvl2(float NewValue)
	VampireLvl2 = NewValue
EndFunction

Function SetVampireLvl3(float NewValue)
	VampireLvl3 = NewValue
EndFunction

Function SetWerewolfLvl1(float NewValue)
	WerewolfLvl1 = NewValue
EndFunction

Function SetWerewolfLvl2(float NewValue)
	WerewolfLvl2 = NewValue
EndFunction

Function SetWerewolfLvl3(float NewValue)
	WerewolfLvl3 = NewValue
EndFunction

Function SetMurderLvl1(float NewValue)
	MurderLvl1 = NewValue
EndFunction

Function SetMurderLvl2(float NewValue)
	MurderLvl2 = NewValue
EndFunction

Function SetDarkBrotherhoodQuestLvl2(float NewValue)
	DarkBrotherhoodQuestLvl2 = NewValue
EndFunction

Function SetDarkBrotherhoodQuestLvl3(float NewValue)
	DarkBrotherhoodQuestLvl3 = NewValue
EndFunction

Function SetAssaultsLvl1(float NewValue)
	AssaultsLvl1 = NewValue
EndFunction

Function SetAssaultsLvl2(float NewValue)
	AssaultsLvl2 = NewValue
EndFunction

Function SetMurdersLvl1(float NewValue)
	MurdersLvl1 = NewValue
EndFunction

Function SetMurdersLvl2(float NewValue)
	MurdersLvl2 = NewValue
EndFunction

Function SetTheftLvl1(float NewValue)
	TheftLvl1 = NewValue
EndFunction

Function SetTheftLvl2(float NewValue)
	TheftLvl2 = NewValue
EndFunction

Function SetWitchHunterLvl1(float NewValue)
	WitchHunterLvl1 = NewValue
EndFunction

Function SetDwemerExplorerLvl1(int NewValue)
	DwemerExplorerLvl1 = NewValue
EndFunction

Function SetGhostHunterLvl1(int NewValue)
	GhostHunterLvl1 = NewValue
EndFunction

Function SetReputationStorage(int NewValue)
	ReputationStorage = NewValue
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DEBUG FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function ForceUpdateRegistration()
	RegisterForSingleUpdateGameTime(1.5)
EndFunction

			