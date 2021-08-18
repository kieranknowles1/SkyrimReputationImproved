Scriptname SR_RQC_SCR_Favor253 extends Quest  
{This script adds the reputation contribution for the completed quest}

; Quest conditions -

; (UnboundInstalled == 1) AND
; (GetOutOfJailImps OR GetOutOfJailSons)
; This ensures that reputation from becoming thane is only given once, Thane is gained from MQ104 in vanilla
; With original unbound, Favor253 never runs on imperial side

; Checking for FavorJarlsMakeFriends instead of Favor253
;Thane's get out of jail conditions
; 0 = not a thane yet
; 1 = Thane, has not used his get out of jail card
; 2 = Thane, has used his get out of jail card
FavorJarlsMakeFriendsScript Property FavorJarlsMakeFriends Auto
GlobalVariable Property SR_PluginEnabled_SkyrimUnbound Auto

;Quest Property Favor253 Auto; Thane of Whiterun
GlobalVariable property SR_MCM_Factions_Thane_Whiterun auto
SR_RQC_SCR Property SR_RQC_QST Auto

;Event OnInit()
; Minor optimization while I'm here
Event OnStoryChangeLocation(ObjectReference akActor, Location akOldLocation, Location akNewLocation)
	RegisterForSingleUpdate(1)
EndEvent

auto State Favor253QuestUnchecked; The quest will be continually checked on Update
	Event OnUpdate()
		;if (Favor253.IsStageDone(20))
		; Only give fame from becoming thane once
		; Without skyrim unbound, this quest will never run as thane status is gained from MQ104
		If (FavorJarlsMakeFriends.WhiterunSonsGetOutofJail != 0 || FavorJarlsMakeFriends.WhiterunImpGetOutofJail != 0) && \
			SR_PluginEnabled_SkyrimUnbound.GetValue() == 1.0

			SR_RQC_QST.IncrementQuestFame(2)
			SR_MCM_Factions_Thane_Whiterun.SetValue(1)
			debug.trace ("Skyrim Reputation marked quest Favor253 as completed")
			gotoState("Favor253QuestChecked")
		else
			Stop()
		endIf
	EndEvent
EndState

State Favor253QuestChecked; The quest was checked as completed and contibuted its reputation points
; Do nothing here
EndState