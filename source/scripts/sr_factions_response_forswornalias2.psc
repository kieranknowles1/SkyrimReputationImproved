;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname SR_Factions_Response_ForswornAlias2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TreasureContainer07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossTreasureContainer01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossTreasureContainer01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCentreMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCentreMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hagraven02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hagraven02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TreasureContainer06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TreasureContainer06 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SR_Factions_Response_Forsworn_AliasSet1.Stop()
SR_FactionAuras_Forsworn_AliasBool.SetValue(1)

if(SR_Factions_Response_Forsworn_Hostile.IsRunning() == true)
   SR_Factions_Response_Forsworn_Hostile.Stop()
endif

; Improved - Register updates here instead of in OnInit
Alias_Hagraven01.RegisterForSingleUpdate(2.0)
Alias_Hagraven02.RegisterForSingleUpdate(2.0)
Alias_Hagraven03.RegisterForSingleUpdate(2.0)

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SR_FactionAuras_Forsworn_ReactionTheft.SetValue(1)
SR_Factions_Response_Forsworn_Hostile.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SR_ForswornAllegianceCheck_Scr Property SR_Factions_Response_Forsworn Auto

GlobalVariable Property SR_FactionAuras_Forsworn_ReactionTheft  Auto
GlobalVariable property SR_FactionAuras_Forsworn_AliasBool auto

Quest Property SR_Factions_Response_Forsworn_AliasSet1 Auto
Quest Property SR_Factions_Response_Forsworn_Hostile Auto

Actor Property PlayerRef Auto
