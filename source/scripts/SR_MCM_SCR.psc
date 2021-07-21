Scriptname SR_MCM_SCR extends SKI_ConfigBase

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SCRIPT VERSION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; NOTE:
; This is an example to show you how to update scripts after they have been deployed.
;
; History
;
; 1 - Version 0.3
; 2 - Version 0.4
; 3 - Version 1.0
; 4 - Version 1.1
; 5 - Version 1.4
; 6 - Version 2.0
; 7 - Version 2.1
; 8 - Version 2.2
; 9 - Version 2.3
; 10 - Version 2.4

int function GetVersion()
	return 10
endFunction

; ---------- TWEAKS -----------
SRTUtilityScript Property SRTUtilityQuest Auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FISS Factory
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

import FISSFactory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Global variables
GlobalVariable property SR_Global_Reputation auto
GlobalVariable Property SR_Global_LawCrime Auto
GlobalVariable Property SR_Global_AedricDaedric Auto
GlobalVariable Property SR_Global_DependabilityAmbition Auto
GlobalVariable property SR_Global_VampireSuspicion auto
GlobalVariable property SR_Global_WerewolfSuspicion auto
GlobalVariable Property SR_DaedricAuras_Vampire Auto
GlobalVariable Property SR_DaedricAuras_Werewolf Auto
GlobalVariable Property SR_FactionAuras_Forsworn Auto
;Fame Threshold variables
GlobalVariable property SR_Global_CurrentFameLevel auto
;Scripts
SR_RQC_SCR Property SR_RQC_QST Auto
SR_Debug_Scr Property SR_RQC_Debug Auto
SR_Factions_DaedraWorshipperReset_Scr Property SR_Factions_Response_DaedraWorshipperReset Auto
SR_Factions_Dragonborn_Scr2 Property SR_Factions_Response_Thalmor Auto 
;Other
GlobalVariable Property SR_MCM_Reputation_Message Auto
;GlobalVariable Property SR_MCM_VampireCustomRaceActive Auto
GlobalVariable Property SR_MCM_MagicEffectToggle Auto
GlobalVariable Property SR_MCM_RepCalcLocChangeToggle Auto
GlobalVariable property SR_MCM_Factions_Thane_Whiterun auto
GlobalVariable property SR_MCM_DragonbornComments auto
GlobalVariable property SR_Global_ThaneInCurrentLocation auto
GlobalVariable Property SR_PluginEnabled_MoonlightTales Auto
;Skills
GlobalVariable property SR_MCM_DaedricAuras_Vampire auto
GlobalVariable property SR_MCM_DaedricAuras_Werewolf auto
GlobalVariable property SR_MCM_WiComment_Feared_Infamy auto
;Perks
GlobalVariable property SR_MCM_Perks_Allure auto
GlobalVariable property SR_MCM_Perks_Fence auto
GlobalVariable property SR_MCM_Perks_Intimidate auto
GlobalVariable property SR_MCM_Perks_PriceChanges auto
;Factions
GlobalVariable property CompBanGoldTotal auto
GlobalVariable property SR_MCM_Factions_Companions auto
GlobalVariable property SR_MCM_Factions_DarkBrotherhood auto
GlobalVariable property SR_MCM_Factions_Dawnguard auto
GlobalVariable property SR_MCM_Factions_Forsworn auto
GlobalVariable property SR_MCM_Factions_MageGuild auto
GlobalVariable property SR_MCM_Factions_Thalmor auto 
GlobalVariable property SR_MCM_Factions_ThievesGuild auto
GlobalVariable property SR_MCM_Factions_VigilOfStendarr auto
Faction Property WolfFaction Auto
;Notes
GlobalVariable property SR_MCM_Factions_CourierNotes auto
;NPC comments
GlobalVariable property SR_MCM_WiComment_Unknown auto
GlobalVariable property SR_MCM_WiComment_Bad auto
GlobalVariable property SR_MCM_WiComment_Good auto
GlobalVariable property SR_MCM_WiComment_Feared auto
GlobalVariable property SR_MCM_WiComment_Child auto
GlobalVariable property SR_MCM_WiComment_Thane auto
GlobalVariable property SR_MCM_WiComment_VampireWerewolf auto
;Guard comments
GlobalVariable property SR_MCM_WiComment_Guards auto
;NPC behaviour
GlobalVariable property SR_MCM_WiComment_Feared_AiPackage auto
GlobalVariable property SR_MCM_WiComment_VampireWerewolf_Hostile auto
GlobalVariable property SR_Global_WiCommentChanceWereVamp auto
;Override options
GlobalVariable property SR_MCM_Override_QuestsCompleted auto
GlobalVariable property SR_MCM_Override_Locations auto
GlobalVariable property SR_MCM_Override_Dungeons auto
GlobalVariable property SR_MCM_Override_PeopleKills auto
GlobalVariable property SR_MCM_Override_StoreInvestments auto
GlobalVariable property SR_MCM_Override_HousesOwned auto
GlobalVariable property SR_MCM_Override_DragonsKilled auto
GlobalVariable property SR_MCM_Override_DragonPriestsKilled auto
GlobalVariable property SR_MCM_Override_NecksBitten auto
GlobalVariable property SR_MCM_Override_VampiricSpellSeen auto
GlobalVariable property SR_MCM_Override_VampireLordTransformations auto
GlobalVariable property SR_MCM_Override_VampireLordSeen auto
GlobalVariable property SR_MCM_Override_VampireComments auto
GlobalVariable property SR_MCM_Override_WerewolfMauls auto
GlobalVariable property SR_MCM_Override_WerewolfTransformations auto
GlobalVariable property SR_MCM_Override_WerewolfFeeds auto
GlobalVariable property SR_MCM_Override_WerewolfSeen auto
GlobalVariable property SR_MCM_Override_WerewolfComments auto
GlobalVariable property SR_MCM_Override_WerewolfVampireTimeDecreament auto
GlobalVariable property SR_MCM_Override_SeenCrimeTimeDecreament auto
GlobalVariable property SR_MCM_Override_PettyCrimeSeen auto
GlobalVariable property SR_MCM_Override_AssaultsSeen auto
GlobalVariable property SR_MCM_Override_MurdersSeen auto
GlobalVariable property SR_MCM_Override_Murders auto
GlobalVariable property SR_MCM_Override_PocketsPicked auto
GlobalVariable property SR_MCM_Override_HorsesStolen auto
GlobalVariable property SR_MCM_Override_ItemsStolen auto
GlobalVariable property SR_MCM_Override_Trespasses auto
GlobalVariable property SR_MCM_Override_JailEscapes auto
GlobalVariable property SR_MCM_Override_DaysJailed auto
GlobalVariable property SR_MCM_Override_FinesPayed auto
GlobalVariable property SR_MCM_Override_ThievesGuildMisc auto
GlobalVariable property SR_MCM_Override_DarkBrotherhoodMisc auto
GlobalVariable property SR_MCM_Override_CompanionsMisc auto
GlobalVariable property SR_MCM_Override_CollegeMisc auto
GlobalVariable property SR_MCM_Override_Brawls auto
GlobalVariable property SR_MCM_Override_MiscQuests auto
GlobalVariable property SR_MCM_Override_CivilWar auto
GlobalVariable property SR_MCM_Override_WarriorSkill auto
GlobalVariable property SR_MCM_Override_Persuasions auto
GlobalVariable property SR_MCM_Override_Intimidations auto
GlobalVariable property SR_MCM_Override_Bribes auto
GlobalVariable property SR_MCM_Override_BooksRead auto
GlobalVariable property SR_MCM_Override_KillsUndead auto
GlobalVariable property SR_MCM_Override_KillsDaedra auto
GlobalVariable property SR_MCM_Override_KillsBandits auto
GlobalVariable property SR_MCM_Override_KillsWizards auto
GlobalVariable property SR_MCM_Override_KillsWitches auto
GlobalVariable property SR_MCM_Override_KillsForsworn auto
GlobalVariable property SR_MCM_Override_SoulsTrapped auto
GlobalVariable property SR_MCM_Override_BlackSoulTraps auto
GlobalVariable property SR_MCM_Override_Necromancy auto
GlobalVariable property SR_MCM_Override_SeenNecroTimeDecreament auto
GlobalVariable property SR_MCM_Override_ArcaneMastery auto
GlobalVariable property SR_MCM_Override_RestorationMagic auto
GlobalVariable property SR_MCM_Override_ConjugationMagic auto
GlobalVariable property SR_MCM_Override_CannibalFeed auto
GlobalVariable property SR_MCM_Override_CharityAdded auto
;Quests
Quest Property SR_Companions_JoinOverride Auto
Quest Property SR_Companions_Reparations Auto
Quest Property SR_Factions_Response_Forsworn Auto
Quest Property SR_Factions_Response_VampireAura Auto
Quest Property SR_Factions_Response_WerewolfAura Auto
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
; OTHER Properties
Int property CheatsEnabled = 0 auto
Int property ModMute = 0 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DISPLAY VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int			iReputationStatus
int			iReputationLevel
int			iWerewolfSuspicion	
int			iVampireSuspicion	
int			iPriceChangeStatus
int			iBarterPerkStatus
int			iInfluencePerkStatus
int			iDaedricPerks
int			iAedricLevel
int			iDaedricLevel
int			iLawLevel
int			iCrimeLevel
int			iDepLevel
int			iAmbLevel
int			iAura_Vampire
int			iAura_Werewolf
int			iAura_Infamy
int			iPerk_Allure
int			iPerk_Fence
int			iPerk_Intimidate
int			iPerk_Barter

int 		iMessageRep

int			iFaction_CourierNotes

int			iFaction_Companions
int			iFaction_DarkBrotherhood
int			iFaction_Dawnguard
int			iFaction_Forsworn
int			iFaction_MageGuild
int			iFaction_Thalmor
int			iFaction_ThievesGuild
int			iFaction_VigilOfStendarr

int			iComment_Unknown
int			iComment_Bad
int			iComment_Good
int			iComment_Feared
int			iComment_Guards
int			iComment_Thane
int			iComment_Child
int			iComment_VampireWerewolf

int			iBehavior_FearedPackage
int			iBehavior_GuardsDaedra

int			_FameDifficultyMenu_M
string[]	_FameDifficultyList

int			iOverrideMaxValueCap 

int			iOverrideQuestsCompleted
int			iOverrideLocations
int			iOverrideDungeons
int			iOverridePeopleKills
int			iOverrideStoreInvestments
int			iOverrideHousesOwned
int			iOverrideDragonsKilled
int			iOverrideDragonPriestsKilled

int			_VampWereDifficultyMenu_M
string[]	_VampWereDifficultyList
int			iOverrideWerewolfVampireTimeDec
int			iOverrideNecksBitten
int			iOverrideVampiricSpellSeen
int			iOverrideVampireLordTransformations
int			iOverrideVampireLordSeen
int			iOverrideVampireComments
int			iOverrideWerewolfMauls
int			iOverrideWerewolfFeeds
int			iOverrideWerewolfTransformations
int			iOverrideWerewolfSeen
int			iOverrideWerewolfComments

int			iOverrideSeenCrimeTimeDecreament
int			iOverridePettyCrimeSeen
int			iOverrideAssaultsSeen
int			iOverrideMurdersSeen
int			iOverrideMurders
int			iOverridePocketsPicked
int			iOverrideHorsesStolen
int			iOverrideItemsStolen
int			iOverrideTrespasses
int			iOverrideJailEscapes
int			iOverrideDaysJailed
int			iOverrideFinesPayed
int			iOverrideThievesGuildMisc
int			iOverrideDarkBrotherhoodMisc
int			iOverrideCompanionsMisc
int			iOverrideCollegeMisc
int			iOverrideBrawls
int			iOverrideMiscQuests
int			iOverrideCivilWar
int			iOverrideWarriorSkill
int			iOverridePersuasions
int			iOverrideIntimidations
int			iOverrideBribes
int			iOverrideBooksRead
int			iOverrideKillsUndead
int			iOverrideKillsDaedra
int			iOverrideKillsBandits
int			iOverrideKillsWizards
int			iOverrideKillsWitches
int			iOverrideKillsForsworn
int			iOverrideSoulsTrapped
int			iOverrideBlackSoulTraps
int			iOverrideNecromancySeen
int			iOverrideSeenNecroTimeDecreament
int			iOverrideArcaneMastery
int			iOverrideRestorationMagic
int			iOverrideConjugationMagic
int			iOverrideCannibalFeed
int			iOverrideCharityAdded

int			iDaedricQuestPerc
int			iVampirismPerc
int			iLycanthropyPerc
int			iNecksBittenPerc
int			iVampiricSpellSeenPerc
int			iVampireLordTransPerc
int			iVampireLordSeenPerc
int			iVampireCommentsPerc
int			iVampireGuardPerc
int			iWerewolfTimesPerc
int			iWerewolfMaulsPerc
int			iWerewolfFeedsPerc
int			iWerewolfSpottedPerc
int			iWerewolfCommentsPerc
int			iWerewolfGuardPerc
int			iCannibalFeedPerc
int			iConjurationPerc
int			iCrimeQuestPerc	
int			iSeenMurdersPerc
int			iSeenAssaultPerc
int			iSeenCrimePerc
int			iMurdersPerc
int			iHorseTheftPerc
int			iTheftPerc
int			iPocketsPerc
int			iTresspassesPerc
int			iJailEscPerc
int			iJailTimePerc
int			iFinesPayedPerc
int			iThievesGuildPerc
int			iDarkBroPerc
int			iAmbitionQuestPerc
int			iIntimidationPerc
int			iNecroTimesPerc
int			iBribePerc
int			iCoWPerc
int			iBooksPerc
int			iSoulTrapPerc
int			iBlackSoulTrapPerc
int			iArcaneMasteryPerc
int			iAedricQuestPerc
int			iUndeadKillsPerc
int			iDaedraKillsPerc
int			iRestorationPerc
int			iCharityAddedPerc
int			iLawQuestPerc
int			iCompQuestPerc
int			iBanditKillsPerc
int			iWizardKillsPerc
int			iWitchKillsPerc
int			iForswornKillsPerc
int			iDependQuestPerc
int			iMiscQuestsPerc
int			iPersuasionPerc
int			iBrawlPerc
int			iCivilWarPerc
int			iWarriorSkillPerc
int			iQuestFamePerc
int			iLocationFamePerc
int			iDungeonFamePerc
int			iKillsFamePerc
int			iStoreFamePerc
int			iPropertyFamePerc
int			iDragonKillPerc
int			iDragonPriestKillPerc

int			iEnableCheats
int			iMuteMod
int			iForceRep
int			iFameCounterUp
int			iFameCounterDown
int			iAedricCounterUp
int			iAedricCounterDown
int			iDaedricCounterUp
int			iDaedricCounterDown
int			iLawCounterUp
int			iLawCounterDown
int			iCrimeCounterUp
int			iCrimeCounterDown
int			iDepCounterUp
int			iDepCounterDown
int			iAmbCounterUp
int			iAmbCounterDown
int			iResetTimeDec
int			iSliderBanditKills
int			iSliderNecroTImes
int			iSliderWerewolfSeen
int			iSliderSeenMurders
int			iSliderSeenAssaults
int			iSliderSeenTheft
int			iSliderVampiricSpellSeen
int			iSliderVampireLordTrans
int			iSliderVampireLordSeen
int			iSliderVampireComments
int			iSliderVampireGuard
int			iSliderWerewolfMauls
int			iSliderWerewolfFeeds
int			iSliderWerewolfComments
int			iSliderWerewolfGuard
int			iSliderDragonKills
int			iSliderDragonPriestKills
int			iSliderWizardKills
int			iSliderWitchKills
int			iSliderForswornKills
int			iSliderBlackSoulTrap
int			iSliderCannibalFeed
int			iSliderCharityAdded
int			iResetMod
int			iResetCrimes
int			iResetMagic
int			iResetExternaContent
int			iResetAllResets

;int			iVampireCustomRaceActive
int			iDragonbornComments
int			iThaneWhiterun
int			iSlowCalculations
int			iMoonlightTales
int			OID_LoadPreset
int			OID_SavePreset

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; STATE VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

bool		bAura_Vampire						= true
bool		bAura_Werewolf						= true
bool		bAura_Infamy						= true
bool		bPerk_Allure						= true
bool		bPerk_Fence							= true
bool		bPerk_Intimidate					= true
bool		bPerk_Barter						= true
bool		bMessageRep							= false

bool		bComment_Unknown					= true
bool		bComment_Bad						= true
bool		bComment_Good						= true
bool		bComment_Feared						= true
bool		bComment_Guards						= true
bool		bComment_Thane						= true
bool		bComment_Child						= true
bool		bComment_VampireWerewolf			= true

bool		bFaction_CourierNotes				= true
bool		bFaction_Companions					= true
bool		bFaction_DarkBrotherhood			= true
bool		bFaction_Dawnguard					= true
bool		bFaction_Forsworn					= true
bool		bFaction_MageGuild					= true
bool		bFaction_Thalmor					= true
bool		bFaction_ThievesGuild				= true
bool		bFaction_VigilOfStendarr			= true

bool		bBehavior_FearedPackage				= true
bool		bBehavior_GuardsDaedra				= true

int			_curFameDifficulty					= 1
bool		bOverrideMaxValueCap				= true
bool		bOverrideQuestsCompleted			= true
bool		bOverrideLocations					= true
bool		bOverrideDungeons					= true
bool		bOverridePeopleKills				= true
bool		bOverrideStoreInvestments			= true
bool		bOverrideHousesOwned				= true
bool		bOverrideDragonsKilled				= true
bool		bOverrideDragonPriestsKilled		= true

int			_curVampWereDifficulty				= 1
bool		bOverrideWerewolfVampireTimeDec		= true
bool		bOverrideNecksBitten				= true
bool		bOverrideVampiricSpellSeen			= true
bool		bOverrideVampireLordTransformations	= true
bool		bOverrideVampireLordSeen			= true
bool		bOverrideVampireComments			= true
bool		bOverrideWerewolfMauls				= true
bool		bOverrideWerewolfFeeds				= true
bool		bOverrideWerewolfTransformations	= true
bool		bOverrideWerewolfSeen				= true
bool		bOverrideWerewolfComments			= true

bool		bOverrideSeenCrimeTimeDecreament	= true
bool		bOverridePettyCrimeSeen				= true
bool		bOverrideAssaultsSeen				= true
bool		bOverrideMurdersSeen				= true
bool		bOverrideMurders					= true
bool		bOverridePocketsPicked				= true
bool		bOverrideHorsesStolen				= true
bool		bOverrideItemsStolen				= true
bool		bOverrideTrespasses					= true
bool		bOverrideJailEscapes				= true
bool		bOverrideDaysJailed					= true
bool		bOverrideFinesPayed					= true
bool		bOverrideThievesGuildMisc			= true
bool		bOverrideDarkBrotherhoodMisc		= true
bool		bOverrideCompanionsMisc				= true
bool		bOverrideCollegeMisc				= true
bool		bOverrideBrawls						= true
bool		bOverrideMiscQuests					= true
bool		bOverrideCivilWar					= true
bool		bOverrideWarriorSkill				= true
bool		bOverridePersuasions				= true
bool		bOverrideIntimidations				= true
bool		bOverrideBribes						= true
bool		bOverrideBooksRead					= true
bool		bOverrideKillsUndead				= true
bool		bOverrideKillsDaedra				= true
bool		bOverrideKillsBandits				= true
bool		bOverrideKillsWizards				= true
bool		bOverrideKillsWitches				= true
bool		bOverrideKillsForsworn				= true
bool		bOverrideSoulsTrapped				= true
bool		bOverrideBlackSoulTraps				= true
bool		bOverrideNecromancySeen				= true
bool		bOverrideSeenNecroTimeDecreament	= true
bool		bOverrideArcaneMastery				= true
bool		bOverrideRestorationMagic			= true
bool		bOverrideConjugationMagic			= true
bool		bOverrideCannibalFeed				= true
bool		bOverrideCharityAdded				= true

bool		bEnableCheats						= False
bool		bMuteMod							= False
bool		bForceRep							= False
int			bFameCounterUp						= 0
int			bFameCounterDown					= 0
int			bAedricCounterUp					= 0
int			bAedricCounterDown					= 0
int			bDaedricCounterUp					= 0
int			bDaedricCounterDown					= 0
int			bLawCounterUp						= 0
int			bLawCounterDown						= 0
int			bCrimeCounterUp						= 0
int			bCrimeCounterDown					= 0
int			bDepCounterUp						= 0
int			bDepCounterDown						= 0
int			bAmbCounterUp						= 0
int			bAmbCounterDown						= 0

float		fSliderDragonKills					= 0.0
float		fSliderDragonPriestKills			= 0.0
float		fSliderBanditKills					= 0.0
float		fSliderWizardKills					= 0.0
float		fSliderWitchKills					= 0.0
float		fSliderForswornKills				= 0.0
float		fSliderNecroTImes					= 0.0
float		fSliderWerewolfSeen					= 0.0
float		fSliderSeenMurders					= 0.0
float		fSliderSeenAssaults					= 0.0
float		fSliderSeenTheft					= 0.0
float		fSliderVampiricSpellSeen			= 0.0
float		fSliderVampireLordTrans				= 0.0
float		fSliderVampireLordSeen				= 0.0
float		fSliderVampireComments				= 0.0
float		fSliderVampireGuard					= 0.0
float		fSliderWerewolfFeeds				= 0.0
float		fSliderWerewolfComments				= 0.0
float		fSliderWerewolfGuard				= 0.0
float		fSliderBlackSoulTrap				= 0.0
float		fSliderCannibalFeed					= 0.0
float		fSliderCharityAdded					= 0.0

bool		bDragonbornComments					= True
bool		bThaneWhiterun						= False
bool		bSlowCalculations					= False
bool		bMoonlightTales						= False

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INITIALIZATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; @overrides SKI_ConfigBase
event OnConfigInit()
	Pages = new string[6]
	Pages[0] = "Status"
	Pages[1] = "Statistics"
	Pages[2] = "Output Options"
	Pages[3] = "Input Options"
	Pages[4] = "Control Panel"
	Pages[5] = "Debug"
	
	_FameDifficultyList = new string[3]
	_FameDifficultyList[0] = "Watchful"
	_FameDifficultyList[1] = "Regular"
	_FameDifficultyList[2] = "Indifferent"
	
	_VampWereDifficultyList = new string[3]
	_VampWereDifficultyList[0] = "Suspicious"
	_VampWereDifficultyList[1] = "Regular"
	_VampWereDifficultyList[2] = "Oblivious"
	
	
endEvent


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PAGE DISPLAY EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Int Function AddBoolGlobal(String toggleName, GlobalVariable booleanGlobal)
{ Use a global as a boolean for a toggle option }
	Bool enabled
	If booleanGlobal.GetValue() == 1.0
		enabled = True
	Else
		enabled = False
	EndIf
	
	Return AddToggleOption(toggleName, enabled)
EndFunction

GlobalVariable Property SR_PluginEnabled_SkyrimUnbound Auto
Int srt_iUnbound

GlobalVariable Property SRTUseGDO Auto
Int srt_iGDO

FormList Property SRTGreyCowlList Auto
Int srt_iGreyCowl

GlobalVariable Property SRTFameMult Auto
GlobalVariable Property SRTAedricMult Auto
GlobalVariable Property SRTDaedricMult Auto
GlobalVariable Property SRTDependabilityMult Auto
GlobalVariable Property SRTAmbitionMult Auto
GlobalVariable Property SRTLawMult Auto
GlobalVariable Property SRTCrimeMult Auto
GlobalVariable Property SRTVampireMult Auto
GlobalVariable Property SRTWerewolfMult Auto
GlobalVariable Property SRTRacismMult Auto

GlobalVariable Property SRTLoadScreens Auto

Int srt_iFameMult
Int srt_iAedricMult
Int srt_iDaedricMult
Int srt_iDependabilityMult
Int srt_iAmbitionMult
Int srt_iLawMult
Int srt_iCrimeMult
Int srt_iVampireMult
Int srt_iWerewolfMult
Int srt_iRacismMult

Int srt_iLoadScreens

; @implements SKI_ConfigBase
event OnPageReset(string a_page)
	{Called when a new page is selected, including the initial empty page}

	If (a_page == "Status")
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		int ModMutedFlag
		if(ModMute == 0)
			ModMutedFlag = OPTION_FLAG_NONE
		else
			ModMutedFlag = OPTION_FLAG_DISABLED
		endif
		
		AddHeaderOption("Reputation Status", ModMutedFlag)
		iReputationStatus 		= AddTextOption("Reputation:", CurrentReputation(), ModMutedFlag)
		iReputationLevel 		= AddTextOption("Fame Level:", ReputationLevel(), ModMutedFlag)
		AddEmptyOption()
		
		AddHeaderOption("Suspicion Status", ModMutedFlag)
		iWerewolfSuspicion		= AddTextOption("Werewolf Suspicion:", CurrentWerewolfSuspicion(), ModMutedFlag)
		iVampireSuspicion		= AddTextOption("Vampire Suspicion:", CurrentVampireSuspicion(), ModMutedFlag)
		AddEmptyOption()
		
		AddHeaderOption("Reputation Perks", ModMutedFlag)
		iPriceChangeStatus 		= AddTextOption("Base Price:", BarterString(), ModMutedFlag)
		iBarterPerkStatus 		= AddTextOption("Barter Perks:", AllureString()+FenceString(), ModMutedFlag)
		iInfluencePerkStatus 	= AddTextOption("Influence Perks:", InfamyString()+IntimidateString(), ModMutedFlag)
		;iDaedricPerks 			= AddTextOption("Daedric Perks:", UndeadAuraString()+AlphaGazeString(), ModMutedFlag)
	
		SetCursorPosition(1)
		
		AddHeaderOption("Devotion", ModMutedFlag)
		iAedricLevel 			= AddTextOption("Aedric Devotion:", AedricPercentage()+"%", ModMutedFlag)
		iDaedricLevel 			= AddTextOption("Daedric Taint:", DaedricPercentage()+"%", ModMutedFlag)
		AddEmptyOption()
		
		AddHeaderOption("Lawfulness", ModMutedFlag)
		iLawLevel 				= AddTextOption("Law", LawPercentage()+"%", ModMutedFlag)
		iCrimeLevel 			= AddTextOption("Crime:", CrimePercentage()+"%", ModMutedFlag)
		AddEmptyOption()
		
		AddHeaderOption("Proclivity", ModMutedFlag)
		iDepLevel 				= AddTextOption("Dependable:", DependabilityPercentage()+"%", ModMutedFlag)
		iAmbLevel 				= AddTextOption("Power-hungry:", AmbitionPercentage()+"%", ModMutedFlag)
		
	Elseif (a_page == "Statistics")
		SetCursorFillMode(TOP_TO_BOTTOM)

		AddHeaderOption("Aedric-Devotion Points Collected")
		iAedricQuestPerc		= AddTextOption("Aedric Choices:", QuestAedricPercentage()+"%")
		iUndeadKillsPerc		= AddTextOption("Undead Killed:", SR_RQC_QST.UndeadKilledScore()+" ("+UndeadKilledPercentage()+"%)")
		iDaedraKillsPerc		= AddTextOption("Daedra Killed:", SR_RQC_QST.DaedraKilledScore()+" ("+DaedraKilledPercentage()+"%)")
		iCharityAddedPerc		= AddTextOption("Charity:", SR_RQC_QST.CharityScore()+" ("+CharityPercentage()+"%)")		
		iRestorationPerc		= AddTextOption("Healer:", RestorationPercentage()+"%")
		AddEmptyOption()		

		AddHeaderOption("Lycanthropy")
		iWerewolfFeedsPerc		= AddTextOption("Hearts Eaten:", WerewolfFeedingCurrentScore())
		iWerewolfTimesPerc		= AddTextOption("Werewolf Transformations:", WerewolfTransformationCurrentScore())
		iWerewolfMaulsPerc		= AddTextOption("Werewolf Mauls:", WerewolfMaulCurrentScore())
		iWerewolfSpottedPerc	= AddTextOption("Beast Form Seen:", WerewolfSpottedCurrentScore())
		iWerewolfCommentsPerc	= AddTextOption("Werewolf Suspicions:", CommentWerewolfVillagerCurrentScore())
		iWerewolfGuardPerc		= AddTextOption("Werewolf Accusations:", CommentWerewolfGuardCurrentScore())		
		AddEmptyOption()
		
		AddHeaderOption("Lawfulness Points Collected")
		iLawQuestPerc			= AddTextOption("Lawful Choices:", QuestLawPercentage()+"%")
		iCompQuestPerc			= AddTextOption("The Companions:", SR_RQC_QST.CompanionsScore()+" ("+CompanionsPercentage()+"%)")
		iBanditKillsPerc		= AddTextOption("Bandits Killed:", SR_RQC_QST.BanditKillerScore()+" ("+BanditKillerPercentage()+"%)")
		iForswornKillsPerc		= AddTextOption("Forsworn Killed:", SR_RQC_QST.ForswornKillerScore()+" ("+ForswornKillerPercentage()+"%)")
		iWizardKillsPerc		= AddTextOption("Warlocks Killed:", SR_RQC_QST.WizardKillerScore()+" ("+WizardKillerPercentage()+"%)")
		iWitchKillsPerc			= AddTextOption("Witches Killed:", SR_RQC_QST.WitchKillerScore()+" ("+WitchKillerPercentage()+"%)")
		iFinesPayedPerc			= AddTextOption("Gold Payed in Fines:", SR_RQC_QST.FinesPayedScore()+" ("+FinesPayedPercentage()+"%)")
		iJailTimePerc			= AddTextOption("Jail Time Served:", SR_RQC_QST.DaysJailedScore()+" ("+JailTimeServedPercentage()+"%)")
		AddEmptyOption()
		
		AddHeaderOption("Dependability Points Collected")
		iDependQuestPerc		= AddTextOption("Dependable Choices:", QuestDependPercentage()+"%")
		iMiscQuestsPerc			= AddTextOption("Minor Favors:", SR_RQC_QST.MiscQuestsScore()+" ("+MiscQuestsPercentage()+"%)")
		iPersuasionPerc			= AddTextOption("Persuasions:", SR_RQC_QST.PersuasionScore()+" ("+PersuasionPercentage()+"%)")
		iCivilWarPerc			= AddTextOption("Civil War:", SR_RQC_QST.CivilWarQuestsScore()+" ("+CivilWarQuestsPercentage()+"%)")
		iBrawlPerc 				= AddTextOption("Brawls Won:", SR_RQC_QST.BrawlsWonScore()+" ("+BrawlsWonPercentage()+"%)")
		iWarriorSkillPerc		= AddTextOption("Warrior Skill:", WarriorSkillPercentage()+"%")
		AddEmptyOption()
		
		AddHeaderOption("Fame Points Collected")
		iQuestFamePerc			= AddTextOption("Quest Fame:", QuestFamePercentage()+"%")
		iDragonKillPerc			= AddTextOption("Dragons Killed:", SR_RQC_QST.DragonKillScore()+" ("+DragonKillsPercentage()+"%)")
		iDragonPriestKillPerc	= AddTextOption("Dragon-priests Killed:", SR_RQC_QST.DragonPriestKillScore()+" ("+DragonPriestKillsPercentage()+"%)")
		iLocationFamePerc		= AddTextOption("Location Visits:", SR_RQC_QST.LocationsScore()+" ("+LocationFamePercentage()+"%)")
		iDungeonFamePerc		= AddTextOption("Dungeons Cleared:", SR_RQC_QST.DungeonsScore()+" ("+DungeonsPercentage()+"%)")
		iKillsFamePerc			= AddTextOption("People Killed:", SR_RQC_QST.KillScore()+" ("+KillPercentage()+"%)")
		iStoreFamePerc			= AddTextOption("Store Investments:", SR_RQC_QST.StoreInvestmentScore()+" ("+StoreInvestmentPercentage()+"%)")
		iPropertyFamePerc		= AddTextOption("Properties Owned:", SR_RQC_QST.HousesOwnedScore()+" ("+HousesOwnedPercentage()+"%)")
		AddEmptyOption()
		
		SetCursorPosition(1)
		
		AddHeaderOption("Daedric-taint Points Collected")
		iDaedricQuestPerc		= AddTextOption("Daedric Choices:", QuestDaedricPercentage()+"%")
		If SRTUtilityQuest.PapyrusExtenderInstalled
			iCannibalFeedPerc		= AddTextOption("Cannibalism:", SR_RQC_QST.CannibalFeedScore()+" ("+CannibalFeedPercentage()+"%)")
		EndIf
		iLycanthropyPerc		= AddTextOption("Lycanthropy:", LycanthropyPercentage()+"%")
		iVampirismPerc			= AddTextOption("Vampirism:", VampirismPercentage()+"%")
		iConjurationPerc		= AddTextOption("Summoner:", ConjurationPercentage()+"%")
		AddEmptyOption()
		AddEmptyOption()		
		
		AddHeaderOption("Vampirism")
		iNecksBittenPerc		= AddTextOption("Necks Bitten:", NecksBittenCurrentScore())
		iVampireLordTransPerc	= AddTextOption("Vampire Lord Transformations:", VampireLordTransformationCurrentScore())
		iVampiricSpellSeenPerc	= AddTextOption("Blood Magic Seen:", VampiricSpellSeenCurrentScore())
		iVampireLordSeenPerc	= AddTextOption("Vampiric Form Seen:", VampireLordSeenCurrentScore())
		iVampireCommentsPerc	= AddTextOption("Vampire Suspicions:", CommentVampireVillagerCurrentScore())
		iVampireGuardPerc		= AddTextOption("Vampire Accusations:", CommentVampireGuardCurrentScore())
		AddEmptyOption()
		
		AddHeaderOption("Crime Points Collected")
		iCrimeQuestPerc			= AddTextOption("Criminal Choices:", QuestCrimePercentage()+"%")
		iThievesGuildPerc		= AddTextOption("Thieves Guild:", SR_RQC_QST.ThievesGuildeScore()+" ("+ThievesGuildePercentage()+"%)")
		iDarkBroPerc			= AddTextOption("Dark Brotherhood:", SR_RQC_QST.DarkBrotherhoodScore()+" ("+DarkBrotherhoodPercentage()+"%)")
		iTheftPerc				= AddTextOption("Thefts:", SR_RQC_QST.ItemsStolenScore()+" ("+ItemsStolenPercentage()+"%)")
		iPocketsPerc			= AddTextOption("Pockets Picked:", SR_RQC_QST.PocketsPickedScore()+" ("+PocketsPickedPercentage()+"%)")
		iTresspassesPerc		= AddTextOption("Tresspasses:", SR_RQC_QST.TrespassScore()+" ("+TrespassPercentage()+"%)")		
		iHorseTheftPerc			= AddTextOption("Horse Thefts:", SR_RQC_QST.HorsesStolenScore()+" ("+HorsesStolenPercentage()+"%)")
		iJailEscPerc			= AddTextOption("Jail Escapes:", SR_RQC_QST.JailEscapeScore()+" ("+JailEscapePercentage()+"%)")
		iMurdersPerc			= AddTextOption("Murders:", SR_RQC_QST.MurderScore()+" ("+MurderPercentage()+"%)")
		iSeenCrimePerc			= AddTextOption("Petty Crime Bounties:", PettyCrimeSpottedCurrentScore())
		iSeenAssaultPerc		= AddTextOption("Assault Bounties:", AssaultCurrentScore())
		iSeenMurdersPerc		= AddTextOption("Murder Bounties:", SeenMurderCurrentScore())
		AddEmptyOption()

		AddHeaderOption("Power-hunger Points Collected")
		iAmbitionQuestPerc		= AddTextOption("Power-hungry Choices:", QuestAmbitionPercentage()+"%")
		iIntimidationPerc		= AddTextOption("Intimidations:", SR_RQC_QST.IntimidationScore()+" ("+IntimidationPercentage()+"%)")
		iBribePerc				= AddTextOption("Bribes:", SR_RQC_QST.BribeScore()+" ("+BribePercentage()+"%)")
		; Requires papyrus extender
		If SRTUtilityQuest.PapyrusExtenderInstalled
			iBlackSoulTrapPerc		= AddTextOption("Black Souls Trapped:", SR_RQC_QST.BlackSoulTrapScore()+" ("+BlackSoulTrapPercentage()+"%)")
		EndIf
		iSoulTrapPerc			= AddTextOption("Total Souls Trapped:", SR_RQC_QST.SoulsTrappedScore()+" ("+SoulsTrappedPercentage()+"%)")
		iBooksPerc				= AddTextOption("Books Read:", SR_RQC_QST.BooksReadScore()+" ("+BooksReadPercentage()+"%)")
		iCoWPerc				= AddTextOption("College of Winterhold:", SR_RQC_QST.CollegeWinterholdScore()+" ("+CollegeWinterholdPercentage()+"%)")
		iArcaneMasteryPerc		= AddTextOption("Arcane Mastery:", ArcaneMasteryPercentage()+"%")
		iNecroTimesPerc			= AddTextOption("Necromancy Seen:", NecroTimesCurrentScore())
		AddEmptyOption()
		
	Elseif (a_page == "Output Options")
		CheckOutputOptionBoolValues()
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		int ModMutedFlag
		if(ModMute == 0)
			ModMutedFlag = OPTION_FLAG_NONE
		else
			ModMutedFlag = OPTION_FLAG_DISABLED
		endif
		
		AddHeaderOption("Notification Settings", ModMutedFlag)
		iMessageRep			= AddToggleOption("Rep. Change Notifications", bMessageRep, ModMutedFlag)
		AddEmptyOption()
				
		AddHeaderOption("Citizen Comments", ModMutedFlag)
		iComment_Unknown			= AddToggleOption("Dismissive Comments", bComment_Unknown, ModMutedFlag)
		iComment_Good				= AddToggleOption("Positive Comments", bComment_Good, ModMutedFlag)
		iComment_Bad				= AddToggleOption("Negative Comments", bComment_Bad, ModMutedFlag)
		iComment_Feared				= AddToggleOption("Scared Comments", bComment_Feared, ModMutedFlag)
		iComment_Thane				= AddToggleOption("Thane Comments", bComment_Thane, ModMutedFlag)
		iComment_VampireWerewolf	= AddToggleOption("Vampire/Werewolf Comments", bComment_VampireWerewolf, ModMutedFlag)
		iComment_Child				= AddToggleOption("Child Comments", bComment_Child, ModMutedFlag)
		AddEmptyOption()
		
		AddHeaderOption("Guard Comments", ModMutedFlag)
		iComment_Guards				= AddToggleOption("Guard Comments", bComment_Guards, ModMutedFlag)
		AddEmptyOption()
		
		AddHeaderOption("Behaviors", ModMutedFlag)
		iBehavior_FearedPackage		= AddToggleOption("Scared Behavior", bBehavior_FearedPackage, ModMutedFlag)
		iBehavior_GuardsDaedra		= AddToggleOption("Hostility to Vampires/Werewolves", bBehavior_GuardsDaedra, ModMutedFlag)
		AddEmptyOption()
				
		SetCursorPosition(1)
		
		AddHeaderOption("Faction Reactions", ModMutedFlag)
		iFaction_Companions			= AddToggleOption("Companions", bFaction_Companions, ModMutedFlag)
		iFaction_Dawnguard			= AddToggleOption("Dawnguard", bFaction_Dawnguard, ModMutedFlag)
		iFaction_Forsworn			= AddToggleOption("Forsworn", bFaction_Forsworn, ModMutedFlag)
		iFaction_Thalmor			= AddToggleOption("Thalmor", bFaction_Thalmor, ModMutedFlag)
		iFaction_VigilOfStendarr	= AddToggleOption("Vigil of Stendarr", bFaction_VigilOfStendarr, ModMutedFlag)
		AddEmptyOption()
			
		AddHeaderOption("Courier Notes", ModMutedFlag)
		iFaction_CourierNotes		= AddToggleOption("Courier Notes ON/OFF", bFaction_CourierNotes, ModMutedFlag)
		iFaction_MageGuild			= AddToggleOption("College of Winterhold", bFaction_MageGuild, ModMutedFlag)
		iFaction_DarkBrotherhood	= AddToggleOption("Dark Brotherhood", bFaction_DarkBrotherhood, ModMutedFlag)
		iFaction_ThievesGuild		= AddToggleOption("Thieves Guild", bFaction_ThievesGuild, ModMutedFlag)
		AddEmptyOption()

		AddHeaderOption("Reputation Perks", ModMutedFlag)
		iPerk_Barter				= AddToggleOption("Barter", bPerk_Barter, ModMutedFlag)
		iPerk_Allure				= AddToggleOption("Allure", bPerk_Allure, ModMutedFlag)
		iPerk_Fence					= AddToggleOption("Fence", bPerk_Fence, ModMutedFlag)
		iPerk_Intimidate			= AddToggleOption("Intimidate", bPerk_Intimidate, ModMutedFlag)
		iAura_Infamy				= AddToggleOption("Infamy", bAura_Infamy, ModMutedFlag)		
		iAura_Vampire				= AddToggleOption("Undead Aura", bAura_Vampire, ModMutedFlag)
		iAura_Werewolf				= AddToggleOption("Beastly Aspect", bAura_Werewolf, ModMutedFlag)		
		AddEmptyOption()
		
	Elseif (a_page == "Input Options")
		CheckInputOptionBoolValues()
		SetCursorFillMode(TOP_TO_BOTTOM)	
		
		AddHeaderOption("Global settings")
		_FameDifficultyMenu_M 				= AddMenuOption("Reputation Gain Setting", _FameDifficultyList[_curFameDifficulty])
		_VampWereDifficultyMenu_M 			= AddMenuOption("Suspicion Gain Setting", _VampWereDifficultyList[_curVampWereDifficulty])
		iOverrideMaxValueCap				= AddToggleOption("Point-Contributions Capped", bOverrideMaxValueCap)
		AddEmptyOption()

		AddHeaderOption("Aedric Devotion")
		iOverrideKillsUndead				= AddToggleOption("Undead Killed", bOverrideKillsUndead)
		iOverrideKillsDaedra				= AddToggleOption("Daedra Killed", bOverrideKillsDaedra)
		iOverrideCharityAdded				= AddToggleOption("Charity", bOverrideCharityAdded)
		iOverrideRestorationMagic			= AddToggleOption("Healer", bOverrideRestorationMagic)
		AddEmptyOption()

		AddHeaderOption("Lycanthropy")
		iOverrideWerewolfFeeds				= AddToggleOption("Hearts Eaten", bOverrideWerewolfFeeds)
		iOverrideWerewolfTransformations	= AddToggleOption("Werewolf Transformations", bOverrideWerewolfTransformations)		
		iOverrideWerewolfMauls				= AddToggleOption("Werewolf Mauls", bOverrideWerewolfMauls)
		iOverrideWerewolfSeen				= AddToggleOption("Beast Form Seen", bOverrideWerewolfSeen)
		iOverrideWerewolfComments			= AddToggleOption("Werewolf Accusations", bOverrideWerewolfComments)
		AddEmptyOption()
		
		AddHeaderOption("Law")
		iOverrideCompanionsMisc				= AddToggleOption("Companions Quests Completed", bOverrideCompanionsMisc)
		iOverrideKillsBandits				= AddToggleOption("Bandits Killed", bOverrideKillsBandits)
		iOverrideKillsForsworn				= AddToggleOption("Forsworn Killed", bOverrideKillsForsworn)
		iOverrideKillsWizards				= AddToggleOption("Warlocks Killed", bOverrideKillsWizards)
		iOverrideKillsWitches				= AddToggleOption("Witches Killed", bOverrideKillsWitches)
		iOverrideFinesPayed					= AddToggleOption("Gold Paid in Fines", bOverrideFinesPayed)
		iOverrideDaysJailed					= AddToggleOption("Days Jailed", bOverrideDaysJailed)
		AddEmptyOption()	

		AddHeaderOption("Dependability")
		iOverrideMiscQuests					= AddToggleOption("Misc. Quests", bOverrideMiscQuests)
		iOverridePersuasions				= AddToggleOption("Persuasions", bOverridePersuasions)
		iOverrideCivilWar					= AddToggleOption("Civil War Quests", bOverrideCivilWar)
		iOverrideBrawls						= AddToggleOption("Brawls Won", bOverrideBrawls)
		iOverrideWarriorSkill				= AddToggleOption("Warrior Skill", bOverrideWarriorSkill)
		AddEmptyOption()
		
		AddHeaderOption("Fame")
		;iOverrideQuestsCompleted			= AddToggleOption("Quests Completed", bOverrideQuestsCompleted)
		iOverrideDragonsKilled				= AddToggleOption("Dragons Killed", bOverrideDragonsKilled)
		iOverrideDragonPriestsKilled		= AddToggleOption("Dragon-priests Killed", bOverrideDragonPriestsKilled)
		iOverrideLocations					= AddToggleOption("Locations Discovered", bOverrideLocations)
		iOverrideDungeons					= AddToggleOption("Dungeons Cleared", bOverrideDungeons)
		iOverridePeopleKills				= AddToggleOption("People Killed", bOverridePeopleKills)
		iOverrideStoreInvestments			= AddToggleOption("Stores Invested In", bOverrideStoreInvestments)
		iOverrideHousesOwned				= AddToggleOption("Houses Owned", bOverrideHousesOwned)
		AddEmptyOption()	
		
		SetCursorPosition(1)

		AddHeaderOption("Stats Decrease Gradually?")		
		iOverrideWerewolfVampireTimeDec		= AddToggleOption("Vamp/Were Suspicion", bOverrideWerewolfVampireTimeDec)
		iOverrideSeenCrimeTimeDecreament	= AddToggleOption("Seen Crime", bOverrideSeenCrimeTimeDecreament)
		iOverrideSeenNecroTimeDecreament	= AddToggleOption("Seen Necromancy", bOverrideSeenNecroTimeDecreament)
		AddEmptyOption()
		
		AddHeaderOption("Daedric Taint")
		If SRTUtilityQuest.PapyrusExtenderInstalled
			iOverrideCannibalFeed				= AddToggleOption("Cannibalism", bOverrideCannibalFeed)
		EndIf
		iOverrideConjugationMagic			= AddToggleOption("Summoner", bOverrideConjugationMagic)
		AddEmptyOption()
	
		AddHeaderOption("Vampirism")
		iOverrideNecksBitten				= AddToggleOption("Necks Bitten", bOverrideNecksBitten)
		iOverrideVampireLordTransformations	= AddToggleOption("Vampire Lord Transformations", bOverrideVampireLordTransformations)
		iOverrideVampiricSpellSeen			= AddToggleOption("Blood Magic Seen", bOverrideVampiricSpellSeen)
		iOverrideVampireLordSeen			= AddToggleOption("Vampiric Form Seen", bOverrideVampireLordSeen)
		iOverrideVampireComments			= AddToggleOption("Vampire Accusations", bOverrideVampireComments)
		AddEmptyOption()
		
		AddHeaderOption("Crime")
		iOverrideThievesGuildMisc			= AddToggleOption("Misc. Thieves Guild Quests", bOverrideThievesGuildMisc)
		iOverrideDarkBrotherhoodMisc		= AddToggleOption("Misc. Dark Brotherhood Quests", bOverrideDarkBrotherhoodMisc)
		iOverrideItemsStolen				= AddToggleOption("Items Stolen", bOverrideItemsStolen)
		iOverridePocketsPicked				= AddToggleOption("Pockets Picked", bOverridePocketsPicked)
		iOverrideTrespasses					= AddToggleOption("Trespasses", bOverrideTrespasses)
		iOverrideHorsesStolen				= AddToggleOption("Horses Stolen", bOverrideHorsesStolen)
		iOverrideJailEscapes				= AddToggleOption("Jail Escapes", bOverrideJailEscapes)
		iOverrideMurders					= AddToggleOption("Total Murders", bOverrideMurders)
		iOverridePettyCrimeSeen				= AddToggleOption("Seen Petty Crimes", bOverridePettyCrimeSeen)	
		iOverrideAssaultsSeen				= AddToggleOption("Seen Assaults", bOverrideAssaultsSeen)
		iOverrideMurdersSeen				= AddToggleOption("Seen Murders", bOverrideMurdersSeen)
		AddEmptyOption()
		
		AddHeaderOption("Power-hunger")
		iOverrideIntimidations				= AddToggleOption("Intimidations", bOverrideIntimidations)
		iOverrideBribes						= AddToggleOption("Bribes", bOverrideBribes)
		iOverrideNecromancySeen				= AddToggleOption("Seen Necromancy", bOverrideNecromancySeen)
		If SRTUtilityQuest.PapyrusExtenderInstalled
			iOverrideBlackSoulTraps				= AddToggleOption("Black Souls Trapped", bOverrideBlackSoulTraps)
		EndIf
		iOverrideSoulsTrapped				= AddToggleOption("Souls Trapped", bOverrideSoulsTrapped)
		iOverrideBooksRead					= AddToggleOption("Books Read", bOverrideBooksRead)
		iOverrideCollegeMisc				= AddToggleOption("Misc. College Quests", bOverrideCollegeMisc)
		iOverrideArcaneMastery				= AddToggleOption("Arcane Mastery", bOverrideArcaneMastery)
		AddEmptyOption()
		
		AddHeaderOption("Stat Multipliers")
		srt_iFameMult						= AddSliderOption("Fame", SRTFameMult.GetValue(), "{1}")
		srt_iAedricMult						= AddSliderOption("Aedric", SRTAedricMult.GetValue(), "{1}")
		srt_iDaedricMult					= AddSliderOption("Daedric ", SRTDaedricMult.GetValue(), "{1}") ; Intentional space due to case insensitive strings
		srt_iDependabilityMult				= AddSliderOption("Dependability", SRTDependabilityMult.GetValue(), "{1}")
		srt_iAmbitionMult					= AddSliderOption("Ambition", SRTAmbitionMult.GetValue(), "{1}")
		srt_iLawMult						= AddSliderOption("Law", SRTLawMult.GetValue(), "{1}")
		srt_iCrimeMult						= AddSliderOption("Crime", SRTCrimeMult.GetValue(), "{1}")
		srt_iVampireMult					= AddSliderOption("Vampirism", SRTVampireMult.GetValue(), "{1}")
		srt_iWerewolfMult					= AddSliderOption("Lycanthropy", SRTWerewolfMult.GetValue(), "{1}")
;		srt_iRacismMult						= AddSliderOption("Racism", SRTRacismMult.GetValue(), "{1}")

	Elseif (a_page == "Control Panel")
		SetSliderValues()
		FlattenCounterValues()
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		int CheatsFlag
		if(CheatsEnabled == 1)
			CheatsFlag = OPTION_FLAG_NONE
		else
			CheatsFlag = OPTION_FLAG_DISABLED
		endif
		
		AddHeaderOption("Enable Manual controls")
		iEnableCheats			= AddToggleOption("I know what I'm doing", bEnableCheats)
		AddEmptyOption()
		AddEmptyOption()
				
		AddHeaderOption("Manually Change Aedric Devotion", CheatsFlag)
		iAedricCounterUp 		= AddTextOption("Increase Aedric Devotion:", bAedricCounterUp, CheatsFlag)
		iAedricCounterDown		= AddTextOption("Decrease Aedric Devotion:", bAedricCounterDown, CheatsFlag)
		AddEmptyOption()
		
		AddHeaderOption("Manually Change Lawfulness", CheatsFlag)
		iLawCounterUp 			= AddTextOption("Increase Law", bLawCounterUp, CheatsFlag)
		iLawCounterDown			= AddTextOption("Decrease Law", bLawCounterDown, CheatsFlag)
		AddEmptyOption()
		
		AddHeaderOption("Manually Change Dependability", CheatsFlag)
		iDepCounterUp 			= AddTextOption("Increase Dependability:", bDepCounterUp, CheatsFlag)
		iDepCounterDown			= AddTextOption("Decrease Dependability:", bDepCounterDown, CheatsFlag)
		AddEmptyOption()
				
		AddHeaderOption("Manually Change Fame", CheatsFlag)
		iFameCounterUp 			= AddTextOption("Increase Fame:", bFameCounterUp, CheatsFlag)
		iFameCounterDown 		= AddTextOption("Decrease Fame:", bFameCounterDown, CheatsFlag)
		AddEmptyOption()
		
		AddHeaderOption("Set Magic Stat", CheatsFlag)
		iSliderNecroTImes 		= AddSliderOption("Necromancy Seen", fSliderNecroTImes, "{0}", CheatsFlag)
		;iSliderCharityAdded 	= AddSliderOption("Charity Added", fSliderCharityAdded, "{0}", CheatsFlag)
		If SRTUtilityQuest.PapyrusExtenderInstalled
			iSliderCannibalFeed 	= AddSliderOption("Cannibal Feedings", fSliderCannibalFeed, "{0}", CheatsFlag)
			iSliderBlackSoulTrap 	= AddSliderOption("Black Souls Trapped", fSliderBlackSoulTrap, "{0}", CheatsFlag)
		EndIf
		AddEmptyOption()
		
		AddHeaderOption("Set Crime Stats", CheatsFlag)
		iSliderSeenMurders		= AddSliderOption("Murder Bounties", fSliderSeenMurders, "{0}", CheatsFlag)
		iSliderSeenAssaults 	= AddSliderOption("Assault Bounties", fSliderSeenAssaults, "{0}", CheatsFlag)
		iSliderSeenTheft 		= AddSliderOption("Petty Crime Bounties", fSliderSeenTheft, "{0}", CheatsFlag)
		AddEmptyOption()
		
		AddHeaderOption("Set Vampire Stats", CheatsFlag)
		iSliderVampireLordTrans		= AddSliderOption("Lord Tranformations", fSliderVampireLordTrans, "{0}", CheatsFlag)
		iSliderVampiricSpellSeen	= AddSliderOption("Blood Magic Seen", fSliderVampiricSpellSeen, "{0}", CheatsFlag)
		iSliderVampireLordSeen		= AddSliderOption("Vampiric Form Seen", fSliderVampireLordSeen, "{0}", CheatsFlag)
		iSliderVampireComments		= AddSliderOption("Vampire Suspicions", fSliderVampireComments, "{0}", CheatsFlag)
		iSliderVampireGuard			= AddSliderOption("Vampire Accusations", fSliderVampireGuard, "{0}", CheatsFlag)
		AddEmptyOption()
		AddEmptyOption()
		
		AddHeaderOption("Adjust Stats", CheatsFlag)
		iResetTimeDec				= AddTextOption("Time-decrement Variables", "RECALIBRATE", CheatsFlag)
		iResetCrimes				= AddTextOption("Reduce Crime Stats", "CLICK", CheatsFlag)
		iResetMagic					= AddTextOption("Reduce Magic Stats", "CLICK", CheatsFlag)

		SetCursorPosition(1)
		
		AddHeaderOption("General Controls")
		iMuteMod				= AddToggleOption("Mute Skyrim Reputation", bMuteMod)
		iForceRep				= AddTextOption("Force Rep. Calculation", "CLICK")
		AddEmptyOption()
		
		AddHeaderOption("Manually Change Daedric-taint", CheatsFlag)
		iDaedricCounterUp 		= AddTextOption("Increase Daedric Taint:", bDaedricCounterUp, CheatsFlag)
		iDaedricCounterDown		= AddTextOption("Decrease Daedric Taint:", bDaedricCounterDown, CheatsFlag)
		AddEmptyOption()
		
		AddHeaderOption("Manually Change Crime", CheatsFlag)
		iCrimeCounterUp 		= AddTextOption("Increase Crime:", bCrimeCounterUp, CheatsFlag)
		iCrimeCounterDown 		= AddTextOption("Decrease Crime:", bCrimeCounterDown, CheatsFlag)
		AddEmptyOption()
		
		AddHeaderOption("Manually Change Power-hunger", CheatsFlag)
		iAmbCounterUp 			= AddTextOption("Increase Power-hunger:", bAmbCounterUp, CheatsFlag)
		iAmbCounterDown			= AddTextOption("Decrease Power-hunger:", bAmbCounterDown, CheatsFlag)
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		
		AddHeaderOption("Set Kill Stats", CheatsFlag)
		iSliderBanditKills 		= AddSliderOption("Bandit Kills", fSliderBanditKills, "{0}", CheatsFlag)
		iSliderForswornKills	= AddSliderOption("Forsworn Kills", fSliderForswornKills, "{0}", CheatsFlag)
		iSliderWizardKills 		= AddSliderOption("Warlock Kills", fSliderWizardKills, "{0}", CheatsFlag)
		iSliderWitchKills	 	= AddSliderOption("Witch Kills", fSliderWitchKills, "{0}", CheatsFlag)
		iSliderDragonKills 		= AddSliderOption("Dragon Kills", fSliderDragonKills, "{0}", CheatsFlag)
		iSliderDragonPriestKills = AddSliderOption("Dragon-priest Kills", fSliderDragonPriestKills, "{0}", CheatsFlag)
		AddEmptyOption()
		
		AddHeaderOption("Set Werewolf Stats", CheatsFlag)
		iSliderWerewolfFeeds		= AddSliderOption("Hearts Eaten", fSliderWerewolfFeeds, "{0}", CheatsFlag)
		iSliderWerewolfSeen			= AddSliderOption("Beast Form Seen", fSliderWerewolfSeen, "{0}", CheatsFlag)
		iSliderWerewolfComments		= AddSliderOption("Werewolf Suspicions", fSliderWerewolfComments, "{0}", CheatsFlag)
		iSliderWerewolfGuard		= AddSliderOption("Werewolf Accusations", fSliderWerewolfGuard, "{0}", CheatsFlag)
		AddEmptyOption()
		AddEmptyOption()
		AddEmptyOption()
		
		AddHeaderOption("Reset", CheatsFlag)
		iResetMod				= AddTextOption("Reset Reputation", "CLICK", CheatsFlag)
		iResetExternaContent	= AddTextOption("Reset Plugin stats", "CLICK", CheatsFlag)
		iResetAllResets			= AddTextOption("Undo Resets", "CLICK", CheatsFlag)
		
	Elseif (a_page == "Debug")
		FISSInterface fiss = FISSFactory.getFISS()
		SetDebugBool()
		SetCursorFillMode(TOP_TO_BOTTOM)
		
		AddHeaderOption("Compatibility")
		;iVampireCustomRaceActive 	= AddToggleOption("Custom Vampire Race", bVampireCustomRaceActive)
		iDragonbornComments 		= AddToggleOption("Dragonborn Comments", bDragonbornComments)
		iThaneWhiterun 				= AddToggleOption("Thane of Whiterun", bThaneWhiterun)
		iMoonlightTales				= AddToggleOption("Wolf Hostility", bMoonlightTales)
		AddEmptyOption()
				
		AddHeaderOption("Miscellaneous")
		iSlowCalculations 			= AddToggleOption("Slower Reputation Calc.", bSlowCalculations)
		
		srt_iLoadScreens			= AddBoolGlobal("Loading Screens", SRTLoadScreens)
		AddEmptyOption()
		
		; Improvements - Show installed mods
		AddHeaderOption("Detected Mods")
		srt_iGDO = AddBoolGlobal("Guard Dialogue Overhaul", SRTUseGDO)
		
		Bool greyCowlInstalled = SRTGreyCowlList.GetSize() > 0
		srt_iGreyCowl = AddToggleOption("Gray Cowl of Nocturnal", greyCowlInstalled)
		
		
		srt_iUnbound = AddBoolGlobal("Skyrim Unbound", SR_PluginEnabled_SkyrimUnbound)
		
		SetCursorPosition(1)
		
		If fiss
			AddHeaderOption("Presets")
			OID_LoadPreset = AddTextOption("Load Preset","")
			OID_SavePreset = AddTextOption("Save Current Settings","")
			AddEmptyOption()	
		endif
		
	EndIf
endevent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INTERACTION EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
event OnOptionSelect(int a_option)
	{Called when the user selects a non-dialog option}
	
	If a_option == srt_iLoadScreens
		If SRTLoadScreens.GetValue() == 0.0
			SRTLoadScreens.SetValue(1.0)
			SetToggleOptionValue(a_option, True)
		Else
			SRTLoadScreens.SetValue(0.0)
			SetToggleOptionValue(a_option, False)
		EndIf
	ElseIf (a_option == iAura_Vampire)
		bAura_Vampire = !bAura_Vampire
		SetToggleOptionValue(a_option, bAura_Vampire)
		if(SR_MCM_DaedricAuras_Vampire.GetValue() == 0)
			SR_MCM_DaedricAuras_Vampire.SetValue(1)
		else
			SR_MCM_DaedricAuras_Vampire.SetValue(0)
			if(SR_Factions_Response_VampireAura.IsRunning() == true)
				SR_Factions_Response_VampireAura.Stop()
			endif
		endif
	
	elseIf (a_option == iAura_Werewolf)
		bAura_Werewolf = !bAura_Werewolf
		SetToggleOptionValue(a_option, bAura_Werewolf)
		if(SR_MCM_DaedricAuras_Werewolf.GetValue() == 0)
			SR_MCM_DaedricAuras_Werewolf.SetValue(1)
		else
			SR_MCM_DaedricAuras_Werewolf.SetValue(0)
			if(SR_Factions_Response_WerewolfAura.IsRunning() == true)
				SR_Factions_Response_WerewolfAura.Stop()
			endif
		endif

	elseIf (a_option == iAura_Infamy)
		bAura_Infamy = !bAura_Infamy
		SetToggleOptionValue(a_option, bAura_Infamy)
		if(SR_MCM_WiComment_Feared_Infamy.GetValue() == 0)
			SR_MCM_WiComment_Feared_Infamy.SetValue(1)
		else
			SR_MCM_WiComment_Feared_Infamy.SetValue(0)
		endif

	elseIf (a_option == iPerk_Allure)
		bPerk_Allure = !bPerk_Allure
		SetToggleOptionValue(a_option, bPerk_Allure)
		if(SR_MCM_Perks_Allure.GetValue() == 0)
			SR_MCM_Perks_Allure.SetValue(1)
		else
			SR_MCM_Perks_Allure.SetValue(0)
		endif

	elseIf (a_option == iPerk_Fence)
		bPerk_Fence = !bPerk_Fence
		SetToggleOptionValue(a_option, bPerk_Fence)
		if(SR_MCM_Perks_Fence.GetValue() == 0)
			SR_MCM_Perks_Fence.SetValue(1)
		else
			SR_MCM_Perks_Fence.SetValue(0)
		endif
		
	elseIf (a_option == iPerk_Intimidate)
		bPerk_Intimidate = !bPerk_Intimidate
		SetToggleOptionValue(a_option, bPerk_Intimidate)
		if(SR_MCM_Perks_Intimidate.GetValue() == 0)
			SR_MCM_Perks_Intimidate.SetValue(1)
		else
			SR_MCM_Perks_Intimidate.SetValue(0)
		endif

	elseIf (a_option == iPerk_Barter)
		bPerk_Barter = !bPerk_Barter
		SetToggleOptionValue(a_option, bPerk_Barter)
		if(SR_MCM_Perks_PriceChanges.GetValue() == 0)
			SR_MCM_Perks_PriceChanges.SetValue(1)
		else
			SR_MCM_Perks_PriceChanges.SetValue(0)
		endif
		
	elseIf (a_option == iFaction_CourierNotes)
		bFaction_CourierNotes = !bFaction_CourierNotes
		SetToggleOptionValue(a_option, bFaction_CourierNotes)
		if(SR_MCM_Factions_CourierNotes.GetValue() == 0)
			SR_MCM_Factions_CourierNotes.SetValue(1)
		else
			SR_MCM_Factions_CourierNotes.SetValue(0)
		endif
		
	elseIf (a_option == iFaction_Companions)
		bFaction_Companions = !bFaction_Companions
		SetToggleOptionValue(a_option, bFaction_Companions)
		if(SR_MCM_Factions_Companions.GetValue() == 0)
			SR_MCM_Factions_Companions.SetValue(1)
		else
			SR_MCM_Factions_Companions.SetValue(0)
			CompBanGoldTotal.SetValue(2000)
			if (SR_Companions_JoinOverride.IsRunning())
				SR_Companions_JoinOverride.Stop()
			endif
			if (SR_Companions_Reparations.IsRunning())
				SR_Companions_Reparations.Stop()
			endIf
		endif

	elseIf (a_option == iFaction_VigilOfStendarr)
		bFaction_VigilOfStendarr = !bFaction_VigilOfStendarr
		SetToggleOptionValue(a_option, bFaction_VigilOfStendarr)
		if(SR_MCM_Factions_VigilOfStendarr.GetValue() == 0)
			SR_MCM_Factions_VigilOfStendarr.SetValue(1)
		else
			SR_MCM_Factions_VigilOfStendarr.SetValue(0)
			SR_Factions_Response_DaedraWorshipperReset.ResetVigilPlayerEnemyFactions()
		endif

	elseIf (a_option == iFaction_Dawnguard)
		bFaction_Dawnguard = !bFaction_Dawnguard
		SetToggleOptionValue(a_option, bFaction_Dawnguard)
		if(SR_MCM_Factions_Dawnguard.GetValue() == 0)
			SR_MCM_Factions_Dawnguard.SetValue(1)
		else
			SR_MCM_Factions_Dawnguard.SetValue(0)
			SR_Factions_Response_DaedraWorshipperReset.ResetDawnguardPlayerEnemyFactions()
		endif
		
	elseIf (a_option == iFaction_Thalmor)
		bFaction_Thalmor = !bFaction_Thalmor
		SetToggleOptionValue(a_option, bFaction_Thalmor)
		if(SR_MCM_Factions_Thalmor.GetValue() == 0)
			SR_MCM_Factions_Thalmor.SetValue(1)
		else
			SR_MCM_Factions_Thalmor.SetValue(0)
			SR_Factions_Response_Thalmor.ResetThalmorEnemyFactions()
		endif
		
	elseIf (a_option == iComment_Thane)
		bComment_Thane = !bComment_Thane
		SetToggleOptionValue(a_option, bComment_Thane)
		if(SR_MCM_WiComment_Thane.GetValue() == 0)
			SR_MCM_WiComment_Thane.SetValue(1)
		else
			SR_MCM_WiComment_Thane.SetValue(0)
		endif
	
	elseIf (a_option == iComment_Child)
		bComment_Child = !bComment_Child
		SetToggleOptionValue(a_option, bComment_Child)
		if(SR_MCM_WiComment_Child.GetValue() == 0)
			SR_MCM_WiComment_Child.SetValue(1)
		else
			SR_MCM_WiComment_Child.SetValue(0)
		endif

	elseIf (a_option == iFaction_DarkBrotherhood)
		bFaction_DarkBrotherhood = !bFaction_DarkBrotherhood
		SetToggleOptionValue(a_option, bFaction_DarkBrotherhood)
		if(SR_MCM_Factions_DarkBrotherhood.GetValue() == 0)
			SR_MCM_Factions_DarkBrotherhood.SetValue(1)
		else
			SR_MCM_Factions_DarkBrotherhood.SetValue(0)
		endif

	elseIf (a_option == iFaction_Forsworn)
		bFaction_Forsworn = !bFaction_Forsworn
		SetToggleOptionValue(a_option, bFaction_Forsworn)
		if(SR_MCM_Factions_Forsworn.GetValue() == 0)
			SR_MCM_Factions_Forsworn.SetValue(1)
		else
			SR_MCM_Factions_Forsworn.SetValue(0)
			if (SR_Factions_Response_Forsworn.IsRunning())
				SR_Factions_Response_Forsworn.Stop()
			endif
		endif

	elseIf (a_option == iFaction_MageGuild)
		bFaction_MageGuild = !bFaction_MageGuild
		SetToggleOptionValue(a_option, bFaction_MageGuild)
		if(SR_MCM_Factions_MageGuild.GetValue() == 0)
			SR_MCM_Factions_MageGuild.SetValue(1)
		else
			SR_MCM_Factions_MageGuild.SetValue(0)
		endif

	elseIf (a_option == iFaction_ThievesGuild)
		bFaction_ThievesGuild = !bFaction_ThievesGuild
		SetToggleOptionValue(a_option, bFaction_ThievesGuild)
		if(SR_MCM_Factions_ThievesGuild.GetValue() == 0)
			SR_MCM_Factions_ThievesGuild.SetValue(1)
		else
			SR_MCM_Factions_ThievesGuild.SetValue(0)
		endif

	elseIf (a_option == iMessageRep)
		bMessageRep = !bMessageRep
		SetToggleOptionValue(a_option, bMessageRep)
		if(SR_MCM_Reputation_Message.GetValue() == 0)
			SR_MCM_Reputation_Message.SetValue(1)
		else
			SR_MCM_Reputation_Message.SetValue(0)
		endif
	
	elseIf (a_option == iComment_Unknown)
		bComment_Unknown = !bComment_Unknown
		SetToggleOptionValue(a_option, bComment_Unknown)
		if(SR_MCM_WiComment_Unknown.GetValue() == 0)
			SR_MCM_WiComment_Unknown.SetValue(1)
		else
			SR_MCM_WiComment_Unknown.SetValue(0)
		endif

	elseIf (a_option == iComment_Bad)
		bComment_Bad = !bComment_Bad
		SetToggleOptionValue(a_option, bComment_Bad)
		if(SR_MCM_WiComment_Bad.GetValue() == 0)
			SR_MCM_WiComment_Bad.SetValue(1)
		else
			SR_MCM_WiComment_Bad.SetValue(0)
		endif

	elseIf (a_option == iComment_Good)
		bComment_Good = !bComment_Good
		SetToggleOptionValue(a_option, bComment_Good)
		if(SR_MCM_WiComment_Good.GetValue() == 0)
			SR_MCM_WiComment_Good.SetValue(1)
		else
			SR_MCM_WiComment_Good.SetValue(0)
		endif

	elseIf (a_option == iComment_Feared)
		bComment_Feared = !bComment_Feared
		SetToggleOptionValue(a_option, bComment_Feared)
		if(SR_MCM_WiComment_Feared.GetValue() == 0)
			SR_MCM_WiComment_Feared.SetValue(1)
		else
			SR_MCM_WiComment_Feared.SetValue(0)
		endif

	elseIf (a_option == iComment_Guards)
		bComment_Guards = !bComment_Guards
		SetToggleOptionValue(a_option, bComment_Guards)
		if(SR_MCM_WiComment_Guards.GetValue() == 0)
			SR_MCM_WiComment_Guards.SetValue(1)
		else
			SR_MCM_WiComment_Guards.SetValue(0)
		endif
	
	elseIf (a_option == iComment_VampireWerewolf)
		bComment_VampireWerewolf = !bComment_VampireWerewolf
		SetToggleOptionValue(a_option, bComment_VampireWerewolf)
		if(SR_MCM_WiComment_VampireWerewolf.GetValue() == 0)
			SR_MCM_WiComment_VampireWerewolf.SetValue(1)
		else
			SR_MCM_WiComment_VampireWerewolf.SetValue(0)
		endif
	
	elseIf (a_option == iBehavior_FearedPackage)
		bBehavior_FearedPackage = !bBehavior_FearedPackage
		SetToggleOptionValue(a_option, bBehavior_FearedPackage)
		if(SR_MCM_WiComment_Feared_AiPackage.GetValue() == 0)
			SR_MCM_WiComment_Feared_AiPackage.SetValue(1)
		else
			SR_MCM_WiComment_Feared_AiPackage.SetValue(0)
		endif

	elseIf (a_option == iBehavior_GuardsDaedra)
		bBehavior_GuardsDaedra = !bBehavior_GuardsDaedra
		SetToggleOptionValue(a_option, bBehavior_GuardsDaedra)
		if(SR_MCM_WiComment_VampireWerewolf_Hostile.GetValue() == 0)
			SR_MCM_WiComment_VampireWerewolf_Hostile.SetValue(1)
		else
			SR_MCM_WiComment_VampireWerewolf_Hostile.SetValue(0)
		endif

	elseIf (a_option == iOverrideQuestsCompleted)
		bOverrideQuestsCompleted = !bOverrideQuestsCompleted
		SetToggleOptionValue(a_option, bOverrideQuestsCompleted)
		if(SR_MCM_Override_QuestsCompleted.GetValue() == 0)
			SR_MCM_Override_QuestsCompleted.SetValue(1)
		else
			SR_MCM_Override_QuestsCompleted.SetValue(0)
		endif	

	elseIf (a_option == iOverrideLocations)
		bOverrideLocations = !bOverrideLocations
		SetToggleOptionValue(a_option, bOverrideLocations)
		if(SR_MCM_Override_Locations.GetValue() == 0)
			SR_MCM_Override_Locations.SetValue(1)
		else
			SR_MCM_Override_Locations.SetValue(0)
		endif		

	elseIf (a_option == iOverrideDungeons)
		bOverrideDungeons = !bOverrideDungeons
		SetToggleOptionValue(a_option, bOverrideDungeons)
		if(SR_MCM_Override_Dungeons.GetValue() == 0)
			SR_MCM_Override_Dungeons.SetValue(1)
		else
			SR_MCM_Override_Dungeons.SetValue(0)
		endif
		
	elseIf (a_option == iOverridePeopleKills)
		bOverridePeopleKills = !bOverridePeopleKills
		SetToggleOptionValue(a_option, bOverridePeopleKills)
		if(SR_MCM_Override_PeopleKills.GetValue() == 0)
			SR_MCM_Override_PeopleKills.SetValue(1)
		else
			SR_MCM_Override_PeopleKills.SetValue(0)
		endif
		
	elseIf (a_option == iOverrideStoreInvestments)
		bOverrideStoreInvestments = !bOverrideStoreInvestments
		SetToggleOptionValue(a_option, bOverrideStoreInvestments)
		if(SR_MCM_Override_StoreInvestments.GetValue() == 0)
			SR_MCM_Override_StoreInvestments.SetValue(1)
		else
			SR_MCM_Override_StoreInvestments.SetValue(0)
		endif

	elseIf (a_option == iOverrideHousesOwned)
		bOverrideHousesOwned = !bOverrideHousesOwned
		SetToggleOptionValue(a_option, bOverrideHousesOwned)
		if(SR_MCM_Override_HousesOwned.GetValue() == 0)
			SR_MCM_Override_HousesOwned.SetValue(1)
		else
			SR_MCM_Override_HousesOwned.SetValue(0)
		endif

	elseIf (a_option == iOverrideDragonsKilled)
		bOverrideDragonsKilled = !bOverrideDragonsKilled
		SetToggleOptionValue(a_option, bOverrideDragonsKilled)
		if(SR_MCM_Override_DragonsKilled.GetValue() == 0)
			SR_MCM_Override_DragonsKilled.SetValue(1)
		else
			SR_MCM_Override_DragonsKilled.SetValue(0)
		endif
	
	elseIf (a_option == iOverrideDragonPriestsKilled)
		bOverrideDragonPriestsKilled = !bOverrideDragonPriestsKilled
		SetToggleOptionValue(a_option, bOverrideDragonPriestsKilled)
		if(SR_MCM_Override_DragonPriestsKilled.GetValue() == 0)
			SR_MCM_Override_DragonPriestsKilled.SetValue(1)
		else
			SR_MCM_Override_DragonPriestsKilled.SetValue(0)
		endif

	elseIf (a_option == iOverrideWerewolfVampireTimeDec)
		bOverrideWerewolfVampireTimeDec = !bOverrideWerewolfVampireTimeDec
		SetToggleOptionValue(a_option, bOverrideWerewolfVampireTimeDec)
		if(SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 0)
			SR_MCM_Override_WerewolfVampireTimeDecreament.SetValue(1)
		else
			SR_MCM_Override_WerewolfVampireTimeDecreament.SetValue(0)
		endif
		
	elseIf (a_option == iOverrideNecksBitten)
		bOverrideNecksBitten = !bOverrideNecksBitten
		SetToggleOptionValue(a_option, bOverrideNecksBitten)
		if(SR_MCM_Override_NecksBitten.GetValue() == 0)
			SR_MCM_Override_NecksBitten.SetValue(1)
		else
			SR_MCM_Override_NecksBitten.SetValue(0)
		endif
		
	elseIf (a_option == iOverrideVampiricSpellSeen)
		bOverrideVampiricSpellSeen = !bOverrideVampiricSpellSeen
		SetToggleOptionValue(a_option, bOverrideVampiricSpellSeen)
		if(SR_MCM_Override_VampiricSpellSeen.GetValue() == 0)
			SR_MCM_Override_VampiricSpellSeen.SetValue(1)
		else
			SR_MCM_Override_VampiricSpellSeen.SetValue(0)
		endif

	elseIf (a_option == iOverrideVampireLordTransformations)
		bOverrideVampireLordTransformations = !bOverrideVampireLordTransformations
		SetToggleOptionValue(a_option, bOverrideVampireLordTransformations)
		if(SR_MCM_Override_VampireLordTransformations.GetValue() == 0)
			SR_MCM_Override_VampireLordTransformations.SetValue(1)
		else
			SR_MCM_Override_VampireLordTransformations.SetValue(0)
		endif

	elseIf (a_option == iOverrideVampireLordSeen)
		bOverrideVampireLordSeen = !bOverrideVampireLordSeen
		SetToggleOptionValue(a_option, bOverrideVampireLordSeen)
		if(SR_MCM_Override_VampireLordSeen.GetValue() == 0)
			SR_MCM_Override_VampireLordSeen.SetValue(1)
		else
			SR_MCM_Override_VampireLordSeen.SetValue(0)
		endif

		elseIf (a_option == iOverrideVampireComments)
		bOverrideVampireComments = !bOverrideVampireComments
		SetToggleOptionValue(a_option, bOverrideVampireComments)
		if(SR_MCM_Override_VampireComments.GetValue() == 0)
			SR_MCM_Override_VampireComments.SetValue(1)
		else
			SR_MCM_Override_VampireComments.SetValue(0)
		endif		

	elseIf (a_option == iOverrideWerewolfMauls)
		bOverrideWerewolfMauls = !bOverrideWerewolfMauls
		SetToggleOptionValue(a_option, bOverrideWerewolfMauls)
		if(SR_MCM_Override_WerewolfMauls.GetValue() == 0)
			SR_MCM_Override_WerewolfMauls.SetValue(1)
		else
			SR_MCM_Override_WerewolfMauls.SetValue(0)
		endif

	elseIf (a_option == iOverrideWerewolfFeeds)
		bOverrideWerewolfFeeds = !bOverrideWerewolfFeeds
		SetToggleOptionValue(a_option, bOverrideWerewolfFeeds)
		if(SR_MCM_Override_WerewolfFeeds.GetValue() == 0)
			SR_MCM_Override_WerewolfFeeds.SetValue(1)
		else
			SR_MCM_Override_WerewolfFeeds.SetValue(0)
		endif

	elseIf (a_option == iOverrideWerewolfTransformations)
		bOverrideWerewolfTransformations = !bOverrideWerewolfTransformations
		SetToggleOptionValue(a_option, bOverrideWerewolfTransformations)
		if(SR_MCM_Override_WerewolfTransformations.GetValue() == 0)
			SR_MCM_Override_WerewolfTransformations.SetValue(1)
		else
			SR_MCM_Override_WerewolfTransformations.SetValue(0)
		endif

	elseIf (a_option == iOverrideWerewolfSeen)
		bOverrideWerewolfSeen = !bOverrideWerewolfSeen
		SetToggleOptionValue(a_option, bOverrideWerewolfSeen)
		if(SR_MCM_Override_WerewolfSeen.GetValue() == 0)
			SR_MCM_Override_WerewolfSeen.SetValue(1)
		else
			SR_MCM_Override_WerewolfSeen.SetValue(0)
		endif

	elseIf (a_option == iOverrideWerewolfComments)
		bOverrideWerewolfComments = !bOverrideWerewolfComments
		SetToggleOptionValue(a_option, bOverrideWerewolfComments)
		if(SR_MCM_Override_WerewolfComments.GetValue() == 0)
			SR_MCM_Override_WerewolfComments.SetValue(1)
		else
			SR_MCM_Override_WerewolfComments.SetValue(0)
		endif

	elseIf (a_option == iOverrideSeenCrimeTimeDecreament)
		bOverrideSeenCrimeTimeDecreament = !bOverrideSeenCrimeTimeDecreament
		SetToggleOptionValue(a_option, bOverrideSeenCrimeTimeDecreament)
		if(SR_MCM_Override_SeenCrimeTimeDecreament.GetValue() == 0)
			SR_MCM_Override_SeenCrimeTimeDecreament.SetValue(1)
		else
			SR_MCM_Override_SeenCrimeTimeDecreament.SetValue(0)
		endif

	elseIf (a_option == iOverridePettyCrimeSeen)
		bOverridePettyCrimeSeen = !bOverridePettyCrimeSeen
		SetToggleOptionValue(a_option, bOverridePettyCrimeSeen)
		if(SR_MCM_Override_PettyCrimeSeen.GetValue() == 0)
			SR_MCM_Override_PettyCrimeSeen.SetValue(1)
		else
			SR_MCM_Override_PettyCrimeSeen.SetValue(0)
		endif
	
	elseIf (a_option == iOverrideAssaultsSeen)
		bOverrideAssaultsSeen = !bOverrideAssaultsSeen
		SetToggleOptionValue(a_option, bOverrideAssaultsSeen)
		if(SR_MCM_Override_AssaultsSeen.GetValue() == 0)
			SR_MCM_Override_AssaultsSeen.SetValue(1)
		else
			SR_MCM_Override_AssaultsSeen.SetValue(0)
		endif

	elseIf (a_option == iOverrideMurdersSeen)
		bOverrideMurdersSeen = !bOverrideMurdersSeen
		SetToggleOptionValue(a_option, bOverrideMurdersSeen)
		if(SR_MCM_Override_MurdersSeen.GetValue() == 0)
			SR_MCM_Override_MurdersSeen.SetValue(1)
		else
			SR_MCM_Override_MurdersSeen.SetValue(0)
		endif
	
	elseIf (a_option == iOverrideMurders)
		bOverrideMurders = !bOverrideMurders
		SetToggleOptionValue(a_option, bOverrideMurders)
		if(SR_MCM_Override_Murders.GetValue() == 0)
			SR_MCM_Override_Murders.SetValue(1)
		else
			SR_MCM_Override_Murders.SetValue(0)
		endif

	elseIf (a_option == iOverridePocketsPicked)
		bOverridePocketsPicked = !bOverridePocketsPicked
		SetToggleOptionValue(a_option, bOverridePocketsPicked)
		if(SR_MCM_Override_PocketsPicked.GetValue() == 0)
			SR_MCM_Override_PocketsPicked.SetValue(1)
		else
			SR_MCM_Override_PocketsPicked.SetValue(0)
		endif

	elseIf (a_option == iOverrideHorsesStolen)
		bOverrideHorsesStolen = !bOverrideHorsesStolen
		SetToggleOptionValue(a_option, bOverrideHorsesStolen)
		if(SR_MCM_Override_HorsesStolen.GetValue() == 0)
			SR_MCM_Override_HorsesStolen.SetValue(1)
		else
			SR_MCM_Override_HorsesStolen.SetValue(0)
		endif

	elseIf (a_option == iOverrideItemsStolen)
		bOverrideItemsStolen = !bOverrideItemsStolen
		SetToggleOptionValue(a_option, bOverrideItemsStolen)
		if(SR_MCM_Override_ItemsStolen.GetValue() == 0)
			SR_MCM_Override_ItemsStolen.SetValue(1)
		else
			SR_MCM_Override_ItemsStolen.SetValue(0)
		endif

	elseIf (a_option == iOverrideTrespasses)
		bOverrideTrespasses = !bOverrideTrespasses
		SetToggleOptionValue(a_option, bOverrideTrespasses)
		if(SR_MCM_Override_Trespasses.GetValue() == 0)
			SR_MCM_Override_Trespasses.SetValue(1)
		else
			SR_MCM_Override_Trespasses.SetValue(0)
		endif

	elseIf (a_option == iOverrideJailEscapes)
		bOverrideJailEscapes = !bOverrideJailEscapes
		SetToggleOptionValue(a_option, bOverrideJailEscapes)
		if(SR_MCM_Override_JailEscapes.GetValue() == 0)
			SR_MCM_Override_JailEscapes.SetValue(1)
		else
			SR_MCM_Override_JailEscapes.SetValue(0)
		endif
	
	elseIf (a_option == iOverrideDaysJailed)
		bOverrideDaysJailed = !bOverrideDaysJailed
		SetToggleOptionValue(a_option, bOverrideDaysJailed)
		if(SR_MCM_Override_DaysJailed.GetValue() == 0)
			SR_MCM_Override_DaysJailed.SetValue(1)
		else
			SR_MCM_Override_DaysJailed.SetValue(0)
		endif

	elseIf (a_option == iOverrideFinesPayed)
		bOverrideFinesPayed = !bOverrideFinesPayed
		SetToggleOptionValue(a_option, bOverrideFinesPayed)
		if(SR_MCM_Override_FinesPayed.GetValue() == 0)
			SR_MCM_Override_FinesPayed.SetValue(1)
		else
			SR_MCM_Override_FinesPayed.SetValue(0)
		endif

	elseIf (a_option == iOverrideThievesGuildMisc)
		bOverrideThievesGuildMisc = !bOverrideThievesGuildMisc
		SetToggleOptionValue(a_option, bOverrideThievesGuildMisc)
		if(SR_MCM_Override_ThievesGuildMisc.GetValue() == 0)
			SR_MCM_Override_ThievesGuildMisc.SetValue(1)
		else
			SR_MCM_Override_ThievesGuildMisc.SetValue(0)
		endif

	elseIf (a_option == iOverrideDarkBrotherhoodMisc)
		bOverrideDarkBrotherhoodMisc = !bOverrideDarkBrotherhoodMisc
		SetToggleOptionValue(a_option, bOverrideDarkBrotherhoodMisc)
		if(SR_MCM_Override_DarkBrotherhoodMisc.GetValue() == 0)
			SR_MCM_Override_DarkBrotherhoodMisc.SetValue(1)
		else
			SR_MCM_Override_DarkBrotherhoodMisc.SetValue(0)
		endif

	elseIf (a_option == iOverrideCompanionsMisc)
		bOverrideCompanionsMisc = !bOverrideCompanionsMisc
		SetToggleOptionValue(a_option, bOverrideCompanionsMisc)
		if(SR_MCM_Override_CompanionsMisc.GetValue() == 0)
			SR_MCM_Override_CompanionsMisc.SetValue(1)
		else
			SR_MCM_Override_CompanionsMisc.SetValue(0)
		endif

	elseIf (a_option == iOverrideCollegeMisc)
		bOverrideCollegeMisc = !bOverrideCollegeMisc
		SetToggleOptionValue(a_option, bOverrideCollegeMisc)
		if(SR_MCM_Override_CollegeMisc.GetValue() == 0)
			SR_MCM_Override_CollegeMisc.SetValue(1)
		else
			SR_MCM_Override_CollegeMisc.SetValue(0)
		endif
	
	elseIf (a_option == iOverrideBrawls)
		bOverrideBrawls = !bOverrideBrawls
		SetToggleOptionValue(a_option, bOverrideBrawls)
		if(SR_MCM_Override_Brawls.GetValue() == 0)
			SR_MCM_Override_Brawls.SetValue(1)
		else
			SR_MCM_Override_Brawls.SetValue(0)
		endif

	elseIf (a_option == iOverrideMiscQuests)
		bOverrideMiscQuests = !bOverrideMiscQuests
		SetToggleOptionValue(a_option, bOverrideMiscQuests)
		if(SR_MCM_Override_MiscQuests.GetValue() == 0)
			SR_MCM_Override_MiscQuests.SetValue(1)
		else
			SR_MCM_Override_MiscQuests.SetValue(0)
		endif
		
	elseIf (a_option == iOverrideCivilWar)
		bOverrideCivilWar = !bOverrideCivilWar
		SetToggleOptionValue(a_option, bOverrideCivilWar)
		if(SR_MCM_Override_CivilWar.GetValue() == 0)
			SR_MCM_Override_CivilWar.SetValue(1)
		else
			SR_MCM_Override_CivilWar.SetValue(0)
		endif

	elseIf (a_option == iOverrideWarriorSkill)
		bOverrideWarriorSkill = !bOverrideWarriorSkill
		SetToggleOptionValue(a_option, bOverrideWarriorSkill)
		if(SR_MCM_Override_WarriorSkill.GetValue() == 0)
			SR_MCM_Override_WarriorSkill.SetValue(1)
		else
			SR_MCM_Override_WarriorSkill.SetValue(0)
		endif

	elseIf (a_option == iOverridePersuasions)
		bOverridePersuasions = !bOverridePersuasions
		SetToggleOptionValue(a_option, bOverridePersuasions)
		if(SR_MCM_Override_Persuasions.GetValue() == 0)
			SR_MCM_Override_Persuasions.SetValue(1)
		else
			SR_MCM_Override_Persuasions.SetValue(0)
		endif

	elseIf (a_option == iOverrideIntimidations)
		bOverrideIntimidations = !bOverrideIntimidations
		SetToggleOptionValue(a_option, bOverrideIntimidations)
		if(SR_MCM_Override_Intimidations.GetValue() == 0)
			SR_MCM_Override_Intimidations.SetValue(1)
		else
			SR_MCM_Override_Intimidations.SetValue(0)
		endif
	
	elseIf (a_option == iOverrideBribes)
		bOverrideBribes = !bOverrideBribes
		SetToggleOptionValue(a_option, bOverrideBribes)
		if(SR_MCM_Override_Bribes.GetValue() == 0)
			SR_MCM_Override_Bribes.SetValue(1)
		else
			SR_MCM_Override_Bribes.SetValue(0)
		endif

	elseIf (a_option == iOverrideBooksRead)
		bOverrideBooksRead = !bOverrideBooksRead
		SetToggleOptionValue(a_option, bOverrideBooksRead)
		if(SR_MCM_Override_BooksRead.GetValue() == 0)
			SR_MCM_Override_BooksRead.SetValue(1)
		else
			SR_MCM_Override_BooksRead.SetValue(0)
		endif

	elseIf (a_option == iOverrideKillsUndead)
		bOverrideKillsUndead = !bOverrideKillsUndead
		SetToggleOptionValue(a_option, bOverrideKillsUndead)
		if(SR_MCM_Override_KillsUndead.GetValue() == 0)
			SR_MCM_Override_KillsUndead.SetValue(1)
		else
			SR_MCM_Override_KillsUndead.SetValue(0)
		endif
	
	elseIf (a_option == iOverrideKillsDaedra)
		bOverrideKillsDaedra = !bOverrideKillsDaedra
		SetToggleOptionValue(a_option, bOverrideKillsDaedra)
		if(SR_MCM_Override_KillsDaedra.GetValue() == 0)
			SR_MCM_Override_KillsDaedra.SetValue(1)
		else
			SR_MCM_Override_KillsDaedra.SetValue(0)
		endif

	elseIf (a_option == iOverrideKillsBandits)
		bOverrideKillsBandits = !bOverrideKillsBandits
		SetToggleOptionValue(a_option, bOverrideKillsBandits)
		if(SR_MCM_Override_KillsBandits.GetValue() == 0)
			SR_MCM_Override_KillsBandits.SetValue(1)
		else
			SR_MCM_Override_KillsBandits.SetValue(0)
		endif

	elseIf (a_option == iOverrideKillsWizards)
		bOverrideKillsWizards = !bOverrideKillsWizards
		SetToggleOptionValue(a_option, bOverrideKillsWizards)
		if(SR_MCM_Override_KillsWizards.GetValue() == 0)
			SR_MCM_Override_KillsWizards.SetValue(1)
		else
			SR_MCM_Override_KillsWizards.SetValue(0)
		endif

	elseIf (a_option == iOverrideKillsWitches)
		bOverrideKillsWitches = !bOverrideKillsWitches
		SetToggleOptionValue(a_option, bOverrideKillsWitches)
		if(SR_MCM_Override_KillsWitches.GetValue() == 0)
			SR_MCM_Override_KillsWitches.SetValue(1)
		else
			SR_MCM_Override_KillsWitches.SetValue(0)
		endif

	elseIf (a_option == iOverrideKillsForsworn)
		bOverrideKillsForsworn = !bOverrideKillsForsworn
		SetToggleOptionValue(a_option, bOverrideKillsForsworn)
		if(SR_MCM_Override_KillsForsworn.GetValue() == 0)
			SR_MCM_Override_KillsForsworn.SetValue(1)
		else
			SR_MCM_Override_KillsForsworn.SetValue(0)
		endif

	elseIf (a_option == iOverrideSoulsTrapped)
		bOverrideSoulsTrapped = !bOverrideSoulsTrapped
		SetToggleOptionValue(a_option, bOverrideSoulsTrapped)
		if(SR_MCM_Override_SoulsTrapped.GetValue() == 0)
			SR_MCM_Override_SoulsTrapped.SetValue(1)
		else
			SR_MCM_Override_SoulsTrapped.SetValue(0)
		endif

	elseIf (a_option == iOverrideBlackSoulTraps)
		bOverrideBlackSoulTraps = !bOverrideBlackSoulTraps
		SetToggleOptionValue(a_option, bOverrideBlackSoulTraps)
		if(SR_MCM_Override_BlackSoulTraps.GetValue() == 0)
			SR_MCM_Override_BlackSoulTraps.SetValue(1)
		else
			SR_MCM_Override_BlackSoulTraps.SetValue(0)
		endif
	
	elseIf (a_option == iOverrideNecromancySeen)
		bOverrideNecromancySeen = !bOverrideNecromancySeen
		SetToggleOptionValue(a_option, bOverrideNecromancySeen)
		if(SR_MCM_Override_Necromancy.GetValue() == 0)
			SR_MCM_Override_Necromancy.SetValue(1)
		else
			SR_MCM_Override_Necromancy.SetValue(0)
		endif
		
	elseIf (a_option == iOverrideSeenNecroTimeDecreament)
		bOverrideSeenNecroTimeDecreament = !bOverrideSeenNecroTimeDecreament
		SetToggleOptionValue(a_option, bOverrideSeenNecroTimeDecreament)
		if(SR_MCM_Override_SeenNecroTimeDecreament.GetValue() == 0)
			SR_MCM_Override_SeenNecroTimeDecreament.SetValue(1)
		else
			SR_MCM_Override_SeenNecroTimeDecreament.SetValue(0)
		endif

	elseIf (a_option == iOverrideArcaneMastery)
		bOverrideArcaneMastery = !bOverrideArcaneMastery
		SetToggleOptionValue(a_option, bOverrideArcaneMastery)
		if(SR_MCM_Override_ArcaneMastery.GetValue() == 0)
			SR_MCM_Override_ArcaneMastery.SetValue(1)
		else
			SR_MCM_Override_ArcaneMastery.SetValue(0)
		endif

	elseIf (a_option == iOverrideRestorationMagic)
		bOverrideRestorationMagic = !bOverrideRestorationMagic
		SetToggleOptionValue(a_option, bOverrideRestorationMagic)
		if(SR_MCM_Override_RestorationMagic.GetValue() == 0)
			SR_MCM_Override_RestorationMagic.SetValue(1)
		else
			SR_MCM_Override_RestorationMagic.SetValue(0)
		endif

	elseIf (a_option == iOverrideConjugationMagic)
		bOverrideConjugationMagic = !bOverrideConjugationMagic
		SetToggleOptionValue(a_option, bOverrideConjugationMagic)
		if(SR_MCM_Override_ConjugationMagic.GetValue() == 0)
			SR_MCM_Override_ConjugationMagic.SetValue(1)
		else
			SR_MCM_Override_ConjugationMagic.SetValue(0)
		endif
		
	elseIf (a_option == iOverrideCannibalFeed)
		bOverrideCannibalFeed = !bOverrideCannibalFeed
		SetToggleOptionValue(a_option, bOverrideCannibalFeed)
		if(SR_MCM_Override_CannibalFeed.GetValue() == 0)
			SR_MCM_Override_CannibalFeed.SetValue(1)
		else
			SR_MCM_Override_CannibalFeed.SetValue(0)
		endif

	elseIf (a_option == iOverrideCharityAdded)
		bOverrideCharityAdded = !bOverrideCharityAdded
		SetToggleOptionValue(a_option, bOverrideCharityAdded)
		if(SR_MCM_Override_CharityAdded.GetValue() == 0)
			SR_MCM_Override_CharityAdded.SetValue(1)
		else
			SR_MCM_Override_CharityAdded.SetValue(0)
		endif

	elseIf (a_option == iOverrideMaxValueCap)
		bOverrideMaxValueCap = !bOverrideMaxValueCap
		SetToggleOptionValue(a_option, bOverrideMaxValueCap)
		if(bOverrideMaxValueCap == False)
			UncapRQCMaxValues()
		else
			if(_curFameDifficulty == 0);Fast
				SetRQCMaxValuesSensitive()
			elseif(_curFameDifficulty == 1);Regular
				SetRQCMaxValuesRegular()
			elseif(_curFameDifficulty == 2);Slow
				SetRQCMaxValuesTardy()
			endif
		endif

	elseIf (a_option == iEnableCheats)
		bEnableCheats = !bEnableCheats
		SetToggleOptionValue(a_option, bEnableCheats)
		if(bEnableCheats == False)
			CheatsEnabled = 0
			ForcePageReset()
		else
			CheatsEnabled = 1
			ForcePageReset()
			ShowMessage("WARNING: Increasing/decreasing scores by more than 1-3 points for any one quest may skew your reputation.", false)
		endif
		
	elseIf (a_option == iMuteMod)
		bMuteMod = !bMuteMod
		SetToggleOptionValue(a_option, bMuteMod)
		if(bMuteMod == False)
			UnmuteMod()
		else
			MuteMod()
		endif
				
;	elseIf (a_option == iVampireCustomRaceActive)
;		bVampireCustomRaceActive = !bVampireCustomRaceActive
;		SetToggleOptionValue(a_option, bVampireCustomRaceActive)
;		if(SR_MCM_VampireCustomRaceActive.GetValue() == 0)
;			SR_MCM_VampireCustomRaceActive.SetValue(1)
;		else
;			SR_MCM_VampireCustomRaceActive.SetValue(0)
;		endif
		
	elseIf (a_option == iDragonbornComments)
		bDragonbornComments = !bDragonbornComments
		SetToggleOptionValue(a_option, bDragonbornComments)
		if(SR_MCM_DragonbornComments.GetValue() == 0)
			SR_MCM_DragonbornComments.SetValue(1)
		else
			SR_MCM_DragonbornComments.SetValue(0)
		endif

	elseIf (a_option == iThaneWhiterun)
		bThaneWhiterun = !bThaneWhiterun
		SetToggleOptionValue(a_option, bThaneWhiterun)
		if(SR_MCM_Factions_Thane_Whiterun.GetValue() == 0)
			SR_MCM_Factions_Thane_Whiterun.SetValue(1)
		else
			SR_MCM_Factions_Thane_Whiterun.SetValue(0)
		endif
		
	elseIf (a_option == iSlowCalculations)
		bSlowCalculations = !bSlowCalculations
		SetToggleOptionValue(a_option, bSlowCalculations)
		if(SR_MCM_RepCalcLocChangeToggle.GetValue() == 0)
			SR_MCM_RepCalcLocChangeToggle.SetValue(1)
		else
			SR_MCM_RepCalcLocChangeToggle.SetValue(0)
		endif		
		
	elseIf (a_option == iMoonlightTales)
		bMoonlightTales = !bMoonlightTales
		SetToggleOptionValue(a_option, bMoonlightTales)
		if(SR_PluginEnabled_MoonlightTales.GetValue() == 0)
			SR_PluginEnabled_MoonlightTales.SetValue(1)
			WolfFaction.SetPlayerEnemy(false)
		else
			SR_PluginEnabled_MoonlightTales.SetValue(0)
		endif
				
	elseIf (a_option == iFameCounterUp)
		bFameCounterUp += 1
		SetTextOptionValue(a_option, bFameCounterUp)
		SR_RQC_QST.IncrementQuestFame(1)
		SR_RQC_QST.IncrementQuestFameMax()
	
	elseIf (a_option == iFameCounterDown)
		bFameCounterDown -= 1
		SetTextOptionValue(a_option, bFameCounterDown)
		if(SR_RQC_QST.QuestFame >=1)
			SR_RQC_QST.DecrementQuestFame()
			SR_RQC_QST.DecrementQuestFameMax()
		endif
	
	elseIf (a_option == iAedricCounterUp)
		bAedricCounterUp += 1
		SetTextOptionValue(a_option, bAedricCounterUp)
		SR_RQC_QST.IncrementQuestAedric(1)
		SR_RQC_QST.IncrementQuestAedricMax()
	
	elseIf (a_option == iAedricCounterDown)
		bAedricCounterDown -= 1
		SetTextOptionValue(a_option, bAedricCounterDown)
		if(SR_RQC_QST.QuestAedric >=1)
			SR_RQC_QST.DecrementQuestAedric()
			SR_RQC_QST.DecrementQuestAedricMax()
		endif
	
	elseIf (a_option == iDaedricCounterUp)
		bDaedricCounterUp += 1
		SetTextOptionValue(a_option, bDaedricCounterUp)
		SR_RQC_QST.IncrementQuestDaedric(1)
		SR_RQC_QST.IncrementQuestDaedricMax()

	elseIf (a_option == iDaedricCounterDown)
		bDaedricCounterDown -= 1
		SetTextOptionValue(a_option, bDaedricCounterDown)
		if(SR_RQC_QST.QuestDaedric >=1)
			SR_RQC_QST.DecrementQuestDaedric()
			SR_RQC_QST.DecrementQuestDaedricMax()
		endif
		
	elseIf (a_option == iLawCounterUp)
		bLawCounterUp += 1
		SetTextOptionValue(a_option, bLawCounterUp)
		SR_RQC_QST.IncrementQuestLaw(1)
		SR_RQC_QST.IncrementQuestLawMax()

	elseIf (a_option == iLawCounterDown)
		bLawCounterDown -= 1
		SetTextOptionValue(a_option, bLawCounterDown)
		if(SR_RQC_QST.QuestLaw >=1)
			SR_RQC_QST.DecrementQuestLaw()
			SR_RQC_QST.DecrementQuestLawMax()
		endif

	elseIf (a_option == iCrimeCounterUp)
		bCrimeCounterUp += 1
		SetTextOptionValue(a_option, bCrimeCounterUp)
		SR_RQC_QST.IncrementQuestCrime(1)
		SR_RQC_QST.IncrementQuestCrimeMax()	
		
	elseIf (a_option == iCrimeCounterDown)
		bCrimeCounterDown -= 1
		SetTextOptionValue(a_option, bCrimeCounterDown)
		if(SR_RQC_QST.QuestCrime >=1)
			SR_RQC_QST.DecrementQuestCrime()
			SR_RQC_QST.DecrementQuestCrimeMax()
		endif
		
	elseIf (a_option == iDepCounterUp)
		bDepCounterUp += 1
		SetTextOptionValue(a_option, bDepCounterUp)
		SR_RQC_QST.IncrementQuestDependability(1)
		SR_RQC_QST.IncrementQuestDependabilityMax()	
		
	elseIf (a_option == iDepCounterDown)
		bDepCounterDown -= 1
		SetTextOptionValue(a_option, bDepCounterDown)
		if(SR_RQC_QST.QuestDependability >=1)
			SR_RQC_QST.DecrementQuestDependability()
			SR_RQC_QST.DecrementQuestDependabilityMax()
		endif
		
	elseIf (a_option == iAmbCounterUp)
		bAmbCounterUp += 1
		SetTextOptionValue(a_option, bAmbCounterUp)
		SR_RQC_QST.IncrementQuestAmbition(1)
		SR_RQC_QST.IncrementQuestAmbitionMax()
		
	elseIf (a_option == iAmbCounterDown)
		bAmbCounterDown -= 1
		SetTextOptionValue(a_option, bAmbCounterDown)
		if(SR_RQC_QST.QuestAmbition >=1)
			SR_RQC_QST.DecrementQuestAmbition()
			SR_RQC_QST.DecrementQuestAmbitionMax()
		endif
		
	elseIf (a_option == iResetTimeDec)
		SetTextOptionValue(a_option, "DONE")
		CalibrateDecrementPropertyValues()
		
	elseIf (a_option == iForceRep)
		SetTextOptionValue(a_option, "DONE")
		SR_RQC_Debug.ForceCalculateReputation()
		if(bMuteMod == true)
			UnmuteMod()
			bMuteMod = false
		endif
	
	elseIf (a_option == iResetMod)
		SetTextOptionValue(a_option, "DONE")
		ResetDecrementPropertyValues()
		SetCounterBalanceValuesAll(1)
		ResetCounterValues()
		
	elseIf (a_option == iResetCrimes)
		SetTextOptionValue(a_option, "DONE")
		SetCounterBalanceValuesCrimeStat(0.5)
	
	elseIf (a_option == iResetMagic)
		SetTextOptionValue(a_option, "DONE")
		SetCounterBalanceValuesMageStat(0.5)
	
	elseIf (a_option == iResetExternaContent)
		SetTextOptionValue(a_option, "DONE")
		ResetPluginDecrementPropertyValues()
		SetCounterBalanceValuesModAdded(1)
	
	elseIf (a_option == iResetAllResets)
		SetTextOptionValue(a_option, "DONE")
		SetCounterBalanceValuesAll(0)
		ResetDecrementPropertyValues()
	;FISSFactory
	elseIf (a_option == OID_LoadPreset)
		BeginLoadPreset()
		;Utility.Wait(2)
		;ResetQuestForToggleGlobals()
	elseIf (a_option == OID_SavePreset)	
		BeginSavePreset()
		
	endif
endEvent

event OnOptionMenuOpen(int a_option)
	{Called when the user selects a menu option}
	if (a_option == _FameDifficultyMenu_M)
		SetMenuDialogStartIndex(_curFameDifficulty)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(_FameDifficultyList)
	elseif (a_option == _VampWereDifficultyMenu_M)
		SetMenuDialogStartIndex(_curVampWereDifficulty)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(_VampWereDifficultyList)
	endIf
endEvent

event OnOptionMenuAccept(int a_option, int a_index)
	{Called when the user accepts a new menu entry}
	if (a_option == _FameDifficultyMenu_M)
		_curFameDifficulty = a_index
		SetMenuOptionValue(a_option, _FameDifficultyList[_curFameDifficulty])
		if(bOverrideMaxValueCap == False)
			if(_curFameDifficulty == 0);Fast
				SR_RQC_QST.SetFameThresholdOne(2)
				SR_RQC_QST.SetFameThresholdTwo(7)
				SR_RQC_QST.SetFameThresholdThree(15)
				SR_RQC_QST.SetFameThresholdFour(30)
				SetRQCDenominatorsSensitive()
			elseif(_curFameDifficulty == 1);Regular
				SR_RQC_QST.SetFameThresholdOne(4)
				SR_RQC_QST.SetFameThresholdTwo(12)
				SR_RQC_QST.SetFameThresholdThree(25)
				SR_RQC_QST.SetFameThresholdFour(50)
				SetRQCDenominatorsRegular()
			elseif(_curFameDifficulty == 2);Slow
				SR_RQC_QST.SetFameThresholdOne(6)
				SR_RQC_QST.SetFameThresholdTwo(17)
				SR_RQC_QST.SetFameThresholdThree(35)
				SR_RQC_QST.SetFameThresholdFour(70)
				SetRQCDenominatorsTardy()
			endif		
		elseif(bOverrideMaxValueCap == True)
			if(_curFameDifficulty == 0);Fast
				SR_RQC_QST.SetFameThresholdOne(2)
				SR_RQC_QST.SetFameThresholdTwo(7)
				SR_RQC_QST.SetFameThresholdThree(15)
				SR_RQC_QST.SetFameThresholdFour(30)
				SetRQCDenominatorsSensitive()
				SetRQCMaxValuesSensitive()
			elseif(_curFameDifficulty == 1);Regular
				SR_RQC_QST.SetFameThresholdOne(4)
				SR_RQC_QST.SetFameThresholdTwo(12)
				SR_RQC_QST.SetFameThresholdThree(25)
				SR_RQC_QST.SetFameThresholdFour(50)
				SetRQCDenominatorsRegular()
				SetRQCMaxValuesRegular()
			elseif(_curFameDifficulty == 2);Slow
				SR_RQC_QST.SetFameThresholdOne(6)
				SR_RQC_QST.SetFameThresholdTwo(17)
				SR_RQC_QST.SetFameThresholdThree(35)
				SR_RQC_QST.SetFameThresholdFour(70)
				SetRQCDenominatorsTardy()
				SetRQCMaxValuesTardy()
			endif
		endif
	elseif (a_option == _VampWereDifficultyMenu_M)
		_curVampWereDifficulty = a_index
		SetMenuOptionValue(a_option, _VampWereDifficultyList[_curVampWereDifficulty])
		if(_curVampWereDifficulty == 0);Suspicious
			SetVampWereDenominatorsSuspicious()
			SetVampWereDecrementorsSuspicious()	
			SetVampWereMaxSuspicious()
		elseif(_curVampWereDifficulty == 1);Regular
			SetVampWereDenominatorsRegular()
			SetVampWereDecrementorsRegular()
			SetVampWereMaxRegular()
		elseif(_curVampWereDifficulty == 2);Oblivious
			SetVampWereDenominatorsOblivious()
			SetVampWereDecrementorsOblivious()
			SetVampWereMaxOblivious()
		endif
	endif
endEvent

Function FlattenCounterValues()
	BalanceCounterValues()
	ResetCounterValues()
EndFunction

Function ResetCounterValues()
	int FameScore = SR_RQC_QST.QuestFameScore() as Int
	int DaedricScore = SR_RQC_QST.QuestDaedricScore() as Int
	int AedricScore = SR_RQC_QST.QuestAedricScore() as Int
	int CrimeScore = SR_RQC_QST.QuestCrimeScore() as Int
	int LawScore = SR_RQC_QST.QuestLawScore() as Int
	int DependScore = SR_RQC_QST.QuestDependabilityScore() as Int
	int AmbitionScore = SR_RQC_QST.QuestAmbitionScore() as Int
	if FameScore == 0
		bFameCounterUp = 0
		bFameCounterDown = 0
		endif
	if DaedricScore == 0
		bDaedricCounterUp = 0
		bDaedricCounterDown = 0
		endif
	if AedricScore == 0
		bAedricCounterUp = 0
		bAedricCounterDown = 0
		endif
	if CrimeScore == 0
		bCrimeCounterUp = 0
		bCrimeCounterDown = 0
		endif
	if LawScore == 0
		bLawCounterUp = 0
		bLawCounterDown = 0
		endif
	if DependScore == 0
		bDepCounterUp = 0
		bDepCounterDown = 0
		endif
	if AmbitionScore == 0
		bAmbCounterUp = 0
		bAmbCounterDown = 0
		endif
EndFunction

Function BalanceCounterValues()
	if bFameCounterUp > (bFameCounterDown * -1)
		bFameCounterUp = bFameCounterUp - (bFameCounterDown * -1)
		bFameCounterDown = 0
		else
		bFameCounterDown = bFameCounterDown - (bFameCounterUp * -1)
		bFameCounterUp = 0
		endif
	if bAedricCounterUp > (bAedricCounterDown * -1)
		bAedricCounterUp = bAedricCounterUp - (bAedricCounterDown * -1)
		bAedricCounterDown = 0
		else
		bAedricCounterDown = bAedricCounterDown - (bAedricCounterUp * -1) 
		bAedricCounterUp = 0
		endif
	if bDaedricCounterUp > (bDaedricCounterDown * -1)
		bDaedricCounterUp = bDaedricCounterUp - (bDaedricCounterDown * -1)
		bDaedricCounterDown = 0
		else
		bDaedricCounterDown = bDaedricCounterDown - (bDaedricCounterUp * -1) 
		bDaedricCounterUp = 0
		endif
	if bLawCounterUp > (bLawCounterDown * -1)
		bLawCounterUp = bLawCounterUp - (bLawCounterDown * -1)
		bLawCounterDown = 0
		else
		bLawCounterDown = bLawCounterDown - (bLawCounterUp * -1)
		bLawCounterUp = 0
		endif
	if bCrimeCounterUp > (bCrimeCounterDown * -1)
		bCrimeCounterUp = bCrimeCounterUp - (bCrimeCounterDown * -1)
		bCrimeCounterDown = 0
		else
		bCrimeCounterDown = bCrimeCounterDown - (bCrimeCounterUp * -1)
		bCrimeCounterUp = 0
		endif
	if bDepCounterUp > (bDepCounterDown * -1)
		bDepCounterUp = bDepCounterUp - (bDepCounterDown * -1)
		bDepCounterDown = 0
		else
		bDepCounterDown = bDepCounterDown - (bDepCounterUp * -1)
		bDepCounterUp = 0
		endif	
	if bAmbCounterUp > (bAmbCounterDown * -1)
		bAmbCounterUp = bAmbCounterUp - (bAmbCounterDown * -1)
		bAmbCounterDown = 0
		else
		bAmbCounterDown = bAmbCounterDown - (bAmbCounterUp * -1)
		bAmbCounterUp = 0
		endif
EndFunction


Function SetSliderValues()
	fSliderDragonKills		= SR_RQC_QST.DragonKillScore() as float
	fSliderDragonPriestKills = SR_RQC_QST.DragonPriestKillScore() as float
	fSliderBanditKills		= SR_RQC_QST.BanditKillerScore() as float
	fSliderWizardKills		= SR_RQC_QST.WizardKillerScore() as float
	fSliderWitchKills		= SR_RQC_QST.WitchKillerScore() as float
	fSliderForswornKills	= SR_RQC_QST.ForswornKillerScore() as float
	fSliderNecroTImes		= SR_RQC_QST.NecroTimesScore() as float
	fSliderSeenMurders		= SR_RQC_QST.SpottedMurderScore() as float
	fSliderSeenAssaults		= SR_RQC_QST.SpottedAssaultScore() as float
	fSliderSeenTheft		= SR_RQC_QST.SpottedPettyCrimeScore() as float
	fSliderVampiricSpellSeen	= SR_RQC_QST.VampiricSpellSeenScore() as float
	fSliderVampireLordTrans	= SR_RQC_QST.VampireLordTransformationScore() as float
	fSliderVampireLordSeen	= SR_RQC_QST.VampireLordSeenScore() as float
	fSliderVampireComments	= SR_RQC_QST.CommentVampireVillagerScore() as float
	fSliderVampireGuard		= SR_RQC_QST.CommentVampireGuardScore() as float
	fSliderWerewolfFeeds	= SR_RQC_QST.WerewolfFeedingScore() as float
	fSliderWerewolfSeen		= SR_RQC_QST.WerewolfSpottedScore() as float
	fSliderWerewolfComments	= SR_RQC_QST.CommentWerewolfVillagerScore() as float
	fSliderWerewolfGuard	= SR_RQC_QST.CommentWerewolfGuardScore() as float
	fSliderBlackSoulTrap	= SR_RQC_QST.BlackSoulTrapScore() as float
	fSliderCannibalFeed		= SR_RQC_QST.CannibalFeedScore() as float
	fSliderCharityAdded		= SR_RQC_QST.CharityScore() as float
EndFunction

Function CheckOutputOptionBoolValues()
	if(SR_MCM_WiComment_Feared_Infamy.GetValue() == 1)
		bAura_Infamy = true
		else
		bAura_Infamy = false
		endif
	if(SR_MCM_Perks_Allure.GetValue() == 1)
		bPerk_Allure = true
		else
		bPerk_Allure = false
		endif
	if(SR_MCM_Perks_Fence.GetValue() == 1)
		bPerk_Fence = true
		else
		bPerk_Fence = false
		endif
	if(SR_MCM_Perks_Intimidate.GetValue() == 1)
		bPerk_Intimidate = true
		else
		bPerk_Intimidate = false
		endif
	if(SR_MCM_Perks_PriceChanges.GetValue() == 1)
		bPerk_Barter = true
		else
		bPerk_Barter = false
		endif
	if(SR_MCM_WiComment_Unknown.GetValue() == 1)
		bComment_Unknown = true
		else
		bComment_Unknown = false
		endif
	if(SR_MCM_WiComment_Bad.GetValue() == 1)
		bComment_Bad = true
		else
		bComment_Bad = false
		endif
	if(SR_MCM_WiComment_Good.GetValue() == 1)
		bComment_Good = true
		else
		bComment_Good = false
		endif
	if(SR_MCM_WiComment_Feared.GetValue() == 1)
		bComment_Feared = true
		else
		bComment_Feared = false
		endif
	if(SR_MCM_WiComment_Guards.GetValue() == 1)
		bComment_Guards = true
		else
		bComment_Guards = false
		endif
	if(SR_MCM_WiComment_Thane.GetValue() == 1)
		bComment_Thane = true
		else
		bComment_Thane = false
		endif
	if(SR_MCM_WiComment_Child.GetValue() == 1)
		bComment_Child = true
		else
		bComment_Child = false
		endif
	if(SR_MCM_WiComment_VampireWerewolf.GetValue() == 1)
		bComment_VampireWerewolf = true
		else
		bComment_VampireWerewolf = false
		endif
	if(SR_MCM_Factions_DarkBrotherhood.GetValue() == 1)
		bFaction_DarkBrotherhood = true
		else
		bFaction_DarkBrotherhood = false
		endif
	if(SR_MCM_Factions_MageGuild.GetValue() == 1)
		bFaction_MageGuild = true
		else
		bFaction_MageGuild = false
		endif
	if(SR_MCM_Factions_ThievesGuild.GetValue() == 1)
		bFaction_ThievesGuild = true
		else
		bFaction_ThievesGuild = false
		endif
	if(SR_MCM_WiComment_Feared_AiPackage.GetValue() == 1)
		bBehavior_FearedPackage = true
		else
		bBehavior_FearedPackage = false
		endif
	if(SR_MCM_WiComment_VampireWerewolf_Hostile.GetValue() == 1)
		bBehavior_GuardsDaedra = true
		else
		bBehavior_GuardsDaedra = false
		endif
	if(ModMute == 0)
		CheckMutedFactionBoolValues()
		endif
EndFunction

Function CheckMutedFactionBoolValues()
	if(SR_MCM_Reputation_Message.GetValue() == 1)
		bMessageRep = true
		else
		bMessageRep = false
		endif
	if(SR_MCM_Factions_CourierNotes.GetValue() == 1)
		bFaction_CourierNotes = true
		else
		bFaction_CourierNotes = false
		endif
	if(SR_MCM_Factions_VigilOfStendarr.GetValue() == 1)
		bFaction_VigilOfStendarr = true
		else
		bFaction_VigilOfStendarr = false
		endif
	if(SR_MCM_Factions_Dawnguard.GetValue() == 1)
		bFaction_Dawnguard = true
		else
		bFaction_Dawnguard = false
		endif
	if(SR_MCM_Factions_Thalmor.GetValue() == 1)
		bFaction_Thalmor = true
		else
		bFaction_Thalmor = false
		endif
	if(SR_MCM_Factions_Companions.GetValue() == 1)
		bFaction_Companions = true
		else
		bFaction_Companions = false
		endif
	if(SR_MCM_Factions_Forsworn.GetValue() == 1)
		bFaction_Forsworn = true
		else
		bFaction_Forsworn = false
		endif
	if(SR_MCM_DaedricAuras_Vampire.GetValue() == 1)
		bAura_Vampire = true
		else
		bAura_Vampire = false
		endif
	if(SR_MCM_DaedricAuras_Werewolf.GetValue() == 1)
		bAura_Werewolf = true
		else
		bAura_Werewolf = false
		endif
EndFunction

Function CheckInputOptionBoolValues()
	if(SR_MCM_Override_QuestsCompleted.GetValue() == 1)
		bOverrideQuestsCompleted = true
		else
		bOverrideQuestsCompleted = false
		endif
	if(SR_MCM_Override_Locations.GetValue() == 1)
		bOverrideLocations = true
		else
		bOverrideLocations = false
		endif
	if(SR_MCM_Override_Dungeons.GetValue() == 1)
		bOverrideDungeons = true
		else
		bOverrideDungeons = false
		endif
	if(SR_MCM_Override_PeopleKills.GetValue() == 1)
		bOverridePeopleKills = true
		else
		bOverridePeopleKills = false
		endif
	if(SR_MCM_Override_StoreInvestments.GetValue() == 1)
		bOverrideStoreInvestments = true
		else
		bOverrideStoreInvestments = false
		endif
	if(SR_MCM_Override_HousesOwned.GetValue() == 1)
		bOverrideHousesOwned = true
		else
		bOverrideHousesOwned = false
		endif
	if(SR_MCM_Override_DragonsKilled.GetValue() == 1)
		bOverrideDragonsKilled = true
		else
		bOverrideDragonsKilled = false
		endif
	if(SR_MCM_Override_DragonPriestsKilled.GetValue() == 1)
		bOverrideDragonPriestsKilled = true
		else
		bOverrideDragonPriestsKilled = false
		endif
	if(SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		bOverrideWerewolfVampireTimeDec = true
		else
		bOverrideWerewolfVampireTimeDec = false
		endif
	if(SR_MCM_Override_SeenCrimeTimeDecreament.GetValue() == 1)
		bOverrideSeenCrimeTimeDecreament = true
		else
		bOverrideSeenCrimeTimeDecreament = false
		endif
	if(SR_MCM_Override_SeenNecroTimeDecreament.GetValue() == 1)
		bOverrideSeenNecroTimeDecreament = true
		else
		bOverrideSeenNecroTimeDecreament = false
		endif
	if(SR_MCM_Override_NecksBitten.GetValue() == 1)
		bOverrideNecksBitten = true
		else
		bOverrideNecksBitten = false
		endif
	if(SR_MCM_Override_VampiricSpellSeen.GetValue() == 1)
		bOverrideVampiricSpellSeen = true
		else
		bOverrideVampiricSpellSeen = false
		endif
	if(SR_MCM_Override_VampireLordTransformations.GetValue() == 1)
		bOverrideVampireLordTransformations = true
		else
		bOverrideVampireLordTransformations = false
		endif
	if(SR_MCM_Override_VampireLordSeen.GetValue() == 1)
		bOverrideVampireLordSeen = true
		else
		bOverrideVampireLordSeen = false
		endif
	if(SR_MCM_Override_VampireComments.GetValue() == 1)
		bOverrideVampireComments = true
		else
		bOverrideVampireComments = false
		endif
	if(SR_MCM_Override_WerewolfMauls.GetValue() == 1)
		bOverrideWerewolfMauls = true
		else
		bOverrideWerewolfMauls = false
		endif
	if(SR_MCM_Override_WerewolfFeeds.GetValue() == 1)
		bOverrideWerewolfFeeds = true
		else
		bOverrideWerewolfFeeds = false
		endif
	if(SR_MCM_Override_WerewolfTransformations.GetValue() == 1)
		bOverrideWerewolfTransformations = true
		else
		bOverrideWerewolfTransformations = false
		endif
	if(SR_MCM_Override_WerewolfSeen.GetValue() == 1)
		bOverrideWerewolfSeen = true
		else
		bOverrideWerewolfSeen = false
		endif
	if(SR_MCM_Override_WerewolfComments.GetValue() == 1)
		bOverrideWerewolfComments = true
		else
		bOverrideWerewolfComments = false
		endif
	if(SR_MCM_Override_PettyCrimeSeen.GetValue() == 1)
		bOverridePettyCrimeSeen = true
		else
		bOverridePettyCrimeSeen = false
		endif
	if(SR_MCM_Override_AssaultsSeen.GetValue() == 1)
		bOverrideAssaultsSeen = true
		else
		bOverrideAssaultsSeen = false
		endif
	if(SR_MCM_Override_MurdersSeen.GetValue() == 1)
		bOverrideMurdersSeen = true
		else
		bOverrideMurdersSeen = false
		endif
	if(SR_MCM_Override_Murders.GetValue() == 1)
		bOverrideMurders = true
		else
		bOverrideMurders = false
		endif
	if(SR_MCM_Override_PocketsPicked.GetValue() == 1)
		bOverridePocketsPicked = true
		else
		bOverridePocketsPicked = false
		endif
	if(SR_MCM_Override_HorsesStolen.GetValue() == 1)
		bOverrideHorsesStolen = true
		else
		bOverrideHorsesStolen = false
		endif
	if(SR_MCM_Override_ItemsStolen.GetValue() == 1)
		bOverrideItemsStolen = true
		else
		bOverrideItemsStolen = false
		endif
	if(SR_MCM_Override_Trespasses.GetValue() == 1)
		bOverrideTrespasses = true
		else
		bOverrideTrespasses = false
		endif
	if(SR_MCM_Override_JailEscapes.GetValue() == 1)
		bOverrideJailEscapes = true
		else
		bOverrideJailEscapes = false
		endif
	if(SR_MCM_Override_DaysJailed.GetValue() == 1)
		bOverrideDaysJailed = true
		else
		bOverrideDaysJailed = false
		endif
	if(SR_MCM_Override_FinesPayed.GetValue() == 1)
		bOverrideFinesPayed = true
		else
		bOverrideFinesPayed = false
		endif
	if(SR_MCM_Override_ThievesGuildMisc.GetValue() == 1)
		bOverrideThievesGuildMisc = true
		else
		bOverrideThievesGuildMisc = false
		endif
	if(SR_MCM_Override_DarkBrotherhoodMisc.GetValue() == 1)
		bOverrideDarkBrotherhoodMisc = true
		else
		bOverrideDarkBrotherhoodMisc = false
		endif
	if(SR_MCM_Override_CompanionsMisc.GetValue() == 1)
		bOverrideCompanionsMisc = true
		else
		bOverrideCompanionsMisc = false
		endif
	if(SR_MCM_Override_CollegeMisc.GetValue() == 1)
		bOverrideCollegeMisc = true
		else
		bOverrideCollegeMisc = false
		endif
	if(SR_MCM_Override_Brawls.GetValue() == 1)
		bOverrideBrawls = true
		else
		bOverrideBrawls = false
		endif
	if(SR_MCM_Override_MiscQuests.GetValue() == 1)
		bOverrideMiscQuests = true
		else
		bOverrideMiscQuests = false
		endif
	if(SR_MCM_Override_CivilWar.GetValue() == 1)
		bOverrideCivilWar = true
		else
		bOverrideCivilWar = false
		endif
	if(SR_MCM_Override_WarriorSkill.GetValue() == 1)
		bOverrideWarriorSkill = true
		else
		bOverrideWarriorSkill = false
		endif
	if(SR_MCM_Override_Persuasions.GetValue() == 1)
		bOverridePersuasions = true
		else
		bOverridePersuasions = false
		endif
	if(SR_MCM_Override_Intimidations.GetValue() == 1)
		bOverrideIntimidations = true
		else
		bOverrideIntimidations = false
		endif
	if(SR_MCM_Override_Bribes.GetValue() == 1)
		bOverrideBribes = true
		else
		bOverrideBribes = false
		endif
	if(SR_MCM_Override_BooksRead.GetValue() == 1)
		bOverrideBooksRead = true
		else
		bOverrideBooksRead = false
		endif
	if(SR_MCM_Override_KillsUndead.GetValue() == 1)
		bOverrideKillsUndead = true
		else
		bOverrideKillsUndead = false
		endif
	if(SR_MCM_Override_KillsDaedra.GetValue() == 1)
		bOverrideKillsDaedra = true
		else
		bOverrideKillsDaedra = false
		endif
	if(SR_MCM_Override_KillsBandits.GetValue() == 1)
		bOverrideKillsBandits = true
		else
		bOverrideKillsBandits = false
		endif
	if(SR_MCM_Override_KillsWizards.GetValue() == 1)
		bOverrideKillsWizards = true
		else
		bOverrideKillsWizards = false
		endif
	if(SR_MCM_Override_KillsWitches.GetValue() == 1)
		bOverrideKillsWitches = true
		else
		bOverrideKillsWitches = false
		endif
	if(SR_MCM_Override_KillsForsworn.GetValue() == 1)
		bOverrideKillsForsworn = true
		else
		bOverrideKillsForsworn = false
		endif
	if(SR_MCM_Override_SoulsTrapped.GetValue() == 1)
		bOverrideSoulsTrapped = true
		else
		bOverrideSoulsTrapped = false
		endif
	if(SR_MCM_Override_BlackSoulTraps.GetValue() == 1)
		bOverrideBlackSoulTraps = true
		else
		bOverrideBlackSoulTraps = false
		endif
	if(SR_MCM_Override_Necromancy.GetValue() == 1)
		bOverrideNecromancySeen = true
		else
		bOverrideNecromancySeen = false
		endif
	if(SR_MCM_Override_ArcaneMastery.GetValue() == 1)
		bOverrideArcaneMastery = true
		else
		bOverrideArcaneMastery = false
		endif
	if(SR_MCM_Override_RestorationMagic.GetValue() == 1)
		bOverrideRestorationMagic = true
		else
		bOverrideRestorationMagic = false
		endif
	if(SR_MCM_Override_ConjugationMagic.GetValue() == 1)
		bOverrideConjugationMagic = true
		else
		bOverrideConjugationMagic = false
		endif
	if(SR_MCM_Override_CannibalFeed.GetValue() == 1)
		bOverrideCannibalFeed = true
		else
		bOverrideCannibalFeed = false
		endif
	if(SR_MCM_Override_CharityAdded.GetValue() == 1)
		bOverrideCharityAdded = true
		else
		bOverrideCharityAdded = false
		endif
EndFunction

Function SetDebugBool()
	if(SR_MCM_Factions_Thane_Whiterun.GetValue() == 1)
		bThaneWhiterun = true
		else
		bThaneWhiterun = false
		endif
	if(SR_PluginEnabled_MoonlightTales.GetValue() == 1)
		bMoonlightTales = true
		else
		bMoonlightTales = false
		endif	
	if(SR_MCM_DragonbornComments.GetValue() == 1)
		bDragonbornComments = true
		else
		bDragonbornComments = false
		endif
;	if(SR_MCM_VampireCustomRaceActive.GetValue() == 1)
;		bVampireCustomRaceActive = true
;		else
;		bVampireCustomRaceActive = false
;		endif
	if(ModMute == 0)
		if(SR_MCM_RepCalcLocChangeToggle.GetValue() == 1)
			bSlowCalculations = false
		else
			bSlowCalculations = true
		endif
		endif
EndFunction

Function UnmuteMod()
	ModMute = 0
	SR_MCM_MagicEffectToggle.SetValue(1)
	if bMessageRep == true
		SR_MCM_Reputation_Message.SetValue(1)
		endif
	if bSlowCalculations == false
		SR_MCM_RepCalcLocChangeToggle.SetValue(1)
		endif
	if bFaction_CourierNotes == true
		SR_MCM_Factions_CourierNotes.SetValue(1)
		endif
	if bFaction_VigilOfStendarr == true
		SR_MCM_Factions_VigilOfStendarr.SetValue(1)
		endif
	if bFaction_Dawnguard == true
		SR_MCM_Factions_Dawnguard.SetValue(1)
		endif
	if bFaction_Thalmor == true
		SR_MCM_Factions_Thalmor.SetValue(1)
		endif
	if bFaction_Companions == true
		SR_MCM_Factions_Companions.SetValue(1)
		endif
	if bFaction_Forsworn == true
		SR_MCM_Factions_Forsworn.SetValue(1)
		endif
	if bAura_Vampire == true
		SR_MCM_DaedricAuras_Vampire.SetValue(1)
		endif
	if bAura_Werewolf == true
		SR_MCM_DaedricAuras_Werewolf.SetValue(1)
		endif
EndFunction

Function MuteMod()
	ModMute = 1
	SR_MCM_MagicEffectToggle.SetValue(0)
	SR_MCM_RepCalcLocChangeToggle.SetValue(0)
	SR_MCM_Reputation_Message.SetValue(0)
	SR_MCM_Factions_CourierNotes.SetValue(0)
	SR_MCM_Factions_Companions.SetValue(0)
	SR_MCM_Factions_Dawnguard.SetValue(0)
	SR_MCM_Factions_Forsworn.SetValue(0)
	SR_MCM_Factions_Thalmor.SetValue(0)
	SR_MCM_Factions_VigilOfStendarr.SetValue(0)
	SR_MCM_DaedricAuras_Vampire.SetValue(0)
	SR_MCM_DaedricAuras_Werewolf.SetValue(0)
	SR_RQC_Debug.RunFullReset()
EndFunction

event OnOptionSliderOpen(int a_option)
	int DragonKillsMax 			= SR_RQC_QST.DragonKillsMax as int
	int DragonPriestKillsMax 	= SR_RQC_QST.DragonPriestKillsMax as int
	int BanditsKilledMax 		= SR_RQC_QST.BanditsKilledMax as int
	int WizardKillerMax 		= SR_RQC_QST.WizardKillerMax as int
	int WitchKillerMax 			= SR_RQC_QST.WitchKillerMax as int
	int ForswornKillerMax 		= SR_RQC_QST.ForswornKillerMax as int
	int SpottedAssaultsMax 		= SR_RQC_QST.SpottedAssaultsMax as int
	int SpottedMurdersMax 		= SR_RQC_QST.SpottedMurdersMax as int
	int SpottedPettyCrimeMax 	= SR_RQC_QST.SpottedPettyCrimeMax as int
	int CharityMax 				= SR_RQC_QST.CharityMax as int
	int CannibalFeedMax 		= SR_RQC_QST.CannibalFeedMax as int
	int ZombieTimeMax 			= SR_RQC_QST.ZombieTimeMax as int
	int BlackSoulTrapMax 		= SR_RQC_QST.BlackSoulTrapMax as int
	int VampiricSpellSeenMax 	= SR_RQC_QST.VampiricSpellSeenMax as int
	int VampireLordTransformationMax = SR_RQC_QST.VampireLordTransformationMax as int
	int VampireLordSeenMax 		= SR_RQC_QST.VampireLordSeenMax as int
	int VampireVillagerMax 		= SR_RQC_QST.VampireVillagerMax as int
	int VampireGuardMax 		= SR_RQC_QST.VampireGuardMax as int
	int WerewolfFeedsMax 		= SR_RQC_QST.WerewolfFeedsMax as int
	int TimesSpottedWerewolfMax = SR_RQC_QST.TimesSpottedWerewolfMax as int
	int WerewolfVillagerMax 	= SR_RQC_QST.WerewolfVillagerMax as int
	int WerewolfGuardMax 		= SR_RQC_QST.WerewolfGuardMax as int
	
	SetSliderDialogDefaultValue(0) ; This was duplicated for all options
	
	If a_option == srt_iFameMult
		SetSliderDialogStartValue(SRTFameMult.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 2)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == srt_iAedricMult
		SetSliderDialogStartValue(SRTAedricMult.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 2)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == srt_iDaedricMult
		SetSliderDialogStartValue(SRTDaedricMult.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 2)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == srt_iDependabilityMult
		SetSliderDialogStartValue(SRTDependabilityMult.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 2)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == srt_iAmbitionMult
		SetSliderDialogStartValue(SRTAmbitionMult.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 2)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == srt_iCrimeMult
		SetSliderDialogStartValue(SRTCrimeMult.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 2)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == srt_iLawMult
		SetSliderDialogStartValue(SRTLawMult.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 2)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == srt_iVampireMult
		SetSliderDialogStartValue(SRTVampireMult.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 2)
		SetSliderDialogInterval(0.1)
	ElseIf a_option == srt_iWerewolfMult
		SetSliderDialogStartValue(SRTWerewolfMult.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(0, 2)
		SetSliderDialogInterval(0.1)
;	ElseIf a_option == srt_iRacismMult
;		SetSliderDialogStartValue(SRTRacismMult.GetValue())
;		SetSliderDialogDefaultValue(1)
;		SetSliderDialogRange(0, 2)
;		SetSliderDialogInterval(0.1)

	
	
	ElseIf (a_option == iSliderDragonKills)
		SetSliderDialogStartValue(fSliderDragonKills)
		SetSliderDialogRange(0, DragonKillsMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderDragonPriestKills)
		SetSliderDialogStartValue(fSliderDragonPriestKills)
		SetSliderDialogRange(0, DragonPriestKillsMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderBanditKills)
		SetSliderDialogStartValue(fSliderBanditKills)
		SetSliderDialogRange(0, BanditsKilledMax)
		SetSliderDialogInterval(10)
	elseif (a_option == iSliderForswornKills)
		SetSliderDialogStartValue(fSliderForswornKills)
		SetSliderDialogRange(0, ForswornKillerMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderWizardKills)
		SetSliderDialogStartValue(fSliderWizardKills)
		SetSliderDialogRange(0, WizardKillerMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderWitchKills)
		SetSliderDialogStartValue(fSliderWitchKills)
		SetSliderDialogRange(0, WitchKillerMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderNecroTImes)
		SetSliderDialogStartValue(fSliderNecroTImes)
		SetSliderDialogRange(0, ZombieTimeMax)
	elseif (a_option == iSliderBlackSoulTrap)
		SetSliderDialogStartValue(fSliderBlackSoulTrap)
		SetSliderDialogRange(0, BlackSoulTrapMax)
	elseif (a_option == iSliderCannibalFeed)
		SetSliderDialogStartValue(fSliderCannibalFeed)
		SetSliderDialogRange(0, CannibalFeedMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderCharityAdded)
		SetSliderDialogStartValue(fSliderCharityAdded)
		SetSliderDialogRange(0, CharityMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderSeenMurders)
		SetSliderDialogStartValue(fSliderSeenMurders)
		SetSliderDialogRange(0, SpottedMurdersMax)
	elseif (a_option == iSliderSeenAssaults)
		SetSliderDialogStartValue(fSliderSeenAssaults)
		SetSliderDialogRange(0, SpottedAssaultsMax)
		SetSliderDialogInterval(1)		
	elseif (a_option == iSliderSeenTheft)
		SetSliderDialogStartValue(fSliderSeenTheft)
		SetSliderDialogRange(0, SpottedPettyCrimeMax)
		SetSliderDialogInterval(1)	
	elseif (a_option == iSliderVampiricSpellSeen)
		SetSliderDialogStartValue(fSliderVampiricSpellSeen)
		SetSliderDialogRange(0, VampiricSpellSeenMax)
		SetSliderDialogInterval(1)	
	elseif (a_option == iSliderVampireLordTrans)
		SetSliderDialogStartValue(fSliderVampireLordTrans)
		SetSliderDialogRange(0, VampireLordTransformationMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderVampireLordSeen)
		SetSliderDialogStartValue(fSliderVampireLordSeen)
		SetSliderDialogRange(0, VampireLordSeenMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderVampireComments)
		SetSliderDialogStartValue(fSliderVampireComments)
		SetSliderDialogRange(0, VampireVillagerMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderVampireGuard)
		SetSliderDialogStartValue(fSliderVampireGuard)
		SetSliderDialogRange(0, VampireGuardMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderWerewolfSeen)
		SetSliderDialogStartValue(fSliderWerewolfSeen)
		SetSliderDialogRange(0, TimesSpottedWerewolfMax)
		SetSliderDialogInterval(1)		
	elseif (a_option == iSliderWerewolfFeeds)
		SetSliderDialogStartValue(fSliderWerewolfFeeds)
		SetSliderDialogRange(0, WerewolfFeedsMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderWerewolfComments)
		SetSliderDialogStartValue(fSliderWerewolfComments)
		SetSliderDialogRange(0, WerewolfVillagerMax)
		SetSliderDialogInterval(1)
	elseif (a_option == iSliderWerewolfGuard)
		SetSliderDialogStartValue(fSliderWerewolfGuard)
		SetSliderDialogRange(0, WerewolfGuardMax)
		SetSliderDialogInterval(1)
	endIf
endEvent

event OnOptionSliderAccept(int a_option, float a_value)
	{Called when the user accepts a new slider value}
	
	If a_option == srt_iFameMult
		SetSliderOptionValue(a_option, a_value, "{1}")
		SRTFameMult.SetValue(a_value)
	ElseIf a_option == srt_iAedricMult
		SetSliderOptionValue(a_option, a_value, "{1}")
		SRTAedricMult.SetValue(a_value)
	ElseIf a_option == srt_iDaedricMult
		SetSliderOptionValue(a_option, a_value, "{1}")
		SRTDaedricMult.SetValue(a_value)
	ElseIf a_option == srt_iDependabilityMult
		SetSliderOptionValue(a_option, a_value, "{1}")
		SRTDependabilityMult.SetValue(a_value)
	ElseIf a_option == srt_iAmbitionMult
		SetSliderOptionValue(a_option, a_value, "{1}")
		SRTAmbitionMult.SetValue(a_value)
	ElseIf a_option == srt_iCrimeMult
		SetSliderOptionValue(a_option, a_value, "{1}")
		SRTCrimeMult.SetValue(a_value)
	ElseIf a_option == srt_iLawMult
		SetSliderOptionValue(a_option, a_value, "{1}")
		SRTLawMult.SetValue(a_value)
	ElseIf a_option == srt_iVampireMult
		SetSliderOptionValue(a_option, a_value, "{1}")
		SRTVampireMult.SetValue(a_value)
	ElseIf a_option == srt_iWerewolfMult
		SetSliderOptionValue(a_option, a_value, "{1}")
		SRTWerewolfMult.SetValue(a_value)
;	ElseIf a_option == srt_iRacismMult
;		SetSliderOptionValue(a_option, a_value, "{1}")
;		SRTRacismMult.SetValue(a_value)
	
	
	ElseIf (a_option == iSliderDragonKills)
		fSliderDragonKills = a_value
		float DragonKills = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetKillsDragons(DragonKills as int)
		SR_RQC_QST.SetDragonsKilled_CounterBalance(0)
	elseif (a_option == iSliderDragonPriestKills)
		fSliderDragonPriestKills = a_value
		float DragonPriestKills = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetKillsDragonPriests(DragonPriestKills as int)
		SR_RQC_QST.SetDragonPriestsKilled_CounterBalance(0)
	elseif (a_option == iSliderBanditKills)
		fSliderBanditKills = a_value
		float BanditKills = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetKillsBandits(BanditKills as int)
		SR_RQC_QST.SetKillsBandits_CounterBalance(0)
	elseif (a_option == iSliderForswornKills)
		fSliderForswornKills = a_value
		float ForswornKills = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetKillsForsworn(ForswornKills as int)
		SR_RQC_QST.SetKillsForsworn_CounterBalance(0)
	elseif (a_option == iSliderWizardKills)
		fSliderWizardKills = a_value
		float WizardKills = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetKillsWizards(WizardKills as int)
		SR_RQC_QST.SetKillsWizards_CounterBalance(0)
	elseif (a_option == iSliderWitchKills)
		fSliderWitchKills = a_value
		float WitchKills = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetKillsWitches(WitchKills as int)
		SR_RQC_QST.SetKillsWitches_CounterBalance(0)
	elseif (a_option == iSliderNecroTImes)
		fSliderNecroTImes = a_value
		float NecroTimes = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetSpellNecromancySeen(NecroTimes as int)
		SR_RQC_QST.SetNecromancy_CounterBalance(0)
	elseif (a_option == iSliderBlackSoulTrap)
		fSliderBlackSoulTrap = a_value
		float BlackSoulTrap = a_value
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetBlackSoulTraps(BlackSoulTrap as int)
		SR_RQC_QST.SetBlackSoulTraps_CounterBalance(0)
	elseif (a_option == iSliderCannibalFeed)
		fSliderCannibalFeed = a_value
		float CannibalFeed = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetSpellCannibalFeed(CannibalFeed as int)
		SR_RQC_QST.SetCannibalFeed_CounterBalance(0)
	elseif (a_option == iSliderCharityAdded)
		fSliderCharityAdded = a_value
		float CharityAdded = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetSpellCharityAdded(CharityAdded as int)
		SR_RQC_QST.SetCharityAdded_CounterBalance(0)
	elseif (a_option == iSliderSeenMurders)
		fSliderSeenMurders = a_value
		float SeenMurders = (a_value/1.5)
		float MurderArrests = (a_value/1.5)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetCrimeMurdersSeen(SeenMurders +1)
		SR_RQC_QST.SetCrimeMurderArrests(MurderArrests)
		SR_RQC_QST.SetMurdersSeen_CounterBalance(0)
	elseif (a_option == iSliderSeenAssaults)
		fSliderSeenAssaults = a_value
		float SeenAssaults = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetCrimeAssaultsSeen(SeenAssaults as int)
		SR_RQC_QST.SetAssaultsSeen_CounterBalance(0)
	elseif (a_option == iSliderSeenTheft)
		fSliderSeenTheft = a_value
		float PettyCrime = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetCrimePettySeen(PettyCrime as int)
		SR_RQC_QST.SetPettyCrimeSeen_CounterBalance(0)
	elseif (a_option == iSliderVampiricSpellSeen)
		fSliderVampiricSpellSeen = a_value
		float VampiricSpellSeen = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetSpellVampiricSpellSeen(VampiricSpellSeen as int)
		SR_RQC_QST.SetVampiricSpellSeen_CounterBalance(0)
	elseif (a_option == iSliderVampireLordTrans)
		fSliderVampireLordTrans = a_value
		float VampireLordTrans = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetVampireLordTransformations(VampireLordTrans as int)
		SR_RQC_QST.SetVampireLordTransformations_CounterBalance(0)
	elseif (a_option == iSliderVampireLordSeen)
		fSliderVampireLordSeen = a_value
		float VampireLordSeen = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetCrimeVampireLordSeen(VampireLordSeen as int)
		SR_RQC_QST.SetVampireLordSeen_CounterBalance(0)
	elseif (a_option == iSliderVampireComments)
		fSliderVampireComments = a_value
		float VampireComments = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetCommentVampireVillager(VampireComments as int)
		SR_RQC_QST.SetVampireComments_CounterBalance(0)
	elseif (a_option == iSliderVampireGuard)
		fSliderVampireGuard = a_value
		float VampireGuard = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetCommentVampireGuard(VampireGuard as int)
		SR_RQC_QST.SetVampireGuardComments_CounterBalance(0)
	elseif (a_option == iSliderWerewolfFeeds)
		fSliderWerewolfFeeds = a_value
		float WerewolfFeeds = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetWerewolfFeedings(WerewolfFeeds as int)
		SR_RQC_QST.SetWerewolfFeeds_CounterBalance(0)		
	elseif (a_option == iSliderWerewolfSeen)
		fSliderWerewolfSeen = a_value
		float WerewolfSeen = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetCrimeWerewolfSeen(WerewolfSeen as int)	
		SR_RQC_QST.SetWerewolfSeen_CounterBalance(0)
	elseif (a_option == iSliderWerewolfComments)
		fSliderWerewolfComments = a_value
		float WerewolfComments = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetCommentWerewolfVillager(WerewolfComments as int)
		SR_RQC_QST.SetWerewolfComments_CounterBalance(0)
	elseif (a_option == iSliderWerewolfGuard)
		fSliderWerewolfGuard = a_value
		float WerewolfGuard = (a_value)
		SetSliderOptionValue(a_option, a_value, "{0}")
		SR_RQC_QST.SetCommentWerewolfGuard(WerewolfGuard as int)
		SR_RQC_QST.SetWerewolfGuardComments_CounterBalance(0)
		
	endIf
endEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ITEM INFO DISPLAY EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; @implements SKI_ConfigBase
event OnOptionHighlight(int a_option)
	{Called when the user highlights an option}

	If a_option == srt_iGDO
		SetInfoText("Remove duplicate dialogue for thanes if GDO is installed")
	ElseIf a_option == srt_iGreyCowl
		SetInfoText("Wearing the cowl will hide your identity")
	ElseIf a_option == srt_iUnbound
		SetInfoText("Prevent reputation gain from quests skipped by Skyirm Unbound")
	ElseIf a_option == srt_iAedricMult || a_option == srt_iDaedricMult || a_option == srt_iDependabilityMult || a_option == srt_iAmbitionMult || a_option == srt_iLawMult || a_option == srt_iCrimeMult || a_option == srt_iVampireMult || a_option == srt_iWerewolfMult 
		SetInfoText("Multiplier for the influence of the selected stat on your reputation")
	ElseIf a_option == srt_iFameMult
		SetInfoText("Multiplier for total fame")
;	Elseif a_option == srt_iRacismMult
;		SetInfoText("Multiplier for race based reputation")
	ElseIf a_option == srt_iLoadScreens
		SetInfoText("Enable loading screens added by Skyrim Reputation")
	ElseIf (a_option == iReputationStatus)
		SetInfoText("(Worst)  Feared  |  Hated  |  Disliked  |  Unknown/Neutral  |  Liked  |  Admired  |  Hero  (Best)")
	elseIf (a_option == iReputationLevel)
		SetInfoText("MAXIMUM fame/notoriety lvl: 1 = Unknown | 2 = Liked/Disliked | 3 = Admired/Hated | 4 = Hero/Feared")
	elseIf (a_option == iWerewolfSuspicion)
		SetInfoText("Suspicion level and how likely people think it is that you are a Werewolf")
	elseIf (a_option == iVampireSuspicion)
		SetInfoText("Suspicion level and how likely people think it is that you are a Vampire")			
	elseIf (a_option == iPriceChangeStatus)
		SetInfoText("Price adjustments at non-guild vendors, before any perks are applied. Disable in 'Output Options'")
	elseIf (a_option == iBarterPerkStatus)
		SetInfoText("See description and toggle the reputation based perks on/off in 'Output Options'")
	elseIf (a_option == iInfluencePerkStatus)
		SetInfoText("See description and toggle the reputation based perks on/off in 'Output Options'")
	elseIf (a_option == iDaedricPerks)
		SetInfoText("See description and toggle the reputation based perks on/off in 'Output Options'")
	elseIf (a_option == iAedricLevel)
		SetInfoText("Devotion is measured in willingness to help at local temples, display of virtues and rejection of Daedra")
	elseIf (a_option == iDaedricLevel)
		SetInfoText("Daedric taint is measured in times doing their bidding or by using their gifts (e.g. vampirism and lycanthropy)")
	elseIf (a_option == iLawLevel)
		SetInfoText("Lawfulness is measured in willingness to enforce the law, do bandit bounties and restore rules and order")
	elseIf (a_option == iCrimeLevel)
		SetInfoText("Lawlessness is measured in willingness to commit crime, trespasses, thefts, assaults and murders")
	elseIf (a_option == iDepLevel)
		SetInfoText("Dependability is measured in willingness to help in local affairs or display of Nord warrior virtues")
	elseIf (a_option == iAmbLevel)
		SetInfoText("Power-hunger is measured in wllingness to further of your own ambitions by deceit, betrayal or dark magic")
	elseif (a_option == _FameDifficultyMenu_M)
		SetInfoText("Change how quickly and severely your individual actions are judged (highest impact and strictest cap at Sensitive)")
	elseif (a_option == _VampWereDifficultyMenu_M)
		SetInfoText("Change how quickly people catch onto your Vampirism/Lycanthropy (fastest gain and slowest reduction at Suspicious)")
	elseif (a_option == iAura_Vampire)
		SetInfoText("Denotes detectable Vampire traits. Makes Skeletons and Spiders neutral towards players at Vampire-stage 2 and above")
	elseIf (a_option == iAura_Werewolf)
		SetInfoText("Denotes detectable Werewolf traits. Makes Werewolves and Wolves neutral towards recently transformed werewolf players, in human form")
	elseIf (a_option == iAura_Infamy)
		SetInfoText("Hostile enemies have a 10% chance to flee a 'Feared' players")
	elseIf (a_option == iPerk_Allure)
		SetInfoText("15% better prices with the opposite sex for 'Admired' and 'Hero' players")
	elseIf (a_option == iPerk_Fence)
		SetInfoText("Disliked, Hated and Feared players can barter stolen goods if they also have a high Crime score")
	elseIf (a_option == iPerk_Intimidate)
		SetInfoText("Hated and Feared players' intimidation checks are 25% more successful")
	elseIf (a_option == iPerk_Barter)
		SetInfoText("Your reputation influences your bartering skill, resulting in price changes")
	elseIf (a_option == iMessageRep)
		SetInfoText("Toggle reputation change notifications and effects")	
	elseIf (a_option == iFaction_CourierNotes)
		SetInfoText("Toggle ALL mod added notes ON/OFF. If on, joinable factions and NPCs may send you courier notes")
	elseIf (a_option == iFaction_Companions)
		SetInfoText("Toggle notes and reactions. The Companions let famous players join quickly and boots out evil doers")	
	elseIf (a_option == iFaction_VigilOfStendarr)
		SetInfoText("Toggle notes and reactions. The Vigilants of Stendarr to become hostile towards daedra worshipping players")
	elseIf (a_option == iFaction_Dawnguard)
		SetInfoText("Toggle notes and reactions. The Dawnguard to become hostile towards known vampire players")
	elseIf (a_option == iFaction_Thalmor)
		SetInfoText("Toggle notes and reactions. The Thalmor to become hostile against meddling players")
	elseIf (a_option == iFaction_DarkBrotherhood)
		SetInfoText("Toggle if you want the Dark Brotherhood to respond to send you courier notes")
	elseIf (a_option == iFaction_Forsworn)
		SetInfoText("Toggle notes and reactions. Saving Madanach makes the many Forsworn camps friendly to player")
	elseIf (a_option == iFaction_MageGuild)
		SetInfoText("Toggle if you want the College of Winterhold to send you courier notes")
	elseIf (a_option == iFaction_ThievesGuild)
		SetInfoText("Toggle if you want the Thieves Guild to respond to send you courier notes")
	elseIf (a_option == iComment_Unknown)
		SetInfoText("Citizens comment on players with 'Unknown' reputation")
	elseIf (a_option == iComment_Bad)
		SetInfoText("Citizens comment on players with 'Disliked', 'Hated' and 'Feared' reputation")
	elseIf (a_option == iComment_Good)
		SetInfoText("Citizens comment on players with 'Liked', 'Admired' and 'Hero' reputation")
	elseIf (a_option == iComment_Feared)
		SetInfoText("Citizens say things like 'Don't hurt me!' to players with 'Feared' reputation")
	elseIf (a_option == iComment_Guards)
		SetInfoText("Guards comment on players' reputation, most responsive to the Law and Crime dimension")
	elseIf (a_option == iComment_Thane)
		SetInfoText("Citizens comment on players that are Thane in their current location")
	elseIf (a_option == iComment_Child)
		SetInfoText("Toggle the Vampire and Werewolf related comments")
	elseIf (a_option == iComment_VampireWerewolf)
		SetInfoText("Citizens comment on players that are Vampires or Werewolves")	
	elseIf (a_option == iBehavior_FearedPackage)
		SetInfoText("Citizens sometimes run away from players with 'Feared' reputation")
	elseIf (a_option == iBehavior_GuardsDaedra)
		SetInfoText("Guards and NPCs have may attack Vampire and Werewolf players with high suspision")

	elseIf (a_option == iOverrideMaxValueCap)
		SetInfoText("Individual contributors are capped for balance, uncap if you find your points maxed out at higher levels")
	elseIf (a_option == iOverrideWerewolfVampireTimeDec)
		SetInfoText("Toggle the gradual reduction of Vampire and Werewolf suspicions")	
	elseIf (a_option == iOverrideSeenCrimeTimeDecreament)
		SetInfoText("Toggle the gradual reduction of witnessed instances of Crime")
	elseIf (a_option == iOverrideSeenNecroTimeDecreament)
		SetInfoText("Toggle the gradual reduction of witnessed instances of Necromancy")	
	elseIf (a_option == iOverrideQuestsCompleted)
		SetInfoText("Toggle the reputation contribution of the total number of quests completed")		
	elseIf (a_option == iOverrideLocations)
		SetInfoText("Toggle the reputation contribution of locations discovered")		
	elseIf (a_option == iOverrideDungeons)
		SetInfoText("Toggle the reputation contribution of number of dungeons cleared")		
	elseIf (a_option == iOverridePeopleKills)
		SetInfoText("Toggle the reputation contribution of the total number of people killed")		
	elseIf (a_option == iOverrideStoreInvestments)
		SetInfoText("Toggle the reputation contribution of the number of store investments")		
	elseIf (a_option == iOverrideHousesOwned)
		SetInfoText("Toggle the reputation contribution of the number of houses owned")		
	elseIf (a_option == iOverrideDragonsKilled)
		SetInfoText("Toggle the reputation contribution of the number of dragons killed")		
	elseIf (a_option == iOverrideNecksBitten)
		SetInfoText("Toggle the reputation contribution of the number of necks bitten as a Vampire")		
	elseIf (a_option == iOverrideVampiricSpellSeen)
		SetInfoText("Toggle the reputation contribution of Vampiric Magic witnessed by townspeople")		
	elseIf (a_option == iOverrideVampireLordTransformations)
		SetInfoText("Toggle the reputation contribution of your Vampire Lord transformations")		
	elseIf (a_option == iOverrideVampireLordSeen)
		SetInfoText("Toggle the reputation contribution of times seen Feeding or in Vampire Lord form by townspeople")	
	elseIf (a_option == iOverrideVampireComments)
		SetInfoText("Toggle the reputation contribution of times townspeople suspect or accuse you of vampirism")		
	elseIf (a_option == iOverrideWerewolfMauls)
		SetInfoText("Toggle the reputation contribution of times you've mauled your enemies as a Werewolf")		
	elseIf (a_option == iOverrideWerewolfFeeds)
		SetInfoText("Toggle the reputation contribution of your feeding on corpses as a Werewolf")		
	elseIf (a_option == iOverrideWerewolfTransformations)
		SetInfoText("Toggle the reputation contribution of your Werewolf transformations")	
	elseIf (a_option == iOverrideWerewolfSeen)
		SetInfoText("Toggle the reputation contribution of times seen in Werewolf form by townspeople")		
	elseIf (a_option == iOverrideWerewolfComments)
		SetInfoText("Toggle the reputation contribution of times townspeople suspect or accuse you of lycanthropy")
	elseIf (a_option == iOverridePettyCrimeSeen)
		SetInfoText("Toggle the reputation contribution of times seen committing trespasses, pickpockets and thefts")		
	elseIf (a_option == iOverrideAssaultsSeen)
		SetInfoText("Toggle the reputation contribution of times seen committing assaults")
	elseIf (a_option == iOverrideMurdersSeen)
		SetInfoText("Toggle the reputation contribution of times suspected or caught for murders")
	elseIf (a_option == iOverrideMurders)
		SetInfoText("Toggle the reputation contribution of your total number of murders")		
	elseIf (a_option == iOverridePocketsPicked)
		SetInfoText("Toggle the reputation contribution of your total number of pockets picked")		
	elseIf (a_option == iOverrideHorsesStolen)
		SetInfoText("Toggle the reputation contribution of your total number of horses stolen")		
	elseIf (a_option == iOverrideItemsStolen)
		SetInfoText("Toggle the reputation contribution of your total number of items stolen")		
	elseIf (a_option == iOverrideTrespasses)
		SetInfoText("Toggle the reputation contribution of your total number of trespasses")		
	elseIf (a_option == iOverrideJailEscapes)
		SetInfoText("Toggle the reputation contribution of your total number of jail escapes")		
	elseIf (a_option == iOverrideDaysJailed)
		SetInfoText("Toggle the reputation contribution of your total number of days jailed")		
	elseIf (a_option == iOverrideFinesPayed)
		SetInfoText("Toggle the reputation contribution of your total amount of gold payed in fines")	
	elseIf (a_option == iOverrideThievesGuildMisc)
		SetInfoText("Toggle the reputation contribution of the number of completed Thieves Guild quests")		
	elseIf (a_option == iOverrideDarkBrotherhoodMisc)
		SetInfoText("Toggle the reputation contribution of the number of completed Dark Brotherhood quests")		
	elseIf (a_option == iOverrideCompanionsMisc)
		SetInfoText("Toggle the reputation contribution of the number of completed Companions quests")		
	elseIf (a_option == iOverrideCollegeMisc)
		SetInfoText("Toggle the reputation contribution of the number of completed College of Winterhold quests")	
	elseIf (a_option == iOverrideBrawls)
		SetInfoText("Toggle the reputation contribution of your won brawls")		
	elseIf (a_option == iOverrideMiscQuests)
		SetInfoText("Toggle the reputation contribution of the number of completed Misc. Quests")		
	elseIf (a_option == iOverrideCivilWar)
		SetInfoText("Toggle the reputation contribution of the number of completed Civil War quests")		
	elseIf (a_option == iOverrideWarriorSkill)
		SetInfoText("Toggle the reputation contribution of your weapon, archery, shield and armor skills")	
	elseIf (a_option == iOverridePersuasions)
		SetInfoText("Toggle the reputation contribution of Persuasions")		
	elseIf (a_option == iOverrideIntimidations)
		SetInfoText("Toggle the reputation contribution of Intimidations")		
	elseIf (a_option == iOverrideBribes)
		SetInfoText("Toggle the reputation contribution of Bribes")		
	elseIf (a_option == iOverrideBooksRead)
		SetInfoText("Toggle the reputation contribution of the total number of books read")			
	elseIf (a_option == iOverrideKillsUndead)
		SetInfoText("Toggle the reputation contribution of the number of Undead killed")		
	elseIf (a_option == iOverrideKillsDaedra)
		SetInfoText("Toggle the reputation contribution of the number of Daedra killed")	
	elseIf (a_option == iOverrideKillsBandits)
		SetInfoText("Toggle the reputation contribution of the number of Bandits killed")	
	elseIf (a_option == iOverrideKillsWizards)
		SetInfoText("Toggle the reputation contribution of the number of Warlocks and Necromancers killed")		
	elseIf (a_option == iOverrideKillsWitches)
		SetInfoText("Toggle the reputation contribution of the number of Witches and Hagravens killed")	
	elseIf (a_option == iOverrideKillsForsworn)
		SetInfoText("Toggle the reputation contribution of the number of Forsworn killed")		
	elseIf (a_option == iOverrideBlackSoulTraps)
		SetInfoText("Toggle the reputation contribution of the number of Black souls trapped in soul gems")		
	elseIf (a_option == iOverrideSoulsTrapped)
		SetInfoText("Toggle the reputation contribution of the total number of souls trapped in soul gems")		
	elseIf (a_option == iOverrideNecromancySeen)
		SetInfoText("Toggle the reputation contribution of times seen performing Necromancy by townspeople")		
	elseIf (a_option == iOverrideArcaneMastery)
		SetInfoText("Toggle the contribution of Destruction, Alteration, Illusion, Conjuration, Restoration and Enchanting skill levels")	
	elseIf (a_option == iOverrideRestorationMagic)
		SetInfoText("Toggle the reputation contribution of your Restoration skill level")	
	elseIf (a_option == iOverrideConjugationMagic)
		SetInfoText("Toggle the reputation contribution of your Conjuration skill level")		
	elseIf (a_option == iOverrideCannibalFeed)
		SetInfoText("Toggle the reputation contribution of the total number of times feeding on corpses")		
	elseIf (a_option == iOverrideCharityAdded)
		SetInfoText("Toggle the reputation contribution of the total number of beggars you have given gold to")		

	elseIf (a_option == iDaedricQuestPerc)
		SetInfoText("Collection percentage of Daedric choices counting towards your reputation (Main influence)")
	elseIf (a_option == iVampirismPerc)
		SetInfoText("Adjusted percentage of Vampire points counting towards your reputation (High influence)")	
	elseIf (a_option == iLycanthropyPerc)
		SetInfoText("Adjusted percentage of Werewolf points counting towards your reputation (High influence)")	
	elseIf (a_option == iNecksBittenPerc)
		SetInfoText("Vampiric bites counting towards your reputation (Low influence)")
	elseIf (a_option == iVampiricSpellSeenPerc)
		SetInfoText("Number of people that have seen you perform Vampiric magic (High influence)")
	elseIf (a_option == iVampireLordTransPerc)
		SetInfoText("Vampire Lord transformations counting towards your reputation (Very low influence)")		
	elseIf (a_option == iVampireLordSeenPerc)
		SetInfoText("Times seen Feeding or in Vampire Lord form counting towards your reputation (High influence)")		
	elseIf (a_option == iVampireCommentsPerc)
		SetInfoText("Number of suspicious comment points counting towards your reputation (Very low influence)")		
	elseIf (a_option == iVampireGuardPerc)
		SetInfoText("Number of violent accusation and altercation points counting towards your reputation (Medium influence)")		
	elseIf (a_option == iWerewolfTimesPerc)
		SetInfoText("Werewolf Transformations counting towards your reputation (Low influence)")
	elseIf (a_option == iWerewolfSpottedPerc)
		SetInfoText("Werewolf bounties counting towards your reputation (High influence)")
	elseIf (a_option == iWerewolfMaulsPerc)
		SetInfoText("Werewolf mauls counting towards your reputation (Low influence)")
	elseIf (a_option == iWerewolfFeedsPerc)
		SetInfoText("Werewolf feedings counting towards your reputation (Low influence)")
	elseIf (a_option == iWerewolfCommentsPerc)
		SetInfoText("Number of suspicious comment points counting towards your reputation (Very low influence)")
	elseIf (a_option == iWerewolfGuardPerc)
		SetInfoText("Number of violent accusation and altercation points counting towards your reputation (Medium influence)")
	elseIf (a_option == iCannibalFeedPerc)
		SetInfoText("Times feeding on corpses counting towards your reputation (Medium influence)")	
	elseIf (a_option == iConjurationPerc)
		SetInfoText("Conjuration skill points counting towards your reputation (Low influence)")
	elseIf (a_option == iCrimeQuestPerc)
		SetInfoText("Collection percentage of Criminal choices counting towards your reputation (Main influence)")
	elseIf (a_option == iSeenMurdersPerc)
		SetInfoText("Times seen committing Murder currently counting towards your reputation (Extremely high influence)")
	elseIf (a_option == iSeenAssaultPerc)
		SetInfoText("Times seen committing Assault currently counting towards your reputation (Very high influence)")
	elseIf (a_option == iSeenCrimePerc)
		SetInfoText("Times seen committing Petty crimes currently counting towards your reputation (High influence)")
	elseIf (a_option == iMurdersPerc)
		SetInfoText("Total Murders (seen and unseen) counting towards your reputation (Low influence)")
	elseIf (a_option == iHorseTheftPerc)
		SetInfoText("Horse Thefts counting towards your reputation (Low influence)")
	elseIf (a_option == iTheftPerc)
		SetInfoText("Stolen Items counting towards your reputation (Very low influence)")
	elseIf (a_option == iPocketsPerc)
		SetInfoText("Pockets picked counting towards your reputation (Very low influence)")
	elseIf (a_option == iTresspassesPerc)
		SetInfoText("Trespasses counting towards your reputation (Very low influence)")
	elseIf (a_option == iJailTimePerc)
		SetInfoText("Jail Time Served that negates other crimes (Medium influence)")
	elseIf (a_option == iFinesPayedPerc)
		SetInfoText("Amount of gold payed in fines that negates other crimes (Medium influence)")
	elseIf (a_option == iJailEscPerc)
		SetInfoText("Jail Escapes counting towards your reputation (Medium influence)")
	elseIf (a_option == iThievesGuildPerc)
		SetInfoText("Thieves Guild Misc. Quests counting towards your reputation (Low influence)")
	elseIf (a_option == iDarkBroPerc)
		SetInfoText("Dark Brotherhood Misc. Quests counting towards your reputation (Medium influence)")
	elseIf (a_option == iAmbitionQuestPerc)
		SetInfoText("Collection percentage of Power-hungry choices counting towards your reputation (Main influence)")
	elseIf (a_option == iIntimidationPerc)
		SetInfoText("Intimidations counting towards your reputation (Very low influence)")
	elseIf (a_option == iNecroTimesPerc)
		SetInfoText("Number of people that have seen you performing Necromancy (High influence)")
	elseIf (a_option == iBribePerc)
		SetInfoText("Bribes counting towards your reputation (Low influence)")
	elseIf (a_option == iCoWPerc)
		SetInfoText("College of Winterhold Quests counting towards your reputation (Medium influence)")
	elseIf (a_option == iBooksPerc)
		SetInfoText("Dangerous Knowledge points counting towards your reputation (Extremely low influence)")
	elseIf (a_option == iBlackSoulTrapPerc)
		SetInfoText("Black souls Trapped counting towards your reputation (Medium influence)")
	elseIf (a_option == iSoulTrapPerc)
		SetInfoText("Total number of souls trapped (black and white) counting towards your reputation (Very low influence)")
	elseIf (a_option == iArcaneMasteryPerc)
		SetInfoText("Total mastery of all schools of magic counting towards your reputation (Low influence)")
	elseIf (a_option == iAedricQuestPerc)
		SetInfoText("Collection percentage of Aedric choices counting towards your reputation (Main influence)")
	elseIf (a_option == iUndeadKillsPerc)
		SetInfoText("Undead killed counting towards your reputation (Low influence)")
	elseIf (a_option == iDaedraKillsPerc)
		SetInfoText("Daedra killed counting towards your reputation (Medium influence)")
	elseIf (a_option == iCharityAddedPerc)
		SetInfoText("Number of beggars helped counting towards your reputation (Medium influence)")
	elseIf (a_option == iRestorationPerc)
		SetInfoText("Restoration skill points counting towards your reputation (Low influence)")
	elseIf (a_option == iLawQuestPerc)
		SetInfoText("Collection percentage of Lawful choices counting towards your reputation (Main influence)")
	elseIf (a_option == iCompQuestPerc)
		SetInfoText("Companion Quests counting towards your reputation (High influence)")
	elseIf (a_option == iBanditKillsPerc)
		SetInfoText("Bandit kills counting towards your reputation (Low influence)")	
	elseIf (a_option == iWizardKillsPerc)
		SetInfoText("Warlock and Necromancer kills counting towards your reputation (Low influence)")		
	elseIf (a_option == iWitchKillsPerc)
		SetInfoText("Witch and Hagraven kills counting towards your reputation (Low influence)")		
	elseIf (a_option == iForswornKillsPerc)
		SetInfoText("Forsworn kills counting towards your reputation (Low influence)")		
	elseIf (a_option == iDependQuestPerc)
		SetInfoText("Collection percentage of Dependable choices counting towards your reputation (Main influence)")
	elseIf (a_option == iMiscQuestsPerc)
		SetInfoText("Number of Misc. Quests counting towards your reputation (Medium influence)")
	elseIf (a_option == iPersuasionPerc)
		SetInfoText("Persuasions counting towards your reputation (Very low influence)")
	elseIf (a_option == iBrawlPerc)
		SetInfoText("Won Brawls counting toward your reputation (Low influence)")
	elseIf (a_option == iCivilWarPerc)
		SetInfoText("Civil War Quests counting towards your reputation (High influence)")
	elseIf (a_option == iWarriorSkillPerc)
		SetInfoText("Total battle experience with weapons and armor counting towards your reputation (Low influence)")
	elseIf (a_option == iQuestFamePerc)
		SetInfoText("Collection percentage of Quest fame points that boost your reputation")
	elseIf (a_option == iLocationFamePerc)
		SetInfoText("Number of locations visited that boost your reputation (Low influence)")
	elseIf (a_option == iDungeonFamePerc)
		SetInfoText("Number of dungeons cleared that boost your reputation (Low influence)")
	elseIf (a_option == iKillsFamePerc)
		SetInfoText("Number of people you've killed that boost your reputation (Low influence)")
	elseIf (a_option == iStoreFamePerc)
		SetInfoText("Number of stores invested in that boost your reputation (Low influence)")
	elseIf (a_option == iPropertyFamePerc)
		SetInfoText("Number of houses owned that boost your reputation (Low influence)")
	elseIf (a_option == iDragonKillPerc)
		SetInfoText("Number of dragons killed that boost your reputation (Medium influence)")
	elseIf (a_option == iDragonPriestKillPerc)
		SetInfoText("Number of dragon-priests killed that boost your reputation (Medium influence)")
			
	elseIf (a_option == iEnableCheats)
		SetInfoText("Only meant for adjusting scores after a reset or completing unpatched mod-added quests")
	elseIf (a_option == iMuteMod)
		SetInfoText("Toggle to silence the mod. It will still run in the background, but without effects")
	elseIf (a_option == iForceRep)
		SetInfoText("If you made input variable changes and feel impatient, press to force a new reputation calculation")
	elseIf (a_option == OID_LoadPreset)
			SetInfoText("With File Access Interface for Skyrim, you can load saved settings to overwrite current settings")
	elseIf (a_option == OID_SavePreset)
			SetInfoText("With File Access Interface for Skyrim, you can save your settings for use between saves")
		
	elseIf (a_option == iFameCounterUp)
		SetInfoText("Click to manually increase the Fame score")
	elseIf (a_option == iAedricCounterUp)
		SetInfoText("Click to manually increase the Aedric Devotion choice score")
	elseIf (a_option == iDaedricCounterUp)
		SetInfoText("Click to manually increase the Daedric Taint choice score")
	elseIf (a_option == iLawCounterUp)
		SetInfoText("Click to manually increase the Lawfulness choice score")
	elseIf (a_option == iCrimeCounterUp)
		SetInfoText("Click to manually increase the Criminal choice score")
	elseIf (a_option == iDepCounterUp)
		SetInfoText("Click to manually increase the Dependable choice score")
	elseIf (a_option == iAmbCounterUp)
		SetInfoText("Click to manually increase the Power-hungry choice score")	
	elseIf (a_option == iFameCounterDown)
		SetInfoText("Click to manually decrease the Fame score")
	elseIf (a_option == iAedricCounterDown)
		SetInfoText("Click to manually decrease the Aedric Devotion choice score")
	elseIf (a_option == iDaedricCounterDown)
		SetInfoText("Click to manually decrease the Daedric Taint choice score")
	elseIf (a_option == iLawCounterDown)
		SetInfoText("Click to manually decrease the Lawfulness choice score")
	elseIf (a_option == iCrimeCounterDown)
		SetInfoText("Click to manually decrease the Criminal choice score")
	elseIf (a_option == iDepCounterDown)
		SetInfoText("Click to manually decrease the Dependable choice score")
	elseIf (a_option == iAmbCounterDown)
		SetInfoText("Click to manually decrease the Power-hungry choice score")
	elseIf (a_option == iResetTimeDec)
		SetInfoText("Recalibration may be needed after manually changing tracked stats or if the scores are too high")
	elseIf (a_option == iSliderVampiricSpellSeen)
		SetInfoText("Slide to manually set the number of times people saw you casting vampiric magic")
	elseIf (a_option == iSliderVampireLordTrans)
		SetInfoText("Slide to manually set the number of times you transformed into Vampire Lord form")
	elseIf (a_option == iSliderVampireLordSeen)
		SetInfoText("Slide to manually set the number of times you've been seen Feeding or in Vampire Lord form")
	elseIf (a_option == iSliderVampireComments)
		SetInfoText("Slide to manually set the number of times you people commented on you undead attrubutes")
	elseIf (a_option == iSliderVampireGuard)
		SetInfoText("Slide to manually set the number of times you people accused you of being a Vampire and attacked")
	elseIf (a_option == iSliderWerewolfSeen)
		SetInfoText("Slide to manually set the number of times you've been seen in Werewolf form")
	elseIf (a_option == iSliderWerewolfFeeds)
		SetInfoText("Slide to manually set the number of times you fed in Werewolf form")
	elseIf (a_option == iSliderWerewolfComments)
		SetInfoText("Slide to manually set the number of times you people commented on you beastly attrubutes")
	elseIf (a_option == iSliderWerewolfGuard)
		SetInfoText("Slide to manually set the number of times you people accused you of being a Werewolf and attacked")
	elseIf (a_option == iSliderDragonKills)
		SetInfoText("Slide to manually set the number of Dragons killed")
	elseIf (a_option == iSliderDragonPriestKills)
		SetInfoText("Slide to manually set the number of Dragon Priests killed")				
	elseIf (a_option == iSliderBanditKills)
		SetInfoText("Slide to manually set the number of bandits killed")
	elseIf (a_option == iSliderWizardKills)
		SetInfoText("Slide to manually set the number of Warlocks and Necromancers killed")	
	elseIf (a_option == iSliderWitchKills)
		SetInfoText("Slide to manually set the number of Hags and Hagravens killed")	
	elseIf (a_option == iSliderForswornKills)
		SetInfoText("Slide to manually set the number of Forworn killed")	
	elseIf (a_option == iSliderNecroTImes)
		SetInfoText("Slide to manually set the number of times you've been seen doing necromancy")
	elseIf (a_option == iSliderBlackSoulTrap)
		SetInfoText("Slide to manually set the number of times you've captured a black soul")	
	elseIf (a_option == iSliderCannibalFeed)
		SetInfoText("Slide to manually set the number of times you've fed on a humanoid corpse")
	elseIf (a_option == iSliderCharityAdded)
		SetInfoText("Slide to manually set the number of times you've gifted gold to beggars")	
	elseIf (a_option == iSliderSeenMurders)
		SetInfoText("Slide to manually set the number of times you've been caught commiting murder")
	elseIf (a_option == iSliderSeenAssaults)
		SetInfoText("Slide to manually set the number of times you've been caught commiting assault")
	elseIf (a_option == iSliderSeenTheft)
		SetInfoText("Slide to manually set the number of times you've been caught commiting petty crime")
		
;	elseIf (a_option == iVampireCustomRaceActive)
;		SetInfoText("Enable if you are using a custom race and you are a vampire")
	elseIf (a_option == iDragonbornComments)
		SetInfoText("Citizens comment on the player being Dragonborn")
	elseIf (a_option == iThaneWhiterun)
		SetInfoText("Toggle if you are currently the thane of whiterun")
	elseIf (a_option == iSlowCalculations)
		SetInfoText("Toggle to slow the time between reputation calculation. Useful if you are experiencing script lag")
	elseIf (a_option == iMoonlightTales)
		SetInfoText("Enable if another mod is managing Wolf and Werewolf hostility towards the player, like Moonlight Tales")
	elseIf (a_option == iResetMod)
		SetInfoText("Reduces all values back to minimum")
	elseIf (a_option == iResetExternaContent)
		SetInfoText("Sets all reputation stats from other mods to 0")
	elseIf (a_option == iResetCrimes)
		SetInfoText("Reduces most crime related statistics by 50%")
	elseIf (a_option == iResetMagic)
		SetInfoText("Reduces most magic related statistics by 50%")
	elseIf (a_option == iResetAllResets)
		SetInfoText("Undoes any of the neighbouring five reset and reduction functions and returns scores to full value")
	endif
endevent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; STRING FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

String Function CurrentReputation()
	Int Reputation = SR_Global_Reputation.GetValue() as Int
	if (Reputation == 0)
		Return ("Unknown")
	elseif (Reputation == 1)
		Return ("Unknown")
	elseif (Reputation == 2)
		Return ("Neutral")
	elseif (Reputation == 3)
		Return ("Disliked")
	elseif (Reputation == 4)
		Return ("Liked")
	elseif (Reputation == 5)
		Return ("Hated")
	elseif (Reputation == 6)
		Return ("Admired")
	elseif (Reputation == 7)
		Return ("Feared")
	elseif (Reputation == 8)
		Return ("Hero")
	endif
EndFunction

String Function ReputationLevel()
    Int FameScore = SR_RQC_QST.TotalFameScore as Int
	Int FameThresholdOne = SR_RQC_QST.FameThresholdOne as Int
	Int FameThresholdTwo = SR_RQC_QST.FameThresholdTwo as Int
	Int FameThresholdThree = SR_RQC_QST.FameThresholdThree as Int
	Int FameThresholdFour = SR_RQC_QST.FameThresholdFour as Int
	if (FameScore > FameThresholdFour)
		Return ("4/4")
	elseif (FameScore > FameThresholdThree)
		Return ("3/4")
	elseif (FameScore > FameThresholdTwo)
		Return ("2/4")
	elseif (FameScore > FameThresholdOne)
		Return ("1/4")
	else
		Return ("0/4")
	endif
EndFunction

String Function CurrentVampireSuspicion()
	Int VampireSuspicion = SR_Global_VampireSuspicion.GetValue() as Int
	if (VampireSuspicion >= 9)
		Return ("Very high")
	elseif (VampireSuspicion >= 7)
		Return ("High")
	elseif (VampireSuspicion >= 5)
		Return ("Moderate")
	elseif (VampireSuspicion >= 3)
		Return ("Low")
	elseif (VampireSuspicion >= 1)
		Return ("Very Low")
	else
		Return ("None")
	endif
EndFunction

String Function CurrentWerewolfSuspicion()
	Int WerewolfSuspicion = SR_Global_WerewolfSuspicion.GetValue() as Int
	if (WerewolfSuspicion >= 9)
		Return ("Very high")
	elseif (WerewolfSuspicion >= 7)
		Return ("High")
	elseif (WerewolfSuspicion >= 5)
		Return ("Moderate")
	elseif (WerewolfSuspicion >= 3)
		Return ("Low")
	elseif (WerewolfSuspicion >= 1)
		Return ("Very Low")
	else
		Return ("None")
	endif
EndFunction

; Tweaks - Check for perks instead of using duplicate code
Perk Property SR_RQC_PERK_BARTER_LIKED Auto
Perk Property SR_RQC_PERK_BARTER_ADMIRED Auto
Perk Property SR_RQC_PERK_BARTER_WORSHIPPED Auto

Perk Property SR_RQC_PERK_BARTER_NEUTRAL Auto
Perk Property SR_RQC_PERK_BARTER_DISLIKED Auto
Perk Property SR_RQC_PERK_BARTER_HATED Auto
Perk Property SR_RQC_PERK_BARTER_FEARED Auto

String Function BarterString()
	Actor player = Game.GetPlayer()
	
	If(SR_MCM_Perks_PriceChanges.GetValue() == 1)
		If player.HasPerk(SR_RQC_PERK_BARTER_LIKED)
			Return "5% better"
		ElseIf player.HasPerk(SR_RQC_PERK_BARTER_ADMIRED)
			Return "10% better"
		ElseIf player.HasPerk(SR_RQC_PERK_BARTER_WORSHIPPED)
			Return "15% better"
		ElseIf player.HasPerk(SR_RQC_PERK_BARTER_NEUTRAL)
			Return "10% worse"
		ElseIf player.HasPerk(SR_RQC_PERK_BARTER_DISLIKED)
			Return "20% worse"
		ElseIf player.HasPerk(SR_RQC_PERK_BARTER_HATED)
			Return "30% worse"
		ElseIf player.HasPerk(SR_RQC_PERK_BARTER_FEARED)
			Return "40% worse"
		Else
			Return "Unchanged"
		EndIf
	Else
		Return ""
	EndIf
EndFunction

String Function AllureString() 
	Race PlayerRace = Game.GetPlayer().GetRace()
	Int Reputation = SR_Global_Reputation.GetValue() as int
	If(SR_MCM_Perks_Allure.GetValue() == 1)
		if ((Reputation == 6)||(Reputation == 8))
			Return ("Allure")
		else
			Return ("")
		endif
	Else
		Return ("")
	Endif
EndFunction

String Function FenceString()
	Int Reputation = SR_Global_Reputation.GetValue() as int
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	If(SR_MCM_Perks_Fence.GetValue() == 1)
		if ((Reputation == 3)||(Reputation == 5)||(Reputation == 7))
			if(LawCrime > 4)
				Return ("Fence")
			else
				Return ("")
			endif
		else
			Return ("")
		endif
	Else
		Return ("")
	Endif
EndFunction

String Function IntimidateString()
	Int Reputation = SR_Global_Reputation.GetValue() as int
	Int LawCrime = SR_Global_LawCrime.GetValue() as int
	If(SR_MCM_Perks_Intimidate.GetValue() == 1)
		if ((Reputation == 5)||(Reputation == 7))
			Return ("Intimidate")
		else
			Return ("")
		endif
	Else
		Return ("")
	Endif
EndFunction

String Function InfamyString()
	If(SR_MCM_WiComment_Feared_Infamy.GetValue() == 1)
		if (SR_Global_Reputation.GetValue() == 7)
			Return ("Infamy, ")
		else
			Return ("")
		endif
	Else
		Return ("")
	Endif
EndFunction

String Function UndeadAuraString()
	If(SR_DaedricAuras_Vampire.GetValue() == 1)
		Return ("Undead Aura")
	Else
		Return ("")
	EndIf
EndFunction

String Function AlphaGazeString()
	If (SR_DaedricAuras_Werewolf.GetValue() == 1)
		Return ("Beastly Aspect")
	Else
		Return ("")
	EndIf
	RegisterForSingleUpdate(4.0); How long until the cloak activates again
EndFunction



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; INT FUNCTIONS - PERCENTAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Int Function DaedricPercentage()
    float DaedricScore = SR_RQC_QST.TotalDaedricScore as float
	float AedricScore = SR_RQC_QST.TotalAedricScore as float
	float TotAedricDaedric = (DaedricScore + AedricScore)
	float DaedricPercentage = ((DaedricScore/TotAedricDaedric)*100)
	Return DaedricPercentage as Int
EndFunction

Int Function AedricPercentage()
    float DaedricScore = SR_RQC_QST.TotalDaedricScore as float
	float AedricScore = SR_RQC_QST.TotalAedricScore as float
	float TotAedricDaedric = (DaedricScore + AedricScore)
	float AedricPercentage = ((AedricScore/TotAedricDaedric)*100)
	Return AedricPercentage as Int
EndFunction

Int Function CrimePercentage()
    float CrimeScore = SR_RQC_QST.TotalCrimeScore as float
	float LawScore = SR_RQC_QST.TotalLawScore as float
	float TotLawCrime = (CrimeScore + LawScore)
	float CrimePercentage = ((CrimeScore/TotLawCrime)*100)
	Return CrimePercentage as Int
EndFunction

Int Function LawPercentage()
    float CrimeScore = SR_RQC_QST.TotalCrimeScore as float
	float LawScore = SR_RQC_QST.TotalLawScore as float
	float TotLawCrime = (CrimeScore + LawScore)
	float LawPercentage = ((LawScore/TotLawCrime)*100)
	Return LawPercentage as Int
EndFunction

Int Function DependabilityPercentage()
    float DepScore = SR_RQC_QST.TotalDependabilityScore as float
	float AmbScore = SR_RQC_QST.TotalAmbitionScore as float
	float TotDepAmb = (AmbScore + DepScore)
	float DependabilityPercentage = ((DepScore/TotDepAmb)*100)
	Return DependabilityPercentage as Int
EndFunction

Int Function AmbitionPercentage()
    float DepScore = SR_RQC_QST.TotalDependabilityScore as float
	float AmbScore = SR_RQC_QST.TotalAmbitionScore as float
	float TotDepAmb = (AmbScore + DepScore)
	float AmbitionPercentage = ((AmbScore/TotDepAmb)*100)
	Return AmbitionPercentage as Int
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR TRACKED STATS PERCENTAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Int Function QuestFamePercentage()
	Float QuestsFame = SR_RQC_QST.QuestFameScore() as Float
	Float QuestsFameMax = SR_RQC_QST.QuestFameMax as Float
	Float QuestsComp = SR_RQC_QST.QuestsCompletedScore() as FLoat
	Float QuestsCompNom = SR_RQC_QST.QuestsCompletedNom as Float
	Float QuestsCompMax = SR_RQC_QST.QuestsCompletedMax as Float
	Float TotQuestFamePercentage = (((QuestsFame+(QuestsComp/QuestsCompNom))/(QuestsFameMax+(QuestsCompMax/QuestsCompNom)))*100)
	if((TotQuestFamePercentage < 99) && (TotQuestFamePercentage > 2))
		Return TotQuestFamePercentage as Int
	elseif(TotQuestFamePercentage >= 99)
		Return 100
	else
		Return 0
	endif
EndFunction

Int Function QuestDaedricPercentage()
	Float DaedricQuests = SR_RQC_QST.QuestDaedricScore() as Float
	Float DaedricQuestsMax = SR_RQC_QST.QuestDaedricMax as Float
	Float DaedricQuestsPercentage = ((DaedricQuests/DaedricQuestsMax)*100)
	if((DaedricQuestsPercentage < 99) && (DaedricQuestsPercentage > 4))
		Return DaedricQuestsPercentage as Int
	elseif(DaedricQuestsPercentage >= 99)
		Return 100
	else
		Return 0
	endif
EndFunction

Int Function QuestAedricPercentage()
	Float AedricQuests = SR_RQC_QST.QuestAedricScore() as Float
	Float QuestAedricMax = SR_RQC_QST.QuestAedricMax as Float
	Float QuestAedricPercentage = (((AedricQuests - 1)/QuestAedricMax)*100)
	if((QuestAedricPercentage < 99) && (QuestAedricPercentage > 2))
		Return QuestAedricPercentage as Int
	elseif(QuestAedricPercentage >= 99)
		Return 100
	else
		Return 0
	endif
EndFunction

Int Function QuestCrimePercentage()
	Float CrimeQuests = SR_RQC_QST.QuestCrimeScore() as Float
	Float QuestCrimeMax = SR_RQC_QST.QuestCrimeMax as Float
	Float CrimeQuestsPercentage = (((CrimeQuests - 1)/QuestCrimeMax)*100)
	if((CrimeQuestsPercentage < 99) && (CrimeQuestsPercentage > 4))
		Return CrimeQuestsPercentage as Int
	elseif(CrimeQuestsPercentage >= 99)
		Return 100
	else
		Return 0
	endif
EndFunction

Int Function QuestLawPercentage()
	Float LawQuests = SR_RQC_QST.QuestLawScore() as Float
	Float QuestLawMax = SR_RQC_QST.QuestLawMax as Float
	Float LawQuestsPercentage = (((LawQuests - 1)/QuestLawMax)*100)
	if((LawQuestsPercentage < 99) && (LawQuestsPercentage > 2))
		Return LawQuestsPercentage as Int
	elseif(LawQuestsPercentage >= 99)
		Return 100
	else
		Return 0
	endif
EndFunction

Int Function QuestDependPercentage()
	Float DependQuests = SR_RQC_QST.QuestDependabilityScore() as Float
	Float QuestDependabilityMax = SR_RQC_QST.QuestDependabilityMax as Float
	Float DependQuestsPercentage = (((DependQuests - 1)/QuestDependabilityMax)*100)
	if((DependQuestsPercentage < 99) && (DependQuestsPercentage > 2))
		Return DependQuestsPercentage as Int
	elseif(DependQuestsPercentage >= 99)
		Return 100
	else
		Return 0
	endif
EndFunction

Int Function QuestAmbitionPercentage()
	Float AmbitionQuests = SR_RQC_QST.QuestAmbitionScore() as Float
	Float QuestAmbitionMax = SR_RQC_QST.QuestAmbitionMax as Float
	Float AmbitionQuestsPercentage = (((AmbitionQuests - 1)/QuestAmbitionMax)*100)
	if((AmbitionQuestsPercentage < 99) && (AmbitionQuestsPercentage > 2))
		Return AmbitionQuestsPercentage as Int
	elseif(AmbitionQuestsPercentage >= 99)
		Return 100
	else
		Return 0
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FAME
;;;;;;;;;;

; Removed unnecessary ElseIfs

Int Function LocationFamePercentage()
	Float Locations = SR_RQC_QST.LocationsScore() as Float
	Float LocationMax = SR_RQC_QST.LocationsMax as Float
	Float LocationPercentage = ((Locations/LocationMax)*100)
	if(LocationPercentage < 99)
		Return LocationPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function DungeonsPercentage()
	Float Dungeons = SR_RQC_QST.DungeonsScore() as Float
	Float DungeonMax = SR_RQC_QST.DungeonsMax as Float
	Float DungeonPercentage = ((Dungeons/DungeonMax)*100)
	if(DungeonPercentage < 99)
		Return DungeonPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function KillPercentage()
	Float PeopleKills = SR_RQC_QST.KillScore() as Float
	Float PeopleKillMax = SR_RQC_QST.PeopleKillsMax as Float
	Float PeopleKillPercentage = ((PeopleKills/PeopleKillMax)*100)
	if(PeopleKillPercentage < 99)
		Return PeopleKillPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function StoreInvestmentPercentage()
	Float StoreInvestments = SR_RQC_QST.StoreInvestmentScore() as Float
	Float StoreInvestmentMax = SR_RQC_QST.StoreInvestmentsMax as Float
	Float StoreInvestmentPercentage = ((StoreInvestments/StoreInvestmentMax)*100)
	if(StoreInvestmentPercentage < 99)
		Return StoreInvestmentPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function HousesOwnedPercentage()
	Float HousesOwned = SR_RQC_QST.HousesOwnedScore() as Float
	Float HouseOwnedMax = SR_RQC_QST.HousesOwnedMax as Float
	Float HouseOwnedPercentage = ((HousesOwned/HouseOwnedMax)*100)
	if(HouseOwnedPercentage < 99)
		Return HouseOwnedPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function DragonKillsPercentage()
	Float DragonKills = SR_RQC_QST.DragonKillScore() as Float
	Float DragonKillsMax = SR_RQC_QST.DragonKillsMax as Float
	Float DragonKillsPercentage = ((DragonKills/DragonKillsMax)*100)
	if(DragonKillsPercentage < 99)
		Return DragonKillsPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function DragonPriestKillsPercentage()
	Float DragonPriestKills = SR_RQC_QST.DragonPriestKillScore() as Float
	Float DragonPriestKillsMax = SR_RQC_QST.DragonPriestKillsMax as Float
	Float DragonPriestKillsPercentage = ((DragonPriestKills/DragonPriestKillsMax)*100)
	if(DragonPriestKillsPercentage < 99)
		Return DragonPriestKillsPercentage as Int
	else
		Return 100
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DAEDRIC
;;;;;;;;;;

Int Function CannibalFeedPercentage()
	Float CannibalFeed = SR_RQC_QST.CannibalFeedScore() as Float
	Float CannibalFeedMax = SR_RQC_QST.CannibalFeedMax as Float
	Float CannibalFeedPercentage = ((CannibalFeed/CannibalFeedMax)*100)
	if(CannibalFeedPercentage < 99)
		Return CannibalFeedPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function VampirismPercentage()
	Float Vampirism = SR_RQC_QST.TotalVampirismScore as FLoat
	Float VampirismMax = SR_RQC_QST.VampirismMax as Float
	Float VampirismPercentage = ((Vampirism/VampirismMax)*100)
	if(VampirismPercentage < 99)
		Return VampirismPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function NecksBittenCurrentScore()
	float NecksBitten = SR_RQC_QST.NecksBittenScore() as Float
	float NecksBittenDenominator = SR_RQC_QST.NecksBittenNom as Float
	float NecksBittenDecreament  = SR_RQC_QST.NecksBittenDecreamentScore()
	float AdjNecksBittenScore = ((NecksBitten/NecksBittenDenominator)-NecksBittenDecreament)
	float NecksBittenCurrentScore = (AdjNecksBittenScore * NecksBittenDenominator)
	Return NecksBittenCurrentScore as Int
EndFunction

Int Function VampiricSpellSeenCurrentScore()
	float VampiricSpellSeen = SR_RQC_QST.VampiricSpellSeenScore() as float
	float VampiricSpellSeenMultiplier = SR_RQC_QST.VampiricSpellSeenMult as float
	float VampiricSpellSeenDenominator = SR_RQC_QST.VampiricSpellSeenNom as float
	float VampiricSpellSeenDecreament = SR_RQC_QST.VampiricSpellSeenDecreamentScore()
	float AdjVampiricSpellSeenScore = (((VampiricSpellSeen*VampiricSpellSeenMultiplier)/VampiricSpellSeenDenominator)-VampiricSpellSeenDecreament)
	float VampiricSpellSeenCurrentScore = ((AdjVampiricSpellSeenScore*VampiricSpellSeenDenominator)/VampiricSpellSeenMultiplier)
	Return VampiricSpellSeenCurrentScore as Int
EndFunction

Int Function VampireLordTransformationCurrentScore()
	float VampireLordTransformation = SR_RQC_QST.VampireLordTransformationScore() as float
	float VampireLordTransformationDenominator = SR_RQC_QST.VampireLordTransformationNom as float
	float VampireLordTransformationDecreament = SR_RQC_QST.VampireLordTransformationDecreamentScore()
	float AdjVampireLordTransformationScore = ((VampireLordTransformation/VampireLordTransformationDenominator)-VampireLordTransformationDecreament)
	float VampireLordTransformationCurrentScore = (AdjVampireLordTransformationScore  * VampireLordTransformationDenominator)
	Return VampireLordTransformationCurrentScore as Int
EndFunction

Int Function VampireLordSeenCurrentScore()
	float VampireLordSeen = SR_RQC_QST.VampireLordSeenScore() as float
	float VampireLordSeenMultiplier = SR_RQC_QST.VampireLordSeenMult as float
	float VampireLordSeenDenominator = SR_RQC_QST.VampireLordSeenNom as float
	float VampireLordSeenDecreament = SR_RQC_QST.VampireLordSeenDecreamentScore()
	float AdjVampireLordSeenScore = (((VampireLordSeen*VampireLordSeenMultiplier)/VampireLordSeenDenominator)-VampireLordSeenDecreament)
	float VampireLordSeenCurrentScore = ((AdjVampireLordSeenScore*VampireLordSeenDenominator)/VampireLordSeenMultiplier)
	Return VampireLordSeenCurrentScore as Int
EndFunction

Int Function CommentVampireVillagerCurrentScore()
	float VillagerComments = SR_RQC_QST.CommentVampireVillagerScore() as float
	float CommentVampVillagerDenominator = SR_RQC_QST.VampireVillagerNom as float
	float VillagerCommentsDecreament = SR_RQC_QST.CommentVampireVillagerDecreamentScore()
	float AdjCommentVampireVillagerScore = ((VillagerComments/CommentVampVillagerDenominator)-VillagerCommentsDecreament)
	float CommentVampireVillagerCurrentScore = (AdjCommentVampireVillagerScore * CommentVampVillagerDenominator)
	Return CommentVampireVillagerCurrentScore as Int
EndFunction

Int Function CommentVampireGuardCurrentScore()
	float GuardIncidents = SR_RQC_QST.CommentVampireGuardScore() as float
	float VampireGuardMultiplier = SR_RQC_QST.VampireGuardMult as float
	float VampireGuardDenominator = SR_RQC_QST.VampireGuardNom as float
	float GuardIncidentsDecreament = SR_RQC_QST.CommentVampireGuardDecreamentScore()
	float AdjCommentVampireGuardScore = (((GuardIncidents*VampireGuardMultiplier)/VampireGuardDenominator)-GuardIncidentsDecreament)
	float CommentVampireGuardCurrentScore = ((AdjCommentVampireGuardScore*VampireGuardDenominator)/VampireGuardMultiplier)
	Return CommentVampireGuardCurrentScore as Int
EndFunction

Int Function LycanthropyPercentage()
	Float Lycanthropy = SR_RQC_QST.TotalLycanthropyScore as FLoat
	Float LycanthropyMax = SR_RQC_QST.LycanthropyMax as Float
	Float LycanthropyPercentage = ((Lycanthropy/LycanthropyMax)*100)
	if(LycanthropyPercentage < 99)
		Return LycanthropyPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function WerewolfMaulCurrentScore()
	float WerewolfMaul = SR_RQC_QST.WerewolfMaulScore() as float
	float WerewolfMaulsDenominator = SR_RQC_QST.WerewolfMaulNom as float
	float WerewolfMaulDecreament = SR_RQC_QST.WerewolfMaulDecreamentScore()
	float AdjWerewolfMaulScore = ((WerewolfMaul/WerewolfMaulsDenominator)-WerewolfMaulDecreament)
	float WerewolfMaulCurrentScore = (AdjWerewolfMaulScore * WerewolfMaulsDenominator)
	Return WerewolfMaulCurrentScore as Int
EndFunction

Int Function WerewolfTransformationCurrentScore()
	float WerewolfTransformation = SR_RQC_QST.WerewolfTransformationScore() as float
	float WerewolfTransformationsDenominator = SR_RQC_QST.WerewolfTransformationsNom as float
	float WerewolfTransformationDec = SR_RQC_QST.WerewolfTransformationDecreamentScore()
	float AdjWerewolfTransformationScore = ((WerewolfTransformation/WerewolfTransformationsDenominator)-WerewolfTransformationDec)
	float WerewolfTransformationCurrentScore = (AdjWerewolfTransformationScore * WerewolfTransformationsDenominator)
	Return WerewolfTransformationCurrentScore as Int
EndFunction

Int Function WerewolfFeedingCurrentScore()
	float WerewolfFeeds = SR_RQC_QST.WerewolfFeedingScore() as float
	float WerewolfFeedingDenominator = SR_RQC_QST.WerewolfFeedsNom as float
	float WerewolfFeedsDec = SR_RQC_QST.WerewolfFeedingDecreamentScore()
	float AdjWerewolfFeedingScore = ((WerewolfFeeds/WerewolfFeedingDenominator)-WerewolfFeedsDec)
	float WerewolfFeedingCurrentScore = (AdjWerewolfFeedingScore  * WerewolfFeedingDenominator)
	Return WerewolfFeedingCurrentScore as Int
EndFunction

Int Function WerewolfSpottedCurrentScore()
	float TimesSpottedWerewolf = SR_RQC_QST.WerewolfSpottedScore() as float
	float WerewolfSpottedMultiplier = SR_RQC_QST.TimesSpottedWerewolfMult as float
	float WerewolfSpottedDenominator = SR_RQC_QST.TimesSpottedWerewolfNom as float
	float TimesSpottedWerewolfDec = SR_RQC_QST.WerewolfSpottedDecreamentScore()
	float AdjWerewolfSpottedScore = (((TimesSpottedWerewolf*WerewolfSpottedMultiplier)/WerewolfSpottedDenominator)-TimesSpottedWerewolfDec)
	float WerewolfSpottedCurrentScore = ((AdjWerewolfSpottedScore*WerewolfSpottedDenominator)/WerewolfSpottedMultiplier)
	Return WerewolfSpottedCurrentScore as Int
EndFunction

Int Function CommentWerewolfVillagerCurrentScore()
	float VillagerComments = SR_RQC_QST.CommentWerewolfVillagerScore() as float
	float CommentWereVillagerDenominator = SR_RQC_QST.WerewolfVillagerNom as float
	float VillagerCommentsDec = SR_RQC_QST.CommentWerewolfVillagerDecreamentScore()
	float AdjCommentWerewolfVillagerScore = ((VillagerComments/CommentWereVillagerDenominator)-VillagerCommentsDec)
	float CommentWerewolfVillagerCurrentScore = (AdjCommentWerewolfVillagerScore * CommentWereVillagerDenominator)
	Return CommentWerewolfVillagerCurrentScore as Int
EndFunction

Int Function CommentWerewolfGuardCurrentScore()
	float GuardIncidents = SR_RQC_QST.CommentWerewolfGuardScore() as float
	float WerewolfGuardMultiplier = SR_RQC_QST.WerewolfGuardMult as float
	float WerewolfGuardDenominator = SR_RQC_QST.WerewolfGuardNom as float
	float GuardIncidentsDec = SR_RQC_QST.CommentWerewolfGuardDecreamentScore()
	float AdjCommentWerewolfGuardScore = (((GuardIncidents*WerewolfGuardMultiplier)/WerewolfGuardDenominator)-GuardIncidentsDec)
	float CommentWerewolfGuardCurrentScore = ((AdjCommentWerewolfGuardScore*WerewolfGuardDenominator)/WerewolfGuardMultiplier)
	Return CommentWerewolfGuardCurrentScore as Int
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AEDRIC
;;;;;;;;;;

Int Function UndeadKilledPercentage()
	Float UndeadKilled = SR_RQC_QST.UndeadKilledScore() as Float
	Float UndeadKilledMax = SR_RQC_QST.UndeadKilledMax as Float
	Float UndeadKilledPercentage = ((UndeadKilled/UndeadKilledMax)*100)
	if(UndeadKilledPercentage < 99)
		Return UndeadKilledPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function CharityPercentage()
	Float Charity = SR_RQC_QST.CharityScore() as Float
	Float CharityMax = SR_RQC_QST.CharityMax as Float
	Float CharityPercentage = ((Charity/CharityMax)*100)
	if(CharityPercentage < 99)
		Return CharityPercentage as Int
	else
		Return 100
	endif
EndFunction	

Int Function DaedraKilledPercentage()
	Float DaedraKilled = SR_RQC_QST.DaedraKilledScore() as Float
	Float DaedraKilledMax = SR_RQC_QST.DaedraKilledMax as Float
	Float DaedraKilledPercentage = ((DaedraKilled/DaedraKilledMax)*100)
	if(DaedraKilledPercentage < 99)
		Return DaedraKilledPercentage as Int
	else
		Return 100
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CRIME
;;;;;;;;;;

Int Function MurderPercentage()
	Float Murders = SR_RQC_QST.MurderScore() as Float
	Float MurdersMax = SR_RQC_QST.MurdersMax as Float
	Float MurdersPercentage = ((Murders/MurdersMax)*100)
	if(MurdersPercentage < 99)
		Return MurdersPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function AssaultCurrentScore()
	float SpottedAssaults = SR_RQC_QST.SpottedAssaultScore() as float
	float SpottedAssaultsMultiplier = SR_RQC_QST.SpottedAssaultsMult as float
	float SpottedAssaultsDenominator = SR_RQC_QST.SpottedAssaultsNom as float
	float SpottedAssaultsDecreament = SR_RQC_QST.SpottedAssaultDecreamentScore()
	float AdjAssaultScore = (((SpottedAssaults*SpottedAssaultsMultiplier)/SpottedAssaultsDenominator)-SpottedAssaultsDecreament)
	float AssaultCurrentScore = ((AdjAssaultScore*SpottedAssaultsDenominator)/SpottedAssaultsMultiplier)
	Return AssaultCurrentScore as Int
EndFunction

Int Function SeenMurderCurrentScore()
	float SpottedMurders = SR_RQC_QST.SpottedMurderScore() as float
	float CrimeMurdersSeenMultiplier = SR_RQC_QST.SpottedMurdersMult as float
	float CrimeMurdersSeenDenominator = SR_RQC_QST.SpottedMurdersNom as float
	float SpottedMurdersDecreament = SR_RQC_QST.SpottedMurderDecreamentScore()
	float AdjSeenMurderScore = (((SpottedMurders*CrimeMurdersSeenMultiplier)/CrimeMurdersSeenDenominator)-SpottedMurdersDecreament)
	float SeenMurderCurrentScore = ((AdjSeenMurderScore*CrimeMurdersSeenDenominator)/CrimeMurdersSeenMultiplier)
	Return SeenMurderCurrentScore as Int
EndFunction

Int Function PettyCrimeSpottedCurrentScore()
	float SpottedPettyCrime = SR_RQC_QST.SpottedPettyCrimeScore() as float
	float SpottedPettyCrimeDenominator = SR_RQC_QST.SpottedPettyCrimeNom as float
	float SpottedPettyCrimeDecreament = SR_RQC_QST.SpottedPettyCrimeDecreamentScore()
	float AdjPettyCrimeSpottedScore = ((SpottedPettyCrime/SpottedPettyCrimeDenominator)-SpottedPettyCrimeDecreament)
	float PettyCrimeSpottedCurrentScore = (AdjPettyCrimeSpottedScore * SpottedPettyCrimeDenominator)
	Return PettyCrimeSpottedCurrentScore as Int
EndFunction

Int Function PocketsPickedPercentage()
	Float PocketsPicked = SR_RQC_QST.PocketsPickedScore() as Float
	Float PocketsPickedMax = SR_RQC_QST.PocketsPickedMax as Float
	Float PocketsPickedPercentage = ((PocketsPicked/PocketsPickedMax)*100)
	if(PocketsPickedPercentage < 99)
		Return PocketsPickedPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function HorsesStolenPercentage()
	Float HorsesStolen = SR_RQC_QST.HorsesStolenScore() as Float
	Float HorsesStolenMax = SR_RQC_QST.HorsesStolenMax as Float
	Float HorsesStolenPercentage = ((HorsesStolen/HorsesStolenMax)*100)
	if(HorsesStolenPercentage < 99)
		Return HorsesStolenPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function ItemsStolenPercentage()
	Float ItemsStolen = SR_RQC_QST.ItemsStolenScore() as Float
	Float ItemsStolenMax = SR_RQC_QST.ItemsStolenMax as Float
	Float ItemsStolenPercentage = ((ItemsStolen/ItemsStolenMax)*100)
	if(ItemsStolenPercentage < 99)
		Return ItemsStolenPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function TrespassPercentage()
	Float Trespasses = SR_RQC_QST.TrespassScore() as Float
	Float TrespassesMax = SR_RQC_QST.TrespassesMax as Float
	Float TrespassesPercentage = ((Trespasses/TrespassesMax)*100)
	if(TrespassesPercentage < 99)
		Return TrespassesPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function JailEscapePercentage()
	Float JailEscapes = SR_RQC_QST.JailEscapeScore() as Float
	Float JailEscapesMax = SR_RQC_QST.JailEscapesMax as Float
	Float JailEscapesPercentage = ((JailEscapes/JailEscapesMax)*100)
	if(JailEscapesPercentage < 99)
		Return JailEscapesPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function JailTimeServedPercentage()
	Float JailTime = SR_RQC_QST.DaysJailedScore() as Float
	Float JailTimeMax = SR_RQC_QST.DaysJailedMax as Float
	Float JailTimePercentage = ((JailTime/JailTimeMax)*100)
	if(JailTimePercentage < 99)
		Return JailTimePercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function FinesPayedPercentage()
	Float FinesPayed = SR_RQC_QST.FinesPayedScore() as Float
	Float FinesPayedMax = SR_RQC_QST.FinesPayedMax as Float
	Float FinesPayedPercentage = ((FinesPayed/FinesPayedMax)*100)
	if(FinesPayedPercentage < 99)
		Return FinesPayedPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function ThievesGuildePercentage()
	Float ThievesGuildQuests = SR_RQC_QST.ThievesGuildeScore() as Float
	Float ThievesGuildQuestsMax = SR_RQC_QST.ThievesGuildQuestsMax as Float
	Float ThievesGuildQuestsPercentage = ((ThievesGuildQuests/ThievesGuildQuestsMax)*100)
	if(ThievesGuildQuestsPercentage < 99)
		Return ThievesGuildQuestsPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function DarkBrotherhoodPercentage()
	Float DarkBrotherhoodQuests = SR_RQC_QST.DarkBrotherhoodScore() as float
	Float DarkBrotherhoodQuestsMax = SR_RQC_QST.DarkBrotherhoodQuestsMax as Float
	Float DarkBrotherhoodQuestsPercentage = ((DarkBrotherhoodQuests/DarkBrotherhoodQuestsMax)*100)
	if(DarkBrotherhoodQuestsPercentage < 99)
		Return DarkBrotherhoodQuestsPercentage as Int
	else
		Return 100
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LAW
;;;;;;;;;;

Int Function CompanionsPercentage()
	Float CompanionsQuests = SR_RQC_QST.CompanionsScore() as Float
	Float CompanionsQuestsMax = SR_RQC_QST.CompanionsQuestsMax as Float
	Float CompanionsQuestsPercentage = ((CompanionsQuests/CompanionsQuestsMax)*100)
	if(CompanionsQuestsPercentage < 99)
		Return CompanionsQuestsPercentage as Int
	else
		Return 100
	endif
EndFunction	

Int Function BanditKillerPercentage()
	Float BanditKiller = SR_RQC_QST.BanditKillerScore() as Float
	Float BanditsKilledMax = SR_RQC_QST.BanditsKilledMax as Float
	Float BanditKillerPercentage = ((BanditKiller/BanditsKilledMax)*100)
	if(BanditKillerPercentage < 99)
		Return BanditKillerPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function WizardKillerPercentage()
	Float WizardKiller = SR_RQC_QST.WizardKillerScore() as Float
	Float WizardKillerMax = SR_RQC_QST.WizardKillerMax as Float
	Float WizardKillerPercentage = ((WizardKiller/WizardKillerMax)*100)
	if(WizardKillerPercentage < 99)
		Return WizardKillerPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function WitchKillerPercentage()
	Float WitchKiller = SR_RQC_QST.WitchKillerScore() as Float
	Float WitchKillerMax = SR_RQC_QST.WitchKillerMax as Float
	Float WitchKillerPercentage = ((WitchKiller/WitchKillerMax)*100)
	if(WitchKillerPercentage < 99)
		Return WitchKillerPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function ForswornKillerPercentage()
	Float ForswornKiller = SR_RQC_QST.ForswornKillerScore() as Float
	Float ForswornKillerMax = SR_RQC_QST.ForswornKillerMax as Float
	Float ForswornKillerPercentage = ((ForswornKiller/ForswornKillerMax)*100)
	if(ForswornKillerPercentage < 99)
		Return ForswornKillerPercentage as Int
	else
		Return 100
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DEPENDABILITY
;;;;;;;;;;

Int Function BrawlsWonPercentage()
	Float BrawlsWon = SR_RQC_QST.BrawlsWonScore() as Float
	Float BrawlsWonMax = SR_RQC_QST.BrawlsWonMax as Float
	Float BrawlsWonPercentage = ((BrawlsWon/BrawlsWonMax)*100)
	if(BrawlsWonPercentage < 99)
		Return BrawlsWonPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function MiscQuestsPercentage()
	Float MiscQuests = SR_RQC_QST.MiscQuestsScore() as FLoat
	Float MiscQuestsMax = SR_RQC_QST.MiscQuestsMax as Float
	Float MiscQuestsPercentage = ((MiscQuests/MiscQuestsMax)*100)
	if(MiscQuestsPercentage < 99)
		Return MiscQuestsPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function CivilWarQuestsPercentage()
	Int CivilWarQuests = SR_RQC_QST.CivilWarQuestsScore()
	Float CivilWarQuestsMax = SR_RQC_QST.CivilWarQuestsMax as Float
	Float CivilWarQuestsPercentage = ((CivilWarQuests/CivilWarQuestsMax)*100)
	if(CivilWarQuestsPercentage < 99)
		Return CivilWarQuestsPercentage as Int
	else
		Return 100
	endif
EndFunction
	
Int Function WarriorSkillPercentage()
	Int WarriorSkillScore = SR_RQC_QST.WarriorSkillScore()
	if(WarriorSkillScore <= 16)
		Return 0
	elseif(WarriorSkillScore <= 18)
		Return (WarriorSkillScore * 0.40) as int
	elseif(WarriorSkillScore <= 20)
		Return (WarriorSkillScore * 0.65) as int
	elseif(WarriorSkillScore <= 22)
		Return (WarriorSkillScore * 0.75) as int
	elseif(WarriorSkillScore <= 24)
		Return (WarriorSkillScore * 0.85) as int
	elseif(WarriorSkillScore <= 26)
		Return (WarriorSkillScore * 0.95) as int
	else
		Return WarriorSkillScore as Int
	endif
EndFunction	

Int Function PersuasionPercentage()
	Float Persuasions = SR_RQC_QST.PersuasionScore() as Float
	Float PersuasionsMax = SR_RQC_QST.PersuasionsMax as Float
	Float PersuasionsPercentage = ((Persuasions/PersuasionsMax)*100)
	if(PersuasionsPercentage < 99)
		Return PersuasionsPercentage as Int
	else
		Return 100
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AMBITION
;;;;;;;;;;

Int Function IntimidationPercentage()
	Float Intimidations = SR_RQC_QST.IntimidationScore() as Float
	Float IntimidationsMax = SR_RQC_QST.IntimidationsMax as Float
	Float IntimidationsPercentage = ((Intimidations/IntimidationsMax)*100)
	if(IntimidationsPercentage < 99)
		Return IntimidationsPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function BribePercentage()
	Float Bribes = SR_RQC_QST.BribeScore() as Float
	Float BribesMax = SR_RQC_QST.BribesMax as Float
	Float BribesPercentage = ((Bribes/BribesMax)*100)
	if(BribesPercentage < 99)
		Return BribesPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function CollegeWinterholdPercentage()
	Float CollegeWinterholdQuests = SR_RQC_QST.CollegeWinterholdScore() as Float
	Float CollegeWinterholdQuestsMax = SR_RQC_QST.CollegeWinterholdQuestsMax as Float
	Float CollegeWinterholdQuestsPercentage = ((CollegeWinterholdQuests/CollegeWinterholdQuestsMax)*100)
	if(CollegeWinterholdQuestsPercentage < 99)
		Return CollegeWinterholdQuestsPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function BooksReadPercentage()
	Float BooksRead = SR_RQC_QST.BooksReadScore() as Float
	Float BooksReadMax = SR_RQC_QST.BooksReadMax as Float
	Float BooksReadPercentage = ((BooksRead/BooksReadMax)*100)
	if(BooksReadPercentage < 99)
		Return BooksReadPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function NecroTimesCurrentScore()
	float NecromancyTimesScore = SR_RQC_QST.NecroTimesScore() as float
	float SpellNecromancySeenDenominator = SR_RQC_QST.ZombieTimePowNom as float
	float NecromancyTimesDecreament = SR_RQC_QST.NecroTimesDecreamentScore()
	float AdjNecroTimesScore = (NecromancyTimesScore/SpellNecromancySeenDenominator)-NecromancyTimesDecreament
	float NecroTimesCurrentScore = AdjNecroTimesScore * SpellNecromancySeenDenominator
	Return NecroTimesCurrentScore as Int
EndFunction


Int Function SoulsTrappedPercentage()
	Float SoulsTrapped = SR_RQC_QST.SoulsTrappedScore() as Float
	Float SoulsTrappedMax = SR_RQC_QST.SoulsTrappedMax as Float
	Float SoulsTrappedPercentage = ((SoulsTrapped/SoulsTrappedMax)*100)
	if(SoulsTrappedPercentage < 99)
		Return SoulsTrappedPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function BlackSoulTrapPercentage()
	Float BlackSoulTrap = SR_RQC_QST.BlackSoulTrapScore() as Float
	Float BlackSoulTrapMax = SR_RQC_QST.BlackSoulTrapMax as Float
	Float BlackSoulTrapPercentage = ((BlackSoulTrap/BlackSoulTrapMax)*100)
	if(BlackSoulTrapPercentage < 99)
		Return BlackSoulTrapPercentage as Int
	else
		Return 100
	endif
EndFunction

Int Function ArcaneMasteryPercentage()
 	Int ArcaneMasteryPercentage = SR_RQC_QST.ArcaneMasteryScore()
	if(ArcaneMasteryPercentage <= 16)
		Return 0
	elseif(ArcaneMasteryPercentage <= 18)
		Return (ArcaneMasteryPercentage * 0.40) as int
	elseif(ArcaneMasteryPercentage <= 20)
		Return (ArcaneMasteryPercentage * 0.65) as int
	elseif(ArcaneMasteryPercentage <= 22)
		Return (ArcaneMasteryPercentage * 0.75) as int
	elseif(ArcaneMasteryPercentage <= 24)
		Return (ArcaneMasteryPercentage * 0.85) as int
	elseif(ArcaneMasteryPercentage <= 26)
		Return (ArcaneMasteryPercentage * 0.95) as int
	else
		Return ArcaneMasteryPercentage as Int
	endif
EndFunction

Int Function ConjurationPercentage()
	Int ConjurationSkill = SR_RQC_QST.ConjurationScore()
	if(ConjurationSkill <= 16)
		Return 0
	elseif(ConjurationSkill <= 18)
		Return (ConjurationSkill * 0.40) as int
	elseif(ConjurationSkill <= 20)
		Return (ConjurationSkill * 0.65) as int
	elseif(ConjurationSkill <= 22)
		Return (ConjurationSkill * 0.75) as int
	elseif(ConjurationSkill <= 24)
		Return (ConjurationSkill * 0.85) as int
	elseif(ConjurationSkill <= 26)
		Return (ConjurationSkill * 0.95) as int
	else
		Return ConjurationSkill as Int
	endif
EndFunction

Int Function RestorationPercentage()
	Int RestorationSkill = SR_RQC_QST.RestorationScore()
	if(RestorationSkill <= 16)
		Return 0
	elseif(RestorationSkill <= 18)
		Return (RestorationSkill * 0.40) as int
	elseif(RestorationSkill <= 20)
		Return (RestorationSkill * 0.65) as int
	elseif(RestorationSkill <= 22)
		Return (RestorationSkill * 0.75) as int
	elseif(RestorationSkill <= 24)
		Return (RestorationSkill * 0.85) as int
	elseif(RestorationSkill <= 26)
		Return (RestorationSkill * 0.95) as int
	else
		Return RestorationSkill as Int
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SET FUNCTIONS FOR SR_RQC_QST FUNCTION DENOMINATORS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function CalibrateDecrementPropertyValues()
	SR_RQC_QST.CalibrateNecksBittenDec()
	SR_RQC_QST.CalibrateSpellVampSpellDec()
	SR_RQC_QST.CalibrateVampLordTransDec()
	SR_RQC_QST.CalibrateCrimeVampLordSeenDec()
	SR_RQC_QST.CalibrateCommentVampVillagerDec()
	SR_RQC_QST.CalibrateCommentVampGuardDec()
	SR_RQC_QST.CalibrateExtVampirismSmallDec()
	SR_RQC_QST.CalibrateExtVampirismLargeDec()
	SR_RQC_QST.CalibrateWerewolfMaulDec()
	SR_RQC_QST.CalibrateWerewolfTransDec()
	SR_RQC_QST.CalibrateWerewolfFeedDec()
	SR_RQC_QST.CalibrateCrimeWereSeenDec()
	SR_RQC_QST.CalibrateCommentWereVillagerDec()
	SR_RQC_QST.CalibrateCommentWereGuardDec()
	SR_RQC_QST.CalibrateExtLycanthropySmallDec()
	SR_RQC_QST.CalibrateExtLycanthropyLargeDec()
	SR_RQC_QST.CalibrateCrimePettySeenDec()
	SR_RQC_QST.CalibrateCrimeAssaultsSeenDec()
	SR_RQC_QST.CalibrateCrimeMurdersSeenDec()
	SR_RQC_QST.CalibrateSpellNecromancySeenDec()
EndFunction

Function ResetDecrementPropertyValues()
	SR_RQC_QST.SetNecksBittenDec(0.0)
	SR_RQC_QST.SetSpellVampSpellDec(0.0)
	SR_RQC_QST.SetVampLordTransDec(0.0)
	SR_RQC_QST.SetCrimeVampLordSeenDec(0.0)
	SR_RQC_QST.SetCommentVampVillagerDec(0.0)
	SR_RQC_QST.SetCommentVampGuardDec(0.0)
	SR_RQC_QST.SetExtVampirismSmallDec(0.0)
	SR_RQC_QST.SetExtVampirismLargeDec(0.0)
	SR_RQC_QST.SetWerewolfMaulDec(0.0)
	SR_RQC_QST.SetWerewolfTransDec(0.0)
	SR_RQC_QST.SetWerewolfFeedDec(0.0)
	SR_RQC_QST.SetCrimeWereSeenDec(0.0)
	SR_RQC_QST.SetCommentWereVillagerDec(0.0)
	SR_RQC_QST.SetCommentWereGuardDec(0.0)
	SR_RQC_QST.SetExtLycanthropySmallDec(0.0)
	SR_RQC_QST.SetExtLycanthropyLargeDec(0.0)
	SR_RQC_QST.SetCrimePettySeenDec(0.0)
	SR_RQC_QST.SetCrimeAssaultsSeenDec(0.0)
	SR_RQC_QST.SetCrimeMurdersSeenDec(0.0)
	SR_RQC_QST.SetNecroTimesDecreament(0.0)
EndFunction

Function ResetPluginDecrementPropertyValues()
	SR_RQC_QST.SetExtVampirismSmallDec(0.0)
	SR_RQC_QST.SetExtVampirismLargeDec(0.0)
	SR_RQC_QST.SetExtLycanthropySmallDec(0.0)
	SR_RQC_QST.SetExtLycanthropyLargeDec(0.0)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SET FUNCTIONS FOR VAMPIRE AND WEREWOLF SUSPICION DENOMINATORS AND MAX VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetVampWereDenominatorsSuspicious()
	SR_RQC_QST.SetNecksBittenNom(2)
	SR_RQC_QST.SetVampiricSpellSeenNom(1)
	SR_RQC_QST.SetVampiricSpellSeenMult(2)
	SR_RQC_QST.SetVampireLordTransformationNom(3)
	SR_RQC_QST.SetVampireLordSeenNom(1)
	SR_RQC_QST.SetVampireLordSeenMult(15)
	SR_RQC_QST.SetVampireVillagerNom(2)
	SR_RQC_QST.SetVampireGuardNom(1)
	SR_RQC_QST.SetVampireGuardMult(5)
	SR_RQC_QST.SetWerewolfMaulNom(8)
	SR_RQC_QST.SetWerewolfTransformationsNom(5)
	SR_RQC_QST.SetWerewolfFeedsNom(3)
	SR_RQC_QST.SetTimesSpottedWerewolfNom(1)
	SR_RQC_QST.SetTimesSpottedWerewolfMult(15)
	SR_RQC_QST.SetWerewolfVillagerNom(2)
	SR_RQC_QST.SetWerewolfGuardNom(1)
	SR_RQC_QST.SetWerewolfGuardMult(5)
	SR_RQC_QST.SetExtVampirismSmallNom(70)
	SR_RQC_QST.SetExtVampirismLargeNom(7)
	SR_RQC_QST.SetExtVampirismLargeMult(1)
	SR_RQC_QST.SetExtLycanthropySmallNom(70)
	SR_RQC_QST.SetExtLycanthropyLargeNom(7)
	SR_RQC_QST.SetExtLycanthropyLargeMult(1)

	SR_RQC_QST.SetAedricDampenerHigh(0.80)
	SR_RQC_QST.SetAedricDampenerMed(0.85)
	SR_RQC_QST.SetAedricDampenerLow(0.90)
	SR_RQC_QST.SetAedricDampenerVeryLow(0.95)
	
	SR_Global_WiCommentChanceWereVamp.SetValue(100)
EndFunction

Function SetVampWereDecrementorsSuspicious()	
	SR_RQC_QST.SetNecksBittenDecTime(6.0)
	SR_RQC_QST.SetNecksBittenDecPerc(0.0085)
	SR_RQC_QST.SetVampSpellDecTime(6.0)
	SR_RQC_QST.SetVampSpellDecPerc(0.028)
	SR_RQC_QST.SetVampLordTransDecTime(6.0)
	SR_RQC_QST.SetVampLordTransDecPerc(0.003)
	SR_RQC_QST.SetCrimeVampLordSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeVampLordSeenDecPerc(0.051)
	SR_RQC_QST.SetCommentVampVillagerDecTime(6.0)
	SR_RQC_QST.SetCommentVampVillagerDecPerc(0.0085)
	SR_RQC_QST.SetCommentVampGuardDecTime(6.0)
	SR_RQC_QST.SetCommentVampGuardDecPerc(0.08)
	SR_RQC_QST.SetWerewolfMaulDecTime(6.0)
	SR_RQC_QST.SetWerewolfMaulDecPerc(0.004)
	SR_RQC_QST.SetWerewolfTransDecTime(6.0)
	SR_RQC_QST.SetWerewolfTransDecPerc(0.0018)
	SR_RQC_QST.SetWerewolfFeedDecTime(6.0)
	SR_RQC_QST.SetWerewolfFeedDecPerc(0.00153)
	SR_RQC_QST.SetCrimeWereSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeWereSeenDecPerc(0.051)
	SR_RQC_QST.SetCommentWereVillagerDecTime(6.0)
	SR_RQC_QST.SetCommentWereVillagerDecPerc(0.0085)
	SR_RQC_QST.SetCommentWereGuardDecTime(6.0)
	SR_RQC_QST.SetCommentWereGuardDecPerc(0.08)
	SR_RQC_QST.SetExtVampirismSmallDecTime(6.0)
	SR_RQC_QST.SetExtVampirismSmallDecPerc(0.0018)
	SR_RQC_QST.SetExtVampirismLargeDecTime(6.0)
	SR_RQC_QST.SetExtVampirismLargeDecPerc(0.00267)
	SR_RQC_QST.SetExtLycanthropySmallDecTime(6.0)
	SR_RQC_QST.SetExtLycanthropySmallDecPerc(0.0018)
	SR_RQC_QST.SetExtLycanthropyLargeDecTime(6.0)
	SR_RQC_QST.SetExtLycanthropyLargeDecPerc(0.00267)
EndFunction

Function SetVampWereMaxSuspicious()
	SR_RQC_QST.SetNecksBittenMax(5000)
	SR_RQC_QST.SetVampiricSpellSeenMax(5000)
	SR_RQC_QST.SetVampireLordTransformationMax(5000)
	SR_RQC_QST.SetVampireLordSeenMax(1000)
	SR_RQC_QST.SetVampireVillagerMax(5000)
	SR_RQC_QST.SetVampireGuardMax(1000)
	SR_RQC_QST.SetWerewolfMaulMax(1000)
	SR_RQC_QST.SetWerewolfTransformationsMax(5000)
	SR_RQC_QST.SetWerewolfFeedsMax(1000)
	SR_RQC_QST.SetTimesSpottedWerewolfMax(1000)
	SR_RQC_QST.SetWerewolfVillagerMax(5000)
	SR_RQC_QST.SetWerewolfGuardMax(1000)
	SR_RQC_QST.SetExtVampirismSmallMax(1000)
	SR_RQC_QST.SetExtVampirismLargeMax(1000)
	SR_RQC_QST.SetExtLycanthropySmallMax(1000)
	SR_RQC_QST.SetExtLycanthropyLargeMax(1000)
	
	SR_RQC_QST.SetVampireRaceCont(15)
	SR_RQC_QST.SetNecksBittenMin(12)
	SR_RQC_QST.SetVampiricSpellSeenMin(2)
	SR_RQC_QST.SetVampireLordTransformationMin(8)
	SR_RQC_QST.SetVampireLordSeenMin(15)
	SR_RQC_QST.SetVampireVillagerMin(12)
	SR_RQC_QST.SetVampireGuardMin(5)
	SR_RQC_QST.SetWerewolfRaceCont(19)
	SR_RQC_QST.SetWerewolfTransformationsMin(5)
	SR_RQC_QST.SetWerewolfFeedsMin(10)
	SR_RQC_QST.SetWerewolfMaulMin(3)
	SR_RQC_QST.SetTimesSpottedWerewolfMin(15)
	SR_RQC_QST.SetWerewolfVillagerMin(12)
	SR_RQC_QST.SetWerewolfGuardMin(5)
EndFunction

Function SetVampWereDenominatorsRegular()
	SR_RQC_QST.SetNecksBittenNom(3)
	SR_RQC_QST.SetVampiricSpellSeenNom(1)
	SR_RQC_QST.SetVampiricSpellSeenMult(2)
	SR_RQC_QST.SetVampireLordTransformationNom(4)
	SR_RQC_QST.SetVampireLordSeenNom(1)
	SR_RQC_QST.SetVampireLordSeenMult(15)
	SR_RQC_QST.SetVampireVillagerNom(3)
	SR_RQC_QST.SetVampireGuardNom(1)
	SR_RQC_QST.SetVampireGuardMult(4)
	SR_RQC_QST.SetWerewolfMaulNom(10)
	SR_RQC_QST.SetWerewolfTransformationsNom(6)
	SR_RQC_QST.SetWerewolfFeedsNom(4)
	SR_RQC_QST.SetTimesSpottedWerewolfNom(1)
	SR_RQC_QST.SetTimesSpottedWerewolfMult(15)
	SR_RQC_QST.SetWerewolfVillagerNom(3)
	SR_RQC_QST.SetWerewolfGuardNom(1)
	SR_RQC_QST.SetWerewolfGuardMult(4)
	SR_RQC_QST.SetExtVampirismSmallNom(100)
	SR_RQC_QST.SetExtVampirismLargeNom(10)
	SR_RQC_QST.SetExtVampirismLargeMult(1)
	SR_RQC_QST.SetExtLycanthropySmallNom(100)
	SR_RQC_QST.SetExtLycanthropyLargeNom(10)
	SR_RQC_QST.SetExtLycanthropyLargeMult(1)
	
	SR_RQC_QST.SetAedricDampenerHigh(0.75)
	SR_RQC_QST.SetAedricDampenerMed(0.80)
	SR_RQC_QST.SetAedricDampenerLow(0.85)
	SR_RQC_QST.SetAedricDampenerVeryLow(0.90)
	
	SR_Global_WiCommentChanceWereVamp.SetValue(90)
EndFunction

Function SetVampWereDecrementorsRegular()	
	SR_RQC_QST.SetNecksBittenDecTime(6.0)
	SR_RQC_QST.SetNecksBittenDecPerc(0.00567)
	SR_RQC_QST.SetVampSpellDecTime(6.0)
	SR_RQC_QST.SetVampSpellDecPerc(0.028)
	SR_RQC_QST.SetVampLordTransDecTime(6.0)
	SR_RQC_QST.SetVampLordTransDecPerc(0.004)
	SR_RQC_QST.SetCrimeVampLordSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeVampLordSeenDecPerc(0.051)
	SR_RQC_QST.SetCommentVampVillagerDecTime(6.0)
	SR_RQC_QST.SetCommentVampVillagerDecPerc(0.00567)
	SR_RQC_QST.SetCommentVampGuardDecTime(6.0)
	SR_RQC_QST.SetCommentVampGuardDecPerc(0.064)
	SR_RQC_QST.SetWerewolfMaulDecTime(6.0)
	SR_RQC_QST.SetWerewolfMaulDecPerc(0.0032)
	SR_RQC_QST.SetWerewolfTransDecTime(6.0)
	SR_RQC_QST.SetWerewolfTransDecPerc(0.0015)
	SR_RQC_QST.SetWerewolfFeedDecTime(6.0)
	SR_RQC_QST.SetWerewolfFeedDecPerc(0.00115)
	SR_RQC_QST.SetCrimeWereSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeWereSeenDecPerc(0.051)
	SR_RQC_QST.SetCommentWereVillagerDecTime(6.0)
	SR_RQC_QST.SetCommentWereVillagerDecPerc(0.00567)
	SR_RQC_QST.SetCommentWereGuardDecTime(6.0)
	SR_RQC_QST.SetCommentWereGuardDecPerc(0.064)
	SR_RQC_QST.SetExtVampirismSmallDecTime(6.0)
	SR_RQC_QST.SetExtVampirismSmallDecPerc(0.0018)
	SR_RQC_QST.SetExtVampirismLargeDecTime(6.0)
	SR_RQC_QST.SetExtVampirismLargeDecPerc(0.00267)
	SR_RQC_QST.SetExtLycanthropySmallDecTime(6.0)
	SR_RQC_QST.SetExtLycanthropySmallDecPerc(0.0018)
	SR_RQC_QST.SetExtLycanthropyLargeDecTime(6.0)
	SR_RQC_QST.SetExtLycanthropyLargeDecPerc(0.00267)
EndFunction

Function SetVampWereMaxRegular()
	SR_RQC_QST.SetNecksBittenMax(5000)
	SR_RQC_QST.SetVampiricSpellSeenMax(5000)
	SR_RQC_QST.SetVampireLordTransformationMax(5000)
	SR_RQC_QST.SetVampireLordSeenMax(1000)
	SR_RQC_QST.SetVampireVillagerMax(5000)
	SR_RQC_QST.SetVampireGuardMax(1000)
	SR_RQC_QST.SetWerewolfMaulMax(1000)
	SR_RQC_QST.SetWerewolfTransformationsMax(5000)
	SR_RQC_QST.SetWerewolfFeedsMax(1000)
	SR_RQC_QST.SetTimesSpottedWerewolfMax(1000)
	SR_RQC_QST.SetWerewolfVillagerMax(5000)
	SR_RQC_QST.SetWerewolfGuardMax(1000)
	SR_RQC_QST.SetExtVampirismSmallMax(1000)
	SR_RQC_QST.SetExtVampirismLargeMax(1000)
	SR_RQC_QST.SetExtLycanthropySmallMax(1000)
	SR_RQC_QST.SetExtLycanthropyLargeMax(1000)
	
	SR_RQC_QST.SetVampireRaceCont(15)
	SR_RQC_QST.SetNecksBittenMin(10)
	SR_RQC_QST.SetVampiricSpellSeenMin(2)
	SR_RQC_QST.SetVampireLordTransformationMin(8)
	SR_RQC_QST.SetVampireLordSeenMin(15)
	SR_RQC_QST.SetVampireVillagerMin(10)
	SR_RQC_QST.SetVampireGuardMin(4)
	SR_RQC_QST.SetWerewolfRaceCont(17)
	SR_RQC_QST.SetWerewolfTransformationsMin(5)
	SR_RQC_QST.SetWerewolfFeedsMin(10)
	SR_RQC_QST.SetWerewolfMaulMin(3)
	SR_RQC_QST.SetTimesSpottedWerewolfMin(15)
	SR_RQC_QST.SetWerewolfVillagerMin(10)
	SR_RQC_QST.SetWerewolfGuardMin(4)
EndFunction

Function SetVampWereDenominatorsOblivious()
	SR_RQC_QST.SetNecksBittenNom(4)
	SR_RQC_QST.SetVampiricSpellSeenNom(1)
	SR_RQC_QST.SetVampiricSpellSeenMult(2)
	SR_RQC_QST.SetVampireLordTransformationNom(5)
	SR_RQC_QST.SetVampireLordSeenNom(1)
	SR_RQC_QST.SetVampireLordSeenMult(15)
	SR_RQC_QST.SetVampireVillagerNom(3)
	SR_RQC_QST.SetVampireGuardNom(1)
	SR_RQC_QST.SetVampireGuardMult(4)
	SR_RQC_QST.SetWerewolfMaulNom(12)
	SR_RQC_QST.SetWerewolfTransformationsNom(7)
	SR_RQC_QST.SetWerewolfFeedsNom(5)
	SR_RQC_QST.SetTimesSpottedWerewolfNom(1)
	SR_RQC_QST.SetTimesSpottedWerewolfMult(15)
	SR_RQC_QST.SetWerewolfVillagerNom(3)
	SR_RQC_QST.SetWerewolfGuardNom(1)
	SR_RQC_QST.SetWerewolfGuardMult(4)
	SR_RQC_QST.SetExtVampirismSmallNom(100)
	SR_RQC_QST.SetExtVampirismLargeNom(10)
	SR_RQC_QST.SetExtVampirismLargeMult(1)
	SR_RQC_QST.SetExtLycanthropySmallNom(100)
	SR_RQC_QST.SetExtLycanthropyLargeNom(10)
	SR_RQC_QST.SetExtLycanthropyLargeMult(1)
	
	SR_RQC_QST.SetAedricDampenerHigh(0.70)
	SR_RQC_QST.SetAedricDampenerMed(0.75)
	SR_RQC_QST.SetAedricDampenerLow(0.80)
	SR_RQC_QST.SetAedricDampenerVeryLow(0.85)
	
	SR_Global_WiCommentChanceWereVamp.SetValue(80)	
EndFunction

Function SetVampWereDecrementorsOblivious()	
	SR_RQC_QST.SetNecksBittenDecTime(6.0)
	SR_RQC_QST.SetNecksBittenDecPerc(0.00425)
	SR_RQC_QST.SetVampSpellDecTime(6.0)
	SR_RQC_QST.SetVampSpellDecPerc(0.028)
	SR_RQC_QST.SetVampLordTransDecTime(6.0)
	SR_RQC_QST.SetVampLordTransDecPerc(0.0018)
	SR_RQC_QST.SetCrimeVampLordSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeVampLordSeenDecPerc(0.051)
	SR_RQC_QST.SetCommentVampVillagerDecTime(6.0)
	SR_RQC_QST.SetCommentVampVillagerDecPerc(0.00567)
	SR_RQC_QST.SetCommentVampGuardDecTime(6.0)
	SR_RQC_QST.SetCommentVampGuardDecPerc(0.064)
	SR_RQC_QST.SetWerewolfMaulDecTime(6.0)
	SR_RQC_QST.SetWerewolfMaulDecPerc(0.00267)
	SR_RQC_QST.SetWerewolfTransDecTime(6.0)
	SR_RQC_QST.SetWerewolfTransDecPerc(0.00129)
	SR_RQC_QST.SetWerewolfFeedDecTime(6.0)
	SR_RQC_QST.SetWerewolfFeedDecPerc(0.00092)
	SR_RQC_QST.SetCrimeWereSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeWereSeenDecPerc(0.051)
	SR_RQC_QST.SetCommentWereVillagerDecTime(6.0)
	SR_RQC_QST.SetCommentWereVillagerDecPerc(0.00567)
	SR_RQC_QST.SetCommentWereGuardDecTime(6.0)
	SR_RQC_QST.SetCommentWereGuardDecPerc(0.064)
	SR_RQC_QST.SetExtVampirismSmallDecTime(6.0)
	SR_RQC_QST.SetExtVampirismSmallDecPerc(0.0018)
	SR_RQC_QST.SetExtVampirismLargeDecTime(6.0)
	SR_RQC_QST.SetExtVampirismLargeDecPerc(0.00267)
	SR_RQC_QST.SetExtLycanthropySmallDecTime(6.0)
	SR_RQC_QST.SetExtLycanthropySmallDecPerc(0.0018)
	SR_RQC_QST.SetExtLycanthropyLargeDecTime(6.0)
	SR_RQC_QST.SetExtLycanthropyLargeDecPerc(0.00267)
EndFunction

Function SetVampWereMaxOblivious()
	SR_RQC_QST.SetNecksBittenMax(5000)
	SR_RQC_QST.SetVampiricSpellSeenMax(5000)
	SR_RQC_QST.SetVampireLordTransformationMax(5000)
	SR_RQC_QST.SetVampireLordSeenMax(1000)
	SR_RQC_QST.SetVampireVillagerMax(5000)
	SR_RQC_QST.SetVampireGuardMax(1000)
	SR_RQC_QST.SetWerewolfMaulMax(1000)
	SR_RQC_QST.SetWerewolfTransformationsMax(5000)
	SR_RQC_QST.SetWerewolfFeedsMax(1000)
	SR_RQC_QST.SetTimesSpottedWerewolfMax(1000)
	SR_RQC_QST.SetWerewolfVillagerMax(5000)
	SR_RQC_QST.SetWerewolfGuardMax(1000)
	SR_RQC_QST.SetExtVampirismSmallMax(1000)
	SR_RQC_QST.SetExtVampirismLargeMax(1000)
	SR_RQC_QST.SetExtLycanthropySmallMax(1000)
	SR_RQC_QST.SetExtLycanthropyLargeMax(1000)
	
	SR_RQC_QST.SetVampireRaceCont(10)
	SR_RQC_QST.SetNecksBittenMin(9)
	SR_RQC_QST.SetVampiricSpellSeenMin(2)
	SR_RQC_QST.SetVampireLordTransformationMin(7)
	SR_RQC_QST.SetVampireLordSeenMin(15)
	SR_RQC_QST.SetVampireVillagerMin(12)
	SR_RQC_QST.SetVampireGuardMin(4)
	SR_RQC_QST.SetWerewolfRaceCont(12)
	SR_RQC_QST.SetWerewolfTransformationsMin(5)
	SR_RQC_QST.SetWerewolfFeedsMin(8)
	SR_RQC_QST.SetWerewolfMaulMin(3)
	SR_RQC_QST.SetTimesSpottedWerewolfMin(15)
	SR_RQC_QST.SetWerewolfVillagerMin(12)
	SR_RQC_QST.SetWerewolfGuardMin(4)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SET FUNCTIONS FOR SR_RQC_QST FUNCTION DENOMINATORS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetRQCDenominatorsSensitive()
	SR_RQC_QST.SetQuestsCompletedNom(15)
	SR_RQC_QST.SetLocationsNom(40)
	SR_RQC_QST.SetDungeonsNom(20)
	SR_RQC_QST.SetSpottedMurdersFameNom(1)
	SR_RQC_QST.SetSpottedMurdersFameMult(2)
	SR_RQC_QST.SetPeopleKillsNom(60)
	SR_RQC_QST.SetStoreInvestmentsNom(5)
	SR_RQC_QST.SetHousesOwnedNom(1)
	SR_RQC_QST.SetDragonKillsNom(3)
	SR_RQC_QST.SetLycanthropyNom(3)
	SR_RQC_QST.SetVampirismNom(3)
	SR_RQC_QST.SetCannibalFeedNom(7)
	SR_RQC_QST.SetZombieTimeDeaNom(2)
	SR_RQC_QST.SetConjurationSkillNom(15)
	SR_RQC_QST.SetRestorationSkillNom(15)
	SR_RQC_QST.SetDaedraKilledNom(10)
	SR_RQC_QST.SetUndeadKilledNom(100)
	SR_RQC_QST.SetCharityNom(2)
	SR_RQC_QST.SetSpottedAssaultsNom(1)
	SR_RQC_QST.SetSpottedAssaultsMult(3)
	SR_RQC_QST.SetSpottedMurdersNom(1)
	SR_RQC_QST.SetSpottedMurdersMult(5)
	SR_RQC_QST.SetSpottedPettyCrimeNom(1)
	SR_RQC_QST.SetMurdersNom(7)
	SR_RQC_QST.SetPocketsPickedNom(20)
	SR_RQC_QST.SetHorsesStolenNom(5)
	SR_RQC_QST.SetItemsStolenNom(100)
	SR_RQC_QST.SetTrespassesNom(20)
	SR_RQC_QST.SetJailEscapesNom(2)
	SR_RQC_QST.SetThievesGuildQuestsNom(10)
	SR_RQC_QST.SetDarkBrotherhoodQuestsNom(5)
	SR_RQC_QST.SetDaysJailedNom(3)
	SR_RQC_QST.SetFinesPayedNom(1000)
	SR_RQC_QST.SetCompanionsQuestsLawNom(2)
	SR_RQC_QST.SetBanditsKilledNom(50)
	SR_RQC_QST.SetWizardKillerNom(25)
	SR_RQC_QST.SetWitchKillerNom(25)
	SR_RQC_QST.SetForswornKillerNom(40)
	SR_RQC_QST.SetCompanionsQuestsDepNom(4)
	SR_RQC_QST.SetCivilWarQuestsNom(1)
	SR_RQC_QST.SetCivilWarQuestsMult(2)	
	SR_RQC_QST.SetMiscQuestsNom(7)
	SR_RQC_QST.SetWarriorSkillNom(4)
	SR_RQC_QST.SetBrawlsWonNom(3)
	SR_RQC_QST.SetPersuasionsNom(7)
	SR_RQC_QST.SetCollegeWinterholdQuestsNom(1)
	SR_RQC_QST.SetBribesNom(5)
	SR_RQC_QST.SetIntimidationsNom(7)
	SR_RQC_QST.SetZombieTimePowNom(1)
	SR_RQC_QST.SetBlackSoulTrapNom(4)
	SR_RQC_QST.SetSoulsTrappedNom(30)
	SR_RQC_QST.SetBooksReadNom(50)
	SR_RQC_QST.SetArcaneMasteryNom(4)
	SR_RQC_QST.SetExtFameSmallNom(80)
	SR_RQC_QST.SetExtFameMediumNom(30)
	SR_RQC_QST.SetExtFameLargeNom(5)
	SR_RQC_QST.SetExtDaedricSmallNom(80)
	SR_RQC_QST.SetExtDaedricMediumNom(30)
	SR_RQC_QST.SetExtDaedricLargeNom(5)
	SR_RQC_QST.SetExtAedricSmallNom(80)
	SR_RQC_QST.SetExtAedricMediumNom(30)
	SR_RQC_QST.SetExtAedricLargeNom(5)
	SR_RQC_QST.SetExtCrimeSmallNom(80)
	SR_RQC_QST.SetExtCrimeMediumNom(30)
	SR_RQC_QST.SetExtCrimeLargeNom(5)
	SR_RQC_QST.SetExtLawSmallNom(80)
	SR_RQC_QST.SetExtLawMediumNom(30)
	SR_RQC_QST.SetExtLawLargeNom(5)
	SR_RQC_QST.SetExtAmbitionSmallNom(80)
	SR_RQC_QST.SetExtAmbitionMediumNom(30)
	SR_RQC_QST.SetExtAmbitionLargeNom(5)
	SR_RQC_QST.SetExtDependabilitySmallNom(80)
	SR_RQC_QST.SetExtDependabilityMediumNom(30)
	SR_RQC_QST.SetExtDependabilityLargeNom(5)
	
	SR_RQC_QST.SetCrimePettySeenDecTime(6.0)
	SR_RQC_QST.SetCrimePettySeenDecPerc(0.014)
	SR_RQC_QST.SetCrimeAssaultsSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeAssaultsSeenDecPerc(0.018)
	SR_RQC_QST.SetCrimeMurdersSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeMurdersSeenDecPerc(0.017)
	SR_RQC_QST.SetSpellNecromancySeenDecTime(6.0)
	SR_RQC_QST.SetNecroTimesDecreamentPerc(0.00153)
	
	SR_RQC_QST.SetRepDifferenceLarge(2.0)
	SR_RQC_QST.SetRepDifferenceMedium(1.7)
	SR_RQC_QST.SetRepDifferenceSmall(1.4)
	SR_RQC_QST.SetMoralDifferenceLarge(2.0)
	SR_RQC_QST.SetMoralDifferenceMedium(1.5)
	SR_RQC_QST.SetMoralDifferenceSmall(1.1)
EndFunction

Function SetRQCDenominatorsRegular()
	SR_RQC_QST.SetQuestsCompletedNom(20)
	SR_RQC_QST.SetLocationsNom(60)
	SR_RQC_QST.SetDungeonsNom(30)
	SR_RQC_QST.SetSpottedMurdersFameNom(1)
	SR_RQC_QST.SetSpottedMurdersFameMult(1)
	SR_RQC_QST.SetPeopleKillsNom(100)
	SR_RQC_QST.SetStoreInvestmentsNom(6)
	SR_RQC_QST.SetHousesOwnedNom(2)
	SR_RQC_QST.SetDragonKillsNom(5)
	SR_RQC_QST.SetZombieTimeDeaNom(2)
	SR_RQC_QST.SetLycanthropyNom(4)
	SR_RQC_QST.SetVampirismNom(4)
	SR_RQC_QST.SetCannibalFeedNom(10)
	SR_RQC_QST.SetConjurationSkillNom(20)
	SR_RQC_QST.SetRestorationSkillNom(20)
	SR_RQC_QST.SetCharityNom(3)
	SR_RQC_QST.SetDaedraKilledNom(20)
	SR_RQC_QST.SetUndeadKilledNom(100)
	SR_RQC_QST.SetSpottedAssaultsNom(1)
	SR_RQC_QST.SetSpottedAssaultsMult(2)
	SR_RQC_QST.SetSpottedMurdersNom(1)
	SR_RQC_QST.SetSpottedMurdersMult(4)
	SR_RQC_QST.SetSpottedPettyCrimeNom(2)
	SR_RQC_QST.SetMurdersNom(10)
	SR_RQC_QST.SetPocketsPickedNom(20)
	SR_RQC_QST.SetHorsesStolenNom(10)
	SR_RQC_QST.SetItemsStolenNom(200)
	SR_RQC_QST.SetTrespassesNom(20)
	SR_RQC_QST.SetJailEscapesNom(5)
	SR_RQC_QST.SetThievesGuildQuestsNom(10)
	SR_RQC_QST.SetDarkBrotherhoodQuestsNom(5)
	SR_RQC_QST.SetDaysJailedNom(5)
	SR_RQC_QST.SetFinesPayedNom(2000)
	SR_RQC_QST.SetCompanionsQuestsLawNom(3)
	SR_RQC_QST.SetBanditsKilledNom(100)
	SR_RQC_QST.SetWizardKillerNom(30)
	SR_RQC_QST.SetWitchKillerNom(30)
	SR_RQC_QST.SetForswornKillerNom(50)
	SR_RQC_QST.SetCompanionsQuestsDepNom(6)
	SR_RQC_QST.SetCivilWarQuestsNom(1)
	SR_RQC_QST.SetCivilWarQuestsMult(2)		
	SR_RQC_QST.SetMiscQuestsNom(10)
	SR_RQC_QST.SetWarriorSkillNom(5)
	SR_RQC_QST.SetBrawlsWonNom(5)
	SR_RQC_QST.SetPersuasionsNom(10)
	SR_RQC_QST.SetCollegeWinterholdQuestsNom(2)
	SR_RQC_QST.SetBribesNom(10)
	SR_RQC_QST.SetIntimidationsNom(10)
	SR_RQC_QST.SetZombieTimePowNom(3)
	SR_RQC_QST.SetBlackSoulTrapNom(5)
	SR_RQC_QST.SetSoulsTrappedNom(50)
	SR_RQC_QST.SetBooksReadNom(50)
	SR_RQC_QST.SetArcaneMasteryNom(5)
	SR_RQC_QST.SetExtFameSmallNom(100)
	SR_RQC_QST.SetExtFameMediumNom(50)
	SR_RQC_QST.SetExtFameLargeNom(10)
	SR_RQC_QST.SetExtDaedricSmallNom(100)
	SR_RQC_QST.SetExtDaedricMediumNom(50)
	SR_RQC_QST.SetExtDaedricLargeNom(10)
	SR_RQC_QST.SetExtAedricSmallNom(100)
	SR_RQC_QST.SetExtAedricMediumNom(50)
	SR_RQC_QST.SetExtAedricLargeNom(10)
	SR_RQC_QST.SetExtCrimeSmallNom(100)
	SR_RQC_QST.SetExtCrimeMediumNom(50)
	SR_RQC_QST.SetExtCrimeLargeNom(10)
	SR_RQC_QST.SetExtLawSmallNom(100)
	SR_RQC_QST.SetExtLawMediumNom(50)
	SR_RQC_QST.SetExtLawLargeNom(10)
	SR_RQC_QST.SetExtAmbitionSmallNom(100)
	SR_RQC_QST.SetExtAmbitionMediumNom(50)
	SR_RQC_QST.SetExtAmbitionLargeNom(10)
	SR_RQC_QST.SetExtDependabilitySmallNom(100)
	SR_RQC_QST.SetExtDependabilityMediumNom(50)
	SR_RQC_QST.SetExtDependabilityLargeNom(10)
	
	SR_RQC_QST.SetCrimePettySeenDecTime(6.0)
	SR_RQC_QST.SetCrimePettySeenDecPerc(0.007)
	SR_RQC_QST.SetCrimeAssaultsSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeAssaultsSeenDecPerc(0.012)
	SR_RQC_QST.SetCrimeMurdersSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeMurdersSeenDecPerc(0.0136)
	SR_RQC_QST.SetSpellNecromancySeenDecTime(6.0)
	SR_RQC_QST.SetNecroTimesDecreamentPerc(0.00153)
	
	SR_RQC_QST.SetRepDifferenceLarge(1.4)
	SR_RQC_QST.SetRepDifferenceMedium(1.2)
	SR_RQC_QST.SetRepDifferenceSmall(1.0)
	SR_RQC_QST.SetMoralDifferenceLarge(2.0)
	SR_RQC_QST.SetMoralDifferenceMedium(1.5)
	SR_RQC_QST.SetMoralDifferenceSmall(1.1)
EndFunction

Function SetRQCDenominatorsTardy()
	SR_RQC_QST.SetQuestsCompletedNom(25)
	SR_RQC_QST.SetLocationsNom(60)
	SR_RQC_QST.SetDungeonsNom(35)
	SR_RQC_QST.SetSpottedMurdersFameNom(2)
	SR_RQC_QST.SetSpottedMurdersFameMult(1)
	SR_RQC_QST.SetPeopleKillsNom(150)
	SR_RQC_QST.SetStoreInvestmentsNom(6)
	SR_RQC_QST.SetHousesOwnedNom(2)
	SR_RQC_QST.SetDragonKillsNom(7)
	SR_RQC_QST.SetLycanthropyNom(4)
	SR_RQC_QST.SetVampirismNom(4)
	SR_RQC_QST.SetCannibalFeedNom(10)
	SR_RQC_QST.SetZombieTimeDeaNom(2)
	SR_RQC_QST.SetConjurationSkillNom(20)
	SR_RQC_QST.SetRestorationSkillNom(20)
	SR_RQC_QST.SetCharityNom(3)
	SR_RQC_QST.SetDaedraKilledNom(30)
	SR_RQC_QST.SetUndeadKilledNom(300)
	SR_RQC_QST.SetSpottedAssaultsNom(1)
	SR_RQC_QST.SetSpottedAssaultsMult(1)
	SR_RQC_QST.SetSpottedMurdersNom(1)
	SR_RQC_QST.SetSpottedMurdersMult(3)
	SR_RQC_QST.SetSpottedPettyCrimeNom(3)
	SR_RQC_QST.SetMurdersNom(25)
	SR_RQC_QST.SetPocketsPickedNom(20)
	SR_RQC_QST.SetHorsesStolenNom(10)
	SR_RQC_QST.SetItemsStolenNom(500)
	SR_RQC_QST.SetTrespassesNom(20)
	SR_RQC_QST.SetJailEscapesNom(10)
	SR_RQC_QST.SetThievesGuildQuestsNom(15)
	SR_RQC_QST.SetDarkBrotherhoodQuestsNom(10)
	SR_RQC_QST.SetDaysJailedNom(7)
	SR_RQC_QST.SetFinesPayedNom(3000)
	SR_RQC_QST.SetCompanionsQuestsLawNom(4)
	SR_RQC_QST.SetBanditsKilledNom(200)
	SR_RQC_QST.SetWizardKillerNom(40)
	SR_RQC_QST.SetWitchKillerNom(40)
	SR_RQC_QST.SetForswornKillerNom(60)
	SR_RQC_QST.SetCompanionsQuestsDepNom(8)
	SR_RQC_QST.SetCivilWarQuestsNom(1)
	SR_RQC_QST.SetCivilWarQuestsMult(1)		
	SR_RQC_QST.SetMiscQuestsNom(15)
	SR_RQC_QST.SetWarriorSkillNom(4)	
	SR_RQC_QST.SetBrawlsWonNom(5)
	SR_RQC_QST.SetPersuasionsNom(15)
	SR_RQC_QST.SetCollegeWinterholdQuestsNom(2)
	SR_RQC_QST.SetBribesNom(15)
	SR_RQC_QST.SetIntimidationsNom(15)
	SR_RQC_QST.SetZombieTimePowNom(5)
	SR_RQC_QST.SetBlackSoulTrapNom(10)
	SR_RQC_QST.SetSoulsTrappedNom(10)
	SR_RQC_QST.SetBooksReadNom(40)
	SR_RQC_QST.SetArcaneMasteryNom(6)
	SR_RQC_QST.SetExtFameSmallNom(100)
	SR_RQC_QST.SetExtFameMediumNom(50)
	SR_RQC_QST.SetExtFameLargeNom(10)
	SR_RQC_QST.SetExtDaedricSmallNom(100)
	SR_RQC_QST.SetExtDaedricMediumNom(50)
	SR_RQC_QST.SetExtDaedricLargeNom(10)
	SR_RQC_QST.SetExtAedricSmallNom(100)
	SR_RQC_QST.SetExtAedricMediumNom(50)
	SR_RQC_QST.SetExtAedricLargeNom(10)
	SR_RQC_QST.SetExtCrimeSmallNom(100)
	SR_RQC_QST.SetExtCrimeMediumNom(50)
	SR_RQC_QST.SetExtCrimeLargeNom(10)
	SR_RQC_QST.SetExtLawSmallNom(100)
	SR_RQC_QST.SetExtLawMediumNom(50)
	SR_RQC_QST.SetExtLawLargeNom(10)
	SR_RQC_QST.SetExtAmbitionSmallNom(100)
	SR_RQC_QST.SetExtAmbitionMediumNom(50)
	SR_RQC_QST.SetExtAmbitionLargeNom(10)
	SR_RQC_QST.SetExtDependabilitySmallNom(100)
	SR_RQC_QST.SetExtDependabilityMediumNom(50)
	SR_RQC_QST.SetExtDependabilityLargeNom(10)
	
	SR_RQC_QST.SetCrimePettySeenDecTime(6.0)
	SR_RQC_QST.SetCrimePettySeenDecPerc(0.00467)
	SR_RQC_QST.SetCrimeAssaultsSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeAssaultsSeenDecPerc(0.006)
	SR_RQC_QST.SetCrimeMurdersSeenDecTime(6.0)
	SR_RQC_QST.SetCrimeMurdersSeenDecPerc(0.0102)
	SR_RQC_QST.SetSpellNecromancySeenDecTime(6.0)
	SR_RQC_QST.SetNecroTimesDecreamentPerc(0.00153)
	
	SR_RQC_QST.SetRepDifferenceLarge(1.4)
	SR_RQC_QST.SetRepDifferenceMedium(1.2)
	SR_RQC_QST.SetRepDifferenceSmall(1.0)
	SR_RQC_QST.SetMoralDifferenceLarge(2.0)
	SR_RQC_QST.SetMoralDifferenceMedium(1.5)
	SR_RQC_QST.SetMoralDifferenceSmall(1.1)
	
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SET FUNCTIONS FOR SR_RQC_QST FUNCTIONS' MAXIMUM VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetRQCMaxValuesSensitive()
	SR_RQC_QST.SetQuestFameMax(114)
	SR_RQC_QST.SetQuestDaedricMax(100)
	SR_RQC_QST.SetQuestAedricMax(116)
	SR_RQC_QST.SetQuestCrimeMax(70)
	SR_RQC_QST.SetQuestLawMax(109)
	SR_RQC_QST.SetQuestDependabilityMax(188)
	SR_RQC_QST.SetQuestAmbitionMax(188)
	SR_RQC_QST.SetQuestsCompletedMax(200)
	SR_RQC_QST.SetLocationsMax(300)
	SR_RQC_QST.SetDungeonsMax(150)
	SR_RQC_QST.SetPeopleKillsMax(500)
	SR_RQC_QST.SetStoreInvestmentsMax(30)
	SR_RQC_QST.SetHousesOwnedMax(10)
	SR_RQC_QST.SetDragonKillsMax(30)
	SR_RQC_QST.SetLycanthropyMax(100)
	SR_RQC_QST.SetVampirismMax(100)
	SR_RQC_QST.SetCannibalFeedMax(70)
	SR_RQC_QST.SetDaedraKilledMax(100)
	SR_RQC_QST.SetUndeadKilledMax(1000)
	SR_RQC_QST.SetCharityMax(11)
	SR_RQC_QST.SetSpottedAssaultsMax(500)
	SR_RQC_QST.SetSpottedMurdersMax(500)
	SR_RQC_QST.SetSpottedPettyCrimeMax(1000)
	SR_RQC_QST.SetMurdersMax(100)
	SR_RQC_QST.SetPocketsPickedMax(100)
	SR_RQC_QST.SetHorsesStolenMax(25)
	SR_RQC_QST.SetItemsStolenMax(500)
	SR_RQC_QST.SetTrespassesMax(100)
	SR_RQC_QST.SetJailEscapesMax(20)
	SR_RQC_QST.SetDaysJailedMax(100)
	SR_RQC_QST.SetFinesPayedMax(10000)
	SR_RQC_QST.SetThievesGuildQuestsMax(100)
	SR_RQC_QST.SetDarkBrotherhoodQuestsMax(50)
	SR_RQC_QST.SetCompanionsQuestsMax(75)
	SR_RQC_QST.SetCivilWarQuestsMax(10)
	SR_RQC_QST.SetBanditsKilledMax(500)
	SR_RQC_QST.SetWizardKillerMax(100)
	SR_RQC_QST.SetWitchKillerMax(100)
	SR_RQC_QST.SetForswornKillerMax(200)
	SR_RQC_QST.SetMiscQuestsMax(150)
	SR_RQC_QST.SetBrawlsWonMax(15)
	SR_RQC_QST.SetPersuasionsMax(35)
	SR_RQC_QST.SetCollegeWinterholdQuestsMax(10)
	SR_RQC_QST.SetBribesMax(25)
	SR_RQC_QST.SetIntimidationsMax(35)
	SR_RQC_QST.SetZombieTimeMax(300)
	SR_RQC_QST.SetBlackSoulTrapMax(80)
	SR_RQC_QST.SetSoulsTrappedMax(500)
	SR_RQC_QST.SetBooksReadMax(250)
	SR_RQC_QST.SetExtFameSmallMax(800)
	SR_RQC_QST.SetExtFameMediumMax(300)
	SR_RQC_QST.SetExtFameLargeMax(50)
	SR_RQC_QST.SetExtDaedricSmallMax(800)
	SR_RQC_QST.SetExtDaedricMediumMax(300)
	SR_RQC_QST.SetExtDaedricLargeMax(50)
	SR_RQC_QST.SetExtAedricSmallMax(800)
	SR_RQC_QST.SetExtAedricMediumMax(300)
	SR_RQC_QST.SetExtAedricLargeMax(50)
	SR_RQC_QST.SetExtCrimeSmallMax(1000)
	SR_RQC_QST.SetExtCrimeMediumMax(500)
	SR_RQC_QST.SetExtCrimeLargeMax(100)
	SR_RQC_QST.SetExtLawSmallMax(1000)
	SR_RQC_QST.SetExtLawMediumMax(500)
	SR_RQC_QST.SetExtLawLargeMax(50)
	SR_RQC_QST.SetExtAmbitionSmallMax(800)
	SR_RQC_QST.SetExtAmbitionMediumMax(300)
	SR_RQC_QST.SetExtAmbitionLargeMax(50)
	SR_RQC_QST.SetExtDependabilitySmallMax(800)
	SR_RQC_QST.SetExtDependabilityMediumMax(300)
	SR_RQC_QST.SetExtDependabilityLargeMax(50)
	SR_RQC_QST.SetBigQuestFinishedResetDelayGameDays(20.0)
EndFunction

Function SetRQCMaxValuesRegular()
	SR_RQC_QST.SetQuestFameMax(114)
	SR_RQC_QST.SetQuestDaedricMax(100)
	SR_RQC_QST.SetQuestAedricMax(116)
	SR_RQC_QST.SetQuestCrimeMax(70)
	SR_RQC_QST.SetQuestLawMax(109)
	SR_RQC_QST.SetQuestDependabilityMax(188)
	SR_RQC_QST.SetQuestAmbitionMax(188)
	SR_RQC_QST.SetQuestsCompletedMax(200)
	SR_RQC_QST.SetLocationsMax(300)
	SR_RQC_QST.SetDungeonsMax(150)
	SR_RQC_QST.SetPeopleKillsMax(1000)
	SR_RQC_QST.SetStoreInvestmentsMax(30)
	SR_RQC_QST.SetHousesOwnedMax(10)
	SR_RQC_QST.SetDragonKillsMax(50)
	SR_RQC_QST.SetLycanthropyMax(100)
	SR_RQC_QST.SetVampirismMax(100)
	SR_RQC_QST.SetCannibalFeedMax(100)
	SR_RQC_QST.SetCharityMax(11)
	SR_RQC_QST.SetDaedraKilledMax(200)
	SR_RQC_QST.SetUndeadKilledMax(1000)
	SR_RQC_QST.SetSpottedAssaultsMax(500)
	SR_RQC_QST.SetSpottedMurdersMax(500)
	SR_RQC_QST.SetSpottedPettyCrimeMax(1000)
	SR_RQC_QST.SetMurdersMax(100)
	SR_RQC_QST.SetPocketsPickedMax(100)
	SR_RQC_QST.SetHorsesStolenMax(50)
	SR_RQC_QST.SetItemsStolenMax(1000)
	SR_RQC_QST.SetTrespassesMax(100)
	SR_RQC_QST.SetJailEscapesMax(25)
	SR_RQC_QST.SetFinesPayedMax(20000)
	SR_RQC_QST.SetDaysJailedMax(150)
	SR_RQC_QST.SetThievesGuildQuestsMax(100)
	SR_RQC_QST.SetDarkBrotherhoodQuestsMax(50)
	SR_RQC_QST.SetCompanionsQuestsMax(100)
	SR_RQC_QST.SetCivilWarQuestsMax(10)
	SR_RQC_QST.SetBanditsKilledMax(1000)
	SR_RQC_QST.SetWizardKillerMax(150)
	SR_RQC_QST.SetWitchKillerMax(150)
	SR_RQC_QST.SetForswornKillerMax(250)
	SR_RQC_QST.SetMiscQuestsMax(200)
	SR_RQC_QST.SetBrawlsWonMax(25)
	SR_RQC_QST.SetPersuasionsMax(50)
	SR_RQC_QST.SetCollegeWinterholdQuestsMax(20)
	SR_RQC_QST.SetBribesMax(50)
	SR_RQC_QST.SetIntimidationsMax(50)
	SR_RQC_QST.SetZombieTimeMax(5000)
	SR_RQC_QST.SetBlackSoulTrapMax(100)
	SR_RQC_QST.SetSoulsTrappedMax(500)
	SR_RQC_QST.SetBooksReadMax(250)
	SR_RQC_QST.SetExtFameSmallMax(1000)
	SR_RQC_QST.SetExtFameMediumMax(500)
	SR_RQC_QST.SetExtFameLargeMax(100)
	SR_RQC_QST.SetExtDaedricSmallMax(1000)
	SR_RQC_QST.SetExtDaedricMediumMax(500)
	SR_RQC_QST.SetExtDaedricLargeMax(100)
	SR_RQC_QST.SetExtAedricSmallMax(1000)
	SR_RQC_QST.SetExtAedricMediumMax(500)
	SR_RQC_QST.SetExtAedricLargeMax(100)
	SR_RQC_QST.SetExtCrimeSmallMax(1000)
	SR_RQC_QST.SetExtCrimeMediumMax(500)
	SR_RQC_QST.SetExtCrimeLargeMax(100)
	SR_RQC_QST.SetExtLawSmallMax(1000)
	SR_RQC_QST.SetExtLawMediumMax(500)
	SR_RQC_QST.SetExtLawLargeMax(100)
	SR_RQC_QST.SetExtAmbitionSmallMax(1000)
	SR_RQC_QST.SetExtAmbitionMediumMax(500)
	SR_RQC_QST.SetExtAmbitionLargeMax(100)
	SR_RQC_QST.SetExtDependabilitySmallMax(1000)
	SR_RQC_QST.SetExtDependabilityMediumMax(500)
	SR_RQC_QST.SetExtDependabilityLargeMax(100)
	SR_RQC_QST.SetBigQuestFinishedResetDelayGameDays(30.0)
EndFunction

Function SetRQCMaxValuesTardy()
	SR_RQC_QST.SetQuestFameMax(114)
	SR_RQC_QST.SetQuestDaedricMax(100)
	SR_RQC_QST.SetQuestAedricMax(116)
	SR_RQC_QST.SetQuestCrimeMax(70)
	SR_RQC_QST.SetQuestLawMax(109)
	SR_RQC_QST.SetQuestDependabilityMax(188)
	SR_RQC_QST.SetQuestAmbitionMax(188)
	SR_RQC_QST.SetQuestsCompletedMax(300)
	SR_RQC_QST.SetLocationsMax(343)
	SR_RQC_QST.SetDungeonsMax(197)
	SR_RQC_QST.SetPeopleKillsMax(3000)
	SR_RQC_QST.SetStoreInvestmentsMax(30)
	SR_RQC_QST.SetHousesOwnedMax(10)
	SR_RQC_QST.SetDragonKillsMax(100)
	SR_RQC_QST.SetLycanthropyMax(100)
	SR_RQC_QST.SetVampirismMax(100)
	SR_RQC_QST.SetCannibalFeedMax(500)
	SR_RQC_QST.SetCharityMax(11)
	SR_RQC_QST.SetDaedraKilledMax(500)
	SR_RQC_QST.SetUndeadKilledMax(3000)
	SR_RQC_QST.SetSpottedAssaultsMax(500)
	SR_RQC_QST.SetSpottedMurdersMax(500)
	SR_RQC_QST.SetSpottedPettyCrimeMax(1000)
	SR_RQC_QST.SetMurdersMax(500)
	SR_RQC_QST.SetPocketsPickedMax(200)
	SR_RQC_QST.SetHorsesStolenMax(100)
	SR_RQC_QST.SetItemsStolenMax(5000)
	SR_RQC_QST.SetTrespassesMax(200)
	SR_RQC_QST.SetJailEscapesMax(100)
	SR_RQC_QST.SetDaysJailedMax(250)
	SR_RQC_QST.SetFinesPayedMax(30000)
	SR_RQC_QST.SetThievesGuildQuestsMax(200)
	SR_RQC_QST.SetDarkBrotherhoodQuestsMax(100)
	SR_RQC_QST.SetCompanionsQuestsMax(200)
	SR_RQC_QST.SetCivilWarQuestsMax(12)
	SR_RQC_QST.SetBanditsKilledMax(3000)
	SR_RQC_QST.SetWizardKillerMax(200)
	SR_RQC_QST.SetWitchKillerMax(200)
	SR_RQC_QST.SetForswornKillerMax(300)
	SR_RQC_QST.SetMiscQuestsMax(500)
	SR_RQC_QST.SetBrawlsWonMax(25)
	SR_RQC_QST.SetPersuasionsMax(100)
	SR_RQC_QST.SetCollegeWinterholdQuestsMax(20)
	SR_RQC_QST.SetBribesMax(100)
	SR_RQC_QST.SetIntimidationsMax(100)
	SR_RQC_QST.SetZombieTimeMax(1000)
	SR_RQC_QST.SetBlackSoulTrapMax(100)
	SR_RQC_QST.SetSoulsTrappedMax(1000)
	SR_RQC_QST.SetBooksReadMax(470)
	SR_RQC_QST.SetExtFameSmallMax(3000)
	SR_RQC_QST.SetExtFameMediumMax(1000)
	SR_RQC_QST.SetExtFameLargeMax(300)
	SR_RQC_QST.SetExtDaedricSmallMax(3000)
	SR_RQC_QST.SetExtDaedricMediumMax(1000)
	SR_RQC_QST.SetExtDaedricLargeMax(300)
	SR_RQC_QST.SetExtAedricSmallMax(3000)
	SR_RQC_QST.SetExtAedricMediumMax(1000)
	SR_RQC_QST.SetExtAedricLargeMax(300)
	SR_RQC_QST.SetExtCrimeSmallMax(3000)
	SR_RQC_QST.SetExtCrimeMediumMax(1000)
	SR_RQC_QST.SetExtCrimeLargeMax(300)
	SR_RQC_QST.SetExtLawSmallMax(3000)
	SR_RQC_QST.SetExtLawMediumMax(1000)
	SR_RQC_QST.SetExtLawLargeMax(300)
	SR_RQC_QST.SetExtAmbitionSmallMax(3000)
	SR_RQC_QST.SetExtAmbitionMediumMax(1000)
	SR_RQC_QST.SetExtAmbitionLargeMax(300)
	SR_RQC_QST.SetExtDependabilitySmallMax(3000)
	SR_RQC_QST.SetExtDependabilityMediumMax(1000)
	SR_RQC_QST.SetExtDependabilityLargeMax(300)
	SR_RQC_QST.SetBigQuestFinishedResetDelayGameDays(40.0)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; UNCAP FUNCTIONS FOR SR_RQC_QST FUNCTIONS' MAXIMUM VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function UncapRQCMaxValues()
	SR_RQC_QST.SetQuestsCompletedMax(273)
	SR_RQC_QST.SetLocationsMax(343)
	SR_RQC_QST.SetDungeonsMax(197)
	SR_RQC_QST.SetPeopleKillsMax(5000)
	SR_RQC_QST.SetStoreInvestmentsMax(30)
	SR_RQC_QST.SetDragonKillsMax(500)
	SR_RQC_QST.SetHousesOwnedMax(10)
	SR_RQC_QST.SetLycanthropyMax(500)
	SR_RQC_QST.SetVampirismMax(500)
	SR_RQC_QST.SetCannibalFeedMax(500)
	SR_RQC_QST.SetCharityMax(11)
	SR_RQC_QST.SetDaedraKilledMax(10000)
	SR_RQC_QST.SetUndeadKilledMax(10000)
	SR_RQC_QST.SetSpottedAssaultsMax(1000)
	SR_RQC_QST.SetSpottedMurdersMax(1000)
	SR_RQC_QST.SetSpottedPettyCrimeMax(1000)
	SR_RQC_QST.SetMurdersMax(10000)
	SR_RQC_QST.SetPocketsPickedMax(10000)
	SR_RQC_QST.SetHorsesStolenMax(1000)
	SR_RQC_QST.SetItemsStolenMax(20000)
	SR_RQC_QST.SetTrespassesMax(10000)
	SR_RQC_QST.SetJailEscapesMax(1000)
	SR_RQC_QST.SetDaysJailedMax(1000)
	SR_RQC_QST.SetFinesPayedMax(90000)
	SR_RQC_QST.SetThievesGuildQuestsMax(500)
	SR_RQC_QST.SetDarkBrotherhoodQuestsMax(500)
	SR_RQC_QST.SetCompanionsQuestsMax(500)
	SR_RQC_QST.SetCivilWarQuestsMax(13)
	SR_RQC_QST.SetBanditsKilledMax(10000)
	SR_RQC_QST.SetWizardKillerMax(1000)
	SR_RQC_QST.SetWitchKillerMax(1000)
	SR_RQC_QST.SetForswornKillerMax(5000)
	SR_RQC_QST.SetMiscQuestsMax(1000)
	SR_RQC_QST.SetBrawlsWonMax(500)
	SR_RQC_QST.SetPersuasionsMax(500)
	SR_RQC_QST.SetCollegeWinterholdQuestsMax(500)
	SR_RQC_QST.SetBribesMax(500)
	SR_RQC_QST.SetIntimidationsMax(500)
	SR_RQC_QST.SetZombieTimeMax(500)
	SR_RQC_QST.SetSoulsTrappedMax(10000)
	SR_RQC_QST.SetBlackSoulTrapMax(1000)
	SR_RQC_QST.SetBooksReadMax(470)
	SR_RQC_QST.SetExtFameSmallMax(10000)
	SR_RQC_QST.SetExtFameMediumMax(5000)
	SR_RQC_QST.SetExtFameLargeMax(1000)
	SR_RQC_QST.SetExtDaedricSmallMax(10000)
	SR_RQC_QST.SetExtDaedricMediumMax(5000)
	SR_RQC_QST.SetExtDaedricLargeMax(1000)
	SR_RQC_QST.SetExtAedricSmallMax(10000)
	SR_RQC_QST.SetExtAedricMediumMax(5000)
	SR_RQC_QST.SetExtAedricLargeMax(1000)
	SR_RQC_QST.SetExtCrimeSmallMax(10000)
	SR_RQC_QST.SetExtCrimeMediumMax(5000)
	SR_RQC_QST.SetExtCrimeLargeMax(1000)
	SR_RQC_QST.SetExtLawSmallMax(10000)
	SR_RQC_QST.SetExtLawMediumMax(5000)
	SR_RQC_QST.SetExtLawLargeMax(1000)
	SR_RQC_QST.SetExtAmbitionSmallMax(10000)
	SR_RQC_QST.SetExtAmbitionMediumMax(5000)
	SR_RQC_QST.SetExtAmbitionLargeMax(1000)
	SR_RQC_QST.SetExtDependabilitySmallMax(10000)
	SR_RQC_QST.SetExtDependabilityMediumMax(5000)
	SR_RQC_QST.SetExtDependabilityLargeMax(1000)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SET FUNCTIONS FOR TRACKED-VALUE'S COUNTER BALANCE VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetCounterBalanceValuesAll(float Percent); Percent of Value to add to counter-balance, resets counter-balance if 0
	SR_RQC_QST.SetQuestFame_CounterBalance(Percent)
	SR_RQC_QST.SetQuestDaedric_CounterBalance(Percent)
	SR_RQC_QST.SetQuestAedric_CounterBalance(Percent)
	SR_RQC_QST.SetQuestCrime_CounterBalance(Percent)
	SR_RQC_QST.SetQuestLaw_CounterBalance(Percent)
	SR_RQC_QST.SetQuestDependability_CounterBalance(Percent)
	SR_RQC_QST.SetQuestAmbition_CounterBalance(Percent)
	SR_RQC_QST.SetQuestsCompleted_CounterBalance(Percent)
	SR_RQC_QST.SetLocations_CounterBalance(Percent)
	SR_RQC_QST.SetDungeons_CounterBalance(Percent)
	SR_RQC_QST.SetPeopleKills_CounterBalance(Percent)
	SR_RQC_QST.SetStoreInvestments_CounterBalance(Percent)
	SR_RQC_QST.SetHousesOwned_CounterBalance(Percent)
	SR_RQC_QST.SetDragonsKilled_CounterBalance(Percent)
	SR_RQC_QST.SetDragonPriestsKilled_CounterBalance(Percent)
	SR_RQC_QST.SetNecksBitten_CounterBalance(Percent)
	SR_RQC_QST.SetVampiricSpellSeen_CounterBalance(Percent)
	SR_RQC_QST.SetVampireLordTransformations_CounterBalance(Percent)
	SR_RQC_QST.SetVampireLordSeen_CounterBalance(Percent)
	SR_RQC_QST.SetVampireComments_CounterBalance(Percent)
	SR_RQC_QST.SetVampireGuardComments_CounterBalance(Percent)
	SR_RQC_QST.SetWerewolfMauls_CounterBalance(Percent)
	SR_RQC_QST.SetWerewolfTransformations_CounterBalance(Percent)
	SR_RQC_QST.SetWerewolfFeeds_CounterBalance(Percent)
	SR_RQC_QST.SetWerewolfSeen_CounterBalance(Percent)
	SR_RQC_QST.SetWerewolfComments_CounterBalance(Percent)
	SR_RQC_QST.SetWerewolfGuardComments_CounterBalance(Percent)
	SR_RQC_QST.SetPettyCrimeSeen_CounterBalance(Percent)
	SR_RQC_QST.SetAssaultsSeen_CounterBalance(Percent)
	SR_RQC_QST.SetMurdersSeen_CounterBalance(Percent)
	SR_RQC_QST.SetMurders_CounterBalance(Percent)
	SR_RQC_QST.SetPocketsPicked_CounterBalance(Percent)
	SR_RQC_QST.SetHorsesStolen_CounterBalance(Percent)
	SR_RQC_QST.SetItemsStolen_CounterBalance(Percent)
	SR_RQC_QST.SetTrespasses_CounterBalance(Percent)
	SR_RQC_QST.SetJailEscapes_CounterBalance(Percent)
	SR_RQC_QST.SetDaysJailed_CounterBalance(Percent)
	SR_RQC_QST.SetFinesPayed_CounterBalance(Percent)
	SR_RQC_QST.SetThievesGuildMisc_CounterBalance(Percent)
	SR_RQC_QST.SetDarkBrotherhoodMisc_CounterBalance(Percent)
	SR_RQC_QST.SetCompanionsMisc_CounterBalance(Percent)
	SR_RQC_QST.SetCollegeMisc_CounterBalance(Percent)
	SR_RQC_QST.SetBrawls_CounterBalance(Percent)
	SR_RQC_QST.SetMiscQuests_CounterBalance(Percent)
	SR_RQC_QST.SetCivilWar_CounterBalance(Percent)
	SR_RQC_QST.SetPersuasions_CounterBalance(Percent)
	SR_RQC_QST.SetIntimidations_CounterBalance(Percent)
	SR_RQC_QST.SetBribes_CounterBalance(Percent)
	SR_RQC_QST.SetBooksRead_CounterBalance(Percent)
	SR_RQC_QST.SetKillsUndead_CounterBalance(Percent)
	SR_RQC_QST.SetKillsDaedra_CounterBalance(Percent)
	SR_RQC_QST.SetKillsBandits_CounterBalance(Percent)
	SR_RQC_QST.SetKillsWizards_CounterBalance(Percent)
	SR_RQC_QST.SetKillsWitches_CounterBalance(Percent)
	SR_RQC_QST.SetKillsForsworn_CounterBalance(Percent)
	SR_RQC_QST.SetSoulsTrapped_CounterBalance(Percent)
	SR_RQC_QST.SetBlackSoulTraps_CounterBalance(Percent)
	SR_RQC_QST.SetNecromancy_CounterBalance(Percent)
	SR_RQC_QST.SetCannibalFeed_CounterBalance(Percent)
	SR_RQC_QST.SetCharityAdded_CounterBalance(Percent)
	SR_RQC_QST.SetExtFameSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtFameMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtFameLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtDaedricSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtDaedricMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtDaedricLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtAedricSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtAedricMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtAedricLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtCrimeSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtCrimeMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtCrimeLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtLawSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtLawMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtLawLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtAmbitionSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtAmbitionMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtAmbitionLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtDependabilitySmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtDependabilityMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtDependabilityLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtVampirismSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtVampirismLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtLycanthropySmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtLycanthropyLarge_CounterBalance(Percent)
EndFunction

Function SetCounterBalanceValuesModAdded(float Percent); Percent of Value to add to counter-balance, resets counter-balance if 0
	SR_RQC_QST.SetExtFameSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtFameMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtFameLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtDaedricSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtDaedricMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtDaedricLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtAedricSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtAedricMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtAedricLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtCrimeSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtCrimeMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtCrimeLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtLawSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtLawMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtLawLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtAmbitionSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtAmbitionMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtAmbitionLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtDependabilitySmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtDependabilityMedium_CounterBalance(Percent)
	SR_RQC_QST.SetExtDependabilityLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtVampirismSmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtVampirismLarge_CounterBalance(Percent)
	SR_RQC_QST.SetExtLycanthropySmall_CounterBalance(Percent)
	SR_RQC_QST.SetExtLycanthropyLarge_CounterBalance(Percent)
EndFunction

Function SetCounterBalanceValuesCrimeStat(float Percent); Percent of Value to add to counter-balance, resets counter-balance if 0
	SR_RQC_QST.SetMurders_CounterBalance(Percent)
	SR_RQC_QST.SetPocketsPicked_CounterBalance(Percent)
	SR_RQC_QST.SetHorsesStolen_CounterBalance(Percent)
	SR_RQC_QST.SetItemsStolen_CounterBalance(Percent)
	SR_RQC_QST.SetTrespasses_CounterBalance(Percent)
	SR_RQC_QST.SetJailEscapes_CounterBalance(Percent)
	SR_RQC_QST.SetDaysJailed_CounterBalance(Percent)
	SR_RQC_QST.SetFinesPayed_CounterBalance(Percent)
	SR_RQC_QST.SetThievesGuildMisc_CounterBalance(Percent)
	SR_RQC_QST.SetDarkBrotherhoodMisc_CounterBalance(Percent)
EndFunction

Function SetCounterBalanceValuesMageStat(float Percent); Percent of Value to add to counter-balance, resets counter-balance if 0
	SR_RQC_QST.SetCollegeMisc_CounterBalance(Percent)
	SR_RQC_QST.SetBooksRead_CounterBalance(Percent)
	SR_RQC_QST.SetSoulsTrapped_CounterBalance(Percent)
	SR_RQC_QST.SetBlackSoulTraps_CounterBalance(Percent)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LOAD AND SAVE FUNCTIONS FOR FISS - FILE ACCESS INTERFACE FOR SKYRIM SCRIPTS PLUGIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function BeginLoadPreset()
	if !ShowMessage("Loading this preset will overwrite the current settings.", true, "Load", "Cancel")
		return
	endif
	If !ShowMessage("Please do not leave the MCM menu until the load is showns as complete.", true, "Begin Load", "Cancel")
		Return
	EndIf

	FISSInterface fiss = FISSFactory.getFISS()
	If (!fiss)
		Debug.MessageBox("FISS not installed. Loading disabled.")
		return
	EndIf

	fiss.beginLoad("SkyrimReputationPresets.xml")
	SR_MCM_Reputation_Message.SetValue(fiss.loadInt("Reputation_Message"))
	SR_MCM_DaedricAuras_Vampire.SetValue(fiss.loadInt("DaedricAuras_Vampire"))
	SR_MCM_DaedricAuras_Werewolf.SetValue(fiss.loadInt("DaedricAuras_Werewolf"))
	SR_MCM_WiComment_Feared_Infamy.SetValue(fiss.loadInt("WiComment_Feared_Infamy"))
	SR_MCM_Perks_Allure.SetValue(fiss.loadInt("Perks_Allure"))
	SR_MCM_Perks_Fence.SetValue(fiss.loadInt("Perks_Fence"))
	SR_MCM_Perks_Intimidate.SetValue(fiss.loadInt("Perks_Intimidate"))
	SR_MCM_Perks_PriceChanges.SetValue(fiss.loadInt("Perks_PriceChanges"))
	SR_MCM_Factions_Companions.SetValue(fiss.loadInt("Factions_Companions"))
	SR_MCM_Factions_DarkBrotherhood.SetValue(fiss.loadInt("Factions_DarkBrotherhood"))
	SR_MCM_Factions_Dawnguard.SetValue(fiss.loadInt("Factions_Dawnguard"))
	SR_MCM_Factions_Forsworn.SetValue(fiss.loadInt("Factions_Forsworn"))
	SR_MCM_Factions_MageGuild.SetValue(fiss.loadInt("Factions_MageGuild"))
	SR_MCM_Factions_Thalmor.SetValue(fiss.loadInt("Factions_Thalmor")) 
	SR_MCM_Factions_ThievesGuild.SetValue(fiss.loadInt("Factions_ThievesGuild"))
	SR_MCM_Factions_VigilOfStendarr.SetValue(fiss.loadInt("Factions_VigilOfStendarr"))
	SR_MCM_Factions_CourierNotes.SetValue(fiss.loadInt("Factions_CourierNotes"))
	SR_MCM_WiComment_Unknown.SetValue(fiss.loadInt("WiComment_Unknown"))
	SR_MCM_WiComment_Bad.SetValue(fiss.loadInt("WiComment_Bad"))
	SR_MCM_WiComment_Good.SetValue(fiss.loadInt("WiComment_Good"))
	SR_MCM_WiComment_Feared.SetValue(fiss.loadInt("WiComment_Feared"))
	SR_MCM_WiComment_Child.SetValue(fiss.loadInt("WiComment_Child"))
	SR_MCM_WiComment_Thane.SetValue(fiss.loadInt("WiComment_Thane"))
	SR_MCM_WiComment_VampireWerewolf.SetValue(fiss.loadInt("WiComment_VampireWerewolf"))
	SR_MCM_WiComment_Guards.SetValue(fiss.loadInt("WiComment_Guards"))
	SR_MCM_WiComment_Feared_AiPackage.SetValue(fiss.loadInt("WiComment_Feared_AiPackage"))
	SR_MCM_WiComment_VampireWerewolf_Hostile.SetValue(fiss.loadInt("WiComment_VampireWerewolf_Hostile"))
	SR_MCM_Override_Locations.SetValue(fiss.loadInt("Override_Locations"))
	SR_MCM_Override_Dungeons.SetValue(fiss.loadInt("Override_Dungeons"))
	SR_MCM_Override_PeopleKills.SetValue(fiss.loadInt("Override_PeopleKills"))
	SR_MCM_Override_StoreInvestments.SetValue(fiss.loadInt("Override_StoreInvestments"))
	SR_MCM_Override_HousesOwned.SetValue(fiss.loadInt("Override_HousesOwned"))
	SR_MCM_Override_DragonsKilled.SetValue(fiss.loadInt("Override_DragonsKilled"))
	SR_MCM_Override_DragonPriestsKilled.SetValue(fiss.loadInt("Override_DragonPriestsKilled"))
	SR_MCM_Override_NecksBitten.SetValue(fiss.loadInt("Override_NecksBitten"))
	SR_MCM_Override_VampiricSpellSeen.SetValue(fiss.loadInt("Override_VampiricSpellSeen"))
	SR_MCM_Override_VampireLordTransformations.SetValue(fiss.loadInt("Override_VampireLordTransformations"))
	SR_MCM_Override_VampireLordSeen.SetValue(fiss.loadInt("Override_VampireLordSeen"))
	SR_MCM_Override_VampireComments.SetValue(fiss.loadInt("Override_VampireComments"))
	SR_MCM_Override_WerewolfMauls.SetValue(fiss.loadInt("Override_WerewolfMauls"))
	SR_MCM_Override_WerewolfTransformations.SetValue(fiss.loadInt("Override_WerewolfTransformations"))
	SR_MCM_Override_WerewolfFeeds.SetValue(fiss.loadInt("Override_WerewolfFeeds"))
	SR_MCM_Override_WerewolfSeen.SetValue(fiss.loadInt("Override_WerewolfSeen"))
	SR_MCM_Override_WerewolfComments.SetValue(fiss.loadInt("Override_WerewolfComments"))
	SR_MCM_Override_WerewolfVampireTimeDecreament.SetValue(fiss.loadInt("Override_WerewolfVampireTimeDecreament"))
	SR_MCM_Override_SeenCrimeTimeDecreament.SetValue(fiss.loadInt("Override_SeenCrimeTimeDecreament"))
	SR_MCM_Override_PettyCrimeSeen.SetValue(fiss.loadInt("Override_PettyCrimeSeen"))
	SR_MCM_Override_AssaultsSeen.SetValue(fiss.loadInt("Override_AssaultsSeen"))
	SR_MCM_Override_MurdersSeen.SetValue(fiss.loadInt("Override_MurdersSeen"))
	SR_MCM_Override_Murders.SetValue(fiss.loadInt("Override_Murders"))
	SR_MCM_Override_PocketsPicked.SetValue(fiss.loadInt("Override_PocketsPicked"))
	SR_MCM_Override_HorsesStolen.SetValue(fiss.loadInt("Override_HorsesStolen"))
	SR_MCM_Override_ItemsStolen.SetValue(fiss.loadInt("Override_ItemsStolen"))
	SR_MCM_Override_Trespasses.SetValue(fiss.loadInt("Override_Trespasses"))
	SR_MCM_Override_JailEscapes.SetValue(fiss.loadInt("Override_JailEscapes"))
	SR_MCM_Override_DaysJailed.SetValue(fiss.loadInt("Override_DaysJailed"))
	SR_MCM_Override_FinesPayed.SetValue(fiss.loadInt("Override_FinesPayed"))
	SR_MCM_Override_ThievesGuildMisc.SetValue(fiss.loadInt("Override_ThievesGuildMisc"))
	SR_MCM_Override_DarkBrotherhoodMisc.SetValue(fiss.loadInt("Override_DarkBrotherhoodMisc"))
	SR_MCM_Override_CompanionsMisc.SetValue(fiss.loadInt("Override_CompanionsMisc"))
	SR_MCM_Override_CollegeMisc.SetValue(fiss.loadInt("Override_CollegeMisc"))
	SR_MCM_Override_Brawls.SetValue(fiss.loadInt("Override_Brawls"))
	SR_MCM_Override_MiscQuests.SetValue(fiss.loadInt("Override_MiscQuests"))
	SR_MCM_Override_CivilWar.SetValue(fiss.loadInt("Override_CivilWar"))
	SR_MCM_Override_WarriorSkill.SetValue(fiss.loadInt("Override_WarriorSkill"))
	SR_MCM_Override_Persuasions.SetValue(fiss.loadInt("Override_Persuasions"))
	SR_MCM_Override_Intimidations.SetValue(fiss.loadInt("Override_Intimidations"))
	SR_MCM_Override_Bribes.SetValue(fiss.loadInt("Override_Bribes"))
	SR_MCM_Override_BooksRead.SetValue(fiss.loadInt("Override_BooksRead"))
	SR_MCM_Override_KillsUndead.SetValue(fiss.loadInt("Override_KillsUndead"))
	SR_MCM_Override_KillsDaedra.SetValue(fiss.loadInt("Override_KillsDaedra"))
	SR_MCM_Override_KillsBandits.SetValue(fiss.loadInt("Override_KillsBandits"))
	SR_MCM_Override_KillsWizards.SetValue(fiss.loadInt("Override_KillsWizards"))
	SR_MCM_Override_KillsWitches.SetValue(fiss.loadInt("Override_KillsWitches"))
	SR_MCM_Override_KillsForsworn.SetValue(fiss.loadInt("Override_KillsForsworn"))
	SR_MCM_Override_SoulsTrapped.SetValue(fiss.loadInt("Override_SoulsTrapped"))
	SR_MCM_Override_BlackSoulTraps.SetValue(fiss.loadInt("Override_BlackSoulTraps"))
	SR_MCM_Override_Necromancy.SetValue(fiss.loadInt("Override_Necromancy"))
	SR_MCM_Override_SeenNecroTimeDecreament.SetValue(fiss.loadInt("Override_SeenNecroTimeDecreament"))
	SR_MCM_Override_ArcaneMastery.SetValue(fiss.loadInt("Override_ArcaneMastery"))
	SR_MCM_Override_RestorationMagic.SetValue(fiss.loadInt("Override_RestorationMagic"))
	SR_MCM_Override_ConjugationMagic.SetValue(fiss.loadInt("Override_ConjugationMagic"))
	SR_MCM_Override_CannibalFeed.SetValue(fiss.loadInt("Override_CannibalFeed"))
	SR_MCM_Override_CharityAdded.SetValue(fiss.loadInt("Override_CharityAdded"))
	_curFameDifficulty = fiss.loadInt("FameDifficulty")
	_curVampWereDifficulty = fiss.loadInt("VampWereDifficulty")
	bOverrideMaxValueCap = fiss.loadBool("OverrideMaxValueCap")
	bEnableCheats = fiss.loadBool("EnableCheats")
	CheatsEnabled = fiss.loadInt("ManualControls")
	
	; FISS always uses 0 as a default value so leaving this commented out for compatability with existing presets
;	SRTFameMult.SetValue(fiss.loadFloat("SRTFameMult"))
;	SRTAedricMult.SetValue(fiss.loadFloat("SRTAedricMult"))
;	SRTDaedricMult.SetValue(fiss.loadFloat("SRTDaedricMult"))
;	SRTDependabilityMult.SetValue(fiss.loadFloat("SRTDependabilityMult"))
;	SRTAmbitionMult.SetValue(fiss.loadFloat("SRTAmbitionMult"))
;	SRTLawMult.SetValue(fiss.loadFloat("SRTLawMult"))
;	SRTCrimeMult.SetValue(fiss.loadFloat("SRTCrimeMult"))
;	SRTVampireMult.SetValue(fiss.loadFloat("SRTVampireMult"))
;	SRTWerewolfMult.SetValue(fiss.loadFloat("SRTWerewolfMult"))
	
;	SRTLoadScreens.SetValue(fiss.loadFloat("SRTLoadScreens"))
	
	string loadResult = fiss.endLoad()	; check the result
	If (loadResult != "")
		ShowMessage("Error reading preset file.")
	Else
		ShowMessage("Skyrim Reputation Preset loaded successfully", false, "Okay")
	EndIf
	ResetQuestForToggleGlobals()
	SetOverrideMaxValueCap()
	SetcurFameDifficulty()
	SetcurVampWereDifficulty()
EndFunction

Function BeginSavePreset()
	if !ShowMessage("This will overwrite the existing preset with your current settings.", true, "Save", "Cancel")
		return
	endif
	if !ShowMessage("Please do not leave the MCM menu until the save is showns as complete.", true, "Begin Save", "Cancel")
		return
	endif

	FISSInterface fiss = FISSFactory.getFISS()
	If (!fiss)
		Debug.MessageBox("FISS not installed. Saving disabled.")
		return
	EndIf

	fiss.beginSave("SkyrimReputationPresets.xml", "SkyrimReputation")

	fiss.saveInt("Reputation_Message", SR_MCM_Reputation_Message.GetValue() as int)
	fiss.saveInt("DaedricAuras_Vampire", SR_MCM_DaedricAuras_Vampire.GetValue() as int)
	fiss.saveInt("DaedricAuras_Werewolf", SR_MCM_DaedricAuras_Werewolf.GetValue() as int)
	fiss.saveInt("WiComment_Feared_Infamy", SR_MCM_WiComment_Feared_Infamy.GetValue() as int)
	fiss.saveInt("Perks_Allure", SR_MCM_Perks_Allure.GetValue() as int)
	fiss.saveInt("Perks_Fence", SR_MCM_Perks_Fence.GetValue() as int)
	fiss.saveInt("Perks_Intimidate", SR_MCM_Perks_Intimidate.GetValue() as int)
	fiss.saveInt("Perks_PriceChanges", SR_MCM_Perks_PriceChanges.GetValue() as int)
	fiss.saveInt("Factions_Companions", SR_MCM_Factions_Companions.GetValue() as int)
	fiss.saveInt("Factions_DarkBrotherhood", SR_MCM_Factions_DarkBrotherhood.GetValue() as int)
	fiss.saveInt("Factions_Dawnguard", SR_MCM_Factions_Dawnguard.GetValue() as int)
	fiss.saveInt("Factions_Forsworn", SR_MCM_Factions_Forsworn.GetValue() as int)
	fiss.saveInt("Factions_MageGuild", SR_MCM_Factions_MageGuild.GetValue() as int)
	fiss.saveInt("Factions_Thalmor", SR_MCM_Factions_Thalmor.GetValue() as int) 
	fiss.saveInt("Factions_ThievesGuild", SR_MCM_Factions_ThievesGuild.GetValue() as int)
	fiss.saveInt("Factions_VigilOfStendarr", SR_MCM_Factions_VigilOfStendarr.GetValue() as int)
	fiss.saveInt("Factions_CourierNotes", SR_MCM_Factions_CourierNotes.GetValue() as int)
	fiss.saveInt("WiComment_Unknown", SR_MCM_WiComment_Unknown.GetValue() as int)
	fiss.saveInt("WiComment_Bad", SR_MCM_WiComment_Bad.GetValue() as int)
	fiss.saveInt("WiComment_Good", SR_MCM_WiComment_Good.GetValue() as int)
	fiss.saveInt("WiComment_Feared", SR_MCM_WiComment_Feared.GetValue() as int)
	fiss.saveInt("WiComment_Child", SR_MCM_WiComment_Child.GetValue() as int)
	fiss.saveInt("WiComment_Thane", SR_MCM_WiComment_Thane.GetValue() as int)
	fiss.saveInt("WiComment_VampireWerewolf", SR_MCM_WiComment_VampireWerewolf.GetValue() as int)
	fiss.saveInt("WiComment_Guards", SR_MCM_WiComment_Guards.GetValue() as int)
	fiss.saveInt("WiComment_Feared_AiPackage", SR_MCM_WiComment_Feared_AiPackage.GetValue() as int)
	fiss.saveInt("WiComment_VampireWerewolf_Hostile", SR_MCM_WiComment_VampireWerewolf_Hostile.GetValue() as int)
	fiss.saveInt("Override_Locations", SR_MCM_Override_Locations.GetValue() as int)
	fiss.saveInt("Override_Dungeons", SR_MCM_Override_Dungeons.GetValue() as int)
	fiss.saveInt("Override_PeopleKills", SR_MCM_Override_PeopleKills.GetValue() as int)
	fiss.saveInt("Override_StoreInvestments", SR_MCM_Override_StoreInvestments.GetValue() as int)
	fiss.saveInt("Override_HousesOwned", SR_MCM_Override_HousesOwned.GetValue() as int)
	fiss.saveInt("Override_DragonsKilled", SR_MCM_Override_DragonsKilled.GetValue() as int)
	fiss.saveInt("Override_DragonPriestsKilled", SR_MCM_Override_DragonPriestsKilled.GetValue() as int)
	fiss.saveInt("Override_NecksBitten", SR_MCM_Override_NecksBitten.GetValue() as int)
	fiss.saveInt("Override_VampiricSpellSeen", SR_MCM_Override_VampiricSpellSeen.GetValue() as int)
	fiss.saveInt("Override_VampireLordTransformations", SR_MCM_Override_VampireLordTransformations.GetValue() as int)
	fiss.saveInt("Override_VampireLordSeen", SR_MCM_Override_VampireLordSeen.GetValue() as int)
	fiss.saveInt("Override_VampireComments", SR_MCM_Override_VampireComments.GetValue() as int)
	fiss.saveInt("Override_WerewolfMauls", SR_MCM_Override_WerewolfMauls.GetValue() as int)
	fiss.saveInt("Override_WerewolfTransformations", SR_MCM_Override_WerewolfTransformations.GetValue() as int)
	fiss.saveInt("Override_WerewolfFeeds", SR_MCM_Override_WerewolfFeeds.GetValue() as int)
	fiss.saveInt("Override_WerewolfSeen", SR_MCM_Override_WerewolfSeen.GetValue() as int)
	fiss.saveInt("Override_WerewolfComments", SR_MCM_Override_WerewolfComments.GetValue() as int)
	fiss.saveInt("Override_WerewolfVampireTimeDecreament", SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() as int)
	fiss.saveInt("Override_SeenCrimeTimeDecreament", SR_MCM_Override_SeenCrimeTimeDecreament.GetValue() as int)
	fiss.saveInt("Override_PettyCrimeSeen", SR_MCM_Override_PettyCrimeSeen.GetValue() as int)
	fiss.saveInt("Override_AssaultsSeen", SR_MCM_Override_AssaultsSeen.GetValue() as int)
	fiss.saveInt("Override_MurdersSeen", SR_MCM_Override_MurdersSeen.GetValue() as int)
	fiss.saveInt("Override_Murders", SR_MCM_Override_Murders.GetValue() as int)
	fiss.saveInt("Override_PocketsPicked", SR_MCM_Override_PocketsPicked.GetValue() as int)
	fiss.saveInt("Override_HorsesStolen", SR_MCM_Override_HorsesStolen.GetValue() as int)
	fiss.saveInt("Override_ItemsStolen", SR_MCM_Override_ItemsStolen.GetValue() as int)
	fiss.saveInt("Override_Trespasses", SR_MCM_Override_Trespasses.GetValue() as int)
	fiss.saveInt("Override_JailEscapes", SR_MCM_Override_JailEscapes.GetValue() as int)
	fiss.saveInt("Override_DaysJailed", SR_MCM_Override_DaysJailed.GetValue() as int)
	fiss.saveInt("Override_FinesPayed", SR_MCM_Override_FinesPayed.GetValue() as int)
	fiss.saveInt("Override_ThievesGuildMisc", SR_MCM_Override_ThievesGuildMisc.GetValue() as int)
	fiss.saveInt("Override_DarkBrotherhoodMisc", SR_MCM_Override_DarkBrotherhoodMisc.GetValue() as int)
	fiss.saveInt("Override_CompanionsMisc", SR_MCM_Override_CompanionsMisc.GetValue() as int)
	fiss.saveInt("Override_CollegeMisc", SR_MCM_Override_CollegeMisc.GetValue() as int)
	fiss.saveInt("Override_Brawls", SR_MCM_Override_Brawls.GetValue() as int)
	fiss.saveInt("Override_MiscQuests", SR_MCM_Override_MiscQuests.GetValue() as int)
	fiss.saveInt("Override_CivilWar", SR_MCM_Override_CivilWar.GetValue() as int)
	fiss.saveInt("Override_WarriorSkill", SR_MCM_Override_WarriorSkill.GetValue() as int)
	fiss.saveInt("Override_Persuasions", SR_MCM_Override_Persuasions.GetValue() as int)
	fiss.saveInt("Override_Intimidations", SR_MCM_Override_Intimidations.GetValue() as int)
	fiss.saveInt("Override_Bribes", SR_MCM_Override_Bribes.GetValue() as int)
	fiss.saveInt("Override_BooksRead", SR_MCM_Override_BooksRead.GetValue() as int)
	fiss.saveInt("Override_KillsUndead", SR_MCM_Override_KillsUndead.GetValue() as int)
	fiss.saveInt("Override_KillsDaedra", SR_MCM_Override_KillsDaedra.GetValue() as int)
	fiss.saveInt("Override_KillsBandits", SR_MCM_Override_KillsBandits.GetValue() as int)
	fiss.saveInt("Override_KillsWizards", SR_MCM_Override_KillsWizards.GetValue() as int)
	fiss.saveInt("Override_KillsWitches", SR_MCM_Override_KillsWitches.GetValue() as int)
	fiss.saveInt("Override_KillsForsworn", SR_MCM_Override_KillsForsworn.GetValue() as int)
	fiss.saveInt("Override_SoulsTrapped", SR_MCM_Override_SoulsTrapped.GetValue() as int)
	fiss.saveInt("Override_BlackSoulTraps", SR_MCM_Override_BlackSoulTraps.GetValue() as int)
	fiss.saveInt("Override_Necromancy", SR_MCM_Override_Necromancy.GetValue() as int)
	fiss.saveInt("Override_SeenNecroTimeDecreament", SR_MCM_Override_SeenNecroTimeDecreament.GetValue() as int)
	fiss.saveInt("Override_ArcaneMastery", SR_MCM_Override_ArcaneMastery.GetValue() as int)
	fiss.saveInt("Override_RestorationMagic", SR_MCM_Override_RestorationMagic.GetValue() as int)
	fiss.saveInt("Override_ConjugationMagic", SR_MCM_Override_ConjugationMagic.GetValue() as int)
	fiss.saveInt("Override_CannibalFeed", SR_MCM_Override_CannibalFeed.GetValue() as int)
	fiss.saveInt("Override_CharityAdded", SR_MCM_Override_CharityAdded.GetValue() as int)
	fiss.saveInt("FameDifficulty", _curFameDifficulty)
	fiss.saveInt("VampWereDifficulty", _curVampWereDifficulty)
	fiss.saveBool("OverrideMaxValueCap", bOverrideMaxValueCap)
	fiss.saveBool("EnableCheats", bEnableCheats)
	fiss.saveInt("ManualControls", CheatsEnabled)
	
	fiss.saveFloat("SRTFameMult", SRTFameMult.GetValue())
	fiss.saveFloat("SRTAedricMult", SRTAedricMult.GetValue())
	fiss.saveFloat("SRTDaedricMult", SRTDaedricMult.GetValue())
	fiss.saveFloat("SRTDependabilityMult", SRTDependabilityMult.GetValue())
	fiss.saveFloat("SRTAmbitionMult", SRTAmbitionMult.GetValue())
	fiss.saveFloat("SRTLawMult", SRTLawMult.GetValue())
	fiss.saveFloat("SRTCrimeMult", SRTCrimeMult.GetValue())
	fiss.saveFloat("SRTVampireMult", SRTVampireMult.GetValue())
	fiss.saveFloat("SRTWerewolfMult", SRTWerewolfMult.GetValue())

	fiss.saveFloat("SRTLoadScreens", SRTLoadScreens.GetValue())
	
	string saveResult = fiss.endSave()	
	; check the result
	If (saveResult != "")
		ShowMessage("Error saving preset file.")
	Else
		ShowMessage("Skyrim Reputation settings saved successfully", false, "Okay")
	EndIf
EndFunction

Function ResetQuestForToggleGlobals()	
	If(SR_MCM_DaedricAuras_Vampire.GetValue() == 0)
		if(SR_Factions_Response_VampireAura.IsRunning() == true)
			SR_Factions_Response_VampireAura.Stop()
		endif
		EndIf
	If(SR_MCM_Factions_Companions.GetValue() == 0)
		CompBanGoldTotal.SetValue(2000)
		if (SR_Companions_JoinOverride.IsRunning())
			SR_Companions_JoinOverride.Stop()
		endif
		if (SR_Companions_Reparations.IsRunning())
			SR_Companions_Reparations.Stop()
		endif
		EndIf
	If(SR_MCM_Factions_Dawnguard.GetValue() == 0)
		SR_Factions_Response_DaedraWorshipperReset.ResetDawnguardPlayerEnemyFactions()
		endif
	If(SR_MCM_Factions_Forsworn.GetValue() == 0)
		if (SR_Factions_Response_Forsworn.IsRunning())
		SR_Factions_Response_Forsworn.Stop()
		endif
		EndIf
	If(SR_MCM_Factions_Thalmor.GetValue() == 0) 
		SR_Factions_Response_Thalmor.ResetThalmorEnemyFactions()
		endif
	If(SR_MCM_Factions_VigilOfStendarr.GetValue() == 0)
		SR_Factions_Response_DaedraWorshipperReset.ResetVigilPlayerEnemyFactions()
		endif
EndFunction

Function SetOverrideMaxValueCap()
	if(bOverrideMaxValueCap == False)
		UncapRQCMaxValues()
	else
		if(_curFameDifficulty == 0);Fast
			SetRQCMaxValuesSensitive()
		elseif(_curFameDifficulty == 1);Regular
			SetRQCMaxValuesRegular()
		elseif(_curFameDifficulty == 2);Slow
			SetRQCMaxValuesTardy()
		endif
	endif
EndFunction

Function SetcurFameDifficulty()
	if(bOverrideMaxValueCap == False)
		if(_curFameDifficulty == 0);Fast
			SR_RQC_QST.SetFameThresholdOne(2)
			SR_RQC_QST.SetFameThresholdTwo(7)
			SR_RQC_QST.SetFameThresholdThree(15)
			SR_RQC_QST.SetFameThresholdFour(30)
			SetRQCDenominatorsSensitive()
		elseif(_curFameDifficulty == 1);Regular
			SR_RQC_QST.SetFameThresholdOne(4)
			SR_RQC_QST.SetFameThresholdTwo(12)
			SR_RQC_QST.SetFameThresholdThree(25)
			SR_RQC_QST.SetFameThresholdFour(50)
			SetRQCDenominatorsRegular()
		elseif(_curFameDifficulty == 2);Slow
			SR_RQC_QST.SetFameThresholdOne(6)
			SR_RQC_QST.SetFameThresholdTwo(17)
			SR_RQC_QST.SetFameThresholdThree(35)
			SR_RQC_QST.SetFameThresholdFour(70)
			SetRQCDenominatorsTardy()
		endif		
	elseif(bOverrideMaxValueCap == True)
		if(_curFameDifficulty == 0);Fast
			SR_RQC_QST.SetFameThresholdOne(2)
			SR_RQC_QST.SetFameThresholdTwo(7)
			SR_RQC_QST.SetFameThresholdThree(15)
			SR_RQC_QST.SetFameThresholdFour(30)
			SetRQCDenominatorsSensitive()
			SetRQCMaxValuesSensitive()
		elseif(_curFameDifficulty == 1);Regular
			SR_RQC_QST.SetFameThresholdOne(4)
			SR_RQC_QST.SetFameThresholdTwo(12)
			SR_RQC_QST.SetFameThresholdThree(25)
			SR_RQC_QST.SetFameThresholdFour(50)
			SetRQCDenominatorsRegular()
			SetRQCMaxValuesRegular()
		elseif(_curFameDifficulty == 2);Slow
			SR_RQC_QST.SetFameThresholdOne(6)
			SR_RQC_QST.SetFameThresholdTwo(17)
			SR_RQC_QST.SetFameThresholdThree(35)
			SR_RQC_QST.SetFameThresholdFour(70)
			SetRQCDenominatorsTardy()
			SetRQCMaxValuesTardy()
		endif
	endif
EndFunction

Function SetcurVampWereDifficulty()
	if(_curVampWereDifficulty == 0);Suspicious
		SetVampWereDenominatorsSuspicious()
		SetVampWereDecrementorsSuspicious()	
		SetVampWereMaxSuspicious()
	elseif(_curVampWereDifficulty == 1);Regular
		SetVampWereDenominatorsRegular()
		SetVampWereDecrementorsRegular()
		SetVampWereMaxRegular()
	elseif(_curVampWereDifficulty == 2);Oblivious
		SetVampWereDenominatorsOblivious()
		SetVampWereDecrementorsOblivious()
		SetVampWereMaxOblivious()
	endif
EndFunction
