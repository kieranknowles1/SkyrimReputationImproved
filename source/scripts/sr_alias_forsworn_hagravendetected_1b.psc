Scriptname SR_Alias_Forsworn_HagravenDetected_1b extends ReferenceAlias  
{ Obsolete, use 1a instead }
; The The duplicate HagravenDetected scripts have been removed, using 1a for everything instead
; Scripts are not removed on existing saves, so these have been compiled to stubs

;/
SR_ForswornAllegianceCheck_Scr Property SR_Factions_Response_Forsworn Auto 
Quest Property SR_Factions_Response_Forsworn_AliasSet1 Auto 
ReferenceAlias Property Hagraven02 Auto

Event OnInit()
	RegisterForSingleUpdate(2)
EndEvent

Event OnUpdate()
	Actor HagravenActor = Hagraven02.GetReference() as Actor
	Actor Player = Game.GetPlayer()
	if HagravenActor != None
		if Player.IsDetectedBy(HagravenActor) == true
			SR_Factions_Response_Forsworn.SetForswornTempEnemy()	
		else
			RegisterForSingleUpdate(2)
		endif
	else
		RegisterForSingleUpdate(10)
	endif
EndEvent
/;