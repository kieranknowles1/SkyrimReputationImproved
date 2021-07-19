Scriptname SR_AssaultCounterQST_Scr extends Quest  

SR_RQC_SCR Property SR_RQC_Script Auto

ReferenceAlias Property Victim Auto
; ReferenceAlias Property Criminal Auto ; Using conditions for this

Event OnInit()
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	; Sneak attacks are sometimes considered assault
	; and followers can count as witnesses

	Actor victimRef = Victim.GetReference() As Actor
	;Actor criminalRef = Criminal.GetReference()
	
;	If victimRef
;		Debug.MessageBox("AssaultCounter: Victim = " + victimRef As String)
;	EndIf
	
	If victimRef && victimRef.GetCrimeFaction()
		SR_RQC_Script.IncrementCrimeAssaultsSeen()
	
;		Debug.MessageBox("SRT: Assault seen")
	EndIf
	Stop()
EndEvent
