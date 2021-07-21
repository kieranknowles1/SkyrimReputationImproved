Scriptname SRTUtilityScript extends Quest  
{ Version tracking and mod integration for Skyrim Reputation }

GlobalVariable Property SRTUseSKSE Auto
GlobalVariable Property SRTUseGDO Auto
GlobalVariable Property SR_PluginEnabled_SkyrimUnbound Auto

Bool Property PapyrusExtenderInstalled Auto Hidden

FormList Property SRTGreyCowlList1 Auto

Quest Property MQ101 Auto

Bool Function IsModLoaded(String pluginName, Int sampleForm)
{ Check for mod without log errors if SKSE is installed }
	If SRTUseSKSE.GetValue() == 1.0
		Return Game.IsPluginInstalled(pluginName)
	Else
		Form sample = Game.GetFormFromFile(sampleForm, pluginName)
		If sample != None
			Return True
		Else
			Return False
		EndIf
	EndIf
EndFunction

Function TryAddForm(Form formToAdd, FormList destinationList)
{ Add a form to a FormList if it isn't already present }
	If !destinationList.HasForm(formToAdd)
		destinationList.AddForm(formToAdd)
	EndIf
EndFunction

Int version = 3

Event OnInit()
	; Detect if the mod is installed on an existing game
	If MQ101.GetStage() >= 70
		RetroFixes()
	EndIf

	Maintenance()
EndEvent

Function Maintenance()
	CheckMods()
	
	; Handle updates
	If version < 3
		If version == 1
			Update_2()
		ElseIf version == 2
			Update_3()
		EndIf
	EndIf
EndFunction

Function CheckMods()
	If SKSE.GetVersion() > 0
		SRTUseSKSE.SetValue(1.0)
		
		; Track black soul traps
		If SKSE.GetPluginVersion("powerofthree's Papyrus Extender") > 0
			PapyrusExtenderInstalled = True
			
			SRTEventHandler eventHandler = (self As Quest) As SRTEventHandler
			eventHandler.RegisterEvents()

		Else
			PapyrusExtenderInstalled = False
		EndIf
	Else
		SRTUseSKSE.SetValue(0.0)
	EndIf
	
	; Disable overlaping dialogue for thanes
	If IsModLoaded("Guard Dialogue Overhaul.esp", 0x019C3C) ; WICastMagic03Thane
		SRTUseGDO.SetValue(1.0)
	Else
		SRTUseGDO.SetValue(0.0)
	EndIf
	
	; Gray cowl
	If IsModLoaded("Gray Fox Cowl.esm", 0x017AE5)
		TryAddForm(Game.GetFormFromFile(0x017AE5, "Gray Fox Cowl.esm"), SRTGreyCowlList1)
	EndIf
	If IsModLoaded("Sneak Tools.esp", 0x077779)
		TryAddForm(Game.GetFormFromFile(0x077779, "Sneak Tools.esp"), SRTGreyCowlList1)
	EndIf
	If IsModLoaded("ccbgssse020-graycowl.esl", 0xD62)
		TryAddForm(Game.GetFormFromFile(0xD62, "ccbgssse020-graycowl.esl"), SRTGreyCowlList1)
	EndIf
	
	; Unbound
	; This mod skips the main quest up to 'Dragon Rising'
	; Original mod had incomplete support for unbound
	;
	; SR_NewStartup_Message checked for MQ101 stage 900, which is never set with reborn
	; MQ103 is missing a check entirely, MQ104 may run before startup check and still increments fame
	; Thane appears to be using the vanilla system (favor253)
	; Don't need to disable dragonborn comments as conditions check for at least MQ105Ustengrav
	If IsModLoaded("Skyrim Unbound.esp", 0x000D62) ; SkyrimUnbound quest
		SR_PluginEnabled_SkyrimUnbound.SetValue(1.0)
	Else
		SR_PluginEnabled_SkyrimUnbound.SetValue(0.0)
	EndIf
EndFunction

GlobalVariable Property SRTBlockedLines Auto
GlobalVariable Property SRTFameMult Auto
GlobalVariable Property SRTLawMult Auto
GlobalVariable Property SRTRacismMult Auto
GlobalVariable Property SRTThalmorQuestMult Auto
GlobalVariable Property SRTUnobservantNPCs Auto

Int Property SecretSetDefault Hidden
Function Set(Int x)
	SRTBlockedLines.SetValue(0.0)
	SRTFameMult.SetValue(0.5)
	SRTLawMult.SetValue(0.5)
	SRTRacismMult.SetValue(1.5)
	SRTThalmorQuestMult.SetValue(0.5)
	SRTUnobservantNPCs.SetValue(1.0)
EndFunction
EndProperty

; --------- UPDATE FUNCTIONS -------------

SR_RQC_SCR Property SR_RQC_QST Auto

GlobalVariable Property SR_MCM_Override_BlackSoulTraps Auto
GlobalVariable Property SR_MCM_Override_CannibalFeed Auto

; Retroactive fixes for if the reputation improved is installed on an existing save
Function RetroFixes()
	Debug.Trace("SRT: Retroactive updates")
	CheckMods()
	
	If SR_PluginEnabled_SkyrimUnbound.GetValue() == 1.0
		UnboundInstall()
	EndIf
	
	; Enable cannibalism and black soul trap tracking
	; This won't do anything unless papyrus extender is installed
	SR_MCM_Override_BlackSoulTraps.SetValue(1.0)
	SR_MCM_Override_CannibalFeed.SetValue(1.0)
EndFunction

Function Update_2()
	Debug.Trace("SRT: Updating v1 -> v2")
	; Several variables on SR_RQC_QST are erroniously incremented at the beginning of the game
	; due to using OnInit()
	; This script reverts changes on existing games
	; These variables are set to -1 on SR_RQC_QST as it's easier than fixing the quest scripts

	; Now doing fix in SR_RQC_SCR
;	SR_RQC_QST.BlackSoulTraps -= 1
;	SR_RQC_QST.CrimeAssaultsSeen -= 1
;	SR_RQC_QST.CrimePettySeen -= 1
;	SR_RQC_QST.CrimeWerewolfSeen -= 1
;	SR_RQC_QST.KillsBandits -= 1
;	SR_RQC_QST.KillsDragonPriests -= 1
;	SR_RQC_QST.KillsDragons -= 1
;	SR_RQC_QST.KillsThalmor -= 1
;	SR_RQC_QST.KillsWitches -= 1
;	SR_RQC_QST.KillsWizards -= 1
;	SR_RQC_QST.SpellCannibalFeed -= 1
;	
;	SR_RQC_QST.CrimeVampireLordSeen -= 1
;	
;	; These are floats for some reason
;	SR_RQC_QST.CrimeMurdersSeen -= 1.0
;	SR_RQC_QST.CrimeMurdersSeen -= 1.0


	;Debug.Notification("SRT: Updates complete")
	;version = 2
	Update_3()
EndFunction

; Should be safer than checking quest stages
Quest Property SR_RQC_QST_MainAndSideQuestBundle Auto
SR_RQC_SCR_Favor253 Property SR_RQC_QST_Favor253 Auto
GlobalVariable property SR_MCM_Factions_Thane_Whiterun auto

Function Update_3()
	Debug.Trace("SRT: Updating v2 -> v3")
	
	; Fix reputation from skyrim unbound
	If SR_PluginEnabled_SkyrimUnbound.GetValue() == 1.0
		UnboundInstall()
	Else
		Debug.Trace("Skyirm unbound not installed")
	EndIf
	
	version = 3
	Debug.Trace("SRT: Updates complete")
EndFunction

Function UnboundInstall()
	Debug.Trace("Retroactive reputation for skyrim unbound")

	; Fix reputation from skyrim unbound
	If SR_PluginEnabled_SkyrimUnbound.GetValue() == 1.0
		If (SR_RQC_QST_MainAndSideQuestBundle As SR_RQC_SCR_MQ103).GetState() == "MQ103QuestChecked"
			SR_RQC_QST.QuestDependability -= 1
			Debug.Trace("Reverted reputation from MQ103")
		EndIf
		If (SR_RQC_QST_MainAndSideQuestBundle As SR_RQC_SCR_MQ104).GetState() == "MQ104QuestChecked"
			SR_RQC_QST.QuestFame -= 3
			SR_RQC_QST.QuestAedric -= 1
			SR_RQC_QST.QuestDependability -= 2
			Debug.Trace("Reverted reputation from MQ104")
			If SR_RQC_QST_Favor253.GetState() == "Favor253QuestUnchecked" ; Not thane
				SR_MCM_Factions_Thane_Whiterun.SetValue(0.0)
				Debug.Trace("Reverted whiterun thane status")
			EndIf
		EndIf
	Else
		Debug.Trace("Skyirm unbound not installed")
	EndIf
EndFunction

