Scriptname SRTEventHandler extends Quest  
{ Papyrus extender specific event handling }

Import PO3_Events_Form


SR_RQC_SCR Property SR_RQC_QST Auto

MiscObject Property SRTExcludeToken Auto ; Temporary dialogue block

Keyword Property ActorTypeNPC Auto


Quest Property CR08 Auto ; Rescue mission
ReferenceAlias Property CR08VictimAlias Auto
Actor CR08Victim ; The quest may have stopped by the time this script runs


Function RegisterEvents()
	RegisterForSoulTrapped(self)
	
	RegisterForQuestStage(self, CR08)
EndFunction



; Story manager version didn't work as the soul trap effect is already dispelled
; when the event is processed

; Papyrus extender adds OnMagicEffectApplyEx which has filters
; this is only used for cannibalism for now

Event OnSoulTrapped(Actor akVictim, Actor akKiller)
	;Debug.Notification("SRT: Soul Trapped")
	
	If akKiller == Game.GetPlayer() && akVictim.HasKeyword(ActorTypeNPC)
		;Debug.Notification("SRT: Black Soul")
		SR_RQC_QST.IncrementBlackSoulTraps()
	EndIf
EndEvent

Event OnQuestStageChange(Quest akQuest, Int aiNewStage)
	;Debug.Trace("SRT: OnQuestStageChange " + akQuest As String + ": stage " + aiNewStage)
	
	If akQuest == CR08 ; Kidnapping
		If aiNewStage == 10 ; Accepted
			CR08Victim = CR08VictimAlias.GetActorReference()
			CR08Victim.AddItem(SRTExcludeToken, 1)
		ElseIf aiNewStage == 200 ; Returned to questgiver
			CR08Victim.RemoveItem(SRTExcludeToken, 1)
			CR08Victim = None
		EndIf
	EndIf
EndEvent