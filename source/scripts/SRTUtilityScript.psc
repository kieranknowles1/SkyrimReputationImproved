Scriptname SRTUtilityScript extends Quest  
{ Version tracking and mod integration for Skyrim Reputation }

GlobalVariable Property SRTUseSKSE Auto
GlobalVariable Property SRTUseGDO Auto

Bool Property PapyrusExtenderInstalled Auto Hidden

FormList Property SRTGreyCowlList1 Auto

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

Int version = 2

Event OnInit()
	Maintenance()
EndEvent

Function Maintenance()
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
	
	; Handle updates
	If version < 2
		If version == 1
			Update_2()
		EndIf
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


	Debug.Notification("SRT: Updates complete")
EndFunction