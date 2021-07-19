Scriptname SR_CheckCrimeStatus_Scr extends Quest  

SRTStatTracker Property StatTracker Auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;GLOBAL PROPERTIES
GlobalVariable property SR_Global_PlayerIsMurderer auto
GlobalVariable property SR_Global_PlayerIsPettyCriminal auto
GlobalVariable property SR_Global_PlayerIsViolentCriminal auto

;SCRIPT PROPERTIES
SR_RQC_SCR Property SR_RQC_QST Auto


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EVENTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnInit()
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	CrimeSetPetty()
	CrimeSetViolent()
	CrimeSetMurder()
	Stop()
EndEvent

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function CrimeSetPetty()
	bool CrimePetty = CrimeCheckPetty()
	if (CrimePetty == true)
		SR_Global_PlayerIsPettyCriminal.SetValue(1)
	else
		SR_Global_PlayerIsPettyCriminal.SetValue(0)
	endif
EndFunction

Bool Function CrimeCheckPetty()
	float PettySeen = SR_RQC_QST.CrimePettySeen as float
	float ItemsStolen = Game.QueryStat("Items Stolen") - StatTracker.UnknownItemsStolen as float
	float HorsesStolen = Game.QueryStat("Horses Stolen") - StatTracker.UnknownHorsesStolen as float
	float PocketsPicked = Game.QueryStat("Pockets Picked") - StatTracker.UnknownPocketsPicked as float
	float TotalTheft = ItemsStolen + HorsesStolen + PocketsPicked
	if(PettySeen >= 5.0)
		Return true
	elseif (TotalTheft >= 300.0)
		Return true
	else
		Return false
	endif
EndFunction

Function CrimeSetViolent()
	bool CrimeViolent = CrimeCheckViolent()
	if (CrimeViolent == true)
		SR_Global_PlayerIsViolentCriminal.SetValue(1)
	else
		SR_Global_PlayerIsViolentCriminal.SetValue(0)
	endif
EndFunction

Bool Function CrimeCheckViolent()
	float AssaultsSeen = SR_RQC_QST.CrimeAssaultsSeen as float
	float MurdersSeen = SR_RQC_QST.CrimeMurdersSeen as float
	float MurderArrests = SR_RQC_QST.CrimeMurderArrests as float
	float MurderCheck = (MurdersSeen/2) + MurderArrests
	float Murders = Game.QueryStat("Murders") - StatTracker.UnknownMurders as float
	if(MurderCheck >= 1.0)
		Return true
	elseif(AssaultsSeen >= 3.0)
		Return true
	elseif(Murders >= 10.0)
		Return true
	else
		Return false
	endif
EndFunction

Function CrimeSetMurder()
	bool CrimeMurder = CrimeCheckMurder()
	if (CrimeMurder == true)
		SR_Global_PlayerIsMurderer.SetValue(1)
	else
		SR_Global_PlayerIsMurderer.SetValue(0)
	endif
EndFunction

Bool Function CrimeCheckMurder()
	float MurdersSeen = SR_RQC_QST.CrimeMurdersSeen as float
	float MurderArrests = SR_RQC_QST.CrimeMurderArrests as float
	float CheckCrimeMurder = (MurdersSeen/2) + MurderArrests
	if(CheckCrimeMurder >= 2.0)
		Return true
	else
		Return false
	endif

EndFunction
