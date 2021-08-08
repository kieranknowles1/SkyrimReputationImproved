Scriptname SR_CrimeCounter2QST_Scr extends Quest  

SR_RQC_SCR Property SR_RQC_Script Auto

; Added debug global
GlobalVariable Property SRTDebug Auto

; Changed this to OnStoryCrimeGold from OnInit
Event OnStoryCrimeGold(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)
	If SRTDebug.GetValue() == 1.0
		Debug.MessageBox("SR_CrimeCounter2QST_Scr: akVictim = " + akVictim + ", akCriminal = " + akCriminal + ", akFaction = " + akFaction + ", aiGoldAmount = " + aiGoldAmount + ", aiCrime = " + aiCrime)
	EndIf

	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	SR_RQC_Script.IncrementCrimePettySeen()
	Stop()
EndEvent
