Scriptname SRTStatTracker extends Quest  

; Increase 'unknown' stats by the change between equipping and unequipping the cowl

; Not all of these are used, keeping it here for consistency
Int Property UnknownItemsStolen Auto
Int Property UnknownHorsesStolen Auto
Int Property UnknownPocketsPicked Auto
Int Property UnknownMurders Auto
Int Property UnknownBackstabs Auto
Int Property UnknownDBQuests Auto
Int Property UnknownQuests Auto
Int Property UnknownLocationsDiscovered Auto
Int Property UnknownDungeonsCleared Auto
Int Property UnknownPeopleKilled Auto
Int Property UnknownStoresInvested Auto
Int Property UnknownHousesOwned Auto
Int Property UnknownNecksBitten Auto
Int Property UnknownMauls Auto
Int Property UnknownWereTransforms Auto
Int Property UnknownUndeadKills Auto
Int Property UnknownDaedraKills Auto
Int Property UnknownTrespasses Auto
Int Property UnknownJailEscapes Auto
Int Property UnknownDaysJailed Auto
Int Property UnknownFinesPaid Auto
Int Property UnknownTGQuests Auto
Int Property UnknownCompanionsQuests Auto
Int Property UnknownBrawlsWon Auto
Int Property UnknownMiscObjectives Auto
Int Property UnknownCWQuests Auto
Int Property UnknownPersuasions Auto
Int Property UnknownIntimidations Auto
Int Property UnknownBribes Auto
Int Property UnknownMGQuests Auto
Int Property UnknownBooksRead Auto
Int Property UnknownSoulsTrapped Auto

; Values when putting the cowl on
Int ItemsStolen
Int HorsesStolen
Int PocketsPicked
Int Murders
Int Backstabs
Int DBQuests
Int Quests
Int LocationsDiscovered
Int DungeonsCleared
Int PeopleKilled
Int StoresInvested
Int HousesOwned
Int NecksBitten
Int Mauls
Int WereTransforms
Int UndeadKills
Int DaedraKills
Int Trespasses
Int JailEscapes
Int DaysJailed
Int FinesPaid
Int TGQuests
Int CompanionsQuests
Int BrawlsWon
Int MiscObjectives
Int CWQuests
Int Persuasions
Int Intimidations
Int Bribes
Int MGQuests
Int BooksRead
Int SoulsTrapped


Event OnInit()
	CowlEquipped() ; Handle installation with the cowl equipped
EndEvent

Function CowlEquipped()
	ItemsStolen = Game.QueryStat("Items Stolen")
	HorsesStolen = Game.QueryStat("Horses Stolen")
	PocketsPicked = Game.QueryStat("Pockets Picked")
	Murders = Game.QueryStat("Murders")
	Backstabs = Game.QueryStat("Backstabs")
	DBQuests = Game.QueryStat("The Dark Brotherhood Quests Completed")
	Quests = Game.QueryStat("Quests Completed")
	LocationsDiscovered = Game.QueryStat("Locations Discovered")
	DungeonsCleared = Game.QueryStat("Dungeons Cleared")
	PeopleKilled = Game.QueryStat("People Killed")
	StoresInvested = Game.QueryStat("Stores Invested In")
	HousesOwned = Game.QueryStat("Houses Owned")
	NecksBitten = Game.QueryStat("Necks Bitten")
	Mauls = Game.QueryStat("Mauls")
	WereTransforms = Game.QueryStat("Werewolf Transformations")
	UndeadKills = Game.QueryStat("Undead Killed")
	DaedraKills = Game.QueryStat("Daedra Killed")
	Trespasses = Game.QueryStat("Trespasses")
	JailEscapes = Game.QueryStat("Jail Escapes")
	DaysJailed = Game.QueryStat("Days Jailed")
	FinesPaid = Game.QueryStat("Fines Paid")
	TGQuests = Game.QueryStat("Thieves' Guild Quests Completed")
	CompanionsQuests = Game.QueryStat("The Companions Quests Completed")
	BrawlsWon = Game.QueryStat("Brawls Won")
	MiscObjectives = Game.QueryStat("Misc Objectives Completed")
	CWQuests = Game.QueryStat("Civil War Quests Completed")
	Persuasions = Game.QueryStat("Persuasions")
	Intimidations = Game.QueryStat("Intimidations")
	Bribes = Game.QueryStat("Bribes")
	MGQuests = Game.QueryStat("College of Winterhold Quests Completed")
	BooksRead = Game.QueryStat("Books Read")
	SoulsTrapped = Game.QueryStat("Souls Trapped")
EndFunction

Function CowlUnequipped()
	; Increas unknown counts by difference between equipping and unequipping cowl
	UnknownItemsStolen += Game.QueryStat("Items Stolen") - ItemsStolen
	UnknownHorsesStolen += Game.QueryStat("Horses Stolen") - HorsesStolen
	UnknownPocketsPicked += Game.QueryStat("Pockets Picked") - PocketsPicked
	UnknownMurders += Game.QueryStat("Murders") - Murders
	UnknownBackstabs += Game.QueryStat("Backstabs") - Backstabs
	UnknownDBQuests += Game.QueryStat("The Dark Brotherhood Quests Completed") - DBQuests
	UnknownQuests += Game.QueryStat("Quests Completed") - Quests
;	UnknownLocationsDiscovered += Game.QueryStat("Locations Discovered") - LocationsDiscovered
	UnknownDungeonsCleared += Game.QueryStat("Dungeons Cleared") - DungeonsCleared
	UnknownPeopleKilled += Game.QueryStat("People Killed") - PeopleKilled
;	UnknownStoresInvested += Game.QueryStat("Stores Invested In") - StoresInvested
;	UnknownHousesOwned += Game.QueryStat("Houses Owned") - HousesOwned
	UnknownNecksBitten += Game.QueryStat("Necks Bitten") - NecksBitten
	UnknownMauls += Game.QueryStat("Mauls") - Mauls
	UnknownWereTransforms += Game.QueryStat("Werewolf Transformations") - WereTransforms
	UnknownUndeadKills += Game.QueryStat("Undead Killed") - UndeadKills
	UnknownDaedraKills += Game.QueryStat("Daedra Killed") - DaedraKills
	UnknownTrespasses += Game.QueryStat("Trespasses") - Trespasses
	UnknownJailEscapes += Game.QueryStat("Jail Escapes") - JailEscapes
	UnknownDaysJailed += Game.QueryStat("Days Jailed") - DaysJailed
	UnknownFinesPaid += Game.QueryStat("Fines Paid") - FinesPaid
	UnknownTGQuests += Game.QueryStat("Thieves' Guild Quests Completed") - TGQuests
	UnknownCompanionsQuests += Game.QueryStat("The Companions Quests Completed") - CompanionsQuests
	UnknownBrawlsWon += Game.QueryStat("Brawls Won") - BrawlsWon
	UnknownMiscObjectives += Game.QueryStat("Misc Objectives Completed") - MiscObjectives
	UnknownCWQuests += Game.QueryStat("Civil War Quests Completed") - CWQuests
	UnknownPersuasions += Game.QueryStat("Persuasions") - Persuasions
	UnknownIntimidations += Game.QueryStat("Intimidations") - Intimidations
	UnknownBribes += Game.QueryStat("Bribes") - Bribes
	UnknownMGQuests += Game.QueryStat("College of Winterhold Quests Completed") - MGQuests
;	UnknownBooksRead += Game.QueryStat("Books Read") - BooksRead
	UnknownSoulsTrapped += Game.QueryStat("Souls Trapped") - SoulsTrapped
EndFunction
