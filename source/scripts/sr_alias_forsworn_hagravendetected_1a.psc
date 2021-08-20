Scriptname SR_Alias_Forsworn_HagravenDetected_1a extends ReferenceAlias  
{ Use this instead of duplicates }

SR_ForswornAllegianceCheck_Scr Property SR_Factions_Response_Forsworn Auto 
;Quest Property SR_Factions_Response_Forsworn_AliasSet1 Auto ; Unused
;ReferenceAlias Property Hagraven01 Auto ; Use GetReference() instead

; Register in quest script
;Event OnInit()
;	RegisterForSingleUpdate(2)
;EndEvent

Event OnUpdate()
	Actor HagravenActor = GetReference() as Actor
	Actor Player = Game.GetPlayer()
	if HagravenActor != None ; Aliases are optional so this may not be filled
		if Player.IsDetectedBy(HagravenActor) == true
			SR_Factions_Response_Forsworn.SetForswornTempEnemy()	
		else
			RegisterForSingleUpdate(2)
		endif
	else
		; RegisterForSingleUpdate(10) ; Don't need to keep updating if this is empty
	endif
EndEvent