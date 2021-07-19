Scriptname SR_RQC_FunctionTriggerQuest_Scr extends Quest  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;SCRIPT PROPERTIES
SR_RQC_SCR Property SR_RQC_QST Auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
	RegisterForSingleUpdate(Utility.RandomFloat(3.0, 5.0))
EndEvent

Event OnUpdate()
	SR_RQC_QST.CalculateReputation()

;	SR_RQC_QST.SetTotalVampirismScore()
;	Utility.Wait(1)
;	SR_RQC_QST.SetTotalLycanthropyScore()
;	Utility.Wait(1)
;	SR_RQC_QST.SetTotalDaedricScore()
;	Utility.Wait(3)
;	SR_RQC_QST.SetTotalAedricScore()
;	Utility.Wait(3)
;	SR_RQC_QST.SetTotalCrimeScore()
;	Utility.Wait(3)
;	SR_RQC_QST.SetTotalLawScore()
;	Utility.Wait(3)
;	SR_RQC_QST.SetTotalDependabilityScore()
;	Utility.Wait(3)
;	SR_RQC_QST.SetTotalAmbitionScore()
;	Utility.Wait(3)
;	SR_RQC_QST.SetTotalFameScore()
;	Utility.Wait(3)
;	SR_RQC_QST.SetReputationGlobal()
;	Utility.Wait(1)
;	SR_RQC_QST.SetAedricDaedricGlobal()
;	Utility.Wait(1)
;	SR_RQC_QST.SetLawCrimeGlobal()
;	Utility.Wait(1)
;	SR_RQC_QST.SetDependabilityAmbitionGlobal()
;	Utility.Wait(1)
;	SR_RQC_QST.SetWerewolfSuspicionScore()
;	Utility.Wait(1)
;	SR_RQC_QST.SetVampirismSuspicionScore()
	Stop()
EndEvent

