Scriptname SRTUtilityPlayerScript Extends ReferenceAlias

SRTUtilityScript Property SRTUtilityQuest Auto

Import PO3_Events_Alias

FormList Property SRTGreyCowlList1 Auto
GlobalVariable Property SRTWearingGreyCowl1 Auto
Message Property SRTGreyCowlMessage1 Auto

; Give the Gray Fox's reputation
GlobalVariable Property SR_Global_Reputation1 Auto
GlobalVariable Property SR_Global_LawCrime1 Auto
GlobalVariable Property SR_Global_WerewolfSuspicion1 Auto
GlobalVariable Property SR_Global_VampireSuspicion1 Auto

SR_RQC_SCR Property SR_RQC_QST1 Auto

; Doesn't work for some reason
; SR_RQC_REF_SCR Property SR_RQC_PlayerAlias Auto
ReferenceAlias Property SR_RQC_PlayerAlias1 Auto

Spell Property SRTGreyCowlSpell_ Auto

SRTStatTracker Property StatTracker Auto

; Cannibalism
MagicEffect Property DA11AbFortifyHealRate Auto

Event OnPlayerLoadGame()
	SRTUtilityQuest.Maintenance()
	
	If SRTUtilityQuest.PapyrusExtenderInstalled
		RegisterForMagicEffectApplyEx(self, DA11AbFortifyHealRate, true)
	EndIf
EndEvent

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	Utility.WaitMenuMode(0.5) ; Let OnObjectUnequipped process first
	If SRTGreyCowlList1.HasForm(akBaseObject)
		SRTGreyCowlMessage1.Show()
		SRTWearingGreyCowl1.SetValue(1.0)
		
		; Give the Gray Fox's reputation
		SR_Global_Reputation1.SetValue(5) ; Hated
		SR_Global_LawCrime1.SetValue(6) ; High crime
		SR_Global_WerewolfSuspicion1.SetValue(0)
		SR_Global_VampireSuspicion1.SetValue(0)
		
		StatTracker.CowlEquipped()
		
		SR_RQC_QST1.UnregisterForUpdateGameTime() ; Pause tracking
		SR_RQC_PlayerAlias1.UnregisterForUpdateGameTime()
		
		; Spell has dispel with keyword
		Game.GetPlayer().AddSpell(SRTGreyCowlSpell_, False)
	EndIf
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	If SRTGreyCowlList1.HasForm(akBaseObject)
		SRTWearingGreyCowl1.SetValue(0.0)
		
		StatTracker.CowlUnequipped()
		
		; Restore regular reputation
		SR_RQC_QST1.CalculateReputation()
		SR_RQC_QST1.RegisterForSingleUpdateGameTime(24.0) ; Resume tracking
		SR_RQC_PlayerAlias1.RegisterForSingleUpdateGameTime(12.0)
		
		(SR_RQC_PlayerAlias1 As SR_RQC_REF_SCR).SetReputationAbility()
	EndIf
EndEvent

; Requires papyrus extender
; This is more efficient than OnMagicEffectApply as it only triggers for filtered effects
; Could this be extended to more effects?
Event OnMagicEffectApplyEx(ObjectReference akCaster, MagicEffect akEffect, Form akSource, bool abApplied)
	;Debug.MessageBox("SRT: OnMagicEffectApplyEx: " + akEffect As String + " checking for " + DA11AbFortifyHealRate As String)
	
	If akEffect == DA11AbFortifyHealRate
		;Debug.Notification("Cannibal")
		SR_RQC_QST1.IncrementSpellCannibalFeed()
	EndIf
EndEvent
