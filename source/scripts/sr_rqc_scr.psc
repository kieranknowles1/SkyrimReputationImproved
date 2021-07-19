Scriptname SR_RQC_SCR extends Quest  
{This script contains the functions calculating the reputation dimensions of the Skyrim Reputation mod}

; Tweaks - Optimization, I couldn't resist :)

GlobalVariable Property SRTWearingGreyCowl1 Auto

GlobalVariable Property SRTFameMult Auto
GlobalVariable Property SRTRacismMult Auto

GlobalVariable Property SRTVampireMult Auto
GlobalVariable Property SRTWerewolfMult Auto
GlobalVariable Property SRTDaedricMult Auto
GlobalVariable Property SRTAedricMult Auto
GlobalVariable Property SRTCrimeMult Auto
GlobalVariable Property SRTLawMult Auto
GlobalVariable Property SRTDependabilityMult Auto
GlobalVariable Property SRTAmbitionMult Auto

; Functions to remove duplicate code
Int Function iMin(Int a, Int b)
	If a < b
		Return a
	Else
		Return b
	EndIf
EndFunction

Float Function fMin(Float a, Float b)
	If a < b
		Return a
	Else
		Return b
	EndIf
EndFunction

Int Function iMax(Int a, Int b)
	If a > b
		Return a
	Else
		Return b
	EndIf
EndFunction

Float Function fMax(Float a, Float b)
	If a > b
		Return a
	Else
		Return b
	EndIf
EndFunction

Int Function CalcCounterBalance(Int current, Float score, Float percentage)
	Int counterBalance = ((score * percentage) + 0.5) As Int
	
	If percentage == 0
		Return 0
	Else
		Return current + counterBalance
	EndIf
EndFunction

Actor Property PlayerRef Auto



Event OnInit()
	RegisterForSingleUpdateGameTime(Utility.RandomFloat(20.0, 24.0))
	
	RegisterForSingleUpdate(60);
EndEvent

Event OnUpdate()
	; Several variables on SR_RQC_QST are erroniously incremented at the beginning of the game
	; due to using OnInit()
	; workaround without having to edit individual scripts

	; Scripts are locked until OnInit is done, so can't use Wait()
	; OnUpdateGameTime is used for everything else
	KillsBandits = 0
	KillsWizards = 0
	KillsWitches = 0
	KillsForsworn = 0
	KillsThalmor = 0
	KillsDragons = 0
	KillsDragonPriests = 0
	BlackSoulTraps = 0
	SpellNecromancySeen = 0
	SpellCannibalFeed = 0
	SpellCharityAdded = 0
	SpellVampiricSpellSeen = 0
	VampireLordTransformations = 0
	CommentVampireVillager = 0
	CommentVampireGuard = 0
	WerewolfFeedings = 0
	CommentWerewolfVillager = 0
	CommentWerewolfGuard = 0
	CrimeWerewolfSeen = 0
	CrimeVampireLordSeen = 0
	CrimePettySeen = 0
	CrimeAssaultsSeen = 0
	CrimeMurdersSeen = 0.0
	CrimeMurderArrests = 0.0
EndEvent
 
Event OnUpdateGameTime()
;	SetTotalVampirismScore()
;	Utility.Wait(1)
;	SetTotalLycanthropyScore()
;	Utility.Wait(1)
;	SetTotalDaedricScore()
;	Utility.Wait(3)
;	SetTotalAedricScore()
;	Utility.Wait(3)
;	SetTotalCrimeScore()
;	Utility.Wait(3)
;	SetTotalLawScore()
;	Utility.Wait(3)
;	SetTotalDependabilityScore()
;	Utility.Wait(3)
;	SetTotalAmbitionScore()
;	Utility.Wait(3)
;	SetTotalFameScore()
;	Utility.Wait(3)
;	SetReputationGlobal()
;	Utility.Wait(1)
;	SetAedricDaedricGlobal()
;	Utility.Wait(1)
;	SetLawCrimeGlobal()
;	Utility.Wait(1)
;	SetDependabilityAmbitionGlobal()
;	Utility.Wait(1)
;	SetWerewolfSuspicionScore()
;	Utility.Wait(1)
;	SetVampirismSuspicionScore()
;	Utility.Wait(1)
;	ResetLastBigQuestFinished()
	CalculateReputation()

	RegisterForSingleUpdateGameTime(Utility.RandomFloat(20.0, 24.0))
EndEvent

Function CalculateReputation()
;	Debug.Trace("Calculating reputation")
;	Float startTime = Utility.GetCurrentRealTime()
	SetTotalVampirismScore()
	SetTotalLycanthropyScore()
	SetTotalDaedricScore()
	SetTotalAedricScore()
	SetTotalCrimeScore()
	SetTotalLawScore()
	SetTotalDependabilityScore()
	SetTotalAmbitionScore()
	SetTotalFameScore()
	SetReputationGlobal()
	SetAedricDaedricGlobal()
	SetLawCrimeGlobal()
	SetDependabilityAmbitionGlobal()
	SetWerewolfSuspicionScore()
	SetVampirismSuspicionScore()
	ResetLastBigQuestFinished()
	
;	Float endTime = Utility.GetCurrentRealTime()
;	Debug.Trace("Reputation calculation done in " + (endTime - startTime) + " seconds")
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTY VALUES FOR REPUTATION STATISTIC DENOMINATORS AND MULTIPLIERS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property QuestsCompletedNom = 20 auto
int property LocationsNom = 60 auto
int property DungeonsNom = 30 auto
int property SpottedMurdersFameNom = 1 auto
int property SpottedMurdersFameMult = 1 auto
int property PeopleKillsNom = 100 auto
int property StoreInvestmentsNom = 6 auto
int property HousesOwnedNom = 2 auto
int property DragonKillsNom = 5 auto
int property DragonPriestKillsNom = 3 auto

int property LycanthropyNom = 3 auto
int property VampirismNom = 3 auto
int property ZombieTimeDeaNom = 2 auto
int property ConjurationSkillNom = 20 auto
int property CannibalFeedNom = 10 auto

int property NecksBittenNom = 3 auto
int property VampiricSpellSeenNom = 1 auto
int property VampiricSpellSeenMult = 2 auto
int property VampireLordTransformationNom = 4 auto
int property VampireLordSeenNom = 1 auto
int property VampireLordSeenMult = 15 auto
int property VampireVillagerNom = 3 auto
int property VampireGuardNom = 1 auto
int property VampireGuardMult = 4 auto

int property WerewolfMaulNom = 10 auto
int property WerewolfTransformationsNom = 6 auto
int property WerewolfFeedsNom = 4 auto
int property TimesSpottedWerewolfNom = 1 auto
int property TimesSpottedWerewolfMult = 15 auto
int property WerewolfVillagerNom = 3 auto
int property WerewolfGuardNom = 1 auto
int property WerewolfGuardMult = 4 auto

int property CharityNom = 3 auto
int property RestorationSkillNom = 20 auto
int property DaedraKilledNom = 20 auto
int property UndeadKilledNom = 100 auto

int property SpottedAssaultsNom = 1 auto
int property SpottedAssaultsMult = 2 auto
int property SpottedMurdersNom = 1 auto
int property SpottedMurdersMult = 4 auto
int property SpottedPettyCrimeNom = 2 auto
int property MurdersNom = 10 auto
int property PocketsPickedNom = 20 auto
int property HorsesStolenNom = 10 auto
int property ItemsStolenNom = 200 auto
int property TrespassesNom = 20 auto
int property JailEscapesNom = 5 auto
int property DaysJailedNom = 5 auto
int property FinesPayedNom = 2000 auto
int property ThievesGuildQuestsNom = 10 auto
int property DarkBrotherhoodQuestsNom = 5 auto

int property CompanionsQuestsLawNom = 3 auto
int property BanditsKilledNom = 100 auto
int property WizardKillerNom = 30 auto
int property WitchKillerNom = 30 auto
int property ForswornKillerNom = 50 auto

int property CompanionsQuestsDepNom = 6 auto
int property CivilWarQuestsNom = 1 auto
int property CivilWarQuestsMult = 2 auto
int property MiscQuestsNom = 10 auto
int property WarriorSkillNom = 5 auto
int property BrawlsWonNom = 5 auto
int property PersuasionsNom = 10 auto

int property CollegeWinterholdQuestsNom = 2 auto
int property BribesNom = 10 auto
int property IntimidationsNom = 10 auto
int property ZombieTimePowNom = 5 auto
int property SoulsTrappedNom = 50 auto
int property BlackSoulTrapNom = 5 auto
int property BooksReadNom = 50 auto
int property ArcaneMasteryNom = 5 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTY VALUES FOR REPUTATION STATISTIC MAXIMUM VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property QuestFameMax = 115 auto
int property QuestDaedricMax = 100 auto
int property QuestAedricMax = 117 auto
int property QuestCrimeMax = 69 auto
int property QuestLawMax = 110 auto
int property QuestDependabilityMax = 191 auto
int property QuestAmbitionMax = 192 auto

int property QuestsCompletedMax = 200 auto
int property LocationsMax = 300 auto
int property DungeonsMax = 150 auto
int property PeopleKillsMax = 1000 auto
int property StoreInvestmentsMax = 30 auto
int property HousesOwnedMax = 10 auto
int property DragonKillsMax = 50 auto
int property DragonPriestKillsMax = 15 auto

int property LycanthropyMax = 100 auto
int property VampirismMax = 100 auto
int property CannibalFeedMax = 500 auto

int property VampireRaceCont = 15 auto
int property NecksBittenMax = 5000 auto
int property VampiricSpellSeenMax = 5000 auto
int property VampireLordTransformationMax = 5000 auto
int property VampireLordSeenMax = 1000 auto
int property VampireVillagerMax = 5000 auto
int property VampireGuardMax = 1000 auto

int property WerewolfRaceCont = 17 auto
int property WerewolfMaulMax = 1000 auto
int property WerewolfTransformationsMax = 5000 auto
int property WerewolfFeedsMax = 1000 auto
int property TimesSpottedWerewolfMax = 1000 auto
int property WerewolfVillagerMax = 5000 auto
int property WerewolfGuardMax = 1000 auto

int property CharityMax = 11 auto
int property DaedraKilledMax = 200 auto
int property UndeadKilledMax = 1000 auto

int property SpottedAssaultsMax = 100 auto
int property SpottedMurdersMax = 100 auto
int property SpottedPettyCrimeMax = 100 auto
int property MurdersMax = 100 auto
int property PocketsPickedMax = 100 auto
int property HorsesStolenMax = 50 auto
int property ItemsStolenMax = 1000 auto
int property TrespassesMax = 100 auto
int property JailEscapesMax = 25 auto
int property DaysJailedMax = 150 auto
int property FinesPayedMax = 30000 auto
int property ThievesGuildQuestsMax = 100 auto
int property DarkBrotherhoodQuestsMax = 50 auto

int property CompanionsQuestsMax = 100 auto
int property CivilWarQuestsMax = 10 auto
int property BanditsKilledMax = 1000 auto
int property WizardKillerMax = 300 auto
int property WitchKillerMax = 150 auto
int property ForswornKillerMax = 500 auto
int property MiscQuestsMax = 200 auto
int property BrawlsWonMax = 25 auto
int property PersuasionsMax = 50 auto

int property CollegeWinterholdQuestsMax = 20 auto
int property BribesMax = 50 auto
int property IntimidationsMax = 50 auto
int property ZombieTimeMax = 500 auto
int property SoulsTrappedMax = 500 auto
int property BlackSoulTrapMax = 100 auto
int property BooksReadMax = 250 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTY VALUES FOR REPUTATION STATISTIC MINIMUM VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property NecksBittenMin = 10 auto
int property VampiricSpellSeenMin = 2 auto
int property VampireLordTransformationMin = 8 auto
int property VampireLordSeenMin = 15 auto
int property VampireVillagerMin = 10 auto
int property VampireGuardMin = 4 auto

int property WerewolfTransformationsMin = 5 auto
Int property WerewolfMaulMin = 3 auto
int property WerewolfFeedsMin = 10 auto
int property TimesSpottedWerewolfMin = 15 auto
int property WerewolfVillagerMin = 10 auto
int property WerewolfGuardMin = 4 auto

int property SpottedAssaultsMin = 1 auto
int property SpottedMurdersMin = 3 auto
int property SpottedPettyCrimeMin = 1 auto

int property SpellNecromancySeenMin = 5 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROPERTY VALUES FOR REPUTATION STATISTIC DECREMENTING STAT TIME FRAMES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

float property NecksBittenDecTime = 6.0 auto
float property NecksBittenDecPerc = 0.00567 auto

float property VampSpellDecTime = 6.0 auto
float property SpellVampSpellDecPerc = 0.028 auto

float property VampLordTransDecTime = 6.0 auto
float property VampLordTransDecPerc = 0.004 auto

float property CrimeVampLordSeenDecTime = 6.0 auto
float property CrimeVampLordSeenPerc = 0.051 auto

float property CommentVampVillagerDecTime = 6.0 auto
float property CommentVampVillagerDecPerc = 0.00567 auto

float property CommentVampGuardDecTime = 6.0 auto
float property CommentVampGuardDecPerc = 0.064 auto

float property WerewolfMaulDecTime = 6.0 auto
float property WerewolfMaulDecPerc = 0.0032 auto

float property WerewolfTransDecTime = 6.0 auto
float property WerewolfTransDecPerc = 0.0015 auto

float property WerewolfFeedDecTime = 6.0 auto
float property WerewolfFeedDecPerc = 0.00115 auto

float property CrimeWereSeenDecTime = 6.0 auto
float property CrimeWereSeenDecPerc = 0.051 auto

float property CommentWereVillagerDecTime = 6.0 auto
float property CommentWereVillagerDecPerc = 0.00567 auto

float property CommentWereGuardDecTime = 6.0 auto
float property CommentWereGuardDecPerc = 0.064 auto

float property CrimePettySeenDecTime = 6.0 auto
float property CrimePettySeenDecPerc = 0.007 auto

float property CrimeAssaultsSeenDecTime = 6.0 auto
float property CrimeAssaultsSeenDecPerc = 0.012 auto

float property CrimeMurdersSeenDecTime = 6.0 auto
float property CrimeMurdersSeenDecPerc = 0.0136 auto

float property SpellNecromancySeenDecTime = 6.0 auto
float property NecroTimesDecreamentPerc = 0.00113 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR TRANSLATING TOTAL REPUTATION SCORES INTO GLOBAL VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GlobalVariable property SR_Global_CurrentFameLevel auto
GlobalVariable property SR_Global_Reputation auto
GlobalVariable property SR_Global_AedricDaedric auto
GlobalVariable property SR_Global_LawCrime auto
GlobalVariable property SR_Global_DependabilityAmbition auto
GlobalVariable property SR_Global_VampireSuspicion auto
GlobalVariable property SR_Global_WerewolfSuspicion auto

Int property FameThresholdOne = 4 auto
Int property FameThresholdTwo = 12 auto
Int property FameThresholdThree = 25 auto
Int property FameThresholdFour = 50 auto

float property TotalVampirismScore = 0.0 auto
float property TotalLycanthropyScore = 0.0 auto
float property AedricDampenerVeryLow = 0.90 auto
float property AedricDampenerLow = 0.85 auto
float property AedricDampenerMed = 0.80 auto
float property AedricDampenerHigh = 0.75 auto

float property TotalFameScore = 0.0 auto
float property TotalDaedricScore = 0.0 auto
float property TotalAedricScore = 0.0 auto
float property TotalCrimeScore = 0.0 auto
float property TotalLawScore = 0.0 auto
float property TotalAmbitionScore = 0.0 auto
float property TotalDependabilityScore = 0.0 auto

float property RepDifferenceLarge = 2.2 auto
float property RepDifferenceMedium = 1.7 auto
float property RepDifferenceSmall = 1.2 auto

float property MoralDifferenceLarge = 2.3 auto
float property MoralDifferenceMedium = 1.7 auto
float property MoralDifferenceSmall = 1.1 auto

Function SetReputationGlobal()
	float Fame 		= TotalFameScore as float
	float Daedric 	= TotalDaedricScore as float
	float Aedric 	= TotalAedricScore as float
	float Crime 	= TotalCrimeScore as float
	float Law 		= TotalLawScore as float
	float Ambition 	= TotalAmbitionScore as float
	float Dependability = TotalDependabilityScore as float
	float FameLevelOne 	= FameThresholdOne as float
	float FameLevelTwo 	= FameThresholdTwo as float
	float FameLevelThree = FameThresholdThree as float
	float FameLevelFour = FameThresholdFour as float
	float RepDiffLarge 	= RepDifferenceLarge as float
	float RepDiffMedium = RepDifferenceMedium as float
	float RepDiffSmall 	= RepDifferenceSmall as float
	
	Float totalPositive = Aedric + Law + (Dependability/2.0)
	Float totalNegative = Daedric + Crime + (Ambition/2.0)
	
	if (Fame > FameLevelFour)
		if (totalPositive > (RepDiffLarge*totalNegative))
			SR_Global_Reputation.SetValue(8); Worshipped
			;Debug.Notification ("Reputation: Worshipped")
		elseif (totalPositive > (RepDiffMedium*totalNegative))
			SR_Global_Reputation.SetValue(6); Admired
			;Debug.Notification ("Reputation: Admired")
		elseif (totalPositive > (RepDiffSmall*totalNegative))
			SR_Global_Reputation.SetValue(4); Liked
			;Debug.Notification ("Reputation: Liked")
		elseif (totalNegative > (RepDiffLarge*totalPositive))
			SR_Global_Reputation.SetValue(7); Feared
			;Debug.Notification ("Reputation: Feared")
		elseif (totalNegative > (RepDiffMedium*totalPositive))
			SR_Global_Reputation.SetValue(5); Hated
			;Debug.Notification ("Reputation: Hated")
		elseif (totalNegative > (RepDiffSmall*totalPositive))
			SR_Global_Reputation.SetValue(3); Disliked
			;Debug.Notification ("Reputation: Disliked")
		else
			SR_Global_Reputation.SetValue(2); Neutral
			;Debug.Notification ("Reputation: Neutral")
		endIf
		SR_Global_CurrentFameLevel.SetValue(4)
	elseif (Fame > FameLevelThree)
		if (totalPositive > (RepDiffLarge*totalNegative))
			SR_Global_Reputation.SetValue(6); Admired
			;Debug.Notification ("Reputation: Admired")
		elseif (totalPositive > (RepDiffMedium*totalNegative))
			SR_Global_Reputation.SetValue(4); Liked
			;Debug.Notification ("Reputation: Liked")
		elseif (totalNegative > (RepDiffLarge*totalPositive))
			SR_Global_Reputation.SetValue(5); Hated
			;Debug.Notification ("Reputation: Hated")
		elseif (totalNegative > (RepDiffMedium*totalPositive))
			SR_Global_Reputation.SetValue(3); Disliked
			;Debug.Notification ("Reputation: Disliked")
		else
			SR_Global_Reputation.SetValue(2); Neutral
			;Debug.Notification ("Reputation: Neutral")
		endIf
		SR_Global_CurrentFameLevel.SetValue(3)
	elseif (Fame > FameLevelTwo)
		if (totalPositive > (RepDiffLarge*totalNegative))
			SR_Global_Reputation.SetValue(4); Liked
			;Debug.Notification ("Reputation: Liked")
		elseif (totalNegative > (RepDiffLarge*totalPositive))
			SR_Global_Reputation.SetValue(3); Disliked
			;Debug.Notification ("Reputation: Disliked")
		else
			SR_Global_Reputation.SetValue(2); Neutral
			;Debug.Notification ("Reputation: Neutral")
		endIf
		SR_Global_CurrentFameLevel.SetValue(2)
	elseif (Fame > FameLevelOne)
		SR_Global_Reputation.SetValue(1); Unknown
		;Debug.Notification ("Reputation: Unknown")
		SR_Global_CurrentFameLevel.SetValue(1)
	else
		SR_Global_Reputation.SetValue(0); Unknown (zero fame)
		;Debug.trace ("Reputation: Unknown - zero fame")
		SR_Global_CurrentFameLevel.SetValue(0)
	endIf
	
EndFunction

Function SetAedricDaedricGlobal()
	float Daedric = TotalDaedricScore as float
	float Aedric = TotalAedricScore as float
	float MoralityDiffLarge = MoralDifferenceLarge as float
	float MoralityDiffMedium = MoralDifferenceMedium as float
	float MoralityDiffSmall 	= MoralDifferenceSmall as float
	if (Aedric > (MoralityDiffLarge*Daedric))
		SR_Global_AedricDaedric.SetValue(1); High Aedric
		;Debug.Notification ("High Aedric")
	elseif (Aedric > (MoralityDiffMedium*Daedric))
		SR_Global_AedricDaedric.SetValue(2); Medium Aedric
		;Debug.Notification ("Medium Aedric")
	elseif (Aedric > (MoralityDiffSmall*Daedric))
		SR_Global_AedricDaedric.SetValue(3); Low SAedric
		;Debug.Notification ("Low Aedric")
	elseif (Daedric > (MoralityDiffLarge*Aedric))
		SR_Global_AedricDaedric.SetValue(6); High Daedric
		;Debug.Notification ("High Daedric")
	elseif (Daedric > (MoralityDiffMedium*Aedric))
		SR_Global_AedricDaedric.SetValue(5); Medium Daedric
		;Debug.Notification ("Medium Daedric")
	elseif (Daedric > (MoralityDiffSmall*Aedric))
		SR_Global_AedricDaedric.SetValue(4); Low Daedric
		;Debug.Notification ("Low Daedric")
	else
		SR_Global_AedricDaedric.SetValue(0); Neutral
	endIf
EndFunction

Function SetLawCrimeGlobal()
	float Crime = TotalCrimeScore as float
	float Law = TotalLawScore as float
	float MoralityDiffLarge = MoralDifferenceLarge as float
	float MoralityDiffMedium = MoralDifferenceMedium as float
	float MoralityDiffSmall 	= MoralDifferenceSmall as float
	if (Law > (MoralityDiffLarge*Crime))
		SR_Global_LawCrime.SetValue(1); High Law
		;Debug.Notification ("High Law")
	elseif (Law > (MoralityDiffMedium*Crime))
		SR_Global_LawCrime.SetValue(2); Medium Law
		;Debug.Notification ("Medium Law")
	elseif (Law > (MoralityDiffSmall*Crime))
		SR_Global_LawCrime.SetValue(3); Low Law
		;Debug.Notification ("Low Law")
	elseif (Crime > (MoralityDiffLarge*Law))
		SR_Global_LawCrime.SetValue(6); High Crime
		;Debug.Notification ("High Crime")
	elseif (Crime > (MoralityDiffMedium*Law))
		SR_Global_LawCrime.SetValue(5); Medium Crime
		;Debug.Notification ("Medium Crime")
	elseif (Crime > (MoralityDiffSmall*Law))
		SR_Global_LawCrime.SetValue(4); Low Crime
		;Debug.Notification ("Low Crime")
	else
		SR_Global_LawCrime.SetValue(0); Neutral
	endIf
EndFunction

Function SetDependabilityAmbitionGlobal()
	float Ambition = TotalAmbitionScore as float
	float Dependability = TotalDependabilityScore as float
	float MoralityDiffLarge = MoralDifferenceLarge as float
	float MoralityDiffMedium = MoralDifferenceMedium as float
	float MoralityDiffSmall 	= MoralDifferenceSmall as float
	if (Dependability > (MoralityDiffLarge*Ambition))
		SR_Global_DependabilityAmbition.SetValue(1); High Dependability
		;Debug.Notification ("High Dependability")
	elseif (Dependability > (MoralityDiffMedium*Ambition))
		SR_Global_DependabilityAmbition.SetValue(2); Medium Dependability
		;Debug.Notification ("Medium Dependability")
	elseif (Dependability > (MoralityDiffSmall*Ambition))
		SR_Global_DependabilityAmbition.SetValue(3); Low Dependability
		;Debug.Notification ("Low Dependability")
	elseif (Ambition > (MoralityDiffLarge*Dependability))
		SR_Global_DependabilityAmbition.SetValue(6); High Ambition
		;Debug.Notification ("High Ambition")
	elseif (Ambition > (MoralityDiffMedium*Dependability))
		SR_Global_DependabilityAmbition.SetValue(5); Medium Ambition
		;Debug.Notification ("Medium Ambition")
	elseif (Ambition > (MoralityDiffSmall*Dependability))
		SR_Global_DependabilityAmbition.SetValue(4); Low Ambition
		;Debug.Notification ("Low Ambition")
	else
		SR_Global_DependabilityAmbition.SetValue(0); Neutral
	endIf
EndFunction

; Tweaks - Remove duplicate code for this and werewolf score

Function SetVampirismSuspicionScore()
	float VampirismScore = TotalVampirismScore as float
	float VampireMax = VampirismMax as float
	float DampenerHigh = AedricDampenerHigh as float
	float DampenerMed = AedricDampenerMed as float
	float DampenerLow = AedricDampenerLow as float
	float DampenerVeryLow = AedricDampenerVeryLow as float
	int AedricDaedricGlobal = SR_Global_AedricDaedric.GetValue() as int
	
	Float adjustedScore = VampirismScore
	
	If AedricDaedricGlobal == 1
		adjustedScore *= DampenerHigh
	ElseIf AedricDaedricGlobal == 2
		adjustedScore *= DampenerMed
	ElseIf AedricDaedricGlobal == 3
		adjustedScore *= DampenerLow
	ElseIf AedricDaedricGlobal == 0
		adjustedScore *= DampenerVeryLow
;	Else
;		; Unchanged - Player has higher daedric than aedric score
	EndIf

	if(adjustedScore >= (VampireMax*0.90))
		SR_Global_VampireSuspicion.SetValue(9);
	elseif(adjustedScore >= (VampireMax*0.80))
		SR_Global_VampireSuspicion.SetValue(8);
	elseif(adjustedScore >= (VampireMax*0.70))
		SR_Global_VampireSuspicion.SetValue(7);
	elseif(adjustedScore >= (VampireMax*0.60))
		SR_Global_VampireSuspicion.SetValue(6);
	elseif(adjustedScore >= (VampireMax*0.50))
		SR_Global_VampireSuspicion.SetValue(5);
	elseif(adjustedScore>= (VampireMax*0.40))
		SR_Global_VampireSuspicion.SetValue(4);
	elseif(adjustedScore >= (VampireMax*0.30))
		SR_Global_VampireSuspicion.SetValue(3);
	elseif(adjustedScore>= (VampireMax*0.20))
		SR_Global_VampireSuspicion.SetValue(2);
	elseif(adjustedScore>= (VampireMax*0.10))
		SR_Global_VampireSuspicion.SetValue(1);
	else
		SR_Global_VampireSuspicion.SetValue(0);
	endif
EndFunction

Function SetWerewolfSuspicionScore()
	float WerewolfScore = TotalLycanthropyScore as float
	float WerewolfMax = LycanthropyMax
	float DampenerHigh = AedricDampenerHigh as float
	float DampenerMed = AedricDampenerMed as float
	float DampenerLow = AedricDampenerLow as float
	float DampenerVeryLow = AedricDampenerVeryLow as float
	Int AedricDaedricGlobal = SR_Global_AedricDaedric.GetValue() as Int
	
	Float adjustedScore = WerewolfScore
	
	If AedricDaedricGlobal == 1 ; High Aedric
		adjustedScore *= DampenerHigh
	ElseIf AedricDaedricGlobal == 2 ; Medium Aedric
		adjustedScore *= DampenerMed
	ElseIf AedricDaedricGlobal == 3 ; Low Aedric
		adjustedScore *= DampenerLow
	ElseIf AedricDaedricGlobal == 0 ; Neutral
		adjustedScore *= DampenerVeryLow
;	Else ; Daedric

	EndIf
	
	if adjustedScore >= (WerewolfMax*0.90)
		SR_Global_WerewolfSuspicion.SetValue(9);
	elseif adjustedScore >= (WerewolfMax*0.80)
		SR_Global_WerewolfSuspicion.SetValue(8);
	elseif adjustedScore >= (WerewolfMax*0.70)
		SR_Global_WerewolfSuspicion.SetValue(7);
	elseif adjustedScore >= (WerewolfMax*0.60)
		SR_Global_WerewolfSuspicion.SetValue(6);
	elseif adjustedScore >= (WerewolfMax*0.50)
		SR_Global_WerewolfSuspicion.SetValue(5);
	elseif adjustedScore >= (WerewolfMax*0.40)
		SR_Global_WerewolfSuspicion.SetValue(4);
	elseif adjustedScore >= (WerewolfMax*0.30)
		SR_Global_WerewolfSuspicion.SetValue(3);
	elseif adjustedScore >= (WerewolfMax*0.20)
		SR_Global_WerewolfSuspicion.SetValue(2);
	elseif adjustedScore >= (WerewolfMax*0.10)
		SR_Global_WerewolfSuspicion.SetValue(1);
	else
		SR_Global_WerewolfSuspicion.SetValue(0);
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR ADDING TRACKED AND PLAYER STATS TO THE INDIVIDUAL QUEST SCORES  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetTotalFameScore()
	Float QuestFameScore 	= QuestFameScore() as float
	Float QuestsCompleted 	= QuestsCompletedScore() as float
	Float Locations 		= LocationsScore() as float
	Float Dungeons 			= DungeonsScore() as float
	Float SpottedMurders 	= SpottedMurderScore() as float
	Float PeopleKills 		= KillScore() as float
	Float StoreInvestments 	= StoreInvestmentScore() as float
	Float HousesOwned 		= HousesOwnedScore() as float
	Float DragonKills 		= DragonKillScore() as float
	Float DragonPriestKills = DragonPriestKillScore() as float
	Float FameSmall 		= ExtFameSmallScore() as float
	Float FameMedium 		= ExtFameMediumScore() as float
	Float FameLarge 		= ExtFameLargeScore() as float
	Float QuestsCompNom 	= QuestsCompletedNom as float
	Float LocNom 			= LocationsNom as float
	Float DungeonNom 		= DungeonsNom as float
	Float SpottedMurderMult	= SpottedMurdersFameMult as float
	Float SpottedMurderNom 	= SpottedMurdersFameNom as float
	Float PeopleKillNom 	= PeopleKillsNom as float
	Float StoreInvestNom 	= StoreInvestmentsNom as float
	Float HousesNom 		= HousesOwnedNom as float
	Float DragonKillNom 	= DragonKillsNom as float
	Float DragonPriestKillNom = DragonPriestKillsNom as float
	Float FameSmallNom 		= ExtFameSmallNom as float
	Float FameMediumNom 	= ExtFameMediumNom as float
	Float FameLargeNom 		= ExtFameLargeNom as float
	Float FameScore = (QuestFameScore+((SpottedMurders*SpottedMurderMult)/SpottedMurderNom)+(QuestsCompleted/QuestsCompNom)+(Locations/LocNom)+(Dungeons/DungeonNom)+(PeopleKills/PeopleKillNom)+(StoreInvestments/StoreInvestNom)+(HousesOwned/HousesNom)+(DragonKills/DragonKillNom)+(DragonPriestKills/DragonPriestKillNom)+(FameSmall/FameSmallNom)+(FameMedium/FameMediumNom)+(FameLarge/FameLargeNom))
	
	FameScore *= SRTFameMult.GetValue()
	
	if(FameScore > 0.0)
		TotalFameScore = FameScore
	else
		TotalFameScore = 0.0
	endif
EndFunction

Function SetTotalDaedricScore()
	Float QuestDaedricScore = QuestDaedricScore() as float
	Float RaceScoreDaedric 	= RaceScore(1) as float
	Float Vampirism 		= TotalVampirismScore as float
	Float Lycanthropy 		= TotalLycanthropyScore as float
	Float CannibalFeed 		= CannibalFeedScore() as float
	Float ZombieTime 		= AdjNecroTimesScore() as float
	Float ConjurationSkill 	= ConjurationScore() as float
	Float DaedricSmall 		= ExtDaedricSmallScore() as float
	Float DaedricMedium 	= ExtDaedricMediumScore() as float
	Float DaedricLarge 		= ExtDaedricLargeScore() as float
	Float ZombieTimeDeadricNom = ZombieTimeDeaNom as float
	Float VampirisNom 		= VampirismNom as float
	Float LycanthrophNom 	= LycanthropyNom as float
	Float CannibalFeedsNom 	= CannibalFeedNom as float
	Float ConjurationNom 	= ConjurationSkillNom as float
	Float DaedricSmallNom 	= ExtDaedricSmallNom as float
	Float DaedricMediumNom 	= ExtDaedricMediumNom as float
	Float DaedricLargeNom	= ExtDaedricLargeNom as float
	Float DaedricScore = (QuestDaedricScore+RaceScoreDaedric+(ZombieTime/ZombieTimeDeadricNom)+(Vampirism/VampirisNom)+(Lycanthropy/LycanthrophNom)+(CannibalFeed/CannibalFeedsNom)+(ConjurationSkill/ConjurationNom)+(DaedricSmall/DaedricSmallNom)+(DaedricMedium/DaedricMediumNom)+(DaedricLarge/DaedricLargeNom))
	
	DaedricScore *= SRTDaedricMult.GetValue()
	
	if(DaedricScore > 0.0)
		TotalDaedricScore = DaedricScore
	else
		TotalDaedricScore = 0.0
	endif
EndFunction

Function SetTotalAedricScore()
	Float QuestAedricScore 	= QuestAedricScore() as float
	Float CharityAdded		= CharityScore() as float
	Float RestorationSkill 	= RestorationScore() as float
	Float UndeadKilled 		= UndeadKilledScore() as float
	Float DaedraKilled 		= DaedraKilledScore() as float
	Float RaceScoreAedric 	= RaceScore(2) as float
	Float AedricSmall 		= ExtAedricSmallScore() as float
	Float AedricMedium 		= ExtAedricMediumScore() as float
	Float AedricLarge 		= ExtAedricLargeScore() as float
	Float CharityAddedNom 	= CharityNom as float
	Float RestorationNom 	= RestorationSkillNom as float
	Float DaedraKillsNom 	= DaedraKilledNom as float
	Float UndeadKillsNom 	= UndeadKilledNom as float
	Float AedricSmallNom 	= ExtAedricSmallNom as float
	Float AedricMediumNom 	= ExtAedricMediumNom as float
	Float AedricLargeNom 	= ExtAedricLargeNom as float
	Float AedricScore = (QuestAedricScore+RaceScoreAedric+(CharityAdded/CharityAddedNom)+(RestorationSkill/RestorationNom)+(DaedraKilled/DaedraKillsNom)+(UndeadKilled/UndeadKillsNom)+(AedricSmall/AedricSmallNom)+(AedricMedium/AedricMediumNom)+(AedricLarge/AedricLargeNom))
	
	AedricScore *= SRTAedricMult.GetValue()
	
	if(AedricScore > 0.0)
		TotalAedricScore = AedricScore
	else
		TotalAedricScore = 0.0
	endif
EndFunction

Function SetTotalCrimeScore()
	Float QuestCrimeScore 	= QuestCrimeScore() as float
	Float SpottedAssaults 	= AdjSpottedAssaultScore() as float
	Float SpottedMurders 	= AdjSpottedMurderScore() as float
	Float SpottedPettyCrime = AdjSpottedPettyCrimeScore() as float
	Float Murders 			= MurderScore() as float
	Float HorsesStolen 		= HorsesStolenScore() as float
	Float PocketsPicked 	= PocketsPickedScore() as float
	Float ItemsStolen 		= ItemsStolenScore() as float
	Float Trespasses 		= TrespassScore() as float
	Float JailEscapes 		= JailEscapeScore() as float
	Float ThievesGuildQuests = ThievesGuildeScore() as float
	Float DarkBrotherhoodQuests = DarkBrotherhoodScore() as float
	Float DaysJailed 		= DaysJailedScore() as float
	Float FinesPayed 		= FinesPayedScore() as float
	Float RaceScoreCrime 	= RaceScore(3) as float
	Float CrimeSmall 		= ExtCrimeSmallScore() as float
	Float CrimeMedium 		= ExtCrimeMediumScore() as float
	Float CrimeLarge 		= ExtCrimeLargeScore() as float
	Float MurderNom 		= MurdersNom as float
	Float PocketPickNom 	= PocketsPickedNom as float
	Float HorseStolenNom 	= HorsesStolenNom as float
	Float ItemStolenNom 	= ItemsStolenNom as float
	Float TrespassNom 		= TrespassesNom as float
	Float JailEscapeNom 	= JailEscapesNom as float
	Float ThievesGuildQuestNom = ThievesGuildQuestsNom as float
	Float DarkBrotherhoodQuestNom = DarkBrotherhoodQuestsNom as float
	Float DaysJailNom 		= DaysJailedNom as float
	Float FinePayedNom 		= FinesPayedNom as float
	Float CrimeSmallNom 	= ExtCrimeSmallNom as float
	Float CrimeMediumNom 	= ExtCrimeMediumNom as float
	Float CrimeLargeNom 	= ExtCrimeLargeNom as float
	Float CrimeScore = ((QuestCrimeScore+RaceScoreCrime+SpottedAssaults+SpottedMurders+SpottedPettyCrime+(Murders/MurderNom)+(PocketsPicked/PocketPickNom)+(HorsesStolen/HorseStolenNom)+(ItemsStolen/ItemStolenNom)+(Trespasses/TrespassNom)+(JailEscapes/JailEscapeNom)+(ThievesGuildQuests/ThievesGuildQuestNom)+(DarkBrotherhoodQuests/DarkBrotherhoodQuestNom)+(CrimeSmall/CrimeSmallNom)+(CrimeMedium/CrimeMediumNom)+(CrimeLarge/CrimeLargeNom))-((DaysJailed/DaysJailNom)+(FinesPayed/FinePayedNom)))
	
	CrimeScore *= SRTCrimeMult.GetValue()
	
	if(CrimeScore > 0.0)
		TotalCrimeScore = CrimeScore
	else
		TotalCrimeScore = 0.0
	endif
EndFunction

Function SetTotalLawScore()
	Float QuestLawScore 	= QuestLawScore() as float
	Float CompanionsQuests 	= CompanionsScore() as float
	Float BanditsKilled 	= BanditKillerScore() as float
	Float WizardsKilled 	= WizardKillerScore() as float
	Float WitchesKilled 	= WitchKillerScore() as float
	Float ForswornKilled 	= ForswornKillerScore() as float
	Float RaceScoreLaw 		= RaceScore(4) as float
	Float LawSmall 			= ExtLawSmallScore() as float
	Float LawMedium 		= ExtLawMediumScore() as float
	Float LawLarge 			= ExtLawLargeScore() as float
	Float CompanionsQuestLawNom = CompanionsQuestsLawNom as float
	Float BanditsKillsNom 	= BanditsKilledNom as float
	Float WizardKillsNom 	= WizardKillerNom as float
	Float WitchKillsNom 	= WitchKillerNom as float
	Float ForswornKillsNom 	= ForswornKillerNom as float
	Float LawSmallNom 		= ExtLawSmallNom as float
	Float LawMediumNom 		= ExtLawMediumNom as float
	Float LawLargeNom 		= ExtLawLargeNom as float
	Float LawScore = (QuestLawScore+RaceScoreLaw+(CompanionsQuests/CompanionsQuestLawNom)+(BanditsKilled/BanditsKillsNom)+(WizardsKilled/WizardKillsNom)+(WitchesKilled/WitchKillsNom)+(ForswornKilled/ForswornKillsNom)+(LawSmall/LawSmallNom)+(LawMedium/LawMediumNom)+(LawLarge/LawLargeNom))
	
	LawScore *= SRTLawMult.GetValue()
	
	if(LawScore > 0.0)
		TotalLawScore = LawScore
	else
		TotalLawScore = 0.0
	endif
EndFunction

Function SetTotalDependabilityScore()
	Float QuestDependabilityScore = QuestDependabilityScore() as float
	Float BrawlsWon 		= BrawlsWonScore() as float
	Float Persuasions 		= PersuasionScore() as float
	Float CompanionsQuests 	= CompanionsScore() as float
	Float MiscQuests 		= MiscQuestsScore() as float
	Float CivilWarQuests 	= CivilWarQuestsScore() as float
	Float WarriorSkill 		= WarriorSkillScore() as float
	Float RaceScoreDependability = RaceScore(5) as float
	Float DependabilitySmall = ExtAmbitionSmallScore() as float
	Float DependabilityMedium = ExtAmbitionMediumScore() as float
	Float DependabilityLarge = ExtAmbitionLargeScore() as float
	Float CompanionsQuestDepNom = CompanionsQuestsDepNom as float
	Float CivilWarQuestMult = CivilWarQuestsMult as float
	Float CivilWarQuestNom 	= CivilWarQuestsNom as float
	Float MiscQuestNom 		= MiscQuestsNom as float
	Float WarriorSkillsNom 	= WarriorSkillNom as float
	Float BrawlWonNom 		= BrawlsWonNom as float
	Float PersuasionNom 	= PersuasionsNom as float
	Float DependabilitySmallNom = ExtDependabilitySmallNom as float
	Float DependabilityMediumNom = ExtDependabilityMediumNom as float
	Float DependabilityLargeNom = ExtDependabilityLargeNom as float
	Float DependabilityScore = (QuestDependabilityScore+RaceScoreDependability+(CompanionsQuests/CompanionsQuestDepNom)+((CivilWarQuests*CivilWarQuestMult)/CivilWarQuestNom)+(MiscQuests/MiscQuestNom)+(WarriorSkill/WarriorSkillsNom)+(BrawlsWon/BrawlWonNom)+(Persuasions/PersuasionNom)+(DependabilitySmall/DependabilitySmallNom)+(DependabilityMedium/DependabilityMediumNom)+(DependabilityLarge/DependabilityLargeNom))
	
	DependabilityScore *= SRTDependabilityMult.GetValue()
	
	if(DependabilityScore > 0.0)
		TotalDependabilityScore = DependabilityScore
	else
		TotalDependabilityScore = 0.0
	endif
EndFunction

Function SetTotalAmbitionScore()
	Float QuestAmbitionScore = QuestAmbitionScore() as float
	Float Bribes			= BribeScore() as float
	Float Intimidations 	= IntimidationScore() as float
	Float BlackSoulsTrapped = BlackSoulTrapScore() as float
	Float SoulsTrapped 		= SoulsTrappedScore() as float
	Float BooksRead 		= BooksReadScore() as float
	Float ZombieTime 		= AdjNecroTimesScore() as float
	Float ArcaneMastery 	= ArcaneMasteryScore() as float
	Float CollegeWinterholdQuests = CollegeWinterholdScore() as float
	Float RaceScoreAmbition = RaceScore(6) as float
	Float AmbitionSmall 	= ExtDependabilitySmallScore() as float
	Float AmbitionMedium	= ExtDependabilityMediumScore() as float
	Float AmbitionLarge		= ExtDependabilityLargeScore() as float
	Float CollegeWinterholdQuestNom = CollegeWinterholdQuestsNom as float
	Float BribeNom 			= BribesNom as float
	Float IntimidationNom 	= IntimidationsNom as float
	Float BlackSoulTrapsNom = BlackSoulTrapNom as float
	Float SoulsTrapsNom 	= SoulsTrappedNom as float
	Float BooksReadsNom 	= BooksReadNom as float
	Float ArcaneMasterNom 	= ArcaneMasteryNom as float
	Float AmbitionSmallNom 	= ExtAmbitionSmallNom as float
	Float AmbitionMediumNom = ExtAmbitionMediumNom as float
	Float AmbitionLargeNom 	= ExtAmbitionLargeNom as float
	Float AmbitionScore = (QuestAmbitionScore+RaceScoreAmbition+(CollegeWinterholdQuests/CollegeWinterholdQuestNom)+(Bribes/BribeNom)+(Intimidations/IntimidationNom)+ZombieTime+(BlackSoulsTrapped/BlackSoulTrapsNom)+(SoulsTrapped/SoulsTrapsNom)+(BooksRead/BooksReadsNom)+(ArcaneMastery/ArcaneMasterNom)+(AmbitionSmall/AmbitionSmallNom)+(AmbitionMedium/AmbitionMediumNom)+(AmbitionLarge/AmbitionLargeNom))
	
	AmbitionScore *= SRTAmbitionMult.GetValue()
	
	if(AmbitionScore > 0.0)
		TotalAmbitionScore = AmbitionScore
	else
		TotalAmbitionScore = 0.0
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR THE SECONDARY REPUTATION STATS OF ASSAULTS, MURDERS AND PETTY CRIME
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Float Function AdjSpottedAssaultScore()
	float SpottedAssaults = SpottedAssaultScore() as float
	float SpottedAssaultsMultiplier = SpottedAssaultsMult as float
	float SpottedAssaultsDenominator = SpottedAssaultsNom as float
	float SpottedAssaultsDecreament = SpottedAssaultDecreamentScore()
	float AdjSpottedAssaults = (((SpottedAssaults*SpottedAssaultsMultiplier)/SpottedAssaultsDenominator)-SpottedAssaultsDecreament)

	Return fMax(0.0, AdjSpottedAssaults)
EndFunction

Float Function AdjSpottedMurderScore()
	float SpottedMurders = SpottedMurderScore() as float
	float CrimeMurdersSeenMultiplier = SpottedMurdersMult as float
	float CrimeMurdersSeenDenominator = SpottedMurdersNom as float
	float SpottedMurdersDecreament = SpottedMurderDecreamentScore()
	float AdjSpottedMurders = (((SpottedMurders*CrimeMurdersSeenMultiplier)/CrimeMurdersSeenDenominator)-SpottedMurdersDecreament)

	Return fMax(0.0, AdjSpottedMurders)
EndFunction

Float Function AdjSpottedPettyCrimeScore()
	float SpottedPettyCrime = SpottedPettyCrimeScore() as float
	float SpottedPettyCrimeDenominator = SpottedPettyCrimeNom as float
	float SpottedPettyCrimeDecreament = SpottedPettyCrimeDecreamentScore()
	float AdjSpottedPettyCrime = ((SpottedPettyCrime/SpottedPettyCrimeDenominator)-SpottedPettyCrimeDecreament)

	Return fMax(0.0, AdjSpottedPettyCrime)
EndFunction

Float Function AdjNecroTimesScore()
	float NecromancyTimesScore = NecroTimesScore() as float
	float SpellNecromancySeenDenominator = ZombieTimePowNom as float
	float NecromancyTimesDecreament = NecroTimesDecreamentScore()
	float AdjNecromancyTimesScore = (NecromancyTimesScore/SpellNecromancySeenDenominator)-NecromancyTimesDecreament

	Return fMax(0.0, AdjNecromancyTimesScore)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR THE SECONDARY REPUTATION STATS OF VAMPIRE SUSPISION, WEREWOLF SUSPSION AND FORSWORN ALLEGIENCE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetTotalVampirismScore()
	float IsVampire = PlayerIsVampireScore() as float
	float NecksBitten = AdjNecksBittenScore() as float
	float BloodMagicSeen = AdjVampiricSpellSeenScore() as float
	float VampireLord = AdjVampireLordTransformationScore() as float
	float VampireLordSeen = AdjVampireLordSeenScore() as float
	float VillagerComments = AdjCommentVampireVillagerScore() as float
	float GuardIncidents = AdjCommentVampireGuardScore() as float
	float ExtraVampirismSmall = AdjExtVampirismSmallScore() as float
	float ExtraVampirismLarge = AdjExtVampirismLargeScore() as float
	float VampireMax = VampirismMax as float
	float VampirismScore = (IsVampire+NecksBitten+BloodMagicSeen+VampireLord+VampireLordSeen+VillagerComments+GuardIncidents+ExtraVampirismSmall+ExtraVampirismLarge)
	
	VampirismScore *= SRTVampireMult.GetValue()

	TotalVampirismScore = fMin(VampirismScore, VampireMax)
EndFunction

Float Function AdjNecksBittenScore()
	float NecksBitten = NecksBittenScore() as Float
	float NecksBittenDenominator = NecksBittenNom as Float
	float NecksBittenDecreament  = NecksBittenDecreamentScore()
	float AdjNecksBitten = ((NecksBitten/NecksBittenDenominator)-NecksBittenDecreament)

	Return fMax(0.0, AdjNecksBitten)
EndFunction

Float Function AdjVampiricSpellSeenScore()
	float VampiricSpellSeen = VampiricSpellSeenScore() as float
	float VampiricSpellSeenMultiplier = VampiricSpellSeenMult as float
	float VampiricSpellSeenDenominator = VampiricSpellSeenNom as float
	float VampiricSpellSeenDecreament = VampiricSpellSeenDecreamentScore()
	float AdjVampiricSpellSeen = (((VampiricSpellSeen*VampiricSpellSeenMultiplier)/VampiricSpellSeenDenominator)-VampiricSpellSeenDecreament)

	Return fMax(0.0, AdjVampiricSpellSeen)
EndFunction

Float Function AdjVampireLordTransformationScore()
	float VampireLordTransformation = VampireLordTransformationScore()
	float VampireLordTransformationDenominator = VampireLordTransformationNom as float
	float VampireLordTransformationDecreament = VampireLordTransformationDecreamentScore()
	float AdjVampireLordTransformation = ((VampireLordTransformation/VampireLordTransformationDenominator)-VampireLordTransformationDecreament)

	Return fMax(0.0, AdjVampireLordTransformation)
EndFunction

Float Function AdjVampireLordSeenScore()
	float VampireLordSeen = VampireLordSeenScore() as float
	float VampireLordSeenMultiplier = VampireLordSeenMult as float
	float VampireLordSeenDenominator = VampireLordSeenNom as float
	float VampireLordSeenDecreament = VampireLordSeenDecreamentScore()
	float AdjVampireLordSeen = (((VampireLordSeen*VampireLordSeenMultiplier)/VampireLordSeenDenominator)-VampireLordSeenDecreament)

	Return fMax(0.0, AdjVampireLordSeen)
EndFunction

Float Function AdjCommentVampireVillagerScore()
	float VillagerComments = CommentVampireVillagerScore() as float
	float CommentVampVillagerDenominator = VampireVillagerNom as float
	float VillagerCommentsDecreament = CommentVampireVillagerDecreamentScore()
	float AdjCommentVampireVillager = ((VillagerComments/CommentVampVillagerDenominator)-VillagerCommentsDecreament)

	Return fMax(0.0, AdjCommentVampireVillager)
EndFunction

Float Function AdjCommentVampireGuardScore()
	float GuardIncidents = CommentVampireGuardScore() as float
	float VampireGuardMultiplier = VampireGuardMult as float
	float VampireGuardDenominator = VampireGuardNom as float
	float GuardIncidentsDecreament = CommentVampireGuardDecreamentScore()
	float AdjCommentVampireGuard = (((GuardIncidents*VampireGuardMultiplier)/VampireGuardDenominator)-GuardIncidentsDecreament)

	Return fMax(0.0, AdjCommentVampireGuard)
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetTotalLycanthropyScore()
	float IsWerewolf = PlayerIsWerewolfScore() as float
	float Mauls = AdjWerewolfMaulScore() as float
	float WerewolfTransformation = AdjWerewolfTransformationScore() as float
	float WerewolfFeeds= AdjWerewolfFeedingScore() as float
	float TimesSpottedWerewolf = AdjWerewolfSpottedScore() as float
	float VillagerComments = AdjCommentWerewolfVillagerScore() as float
	float GuardIncidents = AdjCommentWerewolfGuardScore() as float
	float ExtraLycanthropySmall = AdjExtLycanthropySmallScore() as float
	float ExtraLycanthropyLarge = AdjExtLycanthropyLargeScore() as float
	float LycanthropMax = LycanthropyMax as float
	float LycanthropyScore = (IsWerewolf+Mauls+WerewolfTransformation+WerewolfFeeds+TimesSpottedWerewolf+VillagerComments+GuardIncidents+ExtraLycanthropySmall+ExtraLycanthropyLarge)
	
	LycanthropyScore *= SRTWerewolfMult.GetValue()
	
	TotalLycanthropyScore = fMin(LycanthropyScore, LycanthropMax)
EndFunction

Float Function AdjWerewolfMaulScore()
	float WerewolfMaul = WerewolfMaulScore() as float
	float WerewolfMaulsDenominator = WerewolfMaulNom as float
	float WerewolfMaulDecreament = WerewolfMaulDecreamentScore()
	float AdjWerewolfMaul = ((WerewolfMaul/WerewolfMaulsDenominator)-WerewolfMaulDecreament)

	Return fMax(0.0, AdjWerewolfMaul)
EndFunction

Float Function AdjWerewolfTransformationScore()
	float WerewolfTransformation = WerewolfTransformationScore() as float
	float WerewolfTransformationsDenominator = WerewolfTransformationsNom as float
	float WerewolfTransformationDec = WerewolfTransformationDecreamentScore()
	float AdjWerewolfTransformations = ((WerewolfTransformation/WerewolfTransformationsDenominator)-WerewolfTransformationDec)

	Return fMax(0.0, AdjWerewolfTransformations)
EndFunction

Float Function AdjWerewolfFeedingScore()
	float WerewolfFeeds = WerewolfFeedingScore() as float
	float WerewolfFeedingDenominator = WerewolfFeedsNom as float
	float WerewolfFeedsDec = WerewolfFeedingDecreamentScore()
	float AdjWerewolfFeeding = ((WerewolfFeeds/WerewolfFeedingDenominator)-WerewolfFeedsDec)

	Return fMax(0.0, AdjWerewolfFeeding)
EndFunction

Float Function AdjWerewolfSpottedScore()
	float TimesSpottedWerewolf = WerewolfSpottedScore() as float
	float WerewolfSpottedMultiplier = TimesSpottedWerewolfMult as float
	float WerewolfSpottedDenominator = TimesSpottedWerewolfNom as float
	float TimesSpottedWerewolfDec = WerewolfSpottedDecreamentScore()
	float AdjWerewolfSpotted = (((TimesSpottedWerewolf*WerewolfSpottedMultiplier)/WerewolfSpottedDenominator)-TimesSpottedWerewolfDec)

	Return fMax(0.0, AdjWerewolfSpotted)
EndFunction

Float Function AdjCommentWerewolfVillagerScore()
	float VillagerComments = CommentWerewolfVillagerScore() as float
	float CommentWereVillagerDenominator = WerewolfVillagerNom as float
	float VillagerCommentsDec = CommentWerewolfVillagerDecreamentScore()
	float AdjCommentWerewolfVillager = ((VillagerComments/CommentWereVillagerDenominator)-VillagerCommentsDec)

	Return fMax(0.0, AdjCommentWerewolfVillager)
EndFunction

Float Function AdjCommentWerewolfGuardScore()
	float GuardIncidents = CommentWerewolfGuardScore() as float
	float WerewolfGuardMultiplier = WerewolfGuardMult as float
	float WerewolfGuardDenominator = WerewolfGuardNom as float
	float GuardIncidentsDec = CommentWerewolfGuardDecreamentScore()
	float AdjGuardIncidents = (((GuardIncidents*WerewolfGuardMultiplier)/WerewolfGuardDenominator)-GuardIncidentsDec)
	
	Return fMax(0.0, AdjGuardIncidents)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR CAPPING TRACKED STATS CONTRIBUTIONS TO REPUTATION SCORES  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GlobalVariable property SR_MCM_Override_QuestsCompleted auto
GlobalVariable property SR_MCM_Override_Locations auto
GlobalVariable property SR_MCM_Override_Dungeons auto
GlobalVariable property SR_MCM_Override_PeopleKills auto
GlobalVariable property SR_MCM_Override_StoreInvestments auto
GlobalVariable property SR_MCM_Override_HousesOwned auto
GlobalVariable property SR_MCM_Override_DragonsKilled auto
GlobalVariable property SR_MCM_Override_DragonPriestsKilled auto
GlobalVariable property SR_MCM_Override_NecksBitten auto
GlobalVariable property SR_MCM_Override_VampiricSpellSeen auto
GlobalVariable property SR_MCM_Override_VampireLordTransformations auto
GlobalVariable property SR_MCM_Override_VampireLordSeen auto
GlobalVariable property SR_MCM_Override_VampireComments auto
GlobalVariable property SR_MCM_Override_WerewolfMauls auto
GlobalVariable property SR_MCM_Override_WerewolfTransformations auto
GlobalVariable property SR_MCM_Override_WerewolfFeeds auto
GlobalVariable property SR_MCM_Override_WerewolfSeen auto
GlobalVariable property SR_MCM_Override_WerewolfComments auto
GlobalVariable property SR_MCM_Override_WerewolfVampireTimeDecreament auto
GlobalVariable property SR_MCM_Override_SeenCrimeTimeDecreament auto
GlobalVariable property SR_MCM_Override_PettyCrimeSeen auto
GlobalVariable property SR_MCM_Override_AssaultsSeen auto
GlobalVariable property SR_MCM_Override_MurdersSeen auto
GlobalVariable property SR_MCM_Override_Murders auto
GlobalVariable property SR_MCM_Override_PocketsPicked auto
GlobalVariable property SR_MCM_Override_HorsesStolen auto
GlobalVariable property SR_MCM_Override_ItemsStolen auto
GlobalVariable property SR_MCM_Override_Trespasses auto
GlobalVariable property SR_MCM_Override_JailEscapes auto
GlobalVariable property SR_MCM_Override_DaysJailed auto
GlobalVariable property SR_MCM_Override_FinesPayed auto
GlobalVariable property SR_MCM_Override_ThievesGuildMisc auto
GlobalVariable property SR_MCM_Override_DarkBrotherhoodMisc auto
GlobalVariable property SR_MCM_Override_CompanionsMisc auto
GlobalVariable property SR_MCM_Override_CollegeMisc auto
GlobalVariable property SR_MCM_Override_Brawls auto
GlobalVariable property SR_MCM_Override_MiscQuests auto
GlobalVariable property SR_MCM_Override_CivilWar auto
GlobalVariable property SR_MCM_Override_WarriorSkill auto
GlobalVariable property SR_MCM_Override_Persuasions auto
GlobalVariable property SR_MCM_Override_Intimidations auto
GlobalVariable property SR_MCM_Override_Bribes auto
GlobalVariable property SR_MCM_Override_BooksRead auto
GlobalVariable property SR_MCM_Override_KillsUndead auto
GlobalVariable property SR_MCM_Override_KillsDaedra auto
GlobalVariable property SR_MCM_Override_KillsBandits auto
GlobalVariable property SR_MCM_Override_KillsWizards auto
GlobalVariable property SR_MCM_Override_KillsWitches auto
GlobalVariable property SR_MCM_Override_KillsForsworn auto
GlobalVariable property SR_MCM_Override_SoulsTrapped auto
GlobalVariable property SR_MCM_Override_BlackSoulTraps auto
GlobalVariable property SR_MCM_Override_Necromancy auto
GlobalVariable property SR_MCM_Override_SeenNecroTimeDecreament auto
GlobalVariable property SR_MCM_Override_ArcaneMastery auto
GlobalVariable property SR_MCM_Override_RestorationMagic auto
GlobalVariable property SR_MCM_Override_ConjugationMagic auto
GlobalVariable property SR_MCM_Override_CannibalFeed auto
GlobalVariable property SR_MCM_Override_CharityAdded auto

Quest Property PlayerVampireQuest Auto
Quest Property C00 Auto

Int property QuestFame_CounterBalance = 0 auto
Int property QuestDaedric_CounterBalance = 0 auto
Int property QuestAedric_CounterBalance = 0 auto
Int property QuestCrime_CounterBalance = 0 auto
Int property QuestLaw_CounterBalance = 0 auto
Int property QuestDependability_CounterBalance = 0 auto
Int property QuestAmbition_CounterBalance = 0 auto
Int property QuestsCompleted_CounterBalance = 0 auto
Int property Locations_CounterBalance = 0 auto
Int property Dungeons_CounterBalance = 0 auto
Int property PeopleKills_CounterBalance = 0 auto
Int property StoreInvestments_CounterBalance = 0 auto
Int property HousesOwned_CounterBalance = 0 auto
Int property DragonsKilled_CounterBalance = 0 auto
Int property DragonPriestsKilled_CounterBalance = 0 auto
Int property NecksBitten_CounterBalance = 0 auto
Int property VampiricSpellSeen_CounterBalance = 0 auto
Int property VampireLordTransformations_CounterBalance = 0 auto
Int property VampireLordSeen_CounterBalance = 0 auto
Int property VampireComments_CounterBalance = 0 auto
Int property VampireGuardComments_CounterBalance = 0 auto
Int property WerewolfMauls_CounterBalance = 0 auto
Int property WerewolfTransformations_CounterBalance = 0 auto
Int property WerewolfFeeds_CounterBalance = 0 auto
Int property WerewolfSeen_CounterBalance = 0 auto
Int property WerewolfComments_CounterBalance = 0 auto
Int property WerewolfGuardComments_CounterBalance = 0 auto
Int property PettyCrimeSeen_CounterBalance = 0 auto
Int property AssaultsSeen_CounterBalance = 0 auto
Int property MurdersSeen_CounterBalance = 0 auto
Int property Murders_CounterBalance = 0 auto
Int property PocketsPicked_CounterBalance = 0 auto
Int property HorsesStolen_CounterBalance = 0 auto
Int property ItemsStolen_CounterBalance = 0 auto
Int property Trespasses_CounterBalance = 0 auto
Int property JailEscapes_CounterBalance = 0 auto
Int property DaysJailed_CounterBalance = 0 auto
Int property FinesPayed_CounterBalance = 0 auto
Int property ThievesGuildMisc_CounterBalance = 0 auto
Int Property DiscountedDarkBrotherhoodQuests = 0 auto
Int property DarkBrotherhoodMisc_CounterBalance = 0 auto
Int property CompanionsMisc_CounterBalance = 0 auto
Int property CollegeMisc_CounterBalance = 0 auto
Int property Brawls_CounterBalance = 0 auto
Int property MiscQuests_CounterBalance = 0 auto
Int property CivilWar_CounterBalance = 0 auto
Int property Persuasions_CounterBalance = 0 auto
Int property Intimidations_CounterBalance = 0 auto
Int property Bribes_CounterBalance = 0 auto
Int property DiscountedBooksRead = 0 auto
Int property BooksRead_CounterBalance = 0 auto
Int property KillsUndead_CounterBalance = 0 auto
Int property KillsDaedra_CounterBalance = 0 auto
Int property KillsBandits_CounterBalance = 0 auto
Int property KillsWizards_CounterBalance = 0 auto
Int property KillsWitches_CounterBalance = 0 auto
Int property KillsForsworn_CounterBalance = 0 auto
Int property SoulsTrapped_CounterBalance = 0 auto
Int property BlackSoulTraps_CounterBalance = 0 auto
Int property Necromancy_CounterBalance = 0 auto
Int property CannibalFeed_CounterBalance = 0 auto
Int property CharityAdded_CounterBalance = 0 auto


Int Function QuestFameScore()
	Int QuestFameScore = QuestFame as Int
	Int QuestFameCounterBalance = QuestFame_CounterBalance as Int
	Int QuestFameDisplayed = QuestFameScore - QuestFameCounterBalance

	Return iMax(0, QuestFameDisplayed)
EndFunction

Int Function QuestDaedricScore()
	Int QuestDaedricScore = QuestDaedric as Int
	Int QuestDaedricCounterBalance = QuestDaedric_CounterBalance as Int
	Int QuestDaedricDisplayed = QuestDaedricScore - QuestDaedricCounterBalance

	Return iMax(0, QuestDaedricDisplayed)
EndFunction

Int Function QuestAedricScore()
	Int QuestAedricScore = QuestAedric as Int
	Int QuestAedricCounterBalance = QuestAedric_CounterBalance as Int
	Int QuestAedricDisplayed = QuestAedricScore - QuestAedricCounterBalance

	Return iMax(0, QuestAedricDisplayed)
EndFunction

Int Function QuestCrimeScore()
	Int QuestCrimeScore = QuestCrime as Int
	Int QuestCrimeCounterBalance = QuestCrime_CounterBalance as Int
	Int QuestCrimeDisplayed = QuestCrimeScore - QuestCrimeCounterBalance

	Return iMax(0, QuestCrimeDisplayed)
EndFunction

Int Function QuestLawScore()
	Int QuestLawScore = QuestLaw as Int
	Int QuestLawCounterBalance = QuestLaw_CounterBalance as Int
	Int QuestLawDisplayed = QuestLawScore - QuestLawCounterBalance

	Return iMax(0, QuestLawDisplayed)
EndFunction

Int Function QuestDependabilityScore()
	Int QuestDependabilityScore = QuestDependability as Int
	Int QuestDependabilityCounterBalance = QuestDependability_CounterBalance as Int
	Int QuestDependabilityDisplayed = QuestDependabilityScore - QuestDependabilityCounterBalance

	Return iMax(0, QuestDependabilityDisplayed)
EndFunction

Int Function QuestAmbitionScore()
	Int QuestAmbitionScore = QuestAmbition as Int
	Int QuestAmbitionCounterBalance = QuestAmbition_CounterBalance as Int
	Int QuestAmbitionDisplayed = QuestAmbitionScore - QuestAmbitionCounterBalance

	Return iMax(0, QuestAmbitionDisplayed)
EndFunction

; Tweaks - Replaced unnecessary elseif with else
; Use min() instead of duplicate code
Int Function QuestsCompletedScore()
	Int QuestsCompleted = Game.QueryStat("Quests Completed")
	Int QuestsCompletedCounterBalance = QuestsCompleted_CounterBalance as Int
	Int QuestsCompletedDisplayed = QuestsCompleted - QuestsCompletedCounterBalance
	IF (SR_MCM_Override_QuestsCompleted.GetValue() == 1) && (QuestsCompletedDisplayed > 0)
		Return iMin(QuestsCompletedDisplayed, QuestsCompletedMax)
	Else
		Return 0
	Endif
EndFunction

Int Function LocationsScore()
	Int Locations = Game.QueryStat("Locations Discovered")
	Int LocationsCounterBalance = Locations_CounterBalance as Int
	Int LocationsDisplayed = Locations - LocationsCounterBalance
	IF (SR_MCM_Override_Locations.GetValue() == 1) && (LocationsDisplayed > 0)
		Return iMin(LocationsDisplayed, LocationsMax)
	Else
		Return 0
	Endif		
EndFunction

Int Function DungeonsScore()
	Int Dungeons = Game.QueryStat("Dungeons Cleared")
	Int DungeonsCounterBalance = Dungeons_CounterBalance as int
	Int DungeonsDisplayed = Dungeons - DungeonsCounterBalance
	IF (SR_MCM_Override_Dungeons.GetValue() == 1) && (DungeonsDisplayed > 0)
		Return iMin(DungeonsDisplayed, DungeonsMax)
	Else
		Return 0
	Endif
EndFunction
	
Int Function KillScore()
	Int PeopleKills = Game.QueryStat("People Killed")
	Int PeopleKillsCounterBalance = PeopleKills_CounterBalance as Int
	Int PeopleKillsDisplayed = PeopleKills - PeopleKillsCounterBalance
	IF (SR_MCM_Override_PeopleKills.GetValue() == 1) && (PeopleKillsDisplayed > 0)
		Return iMin(PeopleKillsDisplayed, PeopleKillsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function StoreInvestmentScore()
	Int StoreInvestments = Game.QueryStat("Stores Invested In")
	Int StoreInvestmentsCounterBalance = StoreInvestments_CounterBalance as int
	Int StoreInvestmentsDisplayed = StoreInvestments - StoreInvestmentsCounterBalance
	IF (SR_MCM_Override_StoreInvestments.GetValue() == 1) && (StoreInvestmentsDisplayed > 0)
		Return iMin(StoreInvestmentsDisplayed, StoreInvestmentsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function HousesOwnedScore()
	Int HousesOwned = Game.QueryStat("Houses Owned")
	Int HousesOwnedCounterBalance = HousesOwned_CounterBalance as int
	Int HousesOwnedDisplayed = HousesOwned - HousesOwnedCounterBalance
	IF (SR_MCM_Override_HousesOwned.GetValue() == 1) && (HousesOwnedDisplayed > 0)
		Return iMin(HousesOwnedDisplayed, HousesOwnedMax)
	Else
		Return 0
	Endif
EndFunction

Int Function DragonKillScore()
	Int DragonKill = KillsDragons as int
	Int DragonKillCounterBalance = DragonsKilled_CounterBalance as int
	Int DragonKillDisplayed = DragonKill - DragonKillCounterBalance
	IF (SR_MCM_Override_DragonsKilled.GetValue() == 1) && (DragonKillDisplayed > 0)
		Return iMin(DragonKillDisplayed, DragonKillsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function DragonPriestKillScore()
	Int DragonPriestKills = KillsDragonPriests
	Int DragonPriestsKilledCounterBalance = DragonPriestsKilled_CounterBalance as int
	Int DragonPriestsKilledDisplayed = DragonPriestKills - DragonPriestsKilledCounterBalance
	IF (SR_MCM_Override_DragonPriestsKilled.GetValue() == 1) && (DragonPriestsKilledDisplayed > 0)
		Return iMin(DragonPriestsKilledDisplayed, DragonPriestKillsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function PlayerIsVampireScore()
	Int Vampire = (PlayerVampireQuest as PlayerVampireQuestScript).VampireStatus as int
	If(Vampire >= 1)
		Return VampireRaceCont
	Else
		Return 0
	EndIf
EndFunction

Int Function NecksBittenScore()
	Int NecksBitten = Game.QueryStat("Necks Bitten")
	Int NecksBittenCounterBalance = NecksBitten_CounterBalance as int
	Int NecksBittenDisplayed = NecksBitten - NecksBittenCounterBalance
	IF (SR_MCM_Override_NecksBitten.GetValue() == 1) && (NecksBittenDisplayed > 0)
		Return iMin(NecksBittenDisplayed, NecksBittenMax)
	Else
		Return 0
	EndIf
EndFunction	

Float Function NecksBittenDecreamentScore()
	Float NecksBittenDecreament = NecksBittenDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return fMin(NecksBittenDecreament, NecksBittenMax)
	Else
		Return 0.0
	Endif
EndFunction

Int Function VampiricSpellSeenScore()
	Int VampiricSpellSeen = SpellVampiricSpellSeen as int
	Int VampiricSpellSeenCounterBalance = VampiricSpellSeen_CounterBalance as int
	Int VampiricSpellSeenDisplayed = VampiricSpellSeen - VampiricSpellSeenCounterBalance
	IF (SR_MCM_Override_VampiricSpellSeen.GetValue() == 1) && (VampiricSpellSeenDisplayed > 0)
		Return iMin(VampiricSpellSeenDisplayed, VampiricSpellSeenMax)
	Else
		Return 0
	EndIf
EndFunction

Float Function VampiricSpellSeenDecreamentScore()
	Float VampiricSpellSeenDecreament = SpellVampSpellDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return VampiricSpellSeenDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function VampireLordTransformationScore()
	Int VampireLordTransformation = VampireLordTransformations as int
	Int VampireLordTransformationsCounterBalance = VampireLordTransformations_CounterBalance as int
	Int VampireLordTransformationDisplayed = VampireLordTransformation - VampireLordTransformationsCounterBalance
	IF (SR_MCM_Override_VampireLordTransformations.GetValue() == 1) && (VampireLordTransformationDisplayed > 0)
		Return iMin(VampireLordTransformationDisplayed, VampireLordTransformationMax)
	Else
		Return 0
	EndIf
EndFunction

Float Function VampireLordTransformationDecreamentScore()
	Float VampireLordTransformationDecreament = VampLordTransDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return VampireLordTransformationDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function VampireLordSeenScore()
	Int VampireLordSeen = CrimeVampireLordSeen as int
	Int VampireLordSeenCounterBalance = VampireLordSeen_CounterBalance as int
	Int VampireLordSeenDisplayed = VampireLordSeen - VampireLordSeenCounterBalance
	IF (SR_MCM_Override_VampireLordSeen.GetValue() == 1) && (VampireLordSeenDisplayed > 0)
		Return iMin(VampireLordSeenDisplayed, VampireLordSeenMax)
	Else
		Return 0
	EndIf
EndFunction

Float Function VampireLordSeenDecreamentScore()
	Float VampireLordSeenDecreament = CrimeVampLordSeenDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return VampireLordSeenDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function CommentVampireVillagerScore()
	Int VampireVillager = CommentVampireVillager as int
	Int VampireCommentsCounterBalance = VampireComments_CounterBalance as int
	Int VampireVillagerDisplayed = VampireVillager - VampireCommentsCounterBalance
	IF (SR_MCM_Override_VampireComments.GetValue() == 1) && (VampireVillagerDisplayed > 0)
		Return iMin(VampireVillagerDisplayed, VampireVillagerMax)
	Else
		Return 0
	EndIf
EndFunction

Float Function CommentVampireVillagerDecreamentScore()
	Float VampireVillagerDecreament = CommentVampVillagerDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return VampireVillagerDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function CommentVampireGuardScore()
	Int VampireGuard = CommentVampireGuard as int
	Int VampireGuardCommentsCounterBalance = VampireGuardComments_CounterBalance as int
	Int VampireGuardDisplayed = VampireGuard - VampireGuardCommentsCounterBalance
	IF (SR_MCM_Override_VampireComments.GetValue() == 1) && (VampireGuardDisplayed > 0)
		Return iMin(VampireGuardDisplayed, VampireGuardMax)
	Else
		Return 0
	EndIf
EndFunction

Float Function CommentVampireGuardDecreamentScore()
	Float VampireGuardDecreament = CommentVampGuardDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return VampireGuardDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function PlayerIsWerewolfScore()
	bool Werewolf = (C00 as CompanionsHousekeepingScript).PlayerHasBeastBlood
	If(Werewolf == True)
		Return WerewolfRaceCont
	Else
		Return 0
	EndIf
EndFunction

Int Function WerewolfMaulScore()
	bool Werewolf = (C00 as CompanionsHousekeepingScript).PlayerHasBeastBlood
	Int WerewolfMauls = Game.QueryStat("Mauls")
	Int WerewolfMaulsCounterBalance = WerewolfMauls_CounterBalance as int
	Int WerewolfMaulsDisplayed = WerewolfMauls - WerewolfMaulsCounterBalance
	IF ((SR_MCM_Override_WerewolfMauls.GetValue() == 1) && (Werewolf == True) && (WerewolfMaulsDisplayed > 0))
		Return iMin(WerewolfMaulsDisplayed, WerewolfMaulMax)
	Else
		Return 0
	EndIf
EndFunction

Float Function WerewolfMaulDecreamentScore()
	Float WerewolfMaulDecreament = WerewolfMaulDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return WerewolfMaulDecreament
	Else
		Return 0.0
	Endif
EndFunction

Int Function WerewolfTransformationScore()
	Int WerewolfTransformation = Game.QueryStat("Werewolf Transformations")
	Int WerewolfTransformationsCounterBalance = WerewolfTransformations_CounterBalance as int
	Int WerewolfTransformationDisplayed = WerewolfTransformation - WerewolfTransformationsCounterBalance
	IF (SR_MCM_Override_WerewolfTransformations.GetValue() == 1) && (WerewolfTransformationDisplayed > 0)
		Return iMin(WerewolfTransformationDisplayed, WerewolftransformationsMax)
	Else
		Return 0
	Endif
EndFunction

Float Function WerewolfTransformationDecreamentScore()
	Float WerewolfTransformationDecreament = WerewolfTransDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return WerewolfTransformationDecreament
	Else
		Return 0.0
	Endif
EndFunction

Int Function WerewolfFeedingScore()
	Int WerewolfFeeds = WerewolfFeedings as int
	Int WerewolfFeedsCounterBalance = WerewolfFeeds_CounterBalance as int
	Int WerewolfFeedsDisplayed = WerewolfFeeds - WerewolfFeedsCounterBalance
	IF (SR_MCM_Override_WerewolfFeeds.GetValue() == 1) && (WerewolfFeedsDisplayed > 0)
		Return iMin(WerewolfFeedsDisplayed, WerewolfFeedsMax)
	Else
		Return 0
	Endif
EndFunction

Float Function WerewolfFeedingDecreamentScore()
	Float WerewolfFeedDecreament = WerewolfFeedDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return WerewolfFeedDecreament
	Else
		Return 0.0
	Endif
EndFunction

Int Function WerewolfSpottedScore()
	Int WerewolfSpotted = CrimeWerewolfSeen as int
	Int WerewolfSeenCounterBalance = WerewolfSeen_CounterBalance as int
	Int WerewolfSpottedDisplayed = WerewolfSpotted - WerewolfSeenCounterBalance
	IF (SR_MCM_Override_WerewolfSeen.GetValue() == 1) && (WerewolfSpottedDisplayed > 0)
		Return iMin(WerewolfSpottedDisplayed, TimesSpottedWerewolfMax)
	Else
		Return 0
	Endif
EndFunction

Float Function WerewolfSpottedDecreamentScore()
	Float WerewolfSpottedDecreament = CrimeWereSeenDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return WerewolfSpottedDecreament
	Else
		Return 0.0
	Endif
EndFunction

Int Function CommentWerewolfVillagerScore()
	Int WerewolfComments = CommentWerewolfVillager as Int
	Int WerewolfCommentsCounterBalance = WerewolfComments_CounterBalance as int
	Int WerewolfVillagerDisplayed = WerewolfComments - WerewolfCommentsCounterBalance
	IF (SR_MCM_Override_WerewolfComments.GetValue() == 1) && (WerewolfVillagerDisplayed > 0)
		Return iMin(WerewolfVillagerDisplayed, WerewolfVillagerMax)
	Else
		Return 0
	EndIf
EndFunction

Float Function CommentWerewolfVillagerDecreamentScore()
	Float WerewolfVillagerDecreament = CommentWereVillagerDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return WerewolfVillagerDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function CommentWerewolfGuardScore()
	Int WerewolfGuard = CommentWerewolfGuard as int
	Int WerewolfGuardCommentsCounterBalance = WerewolfGuardComments_CounterBalance as int
	Int WerewolfGuardDisplayed = WerewolfGuard - WerewolfGuardCommentsCounterBalance as int
	IF (SR_MCM_Override_WerewolfComments.GetValue() == 1) && (WerewolfGuardDisplayed > 0)
		Return iMin(WerewolfGuardDisplayed, WerewolfGuardMax)
	Else
		Return 0
	EndIf
EndFunction

Float Function CommentWerewolfGuardDecreamentScore()
	Float WerewolfGuardDecreament = CommentWereGuardDec
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return WerewolfGuardDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function CannibalFeedScore()
	Int CannibalFeed = SpellCannibalFeed as int
	Int CannibalFeedCounterBalance = CannibalFeed_CounterBalance as int
	Int CannibalFeedDisplayed = CannibalFeed - CannibalFeedCounterBalance
	IF (SR_MCM_Override_CannibalFeed.GetValue() == 1) && (CannibalFeedDisplayed > 0)
		Return iMin(CannibalFeedDisplayed, CannibalFeedMax)
	Else
		Return 0
	EndIf
EndFunction

Int Function CharityScore()
	Int Charity = SpellCharityAdded as int
	Int CharityCounterBalance = CharityAdded_CounterBalance as int
	Int CharityDisplayed = Charity - CharityCounterBalance
	IF (SR_MCM_Override_CharityAdded.GetValue() == 1) && (CharityDisplayed > 0)
		Return iMin(CharityDisplayed, CharityMax)
	Else
		Return 0
	EndIf
EndFunction

Int Function UndeadKilledScore()
	Int UndeadKilled = Game.QueryStat("Undead Killed")
	Int UndeadKilledCounterBalance = KillsUndead_CounterBalance as int
	Int UndeadKilledDisplayed = UndeadKilled - UndeadKilledCounterBalance
	IF (SR_MCM_Override_KillsUndead.GetValue() == 1) && (UndeadKilledDisplayed > 0)
		Return iMin(UndeadKilledDisplayed, UndeadKilledMax)
	Else
		Return 0
	Endif
EndFunction

Int Function DaedraKilledScore()
	Int DaedraKilled = Game.QueryStat("Daedra Killed")
	Int DaedraKilledCounterBalance = KillsDaedra_CounterBalance as int
	Int DaedraKilledDisplayed = DaedraKilled - DaedraKilledCounterBalance
	IF (SR_MCM_Override_KillsDaedra.GetValue() == 1) && (DaedraKilledDisplayed > 0)
		Return iMin(DaedraKilledDisplayed, DaedraKilledMax)
	Else
		Return 0
	Endif
EndFunction

Int Function SpottedAssaultScore()
	Int AssaultsSeen = CrimeAssaultsSeen as int
	Int AssaultsSeenCounterBalance = AssaultsSeen_CounterBalance as int
	Int AssaultsSeenDisplayed = AssaultsSeen - AssaultsSeenCounterBalance
	IF (SR_MCM_Override_AssaultsSeen.GetValue() == 1) && (AssaultsSeenDisplayed > 0)
		Return iMin(AssaultsSeenDisplayed, SpottedAssaultsMax)
	Else
		Return 0
	Endif
EndFunction


Float Function SpottedAssaultDecreamentScore()
	Float SpottedAssaultDecreament = CrimeAssaultsSeenDec
	IF (SR_MCM_Override_SeenCrimeTimeDecreament.GetValue() == 1)
		Return SpottedAssaultDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function SpottedMurderScore()
	Float SpottedMurders = CrimeMurdersSeen as float
	Float MurderArrest = CrimeMurderArrests as float
	Float TotalMurders = ((SpottedMurders/2) + MurderArrest)
	Float TotalMurdersCounterBalance = MurdersSeen_CounterBalance as float
	Float TotalMurdersDisplayed = TotalMurders - TotalMurdersCounterBalance
	IF (SR_MCM_Override_MurdersSeen.GetValue() == 1) && (TotalMurdersDisplayed > 0)
		Return fMin(TotalMurdersDisplayed, SpottedMurdersMax) As Int
	Else
		Return 0
	Endif
EndFunction

Float Function SpottedMurderDecreamentScore()
	Float SpottedMurderDecreament = CrimeMurdersSeenDec as Int
	IF (SR_MCM_Override_SeenCrimeTimeDecreament.GetValue() == 1)
		Return SpottedMurderDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function SpottedPettyCrimeScore()
	Float PettyCrimeSpotted = CrimePettySeen as float
	Float PettyCrimeSpottedCounterBalance = PettyCrimeSeen_CounterBalance as float
	Float PettyCrimeSpottedDisplayed = PettyCrimeSpotted - PettyCrimeSpottedCounterBalance
	IF (SR_MCM_Override_PettyCrimeSeen.GetValue() == 1) && (PettyCrimeSpottedDisplayed > 0)
		if(PettyCrimeSpottedDisplayed < SpottedPettyCrimeMax)
			Return PettyCrimeSpottedDisplayed as Int
		else
			Return SpottedPettyCrimeMax as Int
		endif
		Return fMin(PettyCrimeSpottedDisplayed, SpottedPettyCrimeMax) As Int
	Else
		Return 0
	Endif
EndFunction

Float Function SpottedPettyCrimeDecreamentScore()
	Float SpottedPettyCrimeDecreament = CrimePettySeenDec
	IF (SR_MCM_Override_SeenCrimeTimeDecreament.GetValue() == 1)
		Return SpottedPettyCrimeDecreament
	Else
		Return 0.0
	EndIf
EndFunction

Int Function MurderScore()
	Int Murders = Game.QueryStat("Murders")
	Int MurdersCounterBalance = Murders_CounterBalance as int
	Int MurdersDisplayed = Murders - MurdersCounterBalance
	IF (SR_MCM_Override_Murders.GetValue() == 1) && (MurdersDisplayed > 0)
		Return iMin(MurdersDisplayed, MurdersMax)
	Else
		Return 0
	Endif
EndFunction

Int Function HorsesStolenScore()
	Int HorsesStolen = Game.QueryStat("Horses Stolen")
	Int HorsesStolenCounterBalance = HorsesStolen_CounterBalance as int
	Int HorsesStolenDisplayed = HorsesStolen - HorsesStolenCounterBalance
	IF (SR_MCM_Override_HorsesStolen.GetValue() == 1) && (HorsesStolenDisplayed > 0)
		Return iMin(HorsesStolenDisplayed, HorsesStolenMax)
	Else
		Return 0
	Endif
EndFunction

Int Function PocketsPickedScore()
	Int PocketsPicked = Game.QueryStat("Pockets Picked")
	Int PocketsPickedCounterBalance = PocketsPicked_CounterBalance as int
	Int PocketsPickedDisplayed = PocketsPicked - PocketsPickedCounterBalance
	IF (SR_MCM_Override_PocketsPicked.GetValue() == 1) && (PocketsPickedDisplayed > 0)
		Return iMin(PocketsPickedDisplayed, PocketsPickedMax)
	Else
		Return 0
	Endif
EndFunction
	
Int Function ItemsStolenScore()
	Int ItemsStolen = Game.QueryStat("Items Stolen")
	Int ItemsStolenCounterBalance = ItemsStolen_CounterBalance as int
	Int ItemsStolenDisplayed = ItemsStolen - ItemsStolenCounterBalance
	IF (SR_MCM_Override_ItemsStolen.GetValue() == 1) && (ItemsStolenDisplayed > 0)
		Return iMin(ItemsStolenDisplayed, ItemsStolenMax)
	Else
		Return 0
	Endif
EndFunction
	
Int Function TrespassScore()
	Int Trespasses = Game.QueryStat("Trespasses")
	Int TrespassesCounterBalance = Trespasses_CounterBalance as int
	Int TrespassesDisplayed = Trespasses - TrespassesCounterBalance
	IF (SR_MCM_Override_Trespasses.GetValue() == 1) && (TrespassesDisplayed > 0)
		Return iMin(TrespassesDisplayed, TrespassesMax)
	Else
		Return 0
	Endif
EndFunction
	
Int Function JailEscapeScore()
	Int JailEscapes = Game.QueryStat("Jail Escapes")
	Int JailEscapesCounterBalance = JailEscapes_CounterBalance as int
	Int JailEscapesDisplayed = JailEscapes - JailEscapesCounterBalance
	IF (SR_MCM_Override_JailEscapes.GetValue() == 1) && (JailEscapesDisplayed > 0)
		Return iMin(JailEscapesDisplayed, JailEscapesMax)
	Else
		Return 0
	Endif
EndFunction

Int Function DaysJailedScore()
	Int DaysJailed = Game.QueryStat("Days Jailed")
	Int DaysJailedCounterBalance = DaysJailed_CounterBalance as int
	Int DaysJailedDisplayed = DaysJailed - DaysJailedCounterBalance
	If (SR_MCM_Override_DaysJailed.GetValue() == 1) && (DaysJailedDisplayed > 0)
		Return iMin(DaysJailedDisplayed, DaysJailedMax)
	Else
		Return 0
	Endif
EndFunction

Int Function FinesPayedScore()
	Int FinesPayed = Game.QueryStat("Fines Paid")
	Int FinesPayedCounterBalance = FinesPayed_CounterBalance as int
	INt FinesPayedDisplayed = FinesPayed - FinesPayedCounterBalance
	If (SR_MCM_Override_FinesPayed.GetValue() == 1) && (FinesPayedDisplayed > 0)
		Return iMin(FinesPayedDisplayed, FinesPayedMax)
	Else
		Return 0
	Endif
EndFunction

Int Function ThievesGuildeScore()
	Int ThievesGuild = Game.QueryStat("Thieves' Guild Quests Completed")
	Int ThievesGuildCounterBalance = ThievesGuildMisc_CounterBalance as int
	Int ThievesGuildDisplayed = ThievesGuild - ThievesGuildCounterBalance
	IF (SR_MCM_Override_ThievesGuildMisc.GetValue() == 1) && (ThievesGuildDisplayed > 0)
		Return iMin(ThievesGuildDisplayed, ThievesGuildQuestsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function DarkBrotherhoodScore()
	Int DarkBrotherhoodQuests = Game.QueryStat("The Dark Brotherhood Quests Completed")
	Int DarkBrotherhoodQuestsDiscounted = DiscountedDarkBrotherhoodQuests as int
	Int DarkBrotherhoodQuestsCounterBalance = DarkBrotherhoodMisc_CounterBalance as int
	Int DarkBrotherhoodQuestsDisplayed = (DarkBrotherhoodQuests - DarkBrotherhoodQuestsDiscounted) - DarkBrotherhoodQuestsCounterBalance
	IF ((SR_MCM_Override_DarkBrotherhoodMisc.GetValue() == 1) && (DarkBrotherhoodQuestsDisplayed > 0))
		Return iMin(DarkBrotherhoodQuestsDisplayed, DarkBrotherhoodQuestsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function CompanionsScore()
	Int CompanionsQuests = Game.QueryStat("The Companions Quests Completed")
	Int CompanionsQuestsCounterBalance = CompanionsMisc_CounterBalance as int
	Int CompanionsQuestsDisplayed = CompanionsQuests - CompanionsQuestsCounterBalance
	IF (SR_MCM_Override_CompanionsMisc.GetValue() == 1) && (CompanionsQuestsDisplayed > 0)
		Return iMin(CompanionsQuestsDisplayed, CompanionsQuestsMax)
	Else
		Return 0
	Endif
EndFunction	

Int Function BanditKillerScore()
	Int BanditKiller = KillsBandits as Int
	Int BanditKillerCounterBalance = KillsBandits_CounterBalance as int
	Int BanditKillerDisplayed = BanditKiller - BanditKillerCounterBalance
	If (SR_MCM_Override_KillsBandits.GetValue() == 1) && (BanditKillerDisplayed > 0)
		Return iMin(BanditKillerDisplayed, BanditsKilledMax)
	Else
		Return 0
	Endif
EndFunction

Int Function WizardKillerScore()
	Int WizardKiller = KillsWizards as int
	Int WizardKillerCounterBalance = KillsWizards_CounterBalance as int
	Int WizardKillerDisplayed = WizardKiller - WizardKillerCounterBalance
	If (SR_MCM_Override_KillsWizards.GetValue() == 1) && (WizardKillerDisplayed > 0)
		Return iMin(WizardKillerDisplayed, WizardKillerMax)
	Else
		Return 0
	Endif
EndFunction

Int Function WitchKillerScore()
	Int WitchKiller = KillsWitches as int
	Int WitchKillerCounterBalance = KillsWitches_CounterBalance as int
	Int WitchKillerDisplayed = WitchKiller - WitchKillerCounterBalance
	If (SR_MCM_Override_KillsWitches.GetValue() == 1) && (WitchKillerDisplayed > 0)
		Return iMin(WitchKillerDisplayed, WitchKillerMax)
	Else
		Return 0
	Endif
EndFunction

Int Function ForswornKillerScore()
	Int ForswornKiller = KillsForsworn as Int
	Int ForswornKillerCounterBalance = KillsForsworn_CounterBalance as int
	Int ForswornKillerDisplayed = ForswornKiller - ForswornKillerCounterBalance
	If (SR_MCM_Override_KillsForsworn.GetValue() == 1) && (ForswornKillerDisplayed > 0)
		Return iMin(ForswornKillerDisplayed, ForswornKillerMax)
	Else
		Return 0
	Endif
EndFunction

Int Function BrawlsWonScore()
	Int BrawlsWon = Game.QueryStat("Brawls Won")
	Int BrawlsWonCounterBalance = Brawls_CounterBalance as int
	Int BrawlsWonDisplayed = BrawlsWon - BrawlsWonCounterBalance
	IF (SR_MCM_Override_Brawls.GetValue() == 1) && (BrawlsWonDisplayed > 0)
		Return iMin(BrawlsWonDisplayed, BrawlsWonMax)
	Else
		Return 0
	Endif
EndFunction

Int Function MiscQuestsScore()
	Int MiscQuests = Game.QueryStat("Misc Objectives Completed")
	Int MiscQuestsCounterBalance = MiscQuests_CounterBalance as int
	Int MiscQuestsDisplayed = MiscQuests - MiscQuestsCounterBalance
	IF (SR_MCM_Override_MiscQuests.GetValue() == 1) && (MiscQuestsDisplayed > 0)
		Return iMin(MiscQuestsDisplayed, MiscQuestsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function CivilWarQuestsScore()
	Int CivilWarQuests = Game.QueryStat("Civil War Quests Completed")
	Int CivilWarQuestsCounterBalance = CivilWar_CounterBalance as int
	Int CivilWarQuestsDisplayed = CivilWarQuests - CivilWarQuestsCounterBalance
	If (SR_MCM_Override_CivilWar.GetValue() == 1) && (CivilWarQuestsDisplayed > 0)
		Return iMin(CivilWarQuestsDisplayed, CivilWarQuestsMax)
	Else
		Return 0
	Endif
EndFunction
	
Int Function WarriorSkillScore()
	Float LightArmorSkill = PlayerRef.GetBaseActorValue("LightArmor") as Float
	Float HeavyArmorSkill = PlayerRef.GetBaseActorValue("HeavyArmor") as Float
	Float BlockSkill = PlayerRef.GetBaseActorValue("Block") as Float
	Float MarksmanSkill = PlayerRef.GetBaseActorValue("Marksman") as Float	
	Float OneHandedSkill = PlayerRef.GetBaseActorValue("OneHanded") as Float
	Float TwoHandedSkill = PlayerRef.GetBaseActorValue("TwoHanded") as Float
	Float WarriorSkill = ((LightArmorSkill+HeavyArmorSkill+BlockSkill+(MarksmanSkill/2)+(OneHandedSkill/2)+TwoHandedSkill)/5)
	if (SR_MCM_Override_WarriorSkill.GetValue() == 1)
		Return WarriorSkill as Int
	else
		Return 0
	endif
EndFunction	

Int Function PersuasionScore()
	Int Persuasions = Game.QueryStat("Persuasions")
	Int PersuasionsCounterBalance = Persuasions_CounterBalance as int
	Int PersuasionsDisplayed = Persuasions - PersuasionsCounterBalance
	IF (SR_MCM_Override_Persuasions.GetValue() == 1) && (PersuasionsDisplayed > 0)
		Return iMin(PersuasionsDisplayed, PersuasionsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function IntimidationScore()
	Int Intimidations = Game.QueryStat("Intimidations")
	Int IntimidationsCounterBalance = Intimidations_CounterBalance as int
	Int IntimidationsDisplayed = Intimidations - IntimidationsCounterBalance
	IF (SR_MCM_Override_Intimidations.GetValue() == 1) && (IntimidationsDisplayed > 0)
		Return iMin(IntimidationsDisplayed, IntimidationsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function BribeScore()
	Int Bribes = Game.QueryStat("Bribes")
	Int BribesCounterBalance = Bribes_CounterBalance as int
	Int BribesDisplayed = Bribes - BribesCounterBalance
	IF (SR_MCM_Override_Bribes.GetValue() == 1) && (BribesDisplayed > 0)
		Return iMin(BribesDisplayed, BribesMax)
	Else
		Return 0
	Endif
EndFunction

Int Function CollegeWinterholdScore()
	Int CollegeWinterholdQuests = Game.QueryStat("College of Winterhold Quests Completed")
	Int CollegeWinterholdQuestsCounterBalance = CollegeMisc_CounterBalance as int
	Int CollegeWinterholdQuestsDisplayed = CollegeWinterholdQuests - CollegeWinterholdQuestsCounterBalance
	IF (SR_MCM_Override_CollegeMisc.GetValue() == 1) && (CollegeWinterholdQuestsDisplayed > 0)
		Return iMin(CollegeWinterholdQuestsDisplayed, CollegeWinterholdQuestsMax)
	Else
		Return 0
	Endif
EndFunction

Int Function BooksReadScore()
	Int BooksRead = Game.QueryStat("Books Read")
	Int DiscountedBookReads = DiscountedBooksRead as int
	Int BooksReadCounterBalance = BooksRead_CounterBalance as int
	Int BooksReadDisplayed = (BooksRead - DiscountedBookReads) - BooksReadCounterBalance
	If (SR_MCM_Override_BooksRead.GetValue() == 1) && (BooksReadDisplayed > 0)
		Return iMin(BooksReadDisplayed, BooksReadMax)
	Else
		Return 0
	Endif
EndFunction

Int Function NecroTimesScore()
	Int ZombieTime = SpellNecromancySeen as Int
	Int ZombieTimeCounterBalance = Necromancy_CounterBalance as int
	Int ZombieTimeDisplayed = ZombieTime - ZombieTimeCounterBalance
	If (SR_MCM_Override_Necromancy.GetValue() == 1) && (ZombieTimeDisplayed > 0)
		Return iMin(ZombieTimeDisplayed, ZombieTimeMax)
	Else
		Return 0
	Endif
EndFunction

Float Function NecroTimesDecreamentScore()
	Float NecromancyTimesDecreament = NecroTimesDecreament as float
	IF (SR_MCM_Override_SeenNecroTimeDecreament.GetValue() == 1)
		Return NecromancyTimesDecreament as Float
	Else
		Return 0.0
	EndIf
EndFunction

Int Function BlackSoulTrapScore()
	Int BlackSoulTrap = BlackSoulTraps as Int
	Int BlackSoulTrapsCounterBalance = BlackSoulTraps_CounterBalance as int
	Int BlackSoulTrapDisplayed = BlackSoulTrap - BlackSoulTrapsCounterBalance
	If (SR_MCM_Override_BlackSoulTraps.GetValue() == 1) && (BlackSoulTrapDisplayed > 0)
		Return iMin(BlackSoulTrapDisplayed, BlackSoulTrapMax)
	Else
		Return 0
	Endif
EndFunction

Int Function SoulsTrappedScore()
	Int SoulsTrapped = Game.QueryStat("Souls Trapped")
	Int SoulsTrappedCounterBalance = SoulsTrapped_CounterBalance as int
	Int SoulsTrappedDisplayed = SoulsTrapped - SoulsTrappedCounterBalance
	If (SR_MCM_Override_SoulsTrapped.GetValue() == 1) && (SoulsTrappedDisplayed > 0)
		Return iMin(SoulsTrappedDisplayed, SoulsTrappedMax)
	Else
		Return 0
	Endif
EndFunction

Int Function ArcaneMasteryScore()
 	Float IllusionSkill = PlayerRef.GetBaseActorValue("Illusion") as Float
	Float DestructionSkill = PlayerRef.GetBaseActorValue("Destruction") as Float
	Float AlterationSkill = PlayerRef.GetBaseActorValue("Alteration") as Float
	Float ConjurationSkill = PlayerRef.GetBaseActorValue("Conjuration") as Float
	Float RestorationSkill = PlayerRef.GetBaseActorValue("Restoration") as Float
	Float EnchantingSkill = PlayerRef.GetBaseActorValue("Enchanting") as Float
	Float ArcaneMasteryScore = ((IllusionSkill+DestructionSkill+AlterationSkill+ConjurationSkill+(RestorationSkill/2)+(EnchantingSkill/2))/5)
	if (SR_MCM_Override_ArcaneMastery.GetValue() == 1)
		Return ArcaneMasteryScore as Int
	else
		Return 0
	endif
EndFunction

Int Function ConjurationScore()
	Int ConjurationSkill = PlayerRef.GetBaseActorValue("Conjuration") as int
	if (SR_MCM_Override_ConjugationMagic.GetValue() == 1)
		Return ConjurationSkill as Int
	else
		Return 0
	endif
EndFunction

Int Function RestorationScore()
	Int RestorationSkill = PlayerRef.GetBaseActorValue("Restoration") as int
	if (SR_MCM_Override_RestorationMagic.GetValue() == 1)
		Return RestorationSkill as Int
	else
		Return 0
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR CALCULATING RACIAL CONTRIBUTIONS TO REPUTATION SCORES  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Race Property ArgonianRace  Auto  
Race Property BretonRace  Auto  
Race Property KhajiitRace  Auto  
Race Property HighElfRace  Auto  
Race Property NordRace  Auto  
Race Property OrcRace  Auto  
Race Property WoodElfRace  Auto  
Race Property DarkElfRace  Auto  
Race Property ImperialRace  Auto  
Race Property RedguardRace  Auto  
Race Property ArgonianRaceVampire  Auto  
Race Property KhajiitRaceVampire  Auto  
Race Property OrcRaceVampire  Auto  
Race Property DarkElfRaceVampire  Auto  
Race Property WoodElfRaceVampire  Auto  
Race Property HighElfRaceVampire  Auto  
Race Property ImperialRaceVampire  Auto  
Race Property BretonRaceVampire  Auto  
Race Property NordRaceVampire  Auto  
Race Property RedguardRaceVampire  Auto

; Tweaks - Added racism mult and changed return type to float
Float Function RaceScore(Int ScoreType)
	Race PlayerRace = PlayerRef.GetRace()
	Float mult = SRTRacismMult.GetValue() ; Intentionally only affects negative scores
	
	If ScoreType == 1 ;Daedric
		if((PlayerRace == ArgonianRace)||(PlayerRace == ArgonianRaceVampire))
			Return 1.0 * mult
		elseif((PlayerRace == DarkElfRace)||(PlayerRace == DarkElfRaceVampire))
			Return 5.0 * mult
		elseif((PlayerRace == KhajiitRace)||(PlayerRace == KhajiitRaceVampire))
			Return 1.0 * mult
		elseif((PlayerRace == OrcRace)||(PlayerRace == OrcRaceVampire))
			Return 3.0 * mult
		elseif ((PlayerRace == RedguardRace)||(PlayerRace == RedguardRaceVampire))
			Return 2.0 * mult
		else
			Return 0.0
		endIf
	ElseIf ScoreType == 2 ;Aedric
		if((PlayerRace == BretonRace)||(PlayerRace == BretonRaceVampire))
			Return 1.0
		elseif ((PlayerRace == HighElfRace)||(PlayerRace == HighElfRaceVampire))
			Return 2.0
		elseif((PlayerRace == ImperialRace)||(PlayerRace == ImperialRaceVampire))
			Return 2.0
		elseif ((PlayerRace == NordRace)||(PlayerRace == NordRaceVampire))
			Return 3.0
		elseif ((PlayerRace == WoodElfRace)||(PlayerRace == WoodElfRaceVampire))
			Return 2.0
		else
			Return 0.0
		endif
	ElseIf ScoreType == 3 ;Crime
		if((PlayerRace == ArgonianRace)||(PlayerRace == ArgonianRaceVampire))
			Return 2.0 * mult
		elseif((PlayerRace == BretonRace)||(PlayerRace == BretonRaceVampire))
			Return 1.0 * mult
		elseif((PlayerRace == DarkElfRace)||(PlayerRace == DarkElfRaceVampire))
			Return 2.0 * mult
		elseif((PlayerRace == KhajiitRace)||(PlayerRace == KhajiitRaceVampire))
			Return 3.0 * mult
		elseif((PlayerRace == OrcRace)||(PlayerRace == OrcRaceVampire))
			Return 1.0 * mult
		elseif((PlayerRace == RedguardRace)||(PlayerRace == RedguardRaceVampire))
			Return 1.0 * mult
		elseif((PlayerRace == WoodElfRace)||(PlayerRace == WoodElfRaceVampire))
			Return 2.0 * mult
		else
			Return 0.0
		endif
	ElseIf ScoreType == 4 ;Law
		if((PlayerRace == HighElfRace)||(PlayerRace == HighElfRaceVampire))
			Return 1.0
		elseif((PlayerRace == ImperialRace)||(PlayerRace == ImperialRaceVampire))
			Return 3.0
		elseif ((PlayerRace == NordRace)||(PlayerRace == NordRaceVampire))
			Return 2.0
		else
			Return 0.0
		endif
	ElseIf ScoreType == 5 ;Dependability
		if((PlayerRace == ImperialRace)||(PlayerRace == ImperialRaceVampire))
			Return 1.0
		elseif ((PlayerRace == NordRace)||(PlayerRace == NordRaceVampire))
			Return 3.0
		elseif((PlayerRace == OrcRace)||(PlayerRace == OrcRaceVampire))
			Return 1.0
		elseif((PlayerRace == RedguardRace)||(PlayerRace == RedguardRaceVampire))
			Return 1.0
		else
			Return 0.0
		endif	
	ElseIf ScoreType == 6 ;Ambition
		if((PlayerRace == ArgonianRace)||(PlayerRace == ArgonianRaceVampire))
			Return 2.0 * mult
		elseif((PlayerRace == BretonRace)||(PlayerRace == BretonRaceVampire))
			Return 1.0 * mult
		elseif((PlayerRace == DarkElfRace)||(PlayerRace == DarkElfRaceVampire))
			Return 3.0 * mult
		elseif((PlayerRace == HighElfRace)||(PlayerRace == HighElfRaceVampire))
			Return 3.0 * mult
		elseif((PlayerRace == KhajiitRace)||(PlayerRace == KhajiitRaceVampire))
			Return 1.0 * mult
		elseif((PlayerRace == WoodElfRace)||(PlayerRace == WoodElfRaceVampire))
			Return 1.0 * mult
		else
			Return 0.0
		endif	
	Else
		Return 0.0
		;Debug.Trace ("Function SR_RQC_Script.RaceScore() returned 0")
	EndIf
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTION FOR SETTING LAST BIG QUEST FINISHED PROPERTY USED IN SR_RQC_REF_SCR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GlobalVariable Property GameDaysPassed auto
GlobalVariable Property SR_Global_LastBigQuestFinished auto
float property LastBigQuestFinishedTimeStamp auto
float property BigQuestFinishedResetDelayGameDays = 30.0 auto

Function ResetLastBigQuestFinished()
	float QuestTimeStamp = LastBigQuestFinishedTimeStamp
	float ResetDelay = BigQuestFinishedResetDelayGameDays
	float CurrentGameDay = GameDaysPassed.GetValue()
	float FameLevelFour = FameThresholdFour as float
	float CurrentFame = TotalFameScore as float
	if(CurrentFame < FameLevelFour)
		SetLastBigQuestFinishedTimeStamp(CurrentGameDay)
	elseif(CurrentGameDay >= (QuestTimeStamp + ResetDelay))
		SR_Global_LastBigQuestFinished.SetValue(0)
	endif
EndFunction

Function SetLastBigQuestFinished(int NewValue)
	float CurrentGameDay = GameDaysPassed.GetValue()
	SetLastBigQuestFinishedTimeStamp(CurrentGameDay)
	SR_Global_LastBigQuestFinished.SetValue(NewValue)
EndFunction

Function SetLastBigQuestFinishedTimeStamp(float NewValue)
	LastBigQuestFinishedTimeStamp = NewValue
EndFunction

Function SetBigQuestFinishedResetDelayGameDays(float NewValue)
	BigQuestFinishedResetDelayGameDays = NewValue
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR INCREMENTING AND DECREMENTING QUEST REPUTATION SCORES  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property QuestFame = 0 auto
int property QuestDaedric = 0 auto
int property QuestAedric = 0 auto
int property QuestCrime = 0 auto
int property QuestLaw = 0 auto
int property QuestDependability = 0 auto
int property QuestAmbition = 0 auto

Function IncrementQuestFame(Int IncValueFame)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestFame += IncValueFame
EndFunction

Function IncrementQuestFameFull(Int IncValueFame)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestFame += IncValueFame
EndFunction

Function DecrementQuestFame()
	if (QuestFame >= 1)
		QuestFame -= 1
	endif

	if (QuestFame_CounterBalance >= 1)
		QuestFame_CounterBalance -= 1
	endif
EndFunction
 
Function IncrementQuestFameMax()
	QuestFameMax += 1
EndFunction

Function IncrementQuestFameMaximum(int IncValue)
	QuestFameMax += IncValue
EndFunction
 
Function DecrementQuestFameMax()
	if (QuestFameMax >= 1)
		QuestFameMax -= 1
	endif
EndFunction
 
 
Function IncrementQuestDaedric(Int IncValueDaedric)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestDaedric += IncValueDaedric
EndFunction

Function IncrementQuestDaedricFull(Int IncValueDaedric)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestDaedric += IncValueDaedric
EndFunction
 
Function DecrementQuestDaedric()
 	if (QuestDaedric >= 1)
		QuestDaedric -= 1
	endif
	
	if (QuestDaedric_CounterBalance >= 1)
		QuestDaedric_CounterBalance -= 1
	endif
EndFunction
 
Function IncrementQuestDaedricMax()
	QuestDaedricMax += 1
EndFunction

Function IncrementQuestDaedricMaximum(int IncValue)
	QuestDaedricMax += IncValue
EndFunction
 
Function DecrementQuestDaedricMax()
   	if (QuestDaedricMax >= 1)
		QuestDaedricMax -= 1
	endif
EndFunction

Function IncrementQuestAedric(Int IncValueAedric)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestAedric += IncValueAedric
EndFunction
 
Function IncrementQuestAedricFull(Int IncValueAedric)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestAedric += IncValueAedric
EndFunction
 
Function DecrementQuestAedric()
  	if (QuestAedric >= 1)
		QuestAedric -= 1
	endif
	
	if (QuestAedric_CounterBalance >= 1)
		QuestAedric_CounterBalance -= 1
	endif
EndFunction

Function IncrementQuestAedricMax()
	QuestAedricmax += 1
EndFunction

Function IncrementQuestAedricMaximum(int IncValue)
	QuestAedricmax += IncValue
EndFunction
 
Function DecrementQuestAedricMax()
   	if (QuestAedricMax >= 1)
		QuestAedricMax -= 1
	endif
EndFunction
 
Function IncrementQuestCrime(Int IncValueCrime)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestCrime += IncValueCrime
EndFunction

Function IncrementQuestCrimeFull(Int IncValueCrime)
	QuestCrime += IncValueCrime
EndFunction
 
Function DecrementQuestCrime()
	if (QuestCrime >= 1)
		QuestCrime -= 1
	endif
	
	if (QuestCrime_CounterBalance >= 1)
		QuestCrime_CounterBalance -= 1
	endif
EndFunction
 
Function IncrementQuestCrimeMax()
	QuestCrimeMax += 1
EndFunction
 
Function IncrementQuestCrimeMaximum(int IncValue)
	QuestCrimeMax += IncValue
EndFunction
 
Function DecrementQuestCrimeMax()
 	if (QuestCrimeMax >= 1)
		QuestCrimeMax -= 1
	endif
EndFunction
 
Function IncrementQuestLaw(Int IncValueLaw)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestLaw += IncValueLaw
EndFunction

Function IncrementQuestLawFull(Int IncValueLaw)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestLaw += IncValueLaw
EndFunction
 
Function DecrementQuestLaw()
	if (QuestLaw >= 1)
		QuestLaw -= 1
	endif
	
	if (QuestLaw_CounterBalance >= 1)
		QuestLaw_CounterBalance -= 1
	endif
EndFunction
 
Function IncrementQuestLawMax()
	QuestLawMax += 1
EndFunction

Function IncrementQuestLawMaximum(int IncValue)
	QuestLawMax += IncValue
EndFunction
 
Function DecrementQuestLawMax()
	if (QuestLawMax >= 1)
		QuestLawMax -= 1
	endif
EndFunction
 
Function IncrementQuestAmbition(Int IncValueAmbition)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestAmbition += IncValueAmbition
EndFunction

Function IncrementQuestAmbitionFull(Int IncValueAmbition)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestAmbition += IncValueAmbition
EndFunction

Function DecrementQuestAmbition()
	if (QuestAmbition >= 1)
		QuestAmbition -= 1
	endif
	
	if (QuestAmbition_CounterBalance >= 1)
		QuestAmbition_CounterBalance -= 1
	endif
EndFunction
 
Function IncrementQuestAmbitionMax()
	QuestAmbitionMax += 1
EndFunction

Function IncrementQuestAmbitionMaximum(int IncValue)
	QuestAmbitionMax += IncValue
EndFunction
 
Function DecrementQuestAmbitionMax()
	if (QuestAmbitionMax >= 1)
		QuestAmbitionMax -= 1
	endif
EndFunction
 
Function IncrementQuestDependability(Int IncValueDependability)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestDependability += IncValueDependability
EndFunction

Function IncrementQuestDependabilityFull(Int IncValueDependability)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	QuestDependability += IncValueDependability
EndFunction
 
Function DecrementQuestDependability()
	if (QuestDependability >= 1)
		QuestDependability -= 1
	endif
	
	if (QuestDependability_CounterBalance >= 1)
		QuestDependability_CounterBalance -= 1
	endif
EndFunction
 
Function IncrementQuestDependabilityMax()
	QuestDependabilityMax += 1
EndFunction

Function IncrementQuestDependabilityMaximum(int IncValue)
	QuestDependabilityMax += IncValue
EndFunction
 
Function DecrementQuestDependabilityMax()
	if (QuestDependabilityMax >= 1)
		QuestDependabilityMax -= 1
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING AND INCREMENTING MOD ADDED TRACKED STAT PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Several of these are set to -1 as a workaround for
; OnInit running on new game as well as quest start

; doesn't seem to be reliable, now setting to 0 in OnUpdate

int property KillsBandits = 0 auto 
int property KillsWizards = 0 auto 
int property KillsWitches = 0 auto
int property KillsForsworn = 0 auto
int property KillsThalmor = 0 auto
int property KillsDragons = 0 auto
int property KillsDragonPriests = 0 auto
int property BlackSoulTraps = 0 auto
int property SpellNecromancySeen = 0 auto
int property SpellCannibalFeed = 0 auto
int property SpellCharityAdded = 0 auto
int property SpellVampiricSpellSeen = 0 auto
int property VampireLordTransformations = 0 auto
int property CommentVampireVillager = 0 auto
int property CommentVampireGuard = 0 auto
int property WerewolfFeedings = 0 auto
int property CommentWerewolfVillager = 0 auto
int property CommentWerewolfGuard = 0 auto
int property CrimeWerewolfSeen = 0 auto
int property CrimeVampireLordSeen = 0 auto
Int property CrimePettySeen = 0 auto
int property CrimeAssaultsSeen = 0 auto
float property CrimeMurdersSeen = 0.0 auto
float property CrimeMurderArrests = 0.0 auto

Function IncrementKillsBandits()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	KillsBandits += 1
EndFunction

Function IncrementKillsWizards()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	KillsWizards += 1
EndFunction

Function IncrementKillsWitches()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	KillsWitches += 1
EndFunction

Function IncrementKillsForsworn()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	KillsForsworn += 1
EndFunction

Function IncrementKillsThalmor()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	KillsThalmor += 1
EndFunction

Function IncrementKillsDragons()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	KillsDragons += 1
EndFunction

Function IncrementKillsDragonPriests()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	KillsDragonPriests += 1
EndFunction


Function IncrementCommentVampireVillager(Int IncValue)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CommentVampireVillager += IncValue
EndFunction

Function IncrementCommentVampireGuard()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CommentVampireGuard += 1
EndFunction

Function IncrementWerewolfFeedings()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	WerewolfFeedings += 1
EndFunction

Function IncrementCommentWerewolfVillager(Int IncValue)
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CommentWerewolfVillager += IncValue
EndFunction

Function IncrementCommentWerewolfGuard()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CommentWerewolfGuard += 1
EndFunction

Function IncrementBlackSoulTraps()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	BlackSoulTraps += 1
EndFunction

Function IncrementCrimeMurdersSeen()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CrimeMurdersSeen += 1
EndFunction

Function IncrementCrimeMurderArrests()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CrimeMurderArrests += 1
EndFunction

Function IncrementCrimeAssaultsSeen()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CrimeAssaultsSeen += 1
EndFunction

Function IncrementCrimePettySeen()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CrimePettySeen += 1
EndFunction

Function IncrementSpellNecromancySeen()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	SpellNecromancySeen += 1
EndFunction

Function IncrementCrimeWerewolfSeen()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CrimeWerewolfSeen += 1
EndFunction

Function IncrementSpellCannibalFeed()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	SpellCannibalFeed += 1
EndFunction

Function IncrementSpellCharityAdded()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	SpellCharityAdded += 1
EndFunction

Function IncrementSpellVampiricSpellSeen()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	SpellVampiricSpellSeen += 1
EndFunction

Function IncrementVampireLordTransformations()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	VampireLordTransformations += 1
EndFunction

Function IncrementCrimeVampireLordSeen()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	CrimeVampireLordSeen += 1
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING AND INCREMENTING THE MOD ADDED TRACKED STATS'S DECREAMENTING OVER-TIME PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
float property NecksBittenDec = 0.0 auto
float property SpellVampSpellDec = 0.0 auto
float property VampLordTransDec = 0.0 auto
float property CrimeVampLordSeenDec = 0.0 auto
float property CommentVampVillagerDec = 0.0 auto
float property CommentVampGuardDec = 0.0 auto
float property WerewolfMaulDec = 0.0 auto
float property WerewolfTransDec = 0.0 auto
float property WerewolfFeedDec = 0.0 auto
float property CrimeWereSeenDec = 0.0 auto
float property CommentWereVillagerDec = 0.0 auto
float property CommentWereGuardDec = 0.0 auto
float property CrimePettySeenDec = 0.0 auto
float property CrimeAssaultsSeenDec = 0.0 auto
float property CrimeMurdersSeenDec = 0.0 auto
float property NecroTimesDecreament = 0.0 auto

Function IncrementNecksBittenDec()
	float NecksBitten = Game.QueryStat("Necks Bitten") as float
	float NecksBittenCounterBalance = NecksBitten_CounterBalance as float
	float NecksBittenDisplayed = NecksBitten - NecksBittenCounterBalance
	float NecksBittenDenominator = NecksBittenNom as float
	float NecksBittenMinimum = NecksBittenMin as float 
	float AdjustedNecksBittenScore = (NecksBittenDisplayed/NecksBittenDenominator) - NecksBittenDec
	float NecksBittenDecrementer = AdjustedNecksBittenScore * NecksBittenDecPerc
	if(AdjustedNecksBittenScore > NecksBittenMinimum)
		NecksBittenDec += NecksBittenDecrementer
	endif
EndFunction

Function IncrementSpellVampSpellDec()
	float VampiricSpellSeen = SpellVampiricSpellSeen as float
	float VampiricSpellSeenCounterBalance = VampiricSpellSeen_CounterBalance as float
	float VampiricSpellSeenDisplayed = VampiricSpellSeen - VampiricSpellSeenCounterBalance
	float VampiricSpellSeenMultiplier = VampiricSpellSeenMult as float
	float VampiricSpellSeenDenominator = VampiricSpellSeenNom as float
	float VampiricSpellSeenMinimum = VampiricSpellSeenMin as float 
	float AdjustedVampiricSpellSeenScore = ((VampiricSpellSeenDisplayed*VampiricSpellSeenMultiplier)/VampiricSpellSeenDenominator) - SpellVampSpellDec
	float VampiricSpellSeenDecrementer = AdjustedVampiricSpellSeenScore * SpellVampSpellDecPerc
	if(AdjustedVampiricSpellSeenScore > VampiricSpellSeenMinimum)
		SpellVampSpellDec += VampiricSpellSeenDecrementer
	endif
EndFunction

Function IncrementVampLordTransDec()
	float VampireLordTransformation = VampireLordTransformations as float
	float VampireLordTransformationsCounterBalance = VampireLordTransformations_CounterBalance as float
	float VampireLordTransformationDisplayed = VampireLordTransformation - VampireLordTransformationsCounterBalance
	float VampireLordTransformationDenominator = VampireLordTransformationNom as float
	float VampireLordTransformationMinimum = VampireLordTransformationMin as float 
	float AdjustedVampireLordTransformationScore = (VampireLordTransformationDisplayed/VampireLordTransformationDenominator) - VampLordTransDec
	float VampireLordTransformationDecrementer = AdjustedVampireLordTransformationScore * VampLordTransDecPerc
	if(AdjustedVampireLordTransformationScore > VampireLordTransformationMinimum)
		VampLordTransDec += VampireLordTransformationDecrementer
	endif
EndFunction

Function IncrementCrimeVampLordSeenDec()
	float VampireLordFormSeen = CrimeVampireLordSeen as float	
	float VampireLordSeenCounterBalance = VampireLordSeen_CounterBalance as float
	float VampireLordSeenDisplayed = VampireLordFormSeen - VampireLordSeenCounterBalance
	float VampireLordSeenMultiplier = VampireLordSeenMult as float
	float VampireLordSeenDenominator = VampireLordSeenNom as float
	float VampireLordSeenMinimum = VampireLordSeenMin as float 
	float AdjustedVampireLordSeenScore = ((VampireLordSeenDisplayed*VampireLordSeenMultiplier)/VampireLordSeenDenominator) - CrimeVampLordSeenDec
	float VampireLordDecrementer = AdjustedVampireLordSeenScore * CrimeVampLordSeenPerc
	if(AdjustedVampireLordSeenScore > VampireLordSeenMinimum)
		CrimeVampLordSeenDec += VampireLordDecrementer
	endif
EndFunction

Function IncrementCommentVampVillagerDec()
	float CommentVampVillager = CommentVampireVillager as float
	float CommentVampVillagerCounterBalance = VampireComments_CounterBalance as float
	float CommentVampVillagerDisplayed = CommentVampVillager - CommentVampVillagerCounterBalance
	float CommentVampVillagerDenominator = VampireVillagerNom as float
	float CommentVampVillagerMinimum = VampireVillagerMin as float 
	float AdjustedCommentVampVillagerScore = (CommentVampVillagerDisplayed/CommentVampVillagerDenominator) - CommentVampVillagerDec
	float CommentVampVillagerDecrementer = AdjustedCommentVampVillagerScore * CommentVampVillagerDecPerc
	if(AdjustedCommentVampVillagerScore > CommentVampVillagerMinimum)
		CommentVampVillagerDec += CommentVampVillagerDecrementer
	endif
EndFunction

Function IncrementCommentVampGuardDec()
	float VampireGuardIncidents = CommentVampireGuard as float
	float VampireGuardIncidentsCounterBalance = VampireGuardComments_CounterBalance as float
	float VampireGuardIncidentsDisplayed = VampireGuardIncidents - VampireGuardIncidentsCounterBalance
	float VampireGuardMultiplier = VampireGuardMult as float
	float VampireGuardDenominator = VampireGuardNom as float
	float VampireGuardMinimum = VampireGuardMin as float 
	float AdjustedVampireGuardScore = ((VampireGuardIncidentsDisplayed*VampireGuardMultiplier)/VampireGuardDenominator) - CommentVampGuardDec
	float VampireGuardDecrementer = AdjustedVampireGuardScore * CommentVampGuardDecPerc
	if(AdjustedVampireGuardScore > VampireGuardMinimum)
		CommentVampGuardDec += VampireGuardDecrementer
	endif
EndFunction

Function IncrementWerewolfMaulDec()
	float WerewolfMauls = Game.QueryStat("Mauls") as float
	float WerewolfMaulsCounterBalance = WerewolfMauls_CounterBalance as float
	float WerewolfMaulsDisplayed = WerewolfMauls - WerewolfMaulsCounterBalance
	float WerewolfMaulsDenominator = WerewolfMaulNom as float
	float WerewolfMaulsMinimum = WerewolfMaulMin as float 
	float AdjustedWerewolfMaulsScore = (WerewolfMaulsDisplayed/WerewolfMaulsDenominator) - WerewolfMaulDec
	float WerewolfMaulsDecrementer = AdjustedWerewolfMaulsScore * WerewolfMaulDecPerc
	if(AdjustedWerewolfMaulsScore > WerewolfMaulsMinimum)
		WerewolfMaulDec += WerewolfMaulsDecrementer
	endif
EndFunction

Function IncrementWerewolfTransDec()
	float WerewolfTransformationScore = Game.QueryStat("Werewolf Transformations") as float
	float WerewolfTransformationsCounterBalance = WerewolfTransformations_CounterBalance as float
	float WerewolfTransformationDisplayed = WerewolfTransformationScore - WerewolfTransformationsCounterBalance
	float WerewolfTransformationsDenominator = WerewolfTransformationsNom as float
	float WerewolfTransformationsMinimum = WerewolfTransformationsMin as float 
	float AdjustedWerewolfTransformationsScore = (WerewolfTransformationDisplayed/WerewolfTransformationsDenominator) - WerewolfTransDec
	float WerewolfTransformationsDecrementer = AdjustedWerewolfTransformationsScore * WerewolfTransDecPerc
	if(AdjustedWerewolfTransformationsScore > WerewolfTransformationsMinimum)
		WerewolfTransDec += WerewolfTransformationsDecrementer
	endif
EndFunction

Function IncrementWerewolfFeedDec()
	float WerewolfFeeding = WerewolfFeedings as float
	float WerewolfFeedsCounterBalance = WerewolfFeeds_CounterBalance as float
	float WerewolfFeedsDisplayed = WerewolfFeeding - WerewolfFeedsCounterBalance
	float WerewolfFeedingDenominator = WerewolfFeedsNom as float
	float WerewolfFeedingMinimum = WerewolfFeedsMin as float 
	float AdjustedWerewolfFeedingScore = (WerewolfFeedsDisplayed/WerewolfFeedingDenominator) - WerewolfFeedDec
	float WerewolfFeedingDecrementer = AdjustedWerewolfFeedingScore * WerewolfFeedDecPerc
	if(AdjustedWerewolfFeedingScore > WerewolfFeedingMinimum)
		WerewolfFeedDec += WerewolfFeedingDecrementer
	endif
EndFunction

Function IncrementCrimeWereSeenDec()
	float WerewolfSpotted = CrimeWerewolfSeen as float
	float WerewolfSpottedCounterBalance = WerewolfSeen_CounterBalance as float
	float WerewolfSpottedDisplayed = WerewolfSpotted - WerewolfSpottedCounterBalance
	float WerewolfSpottedMultiplier = TimesSpottedWerewolfMult as float
	float WerewolfSpottedDenominator = TimesSpottedWerewolfNom as float
	float WerewolfSpottedMinimum = TimesSpottedWerewolfMin as float 
	float AdjustedWerewolfSpottedScore = ((WerewolfSpottedDisplayed*WerewolfSpottedMultiplier)/WerewolfSpottedDenominator) - CrimeWereSeenDec
	float WerewolfSpottedDecrementer = AdjustedWerewolfSpottedScore * CrimeWereSeenDecPerc
	if(AdjustedWerewolfSpottedScore > WerewolfSpottedMinimum)
		CrimeWereSeenDec += WerewolfSpottedDecrementer
	endif
EndFunction

Function IncrementCommentWereVillagerDec()
	float CommentWereVillager = CommentWerewolfVillager as float
	float CommentWereVillagerCounterBalance = WerewolfComments_CounterBalance as float
	float CommentWereVillagerDisplayed = CommentWereVillager - CommentWereVillagerCounterBalance
	float CommentWereVillagerDenominator = WerewolfVillagerNom as float
	float CommentWereVillagerMinimum = WerewolfVillagerMin as float 
	float AdjustedCommentWereVillagerScore = (CommentWereVillagerDisplayed/CommentWereVillagerDenominator) - CommentWereVillagerDec
	float CommentWereVillagerDecrementer = AdjustedCommentWereVillagerScore * CommentWereVillagerDecPerc
	if(AdjustedCommentWereVillagerScore > CommentWereVillagerMinimum)
		CommentWereVillagerDec += CommentWereVillagerDecrementer
	endif
EndFunction

Function IncrementCommentWereGuardDec()
	float WerewolfGuardIncidents = CommentWerewolfGuard as float
	float WerewolfGuardIncidentsCounterBalance = WerewolfGuardComments_CounterBalance as float
	float WerewolfGuardIncidentsDisplayed = WerewolfGuardIncidents - WerewolfGuardIncidentsCounterBalance
	float WerewolfGuardMultiplier = WerewolfGuardMult as float
	float WerewolfGuardDenominator = WerewolfGuardNom as float
	float WerewolfGuardMinimum = WerewolfGuardMin as float 
	float AdjustedWerewolfGuardScore = ((WerewolfGuardIncidentsDisplayed*WerewolfGuardMultiplier)/WerewolfGuardDenominator) - CommentWereGuardDec
	float WerewolfGuardDecrementer = AdjustedWerewolfGuardScore * CommentWereGuardDecPerc
	if(AdjustedWerewolfGuardScore > WerewolfGuardMinimum)
		CommentWereGuardDec += WerewolfGuardDecrementer
	endif
EndFunction

Function IncrementCrimePettySeenDec()
	float SpottedPettyCrime = CrimePettySeen as float
	float SpottedPettyCrimeCounterBalance = PettyCrimeSeen_CounterBalance as float
	float SpottedPettyCrimeDisplayed = SpottedPettyCrime - SpottedPettyCrimeCounterBalance
	float SpottedPettyCrimeDenominator = SpottedPettyCrimeNom as float
	float SpottedPettyCrimeMinimum = SpottedPettyCrimeMin as float 
	float AdjustedSpottedPettyCrimeScore = (SpottedPettyCrimeDisplayed/SpottedPettyCrimeDenominator) - CrimePettySeenDec
	float SpottedPettyCrimeDecrementer = AdjustedSpottedPettyCrimeScore * CrimePettySeenDecPerc
	if(AdjustedSpottedPettyCrimeScore > SpottedPettyCrimeMinimum)
		CrimePettySeenDec += SpottedPettyCrimeDecrementer
	endif
EndFunction

Function IncrementCrimeAssaultsSeenDec()
	float SpottedAssaults = CrimeAssaultsSeen as float
	float SpottedAssaultsCounterBalance = AssaultsSeen_CounterBalance as float
	float SpottedAssaultsDisplayed = SpottedAssaults - SpottedAssaultsCounterBalance
	float SpottedAssaultsMultiplier = SpottedAssaultsMult as float
	float SpottedAssaultsDenominator = SpottedAssaultsNom as float
	float SpottedAssaultsMinimum = SpottedAssaultsMin as float 
	float AdjustedSpottedAssaultsScore = ((SpottedAssaultsDisplayed*SpottedAssaultsMultiplier)/SpottedAssaultsDenominator) - CrimeAssaultsSeenDec
	float SpottedAssaultsDecrementer = AdjustedSpottedAssaultsScore * CrimeAssaultsSeenDecPerc
	if(AdjustedSpottedAssaultsScore > SpottedAssaultsMinimum)
		CrimeAssaultsSeenDec += SpottedAssaultsDecrementer
	endif
EndFunction

Function IncrementCrimeMurdersSeenDec()
	float SpottedMurders = CrimeMurdersSeen
	float MurderArrest = CrimeMurderArrests
	float CrimeMurdersSeenTotal = ((SpottedMurders/2) + MurderArrest)
	float CrimeMurdersSeenCounterBalance = MurdersSeen_CounterBalance as float
	float CrimeMurdersSeenDisplayed = CrimeMurdersSeenTotal - CrimeMurdersSeenCounterBalance
	float CrimeMurdersSeenMultiplier = SpottedMurdersMult as float
	float CrimeMurdersSeenDenominator = SpottedMurdersNom as float
	float CrimeMurdersSeenMinimum = SpottedMurdersMin as float 
	float AdjustedCrimeMurdersSeenScore = ((CrimeMurdersSeenDisplayed*CrimeMurdersSeenMultiplier)/CrimeMurdersSeenDenominator) - CrimeMurdersSeenDec
	float CrimeMurdersSeenDecrementer = AdjustedCrimeMurdersSeenScore * CrimeMurdersSeenDecPerc
	if(AdjustedCrimeMurdersSeenScore > CrimeMurdersSeenMinimum)
		CrimeMurdersSeenDec += CrimeMurdersSeenDecrementer
	endif
EndFunction

Function IncrementSpellNecromancySeenDec()
	float SpellNecromancySeenIncidents = SpellNecromancySeen as float
	float SpellNecromancySeenCounterBalance = Necromancy_CounterBalance as float
	float SpellNecromancySeenDisplayed = SpellNecromancySeenIncidents - SpellNecromancySeenCounterBalance
	float SpellNecromancySeenDenominator = ZombieTimePowNom as float
	float SpellNecromancySeenMinimum = SpellNecromancySeenMin as float
	float AdjustedSpellNecromancySeenScore = (SpellNecromancySeenDisplayed/SpellNecromancySeenDenominator) - NecroTimesDecreament
	float SpellNecromancySeenDecrementer = AdjustedSpellNecromancySeenScore * NecroTimesDecreamentPerc
	if(AdjustedSpellNecromancySeenScore > SpellNecromancySeenMinimum)
		NecroTimesDecreament += SpellNecromancySeenDecrementer
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING CALCULATION DENOMINATOR AND MULTIPLIER PROPERTY VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetQuestsCompletedNom(int NewValue)
	QuestsCompletedNom = NewValue
EndFunction

Function SetLocationsNom(int NewValue)
	LocationsNom = NewValue
EndFunction

Function SetDungeonsNom(int NewValue)
	DungeonsNom = NewValue
EndFunction

Function SetPeopleKillsNom(int NewValue)
	PeopleKillsNom = NewValue
EndFunction

Function SetSpottedMurdersFameNom(int NewValue)
	SpottedMurdersFameNom = NewValue
EndFunction

Function SetSpottedMurdersFameMult(int NewValue)
	SpottedMurdersFameMult = NewValue
EndFunction

Function SetStoreInvestmentsNom(int NewValue)
	StoreInvestmentsNom = NewValue
EndFunction

Function SetHousesOwnedNom(int NewValue)
	HousesOwnedNom = NewValue
EndFunction

Function SetDragonKillsNom(int NewValue)
	DragonKillsNom = NewValue
EndFunction

Function SetZombieTimeDeaNom(int NewValue)
	ZombieTimeDeaNom = NewValue
EndFunction

Function SetVampirismNom(int NewValue)
	VampirismNom = NewValue
EndFunction


Function SetNecksBittenNom(int NewValue)
	NecksBittenNom = NewValue
EndFunction

Function SetVampiricSpellSeenNom(int NewValue)
	VampiricSpellSeenNom = NewValue
EndFunction

Function SetVampiricSpellSeenMult(int NewValue)
	VampiricSpellSeenMult = NewValue
EndFunction

Function SetVampireLordTransformationNom(int NewValue)
	VampireLordTransformationNom = NewValue
EndFunction

Function SetVampireLordSeenNom(int NewValue)
	VampireLordSeenNom = NewValue
EndFunction

Function SetVampireLordSeenMult(int NewValue)
	VampireLordSeenMult = NewValue
EndFunction

Function SetVampireVillagerNom(int NewValue)
	VampireVillagerNom = NewValue
EndFunction

Function SetVampireGuardNom(int NewValue)
	VampireGuardNom = NewValue
EndFunction

Function SetVampireGuardMult(int NewValue)
	VampireGuardMult = NewValue
EndFunction

Function SetLycanthropyNom(int NewValue)
	LycanthropyNom = NewValue
EndFunction

Function SetWerewolfMaulNom(int NewValue)
	WerewolfMaulNom = NewValue
EndFunction

Function SetWerewolfTransformationsNom(int NewValue)
	WerewolfTransformationsNom = NewValue
EndFunction

Function SetWerewolfFeedsNom(int NewValue)
	WerewolfFeedsNom = NewValue
EndFunction

Function SetTimesSpottedWerewolfNom(int NewValue)
	TimesSpottedWerewolfNom = NewValue
EndFunction

Function SetTimesSpottedWerewolfMult(int NewValue)
	TimesSpottedWerewolfMult = NewValue
EndFunction

Function SetWerewolfVillagerNom(int NewValue)
	WerewolfVillagerNom = NewValue
EndFunction

Function SetWerewolfGuardNom(int NewValue)
	WerewolfGuardNom = NewValue
EndFunction

Function SetWerewolfGuardMult(int NewValue)
	WerewolfGuardMult = NewValue
EndFunction

Function SetConjurationSkillNom(int NewValue)
	ConjurationSkillNom = NewValue
EndFunction

Function SetCannibalFeedNom(int NewValue)
	CannibalFeedNom = NewValue
EndFunction

Function SetCharityNom(int NewValue)
	CharityNom = NewValue
EndFunction

Function SetRestorationSkillNom(int NewValue)
	RestorationSkillNom = NewValue
EndFunction

Function SetDaedraKilledNom(int NewValue)
	DaedraKilledNom = NewValue
EndFunction

Function SetUndeadKilledNom(int NewValue)
	UndeadKilledNom = NewValue
EndFunction

Function SetSpottedAssaultsNom(int NewValue)
	SpottedAssaultsNom = NewValue
EndFunction

Function SetSpottedAssaultsMult(int NewValue)
	SpottedAssaultsMult = NewValue
EndFunction

Function SetSpottedMurdersNom(int NewValue)
	SpottedMurdersNom = NewValue
EndFunction

Function SetSpottedMurdersMult(int NewValue)
	SpottedMurdersMult = NewValue
EndFunction

Function SetSpottedPettyCrimeNom(int NewValue)
	SpottedPettyCrimeNom = NewValue
EndFunction

Function SetMurdersNom(int NewValue)
	MurdersNom = NewValue
EndFunction

Function SetPocketsPickedNom(int NewValue)
	PocketsPickedNom = NewValue
EndFunction

Function SetHorsesStolenNom(int NewValue)
	HorsesStolenNom = NewValue
EndFunction

Function SetItemsStolenNom(int NewValue)
	ItemsStolenNom = NewValue
EndFunction

Function SetTrespassesNom(int NewValue)
	TrespassesNom = NewValue
EndFunction

Function SetJailEscapesNom(int NewValue)
	JailEscapesNom = NewValue
EndFunction

Function SetThievesGuildQuestsNom(int NewValue)
	ThievesGuildQuestsNom = NewValue
EndFunction

Function SetDarkBrotherhoodQuestsNom(int NewValue)
	DarkBrotherhoodQuestsNom = NewValue
EndFunction

Function SetDaysJailedNom(int NewValue)
	DaysJailedNom = NewValue
EndFunction

Function SetFinesPayedNom(int NewValue)
	FinesPayedNom = NewValue
EndFunction

Function SetCompanionsQuestsLawNom(int NewValue)
	CompanionsQuestsLawNom = NewValue
EndFunction

Function SetBanditsKilledNom(int NewValue)
	BanditsKilledNom = NewValue
EndFunction

Function SetWizardKillerNom(int NewValue)
	WizardKillerNom = NewValue
EndFunction

Function SetWitchKillerNom(int NewValue)
	WitchKillerNom = NewValue
EndFunction

Function SetForswornKillerNom(int NewValue)
	ForswornKillerNom = NewValue
EndFunction

Function SetCompanionsQuestsDepNom(int NewValue)
	CompanionsQuestsDepNom = NewValue
EndFunction

Function SetCivilWarQuestsNom(int NewValue)
	CivilWarQuestsNom = NewValue
EndFunction

Function SetCivilWarQuestsMult(int NewValue)
	CivilWarQuestsMult = NewValue
EndFunction

Function SetMiscQuestsNom(int NewValue)
	MiscQuestsNom = NewValue
EndFunction

Function SetWarriorSkillNom(int NewValue)
	WarriorSkillNom = NewValue
EndFunction

Function SetBrawlsWonNom(int NewValue)
	BrawlsWonNom = NewValue
EndFunction

Function SetPersuasionsNom(int NewValue)
	PersuasionsNom = NewValue
EndFunction

Function SetCollegeWinterholdQuestsNom(int NewValue)
	CollegeWinterholdQuestsNom = NewValue
EndFunction

Function SetBribesNom(int NewValue)
	BribesNom = NewValue
EndFunction

Function SetIntimidationsNom(int NewValue)
	IntimidationsNom = NewValue
EndFunction

Function SetZombieTimePowNom(int NewValue)
	ZombieTimePowNom = NewValue
EndFunction

Function SetBlackSoulTrapNom(int NewValue)
	BlackSoulTrapNom = NewValue
EndFunction

Function SetSoulsTrappedNom(int NewValue)
	SoulsTrappedNom = NewValue
EndFunction

Function SetBooksReadNom(int NewValue)
	BooksReadNom = NewValue
EndFunction

Function SetArcaneMasteryNom(int NewValue)
	ArcaneMasteryNom = NewValue
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING CALCULATION MAX VALUE PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetQuestFameMax(int NewValue)
	QuestFameMax = NewValue
EndFunction

Function SetQuestDaedricMax(int NewValue)
	QuestDaedricMax = NewValue
EndFunction

Function SetQuestAedricMax(int NewValue)
	QuestAedricMax = NewValue
EndFunction

Function SetQuestCrimeMax(int NewValue)
	QuestCrimeMax = NewValue
EndFunction

Function SetQuestLawMax(int NewValue)
	QuestLawMax = NewValue
EndFunction

Function SetQuestDependabilityMax(int NewValue)
	QuestDependabilityMax = NewValue
EndFunction

Function SetQuestAmbitionMax(int NewValue)
	QuestAmbitionMax = NewValue
EndFunction

Function SetQuestsCompletedMax(int NewValue)
	QuestsCompletedMax = NewValue
EndFunction

Function SetLocationsMax(int NewValue)
	LocationsMax = NewValue
EndFunction

Function SetDungeonsMax(int NewValue)
	DungeonsMax = NewValue
EndFunction

Function SetPeopleKillsMax(int NewValue)
	PeopleKillsMax = NewValue
EndFunction

Function SetStoreInvestmentsMax(int NewValue)
	StoreInvestmentsMax = NewValue
EndFunction

Function SetHousesOwnedMax(int NewValue)
	HousesOwnedMax = NewValue
EndFunction

Function SetDragonKillsMax(int NewValue)
	DragonKillsMax = NewValue
EndFunction

Function SetVampirismMax(int NewValue)
	VampirismMax = NewValue
EndFunction

Function SetNecksBittenMax(int NewValue)
	NecksBittenMax = NewValue
EndFunction

Function SetVampiricSpellSeenMax(int NewValue)
	VampiricSpellSeenMax = NewValue
EndFunction

Function SetVampireLordTransformationMax(int NewValue)
	VampireLordTransformationMax = NewValue
EndFunction

Function SetVampireLordSeenMax(int NewValue)
	VampireLordSeenMax = NewValue
EndFunction

Function SetVampireVillagerMax(int NewValue)
	VampireVillagerMax = NewValue
EndFunction

Function SetVampireGuardMax(int NewValue)
	VampireGuardMax = NewValue
EndFunction

Function SetLycanthropyMax(int NewValue)
	LycanthropyMax = NewValue
EndFunction

Function SetWerewolfTransformationsMax(int NewValue)
	WerewolfTransformationsMax = NewValue
EndFunction

Function SetWerewolfMaulMax(int NewValue)
	WerewolfMaulMax = NewValue
EndFunction

Function SetWerewolfFeedsMax(int NewValue)
	WerewolfFeedsMax = NewValue
EndFunction

Function SetTimesSpottedWerewolfMax(int NewValue)
	TimesSpottedWerewolfMax = NewValue
EndFunction

Function SetWerewolfVillagerMax(int NewValue)
	WerewolfVillagerMax = NewValue
EndFunction

Function SetWerewolfGuardMax(int NewValue)
	WerewolfGuardMax = NewValue
EndFunction

Function SetCannibalFeedMax(int NewValue)
	CannibalFeedMax = NewValue
EndFunction

Function SetCharityMax(int NewValue)
	CharityMax = NewValue
EndFunction

Function SetDaedraKilledMax(int NewValue)
	DaedraKilledMax = NewValue
EndFunction

Function SetUndeadKilledMax(int NewValue)
	UndeadKilledMax = NewValue
EndFunction

Function SetSpottedAssaultsMax(int NewValue)
	SpottedAssaultsMax = NewValue
EndFunction

Function SetSpottedMurdersMax(int NewValue)
	SpottedMurdersMax = NewValue
EndFunction

Function SetSpottedPettyCrimeMax(int NewValue)
	SpottedPettyCrimeMax = NewValue
EndFunction

Function SetMurdersMax(int NewValue)
	MurdersMax = NewValue
EndFunction

Function SetPocketsPickedMax(int NewValue)
	PocketsPickedMax = NewValue
EndFunction

Function SetHorsesStolenMax(int NewValue)
	HorsesStolenMax = NewValue
EndFunction

Function SetItemsStolenMax(int NewValue)
	ItemsStolenMax = NewValue
EndFunction

Function SetTrespassesMax(int NewValue)
	TrespassesMax = NewValue
EndFunction

Function SetJailEscapesMax(int NewValue)
	JailEscapesMax = NewValue
EndFunction

Function SetDaysJailedMax(int NewValue)
	DaysJailedMax = NewValue
EndFunction

Function SetFinesPayedMax(int NewValue)
	FinesPayedMax = NewValue
EndFunction

Function SetThievesGuildQuestsMax(int NewValue)
	ThievesGuildQuestsMax = NewValue
EndFunction

Function SetDarkBrotherhoodQuestsMax(int NewValue)
	DarkBrotherhoodQuestsMax = NewValue
EndFunction

Function SetCompanionsQuestsMax(int NewValue)
	CompanionsQuestsMax = NewValue
EndFunction

Function SetCivilWarQuestsMax(int NewValue)
	CivilWarQuestsMax = NewValue
EndFunction

Function SetBanditsKilledMax(int NewValue)
	BanditsKilledMax = NewValue
EndFunction

Function SetWizardKillerMax(int NewValue)
	WizardKillerMax = NewValue
EndFunction

Function SetWitchKillerMax(int NewValue)
	WitchKillerMax = NewValue
EndFunction

Function SetForswornKillerMax(int NewValue)
	ForswornKillerMax = NewValue
EndFunction

Function SetMiscQuestsMax(int NewValue)
	MiscQuestsMax = NewValue
EndFunction

Function SetBrawlsWonMax(int NewValue)
	BrawlsWonMax = NewValue
EndFunction

Function SetPersuasionsMax(int NewValue)
	PersuasionsMax = NewValue
EndFunction

Function SetCollegeWinterholdQuestsMax(int NewValue)
	CollegeWinterholdQuestsMax = NewValue
EndFunction

Function SetBribesMax(int NewValue)
	BribesMax = NewValue
EndFunction

Function SetIntimidationsMax(int NewValue)
	IntimidationsMax = NewValue
EndFunction

Function SetZombieTimeMax(int NewValue)
	ZombieTimeMax = NewValue
EndFunction

Function SetBlackSoulTrapMax(int NewValue)
	BlackSoulTrapMax = NewValue
EndFunction

Function SetSoulsTrappedMax(int NewValue)
	SoulsTrappedMax = NewValue
EndFunction

Function SetBooksReadMax(int NewValue)
	BooksReadMax = NewValue
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING CALCULATION MIN VALUE PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetNecksBittenMin(int NewValue)
	NecksBittenMin = NewValue
EndFunction

Function SetVampiricSpellSeenMin(int NewValue)
	VampiricSpellSeenMin = NewValue
EndFunction

Function SetVampireLordTransformationMin(int NewValue)
	VampireLordTransformationMin = NewValue
EndFunction

Function SetVampireLordSeenMin(int NewValue)
	VampireLordSeenMin = NewValue
EndFunction

Function SetVampireVillagerMin(int NewValue)
	VampireVillagerMin = NewValue
EndFunction

Function SetVampireGuardMin(int NewValue)
	VampireGuardMin = NewValue
EndFunction

Function SetWerewolfMaulMin(int NewValue)
	WerewolfMaulMin = NewValue
EndFunction

Function SetWerewolfTransformationsMin(int NewValue)
	WerewolfTransformationsMin = NewValue
EndFunction

Function SetWerewolfFeedsMin(int NewValue)
	WerewolfFeedsMin = NewValue
EndFunction

Function SetTimesSpottedWerewolfMin(int NewValue)
	TimesSpottedWerewolfMin = NewValue
EndFunction

Function SetWerewolfVillagerMin(int NewValue)
	WerewolfVillagerMin = NewValue
EndFunction

Function SetWerewolfGuardMin(int NewValue)
	WerewolfGuardMin = NewValue
EndFunction

Function SetSpottedAssaultsMin(int NewValue)
	SpottedAssaultsMin = NewValue
EndFunction

Function SetSpottedMurdersMin(int NewValue)
	SpottedMurdersMin = NewValue
EndFunction

Function SetSpottedPettyCrimeMin(int NewValue)
	SpottedPettyCrimeMin = NewValue
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING TRACKED STAT PROPERTY VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetKillsBandits(int NewValue)
	KillsBandits = NewValue
EndFunction

Function SetKillsWizards(int NewValue)
	KillsWizards = NewValue
EndFunction

Function SetKillsWitches(int NewValue)
	KillsWitches = NewValue
EndFunction

Function SetKillsForsworn(int NewValue)
	KillsForsworn = NewValue
EndFunction

Function SetKillsDragons(int NewValue)
	KillsDragons = NewValue
EndFunction

Function SetKillsDragonPriests(int NewValue)
	KillsDragonPriests = NewValue
EndFunction

Function SetSpellVampiricSpellSeen(int NewValue)
	SpellVampiricSpellSeen = NewValue
EndFunction

Function SetCrimeVampireLordSeen(int NewValue)
	CrimeVampireLordSeen = NewValue
EndFunction

Function SetVampireLordTransformations(int NewValue)
	VampireLordTransformations = NewValue
EndFunction

Function SetCommentVampireVillager(int NewValue)
	CommentVampireVillager = NewValue
EndFunction

Function SetCommentVampireGuard(int NewValue)
	CommentVampireGuard = NewValue
EndFunction

Function SetWerewolfFeedings(int NewValue)
	WerewolfFeedings = NewValue
EndFunction

Function SetCommentWerewolfVillager(int NewValue)
	CommentWerewolfVillager = NewValue
EndFunction

Function SetCommentWerewolfGuard(int NewValue)
	CommentWerewolfGuard = NewValue
EndFunction

Function SetCrimeWerewolfSeen(int NewValue)
	CrimeWerewolfSeen = NewValue
EndFunction

Function SetBlackSoulTraps(int NewValue)
	BlackSoulTraps = NewValue
EndFunction

Function SetSpellNecromancySeen(int NewValue)
	SpellNecromancySeen = NewValue
EndFunction

Function SetSpellCannibalFeed(int NewValue)
	SpellCannibalFeed = NewValue
EndFunction

Function SetSpellCharityAdded(int NewValue)
	SpellCharityAdded = NewValue
EndFunction

Function SetCrimePettySeen(int NewValue)
	CrimePettySeen = NewValue
EndFunction

Function SetCrimeAssaultsSeen(int NewValue)
	CrimeAssaultsSeen = NewValue
EndFunction

Function SetCrimeMurdersSeen(float NewValue)
	CrimeMurdersSeen = NewValue
EndFunction

Function SetCrimeMurderArrests(float NewValue)
	CrimeMurderArrests = NewValue
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING COUNTER BALANCE PROPERTY VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetQuestFame_CounterBalance(float percentage)
	QuestFame_CounterBalance = CalcCounterBalance(QuestFame_CounterBalance, QuestFameScore(), percentage)
EndFunction

Function SetQuestDaedric_CounterBalance(float percentage)
	QuestDaedric_CounterBalance = CalcCounterBalance(QuestDaedric_CounterBalance, QuestFameScore(), percentage)
EndFunction

Function SetQuestAedric_CounterBalance(float percentage)
	QuestAedric_CounterBalance = CalcCounterBalance(QuestAedric_CounterBalance, QuestAedricScore(), percentage)
EndFunction

Function SetQuestCrime_CounterBalance(float percentage)
	QuestCrime_CounterBalance = CalcCounterBalance(QuestCrime_CounterBalance, QuestCrimeScore(), percentage)
EndFunction

Function SetQuestLaw_CounterBalance(float percentage)
	QuestLaw_CounterBalance = CalcCounterBalance(QuestLaw_CounterBalance, QuestLawScore(), percentage)
EndFunction

Function SetQuestDependability_CounterBalance(float percentage)
	QuestDependability_CounterBalance = CalcCounterBalance(QuestDependability_CounterBalance, QuestDependabilityScore(), percentage)
EndFunction

Function SetQuestAmbition_CounterBalance(float percentage)
	QuestAmbition_CounterBalance = CalcCounterBalance(QuestAmbition_CounterBalance, QuestAmbitionScore(), percentage)
EndFunction

Function SetQuestsCompleted_CounterBalance(float percentage)
	QuestsCompleted_CounterBalance = CalcCounterBalance(QuestsCompleted_CounterBalance, QuestsCompletedScore(), percentage)
EndFunction

Function SetLocations_CounterBalance(float percentage)
	Locations_CounterBalance = CalcCounterBalance(Locations_CounterBalance, LocationsScore(), percentage)
EndFunction

Function SetDungeons_CounterBalance(float percentage)
	Dungeons_CounterBalance = CalcCounterBalance(Dungeons_CounterBalance, DungeonsScore(), percentage)
EndFunction

Function SetPeopleKills_CounterBalance(float percentage)
	PeopleKills_CounterBalance = CalcCounterBalance(PeopleKills_CounterBalance, KillScore(), percentage)
EndFunction

Function SetStoreInvestments_CounterBalance(float percentage)
	StoreInvestments_CounterBalance = CalcCounterBalance(StoreInvestments_CounterBalance, StoreInvestmentScore(), percentage)
EndFunction

Function SetHousesOwned_CounterBalance(float percentage)
	HousesOwned_CounterBalance = CalcCounterBalance(HousesOwned_CounterBalance, HousesOwnedScore(), percentage)
EndFunction

Function SetDragonsKilled_CounterBalance(float percentage)
	DragonsKilled_CounterBalance = CalcCounterBalance(DragonsKilled_CounterBalance, DragonKillScore(), percentage)
EndFunction

Function SetDragonPriestsKilled_CounterBalance(float percentage)
	DragonPriestsKilled_CounterBalance = CalcCounterBalance(DragonPriestsKilled_CounterBalance, DragonPriestKillScore(), percentage)
EndFunction

Function SetNecksBitten_CounterBalance(float percentage)
	NecksBitten_CounterBalance = CalcCounterBalance(NecksBitten_CounterBalance, NecksBittenScore(), percentage)
EndFunction

Function SetVampiricSpellSeen_CounterBalance(float percentage)
	VampiricSpellSeen_CounterBalance = CalcCounterBalance(VampiricSpellSeen_CounterBalance, VampiricSpellSeenScore(), percentage)
EndFunction

Function SetVampireLordTransformations_CounterBalance(float percentage)
	VampireLordTransformations_CounterBalance = CalcCounterBalance(VampireLordTransformations_CounterBalance, VampireLordTransformationScore(), percentage)
EndFunction

Function SetVampireLordSeen_CounterBalance(float percentage)
	VampireLordSeen_CounterBalance = CalcCounterBalance(VampireLordSeen_CounterBalance, VampireLordSeenScore(), percentage)
EndFunction

Function SetVampireComments_CounterBalance(float percentage)
	VampireComments_CounterBalance = CalcCounterBalance(VampireComments_CounterBalance, CommentVampireVillagerScore(), percentage)
EndFunction

Function SetVampireGuardComments_CounterBalance(float percentage)
	VampireGuardComments_CounterBalance = CalcCounterBalance(VampireGuardComments_CounterBalance, CommentVampireGuardScore(), percentage)
EndFunction

Function SetWerewolfMauls_CounterBalance(float percentage)
	WerewolfMauls_CounterBalance = CalcCounterBalance(WerewolfMauls_CounterBalance, WerewolfMaulScore(), percentage)
EndFunction

Function SetWerewolfTransformations_CounterBalance(float percentage)
	WerewolfTransformations_CounterBalance = CalcCounterBalance(WerewolfTransformations_CounterBalance, WerewolfTransformationScore(), percentage)
EndFunction

Function SetWerewolfFeeds_CounterBalance(float percentage)
	WerewolfFeeds_CounterBalance = CalcCounterBalance(WerewolfFeeds_CounterBalance, WerewolfFeedingScore(), percentage)
EndFunction

Function SetWerewolfSeen_CounterBalance(float percentage)
	WerewolfSeen_CounterBalance = CalcCounterBalance(WerewolfSeen_CounterBalance, WerewolfSpottedScore(), percentage)
EndFunction

Function SetWerewolfComments_CounterBalance(float percentage)
	WerewolfComments_CounterBalance = CalcCounterBalance(WerewolfComments_CounterBalance, CommentWerewolfVillagerScore(), percentage)
EndFunction

Function SetWerewolfGuardComments_CounterBalance(float percentage)
	WerewolfGuardComments_CounterBalance = CalcCounterBalance(WerewolfGuardComments_CounterBalance, CommentWerewolfGuardScore(), percentage)
EndFunction

Function SetPettyCrimeSeen_CounterBalance(float percentage)
	PettyCrimeSeen_CounterBalance = CalcCounterBalance(PettyCrimeSeen_CounterBalance, SpottedPettyCrimeScore(), percentage)
EndFunction

Function SetAssaultsSeen_CounterBalance(float percentage)
	AssaultsSeen_CounterBalance = CalcCounterBalance(AssaultsSeen_CounterBalance, SpottedAssaultScore(), percentage)
EndFunction

Function SetMurdersSeen_CounterBalance(float percentage)
	MurdersSeen_CounterBalance = CalcCounterBalance(MurdersSeen_CounterBalance, SpottedMurderScore(), percentage)
EndFunction

Function SetMurders_CounterBalance(float percentage)
	Murders_CounterBalance = CalcCounterBalance(Murders_CounterBalance, MurderScore(), percentage)
EndFunction

Function SetPocketsPicked_CounterBalance(float percentage)
	PocketsPicked_CounterBalance = CalcCounterBalance(PocketsPicked_CounterBalance, PocketsPickedScore(), percentage)
EndFunction

Function SetHorsesStolen_CounterBalance(float percentage)
	HorsesStolen_CounterBalance = CalcCounterBalance(HorsesStolen_CounterBalance, HorsesStolenScore(), percentage)
EndFunction

Function SetItemsStolen_CounterBalance(float percentage)
	ItemsStolen_CounterBalance = CalcCounterBalance(ItemsStolen_CounterBalance, ItemsStolenScore(), percentage)
EndFunction

Function SetTrespasses_CounterBalance(float percentage)
	Trespasses_CounterBalance = CalcCounterBalance(Trespasses_CounterBalance, TrespassScore(), percentage)
EndFunction

Function SetJailEscapes_CounterBalance(float percentage)
	JailEscapes_CounterBalance = CalcCounterBalance(JailEscapes_CounterBalance, JailEscapeScore(), percentage)
EndFunction

Function SetDaysJailed_CounterBalance(float percentage)
	DaysJailed_CounterBalance = CalcCounterBalance(DaysJailed_CounterBalance, DaysJailedScore(), percentage)
EndFunction

Function SetFinesPayed_CounterBalance(float percentage)
	FinesPayed_CounterBalance = CalcCounterBalance(FinesPayed_CounterBalance, FinesPayedScore(), percentage)
EndFunction

Function SetThievesGuildMisc_CounterBalance(float percentage)
	ThievesGuildMisc_CounterBalance = CalcCounterBalance(ThievesGuildMisc_CounterBalance, ThievesGuildeScore(), percentage)
EndFunction

Function SetDarkBrotherhoodMisc_CounterBalance(float percentage)
	DarkBrotherhoodMisc_CounterBalance = CalcCounterBalance(DarkBrotherhoodMisc_CounterBalance, DarkBrotherhoodScore(), percentage)
EndFunction

Function SetCompanionsMisc_CounterBalance(float percentage)
	CompanionsMisc_CounterBalance = CalcCounterBalance(CompanionsMisc_CounterBalance, CompanionsScore(), percentage)
EndFunction

Function SetCollegeMisc_CounterBalance(float percentage)
	CollegeMisc_CounterBalance = CalcCounterBalance(CollegeMisc_CounterBalance, CollegeWinterholdScore(), percentage)
EndFunction

Function SetBrawls_CounterBalance(float percentage)
	Brawls_CounterBalance = CalcCounterBalance(Brawls_CounterBalance, BrawlsWonScore(), percentage)
EndFunction

Function SetMiscQuests_CounterBalance(float percentage)
	MiscQuests_CounterBalance = CalcCounterBalance(MiscQuests_CounterBalance, MiscQuestsScore(), percentage)
EndFunction

Function SetCivilWar_CounterBalance(float percentage)
	CivilWar_CounterBalance = CalcCounterBalance(CivilWar_CounterBalance, CivilWarQuestsScore(), percentage)
EndFunction

Function SetPersuasions_CounterBalance(float percentage)
	Persuasions_CounterBalance = CalcCounterBalance(Persuasions_CounterBalance, PersuasionScore(), percentage)
EndFunction

Function SetIntimidations_CounterBalance(float percentage)
	Intimidations_CounterBalance = CalcCounterBalance(Intimidations_CounterBalance, IntimidationScore(), percentage)
EndFunction

Function SetBribes_CounterBalance(float percentage)
	Bribes_CounterBalance = CalcCounterBalance(Bribes_CounterBalance, BribeScore(), percentage)
EndFunction

Function SetBooksRead_CounterBalance(float percentage)
	BooksRead_CounterBalance = CalcCounterBalance(BooksRead_CounterBalance, BooksReadScore(), percentage)
EndFunction

Function SetKillsUndead_CounterBalance(float percentage)
	KillsUndead_CounterBalance = CalcCounterBalance(KillsUndead_CounterBalance, UndeadKilledScore(), percentage)
EndFunction

Function SetKillsDaedra_CounterBalance(float percentage)
	KillsDaedra_CounterBalance = CalcCounterBalance(KillsDaedra_CounterBalance, DaedraKilledScore(), percentage)
EndFunction

Function SetKillsBandits_CounterBalance(float percentage)
	KillsBandits_CounterBalance = CalcCounterBalance(KillsBandits_CounterBalance, BanditKillerScore(), percentage)
EndFunction

Function SetKillsWizards_CounterBalance(float percentage)
	KillsWizards_CounterBalance = CalcCounterBalance(KillsWizards_CounterBalance, WizardKillerScore(), percentage)
EndFunction

Function SetKillsWitches_CounterBalance(float percentage)
	KillsWitches_CounterBalance = CalcCounterBalance(KillsWitches_CounterBalance, WitchKillerScore(), percentage)
EndFunction

Function SetKillsForsworn_CounterBalance(float percentage)
	KillsForsworn_CounterBalance = CalcCounterBalance(KillsForsworn_CounterBalance, ForswornKillerScore(), percentage)
EndFunction

Function SetSoulsTrapped_CounterBalance(float percentage)
	SoulsTrapped_CounterBalance = CalcCounterBalance(SoulsTrapped_CounterBalance, SoulsTrappedScore(), percentage)
EndFunction

Function SetBlackSoulTraps_CounterBalance(float percentage)
	BlackSoulTraps_CounterBalance = CalcCounterBalance(BlackSoulTraps_CounterBalance, BlackSoulTrapScore(), percentage)
EndFunction

Function SetNecromancy_CounterBalance(float percentage)
	Necromancy_CounterBalance = CalcCounterBalance(Necromancy_CounterBalance, NecroTimesScore(), percentage)
EndFunction

Function SetCannibalFeed_CounterBalance(float percentage)
	CannibalFeed_CounterBalance = CalcCounterBalance(CannibalFeed_CounterBalance, CannibalFeedScore(), percentage)
EndFunction

Function SetCharityAdded_CounterBalance(float percentage)
	CharityAdded_CounterBalance = CalcCounterBalance(CharityAdded_CounterBalance, CharityScore(), percentage)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING REPUTATION CALCULATION PROPERTY VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetRepDifferenceLarge(float NewValue)
	RepDifferenceLarge = NewValue
EndFunction

Function SetRepDifferenceMedium(float NewValue)
	RepDifferenceMedium = NewValue
EndFunction

Function SetRepDifferenceSmall(float NewValue)
	RepDifferenceSmall = NewValue
EndFunction

Function SetMoralDifferenceLarge(float NewValue)
	MoralDifferenceLarge = NewValue
EndFunction

Function SetMoralDifferenceMedium(float NewValue)
	MoralDifferenceMedium = NewValue
EndFunction

Function SetMoralDifferenceSmall(float NewValue)
	MoralDifferenceSmall = NewValue
EndFunction

Function SetAedricDampenerVeryLow(float NewValue)
	AedricDampenerVeryLow = NewValue
EndFunction

Function SetAedricDampenerLow(float NewValue)
	AedricDampenerLow = NewValue
EndFunction

Function SetAedricDampenerMed(float NewValue)
	AedricDampenerMed = NewValue
EndFunction

Function SetAedricDampenerHigh(float NewValue)
	AedricDampenerHigh = NewValue
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING AND INCREMENTING FACTION RELATED TRACKED STAT PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
int property ThalmorQuestEnemy = 0 auto
int property ForswornQuestEnemy = 0 auto

Function IncrementThalmorQuestEnemy(int NewValue)
	ThalmorQuestEnemy += NewValue
EndFunction

Function DecrementThalmorQuestEnemy(int NewValue)
	ThalmorQuestEnemy -= NewValue
EndFunction

Function SetThalmorQuestEnemy(int NewValue)
	ThalmorQuestEnemy = NewValue
EndFunction

Function IncrementForswornQuestEnemy(int NewValue)
	ForswornQuestEnemy += NewValue
EndFunction

Function DecrementForswornQuestEnemy(int NewValue)
	ForswornQuestEnemy -= NewValue
EndFunction

Function SetForswornQuestEnemy(int NewValue)
	ForswornQuestEnemy = NewValue
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING FAME THRESHOLD VALUE PROPERTIES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetFameThresholdOne(int NewValue)
	FameThresholdOne = NewValue
EndFunction

Function SetFameThresholdTwo(int NewValue)
	FameThresholdTwo = NewValue
EndFunction

Function SetFameThresholdThree(int NewValue)
	FameThresholdThree = NewValue
EndFunction

Function SetFameThresholdFour(int NewValue)
	FameThresholdFour = NewValue
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING DECREMENTED TRACKED STAT PROPERTY VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetNecksBittenDec(float NewValue)
	NecksBittenDec = NewValue
EndFunction

Function SetSpellVampSpellDec(float NewValue)
	SpellVampSpellDec = NewValue
EndFunction

Function SetVampLordTransDec(float NewValue)
	VampLordTransDec = NewValue
EndFunction

Function SetCrimeVampLordSeenDec(float NewValue)
	CrimeVampLordSeenDec = NewValue
EndFunction

Function SetCommentVampVillagerDec(float NewValue)
	CommentVampVillagerDec = NewValue
EndFunction

Function SetCommentVampGuardDec(float NewValue)
	CommentVampGuardDec = NewValue
EndFunction

Function SetWerewolfMaulDec(float NewValue)
	WerewolfMaulDec = NewValue
EndFunction

Function SetWerewolfTransDec(float NewValue)
	WerewolfTransDec = NewValue
EndFunction

Function SetWerewolfFeedDec(float NewValue)
	WerewolfFeedDec = NewValue
EndFunction

Function SetCrimeWereSeenDec(float NewValue)
	CrimeWereSeenDec = NewValue
EndFunction

Function SetCommentWereVillagerDec(float NewValue)
	CommentWereVillagerDec = NewValue
EndFunction

Function SetCommentWereGuardDec(float NewValue)
	CommentWereGuardDec = NewValue
EndFunction

Function SetCrimePettySeenDec(float NewValue)
	CrimePettySeenDec = NewValue
EndFunction

Function SetCrimeAssaultsSeenDec(float NewValue)
	CrimeAssaultsSeenDec = NewValue
EndFunction

Function SetCrimeMurdersSeenDec(float NewValue)
	CrimeMurdersSeenDec = NewValue
EndFunction

Function SetNecroTimesDecreament(float NewValue)
	NecroTimesDecreament = NewValue
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING DECREMENTED TRACKED STAT PROPERTY VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetNecksBittenDecTime(float NewValue)
	NecksBittenDecTime = NewValue
EndFunction

Function SetVampSpellDecTime(float NewValue)
	VampSpellDecTime = NewValue
EndFunction

Function SetVampLordTransDecTime(float NewValue)
	VampLordTransDecTime = NewValue
EndFunction

Function SetCrimeVampLordSeenDecTime(float NewValue)
	CrimeVampLordSeenDecTime = NewValue
EndFunction

Function SetCommentVampVillagerDecTime(float NewValue)
	CommentVampVillagerDecTime = NewValue
EndFunction

Function SetCommentVampGuardDecTime(float NewValue)
	CommentVampGuardDecTime = NewValue
EndFunction

Function SetWerewolfMaulDecTime(float NewValue)
	WerewolfMaulDecTime = NewValue
EndFunction

Function SetWerewolfTransDecTime(float NewValue)
	WerewolfTransDecTime = NewValue
EndFunction

Function SetWerewolfFeedDecTime(float NewValue)
	WerewolfFeedDecTime = NewValue
EndFunction

Function SetCrimeWereSeenDecTime(float NewValue)
	CrimeWereSeenDecTime = NewValue
EndFunction

Function SetCommentWereVillagerDecTime(float NewValue)
	CommentWereVillagerDecTime = NewValue
EndFunction

Function SetCommentWereGuardDecTime(float NewValue)
	CommentWereGuardDecTime = NewValue
EndFunction

Function SetCrimePettySeenDecTime(float NewValue)
	CrimePettySeenDecTime = NewValue
EndFunction

Function SetCrimeAssaultsSeenDecTime(float NewValue)
	CrimeAssaultsSeenDecTime = NewValue
EndFunction

Function SetCrimeMurdersSeenDecTime(float NewValue)
	CrimeMurdersSeenDecTime = NewValue
EndFunction

Function SetSpellNecromancySeenDecTime(float NewValue)
	SpellNecromancySeenDecTime = NewValue
EndFunction

Function SetNecksBittenDecPerc(float NewValue)
	NecksBittenDecPerc = NewValue
EndFunction

Function SetVampSpellDecPerc(float NewValue)
	SpellVampSpellDecPerc = NewValue
EndFunction

Function SetVampLordTransDecPerc(float NewValue)
	VampLordTransDecPerc = NewValue
EndFunction

Function SetCrimeVampLordSeenDecPerc(float NewValue)
	CrimeVampLordSeenPerc = NewValue
EndFunction

Function SetCommentVampVillagerDecPerc(float NewValue)
	CommentVampVillagerDecPerc = NewValue
EndFunction

Function SetCommentVampGuardDecPerc(float NewValue)
	CommentVampGuardDecPerc = NewValue
EndFunction

Function SetWerewolfMaulDecPerc(float NewValue)
	WerewolfMaulDecPerc = NewValue
EndFunction

Function SetWerewolfTransDecPerc(float NewValue)
	WerewolfTransDecPerc = NewValue
EndFunction

Function SetWerewolfFeedDecPerc(float NewValue)
	WerewolfFeedDecPerc = NewValue
EndFunction

Function SetCrimeWereSeenDecPerc(float NewValue)
	CrimeWereSeenDecPerc = NewValue
EndFunction

Function SetCommentWereVillagerDecPerc(float NewValue)
	CommentWereVillagerDecPerc = NewValue
EndFunction

Function SetCommentWereGuardDecPerc(float NewValue)
	CommentWereGuardDecPerc = NewValue
EndFunction

Function SetCrimePettySeenDecPerc(float NewValue)
	CrimePettySeenDecPerc = NewValue
EndFunction

Function SetCrimeAssaultsSeenDecPerc(float NewValue)
	CrimeAssaultsSeenDecPerc = NewValue
EndFunction

Function SetCrimeMurdersSeenDecPerc(float NewValue)
	CrimeMurdersSeenDecPerc = NewValue
EndFunction

Function SetNecroTimesDecreamentPerc(float NewValue)
	NecroTimesDecreamentPerc = NewValue
EndFunction

Function CalibrateNecksBittenDec()
	float NecksBitten = Game.QueryStat("Necks Bitten") as float
	float NecksBittenCounterBalance = NecksBitten_CounterBalance as float
	float NecksBittenDisplayed = NecksBitten - NecksBittenCounterBalance
	float NecksBittenDenominator = NecksBittenNom as float
	float NecksBittenMinimum = NecksBittenMin as float 
	float NecksBittenScore = (NecksBittenDisplayed/NecksBittenDenominator)
	if(NecksBittenScore >= NecksBittenMinimum)
		NecksBittenDec = (NecksBittenScore - NecksBittenMinimum)
	else
		NecksBittenDec = 0.0
	endif
EndFunction

Function CalibrateSpellVampSpellDec()
	float VampiricSpellSeen = SpellVampiricSpellSeen as float
	float VampiricSpellSeenCounterBalance = VampiricSpellSeen_CounterBalance as float
	float VampiricSpellSeenDisplayed = VampiricSpellSeen - VampiricSpellSeenCounterBalance
	float VampiricSpellSeenMultiplier = VampiricSpellSeenMult as float
	float VampiricSpellSeenDenominator = VampiricSpellSeenNom as float
	float VampiricSpellSeenMinimum = VampiricSpellSeenMin as float 
	float VampiricSpellSeenScore = ((VampiricSpellSeenDisplayed*VampiricSpellSeenMultiplier)/VampiricSpellSeenDenominator)
	if(VampiricSpellSeenScore >= VampiricSpellSeenMinimum)
		SpellVampSpellDec = (VampiricSpellSeenScore - VampiricSpellSeenMinimum)
	else
		SpellVampSpellDec = 0.0
	endif
EndFunction

Function CalibrateVampLordTransDec()
	float VampireLordTransformation = VampireLordTransformations as float
	float VampireLordTransformationsCounterBalance = VampireLordTransformations_CounterBalance as float
	float VampireLordTransformationDisplayed = VampireLordTransformation - VampireLordTransformationsCounterBalance
	float VampireLordTransformationDenominator = VampireLordTransformationNom as float
	float VampireLordTransformationMinimum = VampireLordTransformationMin as float 
	float VampireLordTransformationScore = (VampireLordTransformationDisplayed/VampireLordTransformationDenominator)
	if(VampireLordTransformationScore >= VampireLordTransformationMinimum)
		VampLordTransDec = (VampireLordTransformationScore - VampireLordTransformationMinimum)
	else
		VampLordTransDec = 0.0
	endif
EndFunction

Function CalibrateCrimeVampLordSeenDec()
	float VampireLordFormSeen = CrimeVampireLordSeen as float
	float VampireLordSeenCounterBalance = VampireLordSeen_CounterBalance as float
	float VampireLordSeenDisplayed = VampireLordFormSeen - VampireLordSeenCounterBalance
	float VampireLordSeenMultiplier = VampireLordSeenMult as float
	float VampireLordSeenDenominator = VampireLordSeenNom as float
	float VampireLordSeenMinimum = VampireLordSeenMin as float 
	float VampireLordSeenScore = ((VampireLordSeenDisplayed*VampireLordSeenMultiplier)/VampireLordSeenDenominator)
	if(VampireLordSeenScore >= VampireLordSeenMinimum)
		CrimeVampLordSeenDec = (VampireLordSeenScore - VampireLordSeenMinimum)
	else
		CrimeVampLordSeenDec = 0.0
	endif
EndFunction

Function CalibrateCommentVampVillagerDec()
	float CommentVampVillager = CommentVampireVillager as float
	float CommentVampVillagerCounterBalance = VampireComments_CounterBalance as float
	float CommentVampVillagerDisplayed = CommentVampVillager - CommentVampVillagerCounterBalance
	float CommentVampVillagerDenominator = VampireVillagerNom as float
	float CommentVampVillagerMinimum = VampireVillagerMin as float 
	float CommentVampVillagerScore = (CommentVampVillagerDisplayed/CommentVampVillagerDenominator)
	if(CommentVampVillagerScore >= CommentVampVillagerMinimum)
		CommentVampVillagerDec = (CommentVampVillagerScore - CommentVampVillagerMinimum)
	else
		CommentVampVillagerDec = 0.0
	endif
EndFunction

Function CalibrateCommentVampGuardDec()
	float VampireGuardIncidents = CommentVampireGuard as float
	float VampireGuardIncidentsCounterBalance = VampireGuardComments_CounterBalance as float
	float VampireGuardIncidentsDisplayed = VampireGuardIncidents - VampireGuardIncidentsCounterBalance
	float VampireGuardMultiplier = VampireGuardMult as float
	float VampireGuardDenominator = VampireGuardNom as float
	float VampireGuardMinimum = VampireGuardMin as float 
	float VampireGuardScore = ((VampireGuardIncidentsDisplayed*VampireGuardMultiplier)/VampireGuardDenominator)
	if(VampireGuardScore >= VampireGuardMinimum)
		CommentVampGuardDec = (VampireGuardScore - VampireGuardMinimum)
	else
		CommentVampGuardDec = 0.0
	endif
EndFunction

Function CalibrateWerewolfMaulDec()
	float WerewolfMauls = Game.QueryStat("Mauls") as float
	float WerewolfMaulsCounterBalance = WerewolfMauls_CounterBalance as float
	float WerewolfMaulsDisplayed = WerewolfMauls - WerewolfMaulsCounterBalance
	float WerewolfMaulsDenominator = WerewolfMaulNom as float
	float WerewolfMaulsMinimum = WerewolfMaulMin as float 
	float WerewolfMaulsScore = (WerewolfMaulsDisplayed/WerewolfMaulsDenominator)
	if(WerewolfMaulsScore >= WerewolfMaulsMinimum)
		WerewolfMaulDec = (WerewolfMaulsScore - WerewolfMaulsMinimum)
	else
		WerewolfMaulDec = 0.0
	endif
EndFunction

Function CalibrateWerewolfTransDec()
	float WerewolfTransformationScore = Game.QueryStat("Werewolf Transformations") as float
	float WerewolfTransformationsCounterBalance = WerewolfTransformations_CounterBalance as float
	float WerewolfTransformationDisplayed = WerewolfTransformationScore - WerewolfTransformationsCounterBalance
	float WerewolfTransformationsDenominator = WerewolfTransformationsNom as float
	float WerewolfTransformationsMinimum = WerewolfTransformationsMin as float 
	float WerewolfTransformationsScore = (WerewolfTransformationDisplayed/WerewolfTransformationsDenominator)
	if(WerewolfTransformationsScore >= WerewolfTransformationsMinimum)
		WerewolfTransDec = (WerewolfTransformationsScore - WerewolfTransformationsMinimum)
	else
		WerewolfTransDec = 0.0
	endif
EndFunction

Function CalibrateWerewolfFeedDec()
	float WerewolfFeeding = WerewolfFeedings as float
	float WerewolfFeedsCounterBalance = WerewolfFeeds_CounterBalance as float
	float WerewolfFeedsDisplayed = WerewolfFeeding - WerewolfFeedsCounterBalance
	float WerewolfFeedingDenominator = WerewolfFeedsNom as float
	float WerewolfFeedingMinimum = WerewolfFeedsMin as float 
	float WerewolfFeedingScore = (WerewolfFeedsDisplayed/WerewolfFeedingDenominator)
	if(WerewolfFeedingScore >= WerewolfFeedingMinimum)
		WerewolfFeedDec = (WerewolfFeedingScore - WerewolfFeedingMinimum)
	else
		WerewolfFeedDec = 0.0
	endif
EndFunction

Function CalibrateCrimeWereSeenDec()
	float WerewolfSpotted = CrimeWerewolfSeen as float
	float WerewolfSpottedCounterBalance = WerewolfSeen_CounterBalance as float
	float WerewolfSpottedDisplayed = WerewolfSpotted - WerewolfSpottedCounterBalance
	float WerewolfSpottedMultiplier = TimesSpottedWerewolfMult as float
	float WerewolfSpottedDenominator = TimesSpottedWerewolfNom as float
	float WerewolfSpottedMinimum = TimesSpottedWerewolfMin as float 
	float WerewolfSpottedScore = ((WerewolfSpottedDisplayed*WerewolfSpottedMultiplier)/WerewolfSpottedDenominator)
	if(WerewolfSpottedScore >= WerewolfSpottedMinimum)
		CrimeWereSeenDec = (WerewolfSpottedScore - WerewolfSpottedMinimum)
	else
		CrimeWereSeenDec = 0.0
	endif
EndFunction

Function CalibrateCommentWereVillagerDec()
	float CommentWereVillager = CommentWerewolfVillager as float
	float CommentWereVillagerCounterBalance = WerewolfComments_CounterBalance as float
	float CommentWereVillagerDisplayed = CommentWereVillager - CommentWereVillagerCounterBalance
	float CommentWereVillagerDenominator = WerewolfVillagerNom as float
	float CommentWereVillagerMinimum = WerewolfVillagerMin as float 
	float CommentWereVillagerScore = (CommentWereVillagerDisplayed/CommentWereVillagerDenominator)
	if(CommentWereVillagerScore >= CommentWereVillagerMinimum)
		CommentWereVillagerDec = (CommentWereVillagerScore - CommentWereVillagerMinimum)
	else
		CommentWereVillagerDec = 0.0
	endif
EndFunction

Function CalibrateCommentWereGuardDec()
	float WerewolfGuardIncidents = CommentWerewolfGuard as float
	float WerewolfGuardIncidentsCounterBalance = WerewolfGuardComments_CounterBalance as float
	float WerewolfGuardIncidentsDisplayed = WerewolfGuardIncidents - WerewolfGuardIncidentsCounterBalance
	float WerewolfGuardMultiplier = WerewolfGuardMult as float
	float WerewolfGuardDenominator = WerewolfGuardNom as float
	float WerewolfGuardMinimum = WerewolfGuardMin as float 
	float WerewolfGuardScore = ((WerewolfGuardIncidentsDisplayed*WerewolfGuardMultiplier)/WerewolfGuardDenominator)
	if(WerewolfGuardScore >= WerewolfGuardMinimum)
		CommentWereGuardDec = (WerewolfGuardScore - WerewolfGuardMinimum)
	else
		CommentWereGuardDec = 0.0
	endif
EndFunction

Function CalibrateCrimePettySeenDec()
	float SpottedPettyCrime = CrimePettySeen as float
	float SpottedPettyCrimeCounterBalance = PettyCrimeSeen_CounterBalance as float
	float SpottedPettyCrimeDisplayed = SpottedPettyCrime - SpottedPettyCrimeCounterBalance
	float SpottedPettyCrimeDenominator = SpottedPettyCrimeNom as float
	float SpottedPettyCrimeMinimum = SpottedPettyCrimeMin as float 
	float SpottedPettyCrimeScore = (SpottedPettyCrimeDisplayed/SpottedPettyCrimeDenominator)
	if(SpottedPettyCrimeScore >= SpottedPettyCrimeMinimum)
		CrimePettySeenDec = (SpottedPettyCrimeScore - SpottedPettyCrimeMinimum)
	else
		CrimePettySeenDec = 0.0
	endif
EndFunction

Function CalibrateCrimeAssaultsSeenDec()
	float SpottedAssaults = CrimeAssaultsSeen as float
	float SpottedAssaultsCounterBalance = AssaultsSeen_CounterBalance as float
	float SpottedAssaultsDisplayed = SpottedAssaults - SpottedAssaultsCounterBalance
	float SpottedAssaultsMultiplier = SpottedAssaultsMult as float
	float SpottedAssaultsDenominator = SpottedAssaultsNom as float
	float SpottedAssaultsMinimum = SpottedAssaultsMin as float 
	float SpottedAssaultsScore = ((SpottedAssaultsDisplayed*SpottedAssaultsMultiplier)/SpottedAssaultsDenominator)
	if(SpottedAssaultsScore >= SpottedAssaultsMinimum)
		CrimeAssaultsSeenDec = (SpottedAssaultsScore - SpottedAssaultsMinimum)
	else
		CrimeAssaultsSeenDec = 0.0
	endif
EndFunction

Function CalibrateCrimeMurdersSeenDec()
	float SpottedMurders = CrimeMurdersSeen
	float MurderArrest = CrimeMurderArrests
	float CrimeMurdersSeenIncidents = ((SpottedMurders/2) + MurderArrest)
	float CrimeMurdersSeenCounterBalance = MurdersSeen_CounterBalance as float
	float CrimeMurdersSeenDisplayed = CrimeMurdersSeenIncidents - CrimeMurdersSeenCounterBalance
	float CrimeMurdersSeenMultiplier = SpottedMurdersMult as float
	float CrimeMurdersSeenDenominator = SpottedMurdersNom as float
	float CrimeMurdersSeenMinimum = SpottedMurdersMin as float 
	float CrimeMurdersSeenScore = ((CrimeMurdersSeenDisplayed*CrimeMurdersSeenMultiplier)/CrimeMurdersSeenDenominator)
	if(CrimeMurdersSeenScore >= CrimeMurdersSeenMinimum)
		CrimeMurdersSeenDec = (CrimeMurdersSeenScore - CrimeMurdersSeenMinimum)
	else
		CrimeMurdersSeenDec = 0.0
	endif
EndFunction

Function CalibrateSpellNecromancySeenDec()
	float SpellNecromancySeenIncidents = SpellNecromancySeen as float
	float SpellNecromancySeenCounterBalance = Necromancy_CounterBalance as float
	float SpellNecromancySeenDisplayed = SpellNecromancySeenIncidents - SpellNecromancySeenCounterBalance
	float SpellNecromancySeenDenominator = ZombieTimePowNom as float
	float SpellNecromancySeenMinimum = SpellNecromancySeenMin as float
	float SpellNecromancySeenScore = (SpellNecromancySeenDisplayed/SpellNecromancySeenDenominator)
	if(SpellNecromancySeenScore >= SpellNecromancySeenMinimum)
		NecroTimesDecreament = (SpellNecromancySeenScore - SpellNecromancySeenMinimum)
	else
		NecroTimesDecreament = 0.0
	endif
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS FOR SETTING OTHER PROPERTY VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function SetVampireRaceCont(int NewValue)
	VampireRaceCont = NewValue
EndFunction

Function SetWerewolfRaceCont(int NewValue)
	WerewolfRaceCont = NewValue
EndFunction

Function SetDiscountedDarkBrotherhoodQuests(int NewValue)
	DiscountedDarkBrotherhoodQuests = NewValue
EndFunction

Function IncrementDiscountedDarkBrotherhoodQuests(int NewValue)
	DiscountedDarkBrotherhoodQuests += NewValue
EndFunction

Function SetDiscountedBooksRead(int NewValue)
	DiscountedBooksRead = NewValue
EndFunction

Function IncrementDiscountedBooksRead(int NewValue)
	DiscountedBooksRead += NewValue
EndFunction


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DEBUG FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function ForceUpdateRegistration()
	RegisterForSingleUpdateGameTime(2.5)
EndFunction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EXTERNAL MOD ACCESS PROPERTY VALUES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property ExtFameSmallNom = 100 auto
int property ExtFameMediumNom = 50 auto
int property ExtFameLargeNom = 10 auto
int property ExtDaedricSmallNom = 100 auto
int property ExtDaedricMediumNom = 50 auto
int property ExtDaedricLargeNom = 10 auto
int property ExtAedricSmallNom = 100 auto
int property ExtAedricMediumNom = 50 auto
int property ExtAedricLargeNom = 10 auto
int property ExtCrimeSmallNom = 100 auto
int property ExtCrimeMediumNom = 50 auto
int property ExtCrimeLargeNom = 10 auto
int property ExtLawSmallNom = 100 auto
int property ExtLawMediumNom = 50 auto
int property ExtLawLargeNom = 10 auto
int property ExtAmbitionSmallNom = 100 auto
int property ExtAmbitionMediumNom = 50 auto
int property ExtAmbitionLargeNom = 10 auto
int property ExtDependabilitySmallNom = 100 auto
int property ExtDependabilityMediumNom = 50 auto
int property ExtDependabilityLargeNom = 10 auto

int property ExtFameSmallMax = 1000 auto
int property ExtFameMediumMax = 500 auto
int property ExtFameLargeMax = 100 auto
int property ExtDaedricSmallMax = 1000 auto
int property ExtDaedricMediumMax = 500 auto
int property ExtDaedricLargeMax = 100 auto
int property ExtAedricSmallMax = 1000 auto
int property ExtAedricMediumMax = 500 auto
int property ExtAedricLargeMax = 100 auto
int property ExtCrimeSmallMax = 1000 auto
int property ExtCrimeMediumMax = 500 auto
int property ExtCrimeLargeMax = 100 auto
int property ExtLawSmallMax = 1000 auto
int property ExtLawMediumMax = 500 auto
int property ExtLawLargeMax = 100 auto
int property ExtAmbitionSmallMax = 1000 auto
int property ExtAmbitionMediumMax = 500 auto
int property ExtAmbitionLargeMax = 100 auto
int property ExtDependabilitySmallMax = 1000 auto
int property ExtDependabilityMediumMax = 500 auto
int property ExtDependabilityLargeMax = 100 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property ExtVampirismSmallNom = 100 auto
int property ExtVampirismLargeNom = 10 auto
int property ExtVampirismLargeMult = 1 auto
int property ExtLycanthropySmallNom = 100 auto
int property ExtLycanthropyLargeNom = 10 auto
int property ExtLycanthropyLargeMult = 1 auto

int property ExtVampirismSmallMax = 1000 auto
int property ExtVampirismLargeMax = 100 auto
int property ExtLycanthropySmallMax = 1000 auto
int property ExtLycanthropyLargeMax = 100 auto

Int property ExtVampirismSmallMin = 0 auto
Int property ExtVampirismLargeMin = 0 auto
Int property ExtLycanthropySmallMin = 0 auto
Int property ExtLycanthropyLargeMin = 0 auto

float property ExtVampirismSmallDec = 0.0 auto
float property ExtVampirismLargeDec = 0.0 auto
float property ExtLycanthropySmallDec = 0.0 auto
float property ExtLycanthropyLargeDec = 0.0 auto

float property ExtVampirismSmallDecTime = 5.0 auto
float property ExtVampirismSmallDecPerc = 0.0018 auto

float property ExtVampirismLargeDecTime = 6.0 auto
float property ExtVampirismLargeDecPerc = 0.00267 auto

float property ExtLycanthropySmallDecTime = 5.0 auto
float property ExtLycanthropySmallDecPerc = 0.0018 auto

float property ExtLycanthropyLargeDecTime = 6.0 auto
float property ExtLycanthropyLargeDecPerc = 0.00267 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property ExtFameSmall_CounterBalance = 0 auto
int property ExtFameMedium_CounterBalance = 0 auto
int property ExtFameLarge_CounterBalance = 0 auto

int property ExtDaedricSmall_CounterBalance = 0 auto
int property ExtDaedricMedium_CounterBalance = 0 auto
int property ExtDaedricLarge_CounterBalance = 0 auto

int property ExtAedricSmall_CounterBalance = 0 auto
int property ExtAedricMedium_CounterBalance = 0 auto
int property ExtAedricLarge_CounterBalance = 0 auto

int property ExtCrimeSmall_CounterBalance = 0 auto
int property ExtCrimeMedium_CounterBalance = 0 auto
int property ExtCrimeLarge_CounterBalance = 0 auto

int property ExtLawSmall_CounterBalance = 0 auto
int property ExtLawMedium_CounterBalance = 0 auto
int property ExtLawLarge_CounterBalance = 0 auto

int property ExtAmbitionSmall_CounterBalance = 0 auto
int property ExtAmbitionMedium_CounterBalance = 0 auto
int property ExtAmbitionLarge_CounterBalance = 0 auto

int property ExtDependabilitySmall_CounterBalance = 0 auto
int property ExtDependabilityMedium_CounterBalance = 0 auto
int property ExtDependabilityLarge_CounterBalance = 0 auto

int property ExtVampirismSmall_CounterBalance = 0 auto
int property ExtVampirismLarge_CounterBalance = 0 auto
int property ExtLycanthropySmall_CounterBalance = 0 auto
int property ExtLycanthropyLarge_CounterBalance = 0 auto

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EXTERNAL MOD ACCESS PROPERTY INCREMENT FUNCTIONS AND CAPPING FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

int property ExtFameSmall = 0 auto
int property ExtFameMedium = 0 auto
int property ExtFameLarge = 0 auto

int property ExtDaedricSmall = 0 auto
int property ExtDaedricMedium = 0 auto
int property ExtDaedricLarge = 0 auto

int property ExtAedricSmall = 0 auto
int property ExtAedricMedium = 0 auto
int property ExtAedricLarge = 0 auto

int property ExtCrimeSmall = 0 auto
int property ExtCrimeMedium = 0 auto
int property ExtCrimeLarge = 0 auto

int property ExtLawSmall = 0 auto
int property ExtLawMedium = 0 auto
int property ExtLawLarge = 0 auto

int property ExtAmbitionSmall = 0 auto
int property ExtAmbitionMedium = 0 auto
int property ExtAmbitionLarge = 0 auto

int property ExtDependabilitySmall = 0 auto
int property ExtDependabilityMedium = 0 auto
int property ExtDependabilityLarge = 0 auto

int property ExtVampirismSmall = 0 auto
int property ExtVampirismLarge = 0 auto
int property ExtLycanthropySmall = 0 auto
int property ExtLycanthropyLarge = 0 auto


Function IncrementFameVariableSmall()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtFameSmall += 1
EndFunction

Function IncrementFameVariableMedium()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtFameMedium += 1
EndFunction

Function IncrementFameVariableLarge()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtFameLarge += 1
EndFunction

Function IncrementDaedricVariableSmall()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtDaedricSmall += 1
EndFunction

Function IncrementDaedricVariableMedium()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtDaedricMedium += 1
EndFunction

Function IncrementDaedricVariableLarge()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtDaedricLarge += 1
EndFunction

Function IncrementAedricVariableSmall()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtAedricSmall += 1
EndFunction

Function IncrementAedricVariableMedium()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtAedricMedium += 1
EndFunction

Function IncrementAedricVariableLarge()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtAedricLarge += 1
EndFunction

Function IncrementCrimeVariableSmall()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtCrimeSmall += 1
EndFunction

Function IncrementCrimeVariableMedium()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtCrimeMedium += 1
EndFunction

Function IncrementCrimeVariableLarge()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtCrimeLarge += 1
EndFunction

Function IncrementLawVariableSmall()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtLawSmall += 1
EndFunction

Function IncrementLawVariableMedium()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtLawMedium += 1
EndFunction

Function IncrementLawVariableLarge()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtLawLarge += 1
EndFunction

Function IncrementAmbitionVariableSmall()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtAmbitionSmall += 1
EndFunction

Function IncrementAmbitionVariableMedium()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtAmbitionMedium += 1
EndFunction

Function IncrementAmbitionVariableLarge()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtAmbitionLarge += 1
EndFunction

Function IncrementDependabilityVariableSmall()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtDependabilitySmall += 1
EndFunction

Function IncrementDependabilityVariableMedium()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtDependabilityMedium += 1
EndFunction

Function IncrementDependabilityVariableLarge()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtDependabilityLarge += 1
EndFunction

Function IncrementExtVampirismSmall()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtVampirismSmall += 1
EndFunction

Function IncrementExtVampirismLarge()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtVampirismLarge += 1
EndFunction

Function IncrementExtLycanthropySmall()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtLycanthropySmall += 1
EndFunction

Function IncrementExtLycanthropyLarge()
	If SRTWearingGreyCowl1.GetValue() == 1.0
		Return
	EndIf

	ExtLycanthropyLarge += 1
EndFunction

; Tweaks - Remove duplicate code
Int Function ExtScore(Int score, Int counterBalance, Int max)
	Int displayed = score - counterBalance
	
	Return iMin(displayed, max)
EndFunction

Int Function ExtFameSmallScore()
	Return ExtScore(ExtFameSmall, ExtFameSmall_CounterBalance, ExtFameSmallMax)
EndFunction

Int Function ExtFameMediumScore()
	Return ExtScore(ExtFameMedium, ExtFameMedium_CounterBalance, ExtFameMediumMax)
EndFunction

Int Function ExtFameLargeScore()
	Return ExtScore(ExtFameLarge, ExtFameLarge_CounterBalance, ExtFameLargeMax)
EndFunction

Int Function ExtDaedricSmallScore()
	Return ExtScore(ExtDaedricSmall, ExtDaedricSmall_CounterBalance, ExtDaedricSmallMax)
EndFunction

Int Function ExtDaedricMediumScore()
	Return ExtScore(ExtDaedricMedium, ExtDaedricMedium_CounterBalance, ExtDaedricMediumMax)
EndFunction

Int Function ExtDaedricLargeScore()
	Return ExtScore(ExtDaedricLarge, ExtDaedricLarge_CounterBalance, ExtDaedricLargeMax)
EndFunction

Int Function ExtAedricSmallScore()
	Return ExtScore(ExtAedricSmall, ExtAedricSmall_CounterBalance, ExtAedricSmallMax)
EndFunction

Int Function ExtAedricMediumScore()
	Return ExtScore(ExtAedricMedium, ExtAedricMedium_CounterBalance, ExtAedricMediumMax)
EndFunction

Int Function ExtAedricLargeScore()
	Return ExtScore(ExtAedricLarge, ExtAedricLarge_CounterBalance, ExtAedricLargeMax)
EndFunction

Int Function ExtCrimeSmallScore()
	Return ExtScore(ExtCrimeSmall, ExtCrimeSmall_CounterBalance, ExtCrimeSmallMax)
EndFunction

Int Function ExtCrimeMediumScore()
	Return ExtScore(ExtCrimeMedium, ExtCrimeMedium_CounterBalance, ExtCrimeMediumMax)
EndFunction

Int Function ExtCrimeLargeScore()
	Return ExtScore(ExtCrimeLarge, ExtCrimeLarge_CounterBalance, ExtCrimeLargeMax)
EndFunction

Int Function ExtLawSmallScore()
	Return ExtScore(ExtLawSmall, ExtLawSmall_CounterBalance, ExtLawSmallMax)
EndFunction

Int Function ExtLawMediumScore()
	Return ExtScore(ExtLawMedium, ExtLawMedium_CounterBalance, ExtLawMediumMax)
EndFunction

Int Function ExtLawLargeScore()
	Return ExtScore(ExtLawLarge, ExtLawLarge_CounterBalance, ExtLawLargeMax)
EndFunction

Int Function ExtAmbitionSmallScore()
	Return ExtScore(ExtAmbitionSmall, ExtAmbitionSmall_CounterBalance, ExtAmbitionSmallMax)
EndFunction

Int Function ExtAmbitionMediumScore()
	Return ExtScore(ExtAmbitionMedium, ExtAmbitionMedium_CounterBalance, ExtAmbitionMediumMax)
EndFunction

Int Function ExtAmbitionLargeScore()
	Return ExtScore(ExtAmbitionLarge, ExtAmbitionLarge_CounterBalance, ExtAmbitionLargeMax)
EndFunction

Int Function ExtDependabilitySmallScore()
	Return ExtScore(ExtDependabilitySmall, ExtDependabilitySmall_CounterBalance, ExtDependabilitySmallMax)
EndFunction

Int Function ExtDependabilityMediumScore()
	Return ExtScore(ExtDependabilityMedium, ExtDependabilityMedium_CounterBalance, ExtDependabilityMediumMax)
EndFunction

Int Function ExtDependabilityLargeScore()
	Return ExtScore(ExtDependabilityLarge, ExtDependabilityLarge_CounterBalance, ExtDependabilityLargeMax)
EndFunction

Int Function AdjExtVampirismSmallScore()
	Int ExtraVampirismSmall = ExtVampirismSmallScore()
	Int ExtraVampirismSmallDecreament = ExtraVampirismSmallDecreamentScore()
	Int AdjExtraVampirismSmall = (ExtVampirismSmall/ExtVampirismSmallNom)-ExtraVampirismSmallDecreament

	Return iMax(0, AdjExtraVampirismSmall)
EndFunction

Int Function ExtVampirismSmallScore()
	Return ExtScore(ExtVampirismSmall, ExtVampirismSmall_CounterBalance, ExtVampirismSmallMax)
EndFunction

Int Function AdjExtVampirismLargeScore()
	Int ExtraVampirismLarge = ExtVampirismLargeScore()
	Int ExtraVampirismLargeDecreament = ExtraVampirismLargeDecreamentScore()
	Int AdjExtraVampirismLarge = ((ExtVampirismLarge*ExtVampirismLargeMult)/ExtVampirismLargeNom)-ExtraVampirismLargeDecreament

	Return iMax(0, AdjExtraVampirismLarge)
EndFunction

Int Function ExtVampirismLargeScore()
	Return ExtScore(ExtVampirismLarge, ExtVampirismLarge_CounterBalance, ExtVampirismLargeMax)
EndFunction

Int Function AdjExtLycanthropySmallScore()
	Int ExtraLycanthropySmall = ExtLycanthropySmallScore()
	Int ExtraLycanthropySmallDecreament = ExtraLycanthropySmallDecreamentScore()
	Int AdjExtraLycanthropySmall = (ExtLycanthropySmall/ExtLycanthropySmallNom)-ExtraLycanthropySmallDecreament

	Return iMax(0, AdjExtraLycanthropySmall)
EndFunction

Int Function ExtLycanthropySmallScore()
	Return ExtScore(ExtLycanthropySmall, ExtLycanthropySmall_CounterBalance, ExtLycanthropySmallMax)
EndFunction

Int Function AdjExtLycanthropyLargeScore()
	Int ExtraLycanthropyLarge = ExtLycanthropyLargeScore()
	Int ExtraLycanthropyLargeDecreament = ExtraLycanthropyLargeDecreamentScore()
	Int AdjExtraLycanthropyLarge = ((ExtLycanthropyLarge*ExtLycanthropyLargeMult)/ExtLycanthropyLargeNom)-ExtraLycanthropyLargeDecreament

	Return iMax(0, AdjExtraLycanthropyLarge)
EndFunction

Int Function ExtLycanthropyLargeScore()
	Return ExtScore(ExtLawLarge, ExtLycanthropyLarge_CounterBalance, ExtLycanthropyLargeMax)
EndFunction

Int Function ExtraVampirismSmallDecreamentScore()
	Int ExtraVampirismSmallDecreament = ExtVampirismSmallDec as Int
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return ExtraVampirismSmallDecreament as Int
	Else
		Return 0
	EndIf
EndFunction

Function IncrementExtVampirismSmallDec()
	float ExtraVampirismSmall = ExtVampirismSmall as float
	float ExtVampirismSmallCounterBalance = ExtVampirismSmall_CounterBalance as float
	float ExtVampirismSmallDisplayed = ExtraVampirismSmall - ExtVampirismSmallCounterBalance
	float ExtraVampirismSmallDenominator = ExtVampirismSmallNom as float
	float ExtraVampirismSmallMinimum = ExtVampirismSmallMin as float 
	float AdjustedExtraVampirismSmallScore = (ExtVampirismSmallDisplayed/ExtraVampirismSmallDenominator) - ExtVampirismSmallDec
	float ExtraVampirismSmallDecrementer = AdjustedExtraVampirismSmallScore * ExtVampirismSmallDecPerc
	if(AdjustedExtraVampirismSmallScore > ExtraVampirismSmallMinimum)
		ExtVampirismSmallDec += ExtraVampirismSmallDecrementer
	endif
EndFunction

Function CalibrateExtVampirismSmallDec()
	float ExtraVampirismSmall = ExtVampirismSmall as float
	float ExtVampirismSmallCounterBalance = ExtVampirismSmall_CounterBalance as float
	float ExtVampirismSmallDisplayed = ExtraVampirismSmall - ExtVampirismSmallCounterBalance
	float ExtraVampirismSmallDenominator = ExtVampirismSmallNom as float
	float ExtraVampirismSmallMinimum = ExtVampirismSmallMin as float 
	float ExtraVampirismSmallScore = (ExtVampirismSmallDisplayed/ExtraVampirismSmallDenominator)
	if(ExtraVampirismSmallScore >= ExtraVampirismSmallMinimum)
		ExtVampirismSmallDec = (ExtraVampirismSmallScore - ExtraVampirismSmallMinimum)
	else
		ExtVampirismSmallDec = 0.0
	endif
EndFunction

Int Function ExtraVampirismLargeDecreamentScore()
	Int ExtraVampirismLargeDecreament = ExtVampirismLargeDec as Int
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return ExtraVampirismLargeDecreament as Int
	Else
		Return 0
	EndIf
EndFunction

Function IncrementExtVampirismLargeDec()
	float ExtraVampirismLarge = ExtVampirismLarge as float
	float ExtVampirismLargeCounterBalance = ExtVampirismLarge_CounterBalance as float
	float ExtVampirismLargeDisplayed = ExtraVampirismLarge - ExtVampirismLargeCounterBalance
	float ExtraVampirismLargeDenominator = ExtVampirismLargeNom as float
	float ExtraVampirismLargeMinimum = ExtVampirismLargeMin as float 
	float AdjustedExtraVampirismLargeScore = (ExtVampirismLargeDisplayed/ExtraVampirismLargeDenominator) - ExtVampirismLargeDec
	float ExtraVampirismLargeDecrementer = AdjustedExtraVampirismLargeScore * ExtVampirismLargeDecPerc
	if(AdjustedExtraVampirismLargeScore > ExtraVampirismLargeMinimum)
		ExtVampirismLargeDec += ExtraVampirismLargeDecrementer
	endif
EndFunction

Function CalibrateExtVampirismLargeDec()
	float ExtraVampirismLarge = ExtVampirismLarge as float
	float ExtVampirismLargeCounterBalance = ExtVampirismLarge_CounterBalance as float
	float ExtVampirismLargeDisplayed = ExtraVampirismLarge - ExtVampirismLargeCounterBalance
	float ExtraVampirismLargeDenominator = ExtVampirismLargeNom as float
	float ExtraVampirismLargeMinimum = ExtVampirismLargeMin as float 
	float ExtraVampirismLargeScore = (ExtVampirismLargeDisplayed/ExtraVampirismLargeDenominator)
	if(ExtraVampirismLargeScore >= ExtraVampirismLargeMinimum)
		ExtVampirismLargeDec = (ExtraVampirismLargeScore - ExtraVampirismLargeMinimum)
	else
		ExtVampirismLargeDec = 0.0
	endif
EndFunction

Int Function ExtraLycanthropySmallDecreamentScore()
	Int ExtraLycanthropySmallDecreament = ExtLycanthropySmallDec as Int
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return ExtraLycanthropySmallDecreament as Int
	Else
		Return 0
	EndIf
EndFunction

Function IncrementExtLycanthropySmallDec()
	float ExtraLycanthropySmall = ExtLycanthropySmall as float
	float ExtLycanthropySmallCounterBalance = ExtLycanthropySmall_CounterBalance as float
	float ExtLycanthropySmallDisplayed = ExtraLycanthropySmall - ExtLycanthropySmallCounterBalance
	float ExtraLycanthropySmallDenominator = ExtLycanthropySmallNom as float
	float ExtraLycanthropySmallMinimum = ExtLycanthropySmallMin as float 
	float AdjustedExtraLycanthropySmallScore = (ExtLycanthropySmallDisplayed/ExtraLycanthropySmallDenominator) - ExtLycanthropySmallDec
	float ExtraLycanthropySmallDecrementer = AdjustedExtraLycanthropySmallScore * ExtLycanthropySmallDecPerc
	if(AdjustedExtraLycanthropySmallScore > ExtraLycanthropySmallMinimum)
		ExtLycanthropySmallDec += ExtraLycanthropySmallDecrementer
	endif
EndFunction

Function CalibrateExtLycanthropySmallDec()
	float ExtraLycanthropySmall = ExtLycanthropySmall as float
	float ExtLycanthropySmallCounterBalance = ExtLycanthropySmall_CounterBalance as float
	float ExtLycanthropySmallDisplayed = ExtraLycanthropySmall - ExtLycanthropySmallCounterBalance
	float ExtraLycanthropySmallDenominator = ExtLycanthropySmallNom as float
	float ExtraLycanthropySmallMinimum = ExtLycanthropySmallMin as float 
	float ExtraLycanthropySmallScore = (ExtLycanthropySmallDisplayed/ExtraLycanthropySmallDenominator)
	if(ExtraLycanthropySmallScore >= ExtraLycanthropySmallMinimum)
		ExtLycanthropySmallDec = (ExtraLycanthropySmallScore - ExtraLycanthropySmallMinimum)
	else
		ExtLycanthropySmallDec = 0.0
	endif
EndFunction

Int Function ExtraLycanthropyLargeDecreamentScore()
	Int ExtraLycanthropyLargeDecreament = ExtLycanthropyLargeDec as Int
	IF (SR_MCM_Override_WerewolfVampireTimeDecreament.GetValue() == 1)
		Return ExtraLycanthropyLargeDecreament as Int
	Else
		Return 0
	EndIf
EndFunction

Function IncrementExtLycanthropyLargeDec()
	float ExtraLycanthropyLarge = ExtLycanthropyLarge as float
	float ExtLycanthropyLargeCounterBalance = ExtLycanthropyLarge_CounterBalance as float
	float ExtLycanthropyLargeDisplayed = ExtraLycanthropyLarge - ExtLycanthropyLargeCounterBalance
	float ExtraLycanthropyLargeDenominator = ExtLycanthropyLargeNom as float
	float ExtraLycanthropyLargeMinimum = ExtLycanthropyLargeMin as float 
	float AdjustedExtraLycanthropyLargeScore = (ExtLycanthropyLargeDisplayed/ExtraLycanthropyLargeDenominator) - ExtLycanthropyLargeDec
	float ExtraLycanthropyLargeDecrementer = AdjustedExtraLycanthropyLargeScore * ExtLycanthropyLargeDecPerc
	if(AdjustedExtraLycanthropyLargeScore > ExtraLycanthropyLargeMinimum)
		ExtLycanthropyLargeDec += ExtraLycanthropyLargeDecrementer
	endif
EndFunction

Function CalibrateExtLycanthropyLargeDec()
	float ExtraLycanthropyLarge = ExtLycanthropyLarge as float
	float ExtLycanthropyLargeCounterBalance = ExtLycanthropyLarge_CounterBalance as float
	float ExtLycanthropyLargeDisplayed = ExtraLycanthropyLarge - ExtLycanthropyLargeCounterBalance
	float ExtraLycanthropyLargeDenominator = ExtLycanthropyLargeNom as float
	float ExtraLycanthropyLargeMinimum = ExtLycanthropyLargeMin as float 
	float ExtraLycanthropyLargeScore = (ExtLycanthropyLargeDisplayed/ExtraLycanthropyLargeDenominator)
	if(ExtraLycanthropyLargeScore >= ExtraLycanthropyLargeMinimum)
		ExtLycanthropyLargeDec = (ExtraLycanthropyLargeScore - ExtraLycanthropyLargeMinimum)
	else
		ExtLycanthropyLargeDec = 0.0
	endif
EndFunction

Function SetExtFameSmall_CounterBalance(float percentage)
	ExtFameSmall_CounterBalance = CalcCounterBalance(ExtFameSmall_CounterBalance, ExtFameSmallScore(), percentage)
EndFunction

Function SetExtFameMedium_CounterBalance(float percentage)
	ExtFameMedium_CounterBalance = CalcCounterBalance(ExtFameMedium_CounterBalance, ExtFameMediumScore(), percentage)
EndFunction

Function SetExtFameLarge_CounterBalance(float percentage)
	ExtFameLarge_CounterBalance = CalcCounterBalance(ExtFameLarge_CounterBalance, ExtFameLargeScore(), percentage)
EndFunction

Function SetExtDaedricSmall_CounterBalance(float percentage)
	ExtDaedricSmall_CounterBalance = CalcCounterBalance(ExtDaedricSmall_CounterBalance, ExtDaedricSmallScore(), percentage)
EndFunction

Function SetExtDaedricMedium_CounterBalance(float percentage)
	ExtDaedricMedium_CounterBalance = CalcCounterBalance(ExtDaedricMedium_CounterBalance, ExtDaedricMediumScore(), percentage)
EndFunction

Function SetExtDaedricLarge_CounterBalance(float percentage)
	ExtDaedricLarge_CounterBalance = CalcCounterBalance(ExtDaedricLarge_CounterBalance, ExtDaedricLargeScore(), percentage)
EndFunction

Function SetExtAedricSmall_CounterBalance(float percentage)
	ExtAedricSmall_CounterBalance = CalcCounterBalance(ExtAedricSmall_CounterBalance, ExtAedricSmallScore(), percentage)
EndFunction

Function SetExtAedricMedium_CounterBalance(float percentage)
	ExtAedricMedium_CounterBalance = CalcCounterBalance(ExtAedricMedium_CounterBalance, ExtAedricMediumScore(), percentage)
EndFunction

Function SetExtAedricLarge_CounterBalance(float percentage)
	ExtAedricLarge_CounterBalance = CalcCounterBalance(ExtAedricLarge_CounterBalance, ExtAedricLargeScore(), percentage)
EndFunction

Function SetExtCrimeSmall_CounterBalance(float percentage)
	ExtCrimeSmall_CounterBalance = CalcCounterBalance(ExtCrimeSmall_CounterBalance, ExtCrimeSmallScore(), percentage)
EndFunction

Function SetExtCrimeMedium_CounterBalance(float percentage)
	ExtCrimeMedium_CounterBalance = CalcCounterBalance(ExtCrimeMedium_CounterBalance, ExtCrimeMediumScore(), percentage)
EndFunction

Function SetExtCrimeLarge_CounterBalance(float percentage)
	ExtCrimeLarge_CounterBalance = CalcCounterBalance(ExtCrimeLarge_CounterBalance, ExtCrimeLargeScore(), percentage)
EndFunction

Function SetExtLawSmall_CounterBalance(float percentage)
	ExtLawSmall_CounterBalance = CalcCounterBalance(ExtLawSmall_CounterBalance, ExtLawSmallScore(), percentage)
EndFunction

Function SetExtLawMedium_CounterBalance(float percentage)
	ExtLawMedium_CounterBalance = CalcCounterBalance(ExtLawMedium_CounterBalance, ExtLawMediumScore(), percentage)
EndFunction

Function SetExtLawLarge_CounterBalance(float percentage)
	ExtLawLarge_CounterBalance = CalcCounterBalance(ExtLawLarge_CounterBalance, ExtLawLargeScore(), percentage)
EndFunction

Function SetExtAmbitionSmall_CounterBalance(float percentage)
	ExtAmbitionSmall_CounterBalance = CalcCounterBalance(ExtAmbitionSmall_CounterBalance, ExtAmbitionSmallScore(), percentage)
EndFunction

Function SetExtAmbitionMedium_CounterBalance(float percentage)
	ExtAmbitionMedium_CounterBalance = CalcCounterBalance(ExtAmbitionMedium_CounterBalance, ExtAmbitionMediumScore(), percentage)
EndFunction

Function SetExtAmbitionLarge_CounterBalance(float percentage)
	ExtAmbitionLarge_CounterBalance = CalcCounterBalance(ExtAmbitionLarge_CounterBalance, ExtAmbitionLargeScore(), percentage)
EndFunction

Function SetExtDependabilitySmall_CounterBalance(float percentage)
	ExtDependabilitySmall_CounterBalance = CalcCounterBalance(ExtDependabilitySmall_CounterBalance, ExtDependabilitySmallScore(), percentage)
EndFunction

Function SetExtDependabilityMedium_CounterBalance(float percentage)
	ExtDependabilityMedium_CounterBalance = CalcCounterBalance(ExtDependabilityMedium_CounterBalance, ExtDependabilityMediumScore(), percentage)
EndFunction

Function SetExtDependabilityLarge_CounterBalance(float percentage)
	ExtDependabilityLarge_CounterBalance = CalcCounterBalance(ExtDependabilityLarge_CounterBalance, ExtDependabilityLargeScore(), percentage)
EndFunction

Function SetExtVampirismSmall_CounterBalance(float percentage)
	ExtVampirismSmall_CounterBalance = CalcCounterBalance(ExtVampirismSmall_CounterBalance, ExtVampirismSmallScore(), percentage)
EndFunction

Function SetExtVampirismLarge_CounterBalance(float percentage)
	ExtVampirismLarge_CounterBalance = CalcCounterBalance(ExtVampirismLarge_CounterBalance, ExtVampirismLargeScore(), percentage)
EndFunction

Function SetExtLycanthropySmall_CounterBalance(float percentage)
	ExtLycanthropySmall_CounterBalance = CalcCounterBalance(ExtLycanthropySmall_CounterBalance, ExtLycanthropySmallScore(), percentage)
EndFunction

Function SetExtLycanthropyLarge_CounterBalance(float percentage)
	ExtLycanthropyLarge_CounterBalance = CalcCounterBalance(ExtLycanthropyLarge_CounterBalance, ExtLycanthropyLargeScore(), percentage)
EndFunction

Function SetExtFameSmallNom(int NewValue)
	ExtFameSmallNom = NewValue
EndFunction

Function SetExtFameMediumNom(int NewValue)
	ExtFameMediumNom = NewValue
EndFunction

Function SetExtFameLargeNom(int NewValue)
	ExtFameLargeNom = NewValue
EndFunction

Function SetExtDaedricSmallNom(int NewValue)
	ExtDaedricSmallNom = NewValue
EndFunction

Function SetExtDaedricMediumNom(int NewValue)
	ExtDaedricMediumNom = NewValue
EndFunction

Function SetExtDaedricLargeNom(int NewValue)
	ExtDaedricLargeNom = NewValue
EndFunction

Function SetExtAedricSmallNom(int NewValue)
	ExtAedricSmallNom = NewValue
EndFunction

Function SetExtAedricMediumNom(int NewValue)
	ExtAedricMediumNom = NewValue
EndFunction

Function SetExtAedricLargeNom(int NewValue)
	ExtAedricLargeNom = NewValue
EndFunction

Function SetExtCrimeSmallNom(int NewValue)
	ExtCrimeSmallNom = NewValue
EndFunction

Function SetExtCrimeMediumNom(int NewValue)
	ExtCrimeMediumNom = NewValue
EndFunction

Function SetExtCrimeLargeNom(int NewValue)
	ExtCrimeLargeNom = NewValue
EndFunction

Function SetExtLawSmallNom(int NewValue)
	ExtLawSmallNom = NewValue
EndFunction

Function SetExtLawMediumNom(int NewValue)
	ExtLawMediumNom = NewValue
EndFunction

Function SetExtLawLargeNom(int NewValue)
	ExtLawLargeNom = NewValue
EndFunction

Function SetExtAmbitionSmallNom(int NewValue)
	ExtAmbitionSmallNom = NewValue
EndFunction

Function SetExtAmbitionMediumNom(int NewValue)
	ExtAmbitionMediumNom = NewValue
EndFunction

Function SetExtAmbitionLargeNom(int NewValue)
	ExtAmbitionLargeNom = NewValue
EndFunction

Function SetExtDependabilitySmallNom(int NewValue)
	ExtDependabilitySmallNom = NewValue
EndFunction

Function SetExtDependabilityMediumNom(int NewValue)
	ExtDependabilityMediumNom = NewValue
EndFunction

Function SetExtDependabilityLargeNom(int NewValue)
	ExtDependabilityLargeNom = NewValue
EndFunction

Function SetExtVampirismSmallNom(int NewValue)
	ExtVampirismSmallNom = NewValue
EndFunction

Function SetExtVampirismLargeNom(int NewValue)
	ExtVampirismLargeNom = NewValue
EndFunction

Function SetExtVampirismLargeMult(int NewValue)
	ExtVampirismLargeMult = NewValue
EndFunction

Function SetExtLycanthropySmallNom(int NewValue)
	ExtLycanthropySmallNom = NewValue
EndFunction

Function SetExtLycanthropyLargeNom(int NewValue)
	ExtLycanthropyLargeNom = NewValue
EndFunction

Function SetExtLycanthropyLargeMult(int NewValue)
	ExtLycanthropyLargeMult = NewValue
EndFunction

Function SetExtFameSmallMax(int NewValue)
	ExtFameSmallMax = NewValue
EndFunction

Function SetExtFameMediumMax(int NewValue)
	ExtFameMediumMax = NewValue
EndFunction

Function SetExtFameLargeMax(int NewValue)
	ExtFameLargeMax = NewValue
EndFunction

Function SetExtDaedricSmallMax(int NewValue)
	ExtDaedricSmallMax = NewValue
EndFunction

Function SetExtDaedricMediumMax(int NewValue)
	ExtDaedricMediumMax = NewValue
EndFunction

Function SetExtDaedricLargeMax(int NewValue)
	ExtDaedricLargeMax = NewValue
EndFunction

Function SetExtAedricSmallMax(int NewValue)
	ExtAedricSmallMax = NewValue
EndFunction

Function SetExtAedricMediumMax(int NewValue)
	ExtAedricMediumMax = NewValue
EndFunction

Function SetExtAedricLargeMax(int NewValue)
	ExtAedricLargeMax = NewValue
EndFunction

Function SetExtCrimeSmallMax(int NewValue)
	ExtCrimeSmallMax = NewValue
EndFunction

Function SetExtCrimeMediumMax(int NewValue)
	ExtCrimeMediumMax = NewValue
EndFunction

Function SetExtCrimeLargeMax(int NewValue)
	ExtCrimeLargeMax = NewValue
EndFunction

Function SetExtLawSmallMax(int NewValue)
	ExtLawSmallMax = NewValue
EndFunction

Function SetExtLawMediumMax(int NewValue)
	ExtLawMediumMax = NewValue
EndFunction

Function SetExtLawLargeMax(int NewValue)
	ExtLawLargeMax = NewValue
EndFunction

Function SetExtAmbitionSmallMax(int NewValue)
	ExtAmbitionSmallMax = NewValue
EndFunction

Function SetExtAmbitionMediumMax(int NewValue)
	ExtAmbitionMediumMax = NewValue
EndFunction

Function SetExtAmbitionLargeMax(int NewValue)
	ExtAmbitionLargeMax = NewValue
EndFunction

Function SetExtDependabilitySmallMax(int NewValue)
	ExtDependabilitySmallMax = NewValue
EndFunction

Function SetExtDependabilityMediumMax(int NewValue)
	ExtDependabilityMediumMax = NewValue
EndFunction

Function SetExtDependabilityLargeMax(int NewValue)
	ExtDependabilityLargeMax = NewValue
EndFunction

Function SetExtVampirismSmallMax(int NewValue)
	ExtVampirismSmallMax = NewValue
EndFunction

Function SetExtVampirismLargeMax(int NewValue)
	ExtVampirismLargeMax = NewValue
EndFunction

Function SetExtLycanthropySmallMax(int NewValue)
	ExtLycanthropySmallMax = NewValue
EndFunction

Function SetExtLycanthropyLargeMax(int NewValue)
	ExtLycanthropyLargeMax = NewValue
EndFunction

Function SetExtVampirismSmallMin(int NewValue)
	ExtVampirismSmallMin = NewValue
EndFunction

Function SetExtVampirismLargeMin(int NewValue)
	ExtVampirismLargeMin = NewValue
EndFunction

Function SetExtLycanthropySmallMin(int NewValue)
	ExtLycanthropySmallMin = NewValue
EndFunction

Function SetExtLycanthropyLargeMin(int NewValue)
	ExtLycanthropyLargeMin = NewValue
EndFunction

Function SetExtVampirismSmallDec(float NewValue)
	ExtVampirismSmallDec = NewValue
EndFunction

Function SetExtVampirismLargeDec(float NewValue)
	ExtVampirismLargeDec = NewValue
EndFunction

Function SetExtLycanthropySmallDec(float NewValue)
	ExtLycanthropySmallDec = NewValue
EndFunction

Function SetExtLycanthropyLargeDec(float NewValue)
	ExtLycanthropyLargeDec = NewValue
EndFunction

Function SetExtVampirismSmallDecTime(float NewValue)
	ExtVampirismSmallDecTime = NewValue
EndFunction

Function SetExtVampirismLargeDecTime(float NewValue)
	ExtVampirismLargeDecTime = NewValue
EndFunction

Function SetExtLycanthropySmallDecTime(float NewValue)
	ExtLycanthropySmallDecTime = NewValue
EndFunction

Function SetExtLycanthropyLargeDecTime(float NewValue)
	ExtLycanthropyLargeDecTime = NewValue
EndFunction

Function SetExtVampirismSmallDecPerc(float NewValue)
	ExtVampirismSmallDecPerc = NewValue
EndFunction

Function SetExtVampirismLargeDecPerc(float NewValue)
	ExtVampirismLargeDecPerc = NewValue
EndFunction

Function SetExtLycanthropySmallDecPerc(float NewValue)
	ExtLycanthropySmallDecPerc = NewValue
EndFunction

Function SetExtLycanthropyLargeDecPerc(float NewValue)
	ExtLycanthropyLargeDecPerc = NewValue
EndFunction
