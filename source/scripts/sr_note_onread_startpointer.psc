Scriptname SR_Note_OnRead_StartPointer extends ObjectReference 

; Tweaks - Removed MCM replacer if SKSE installed

SR_ConfigQST_Scr Property SR_MCM_Replacer Auto
Quest Property SR_MCM_Replacer_Pointer  Auto 

GlobalVariable Property SRTUseSKSE Auto

auto State waiting
	Event OnRead()
		If SRTUseSKSE.GetValue() == 0.0
			if(SR_MCM_Replacer.SpokenToErikur == 0)
				if(SR_MCM_Replacer_Pointer.IsRunning() == false)
					SR_MCM_Replacer_Pointer.Start()
				endif
			endif
			GoToState("inactive")	
		EndIf
	EndEvent
EndState

State inactive
EndState