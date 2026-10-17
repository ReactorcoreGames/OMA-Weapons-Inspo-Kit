class UT2003LadderInfo extends LadderInfo;

defaultproperties
{
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DM0'
	begin object name="DM0" class=Engine.MatchInfo
		LevelName="TUT-DM"
		MenuName="Deathmatch Tutorial"
		EnemyTeamName="xGame.DMRosterTrainingDay"
		GoalScore=10.0000000
		URLString="?Quickstart=true"
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[0]=DM0
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DM1'
	begin object name="DM1" class=Engine.MatchInfo
		LevelName="DM-TrainingDay"
		EnemyTeamName="xGame.DMRosterTrainingDay"
		DifficultyModifier=-0.3000000
		GoalScore=10.0000000
		URLString="?WeaponStay=true"
		NumBots=1
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[1]=DM1
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DM2'
	begin object name="DM2" class=Engine.MatchInfo
		LevelName="DM-Gael"
		EnemyTeamName="xGame.DMRosterGael"
		DifficultyModifier=0.2000000
		GoalScore=10.0000000
		URLString="?WeaponStay=true"
		NumBots=1
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[2]=DM2
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DM3'
	begin object name="DM3" class=Engine.MatchInfo
		LevelName="DM-Leviathan"
		EnemyTeamName="xGame.DMRosterLeviathan"
		DifficultyModifier=0.5000000
		GoalScore=15.0000000
		URLString="?WeaponStay=true"
		NumBots=2
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[3]=DM3
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DM4'
	begin object name="DM4" class=Engine.MatchInfo
		LevelName="DM-Oceanic"
		EnemyTeamName="xGame.DMRosterOceanic"
		SpecialEvent="DRAFT"
		DifficultyModifier=0.1000000
		GoalScore=15.0000000
		URLString="?WeaponStay=true"
		NumBots=4
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[4]=DM4
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DM5'
	begin object name="DM5" class=Engine.MatchInfo
		LevelName="DM-Phobos2"
		EnemyTeamName="xGame.DMRosterBeatTeam"
		SpecialEvent="TDM OPENED"
		DifficultyModifier=0.5000000
		GoalScore=20.0000000
		URLString="?WeaponStay=true"
		NumBots=7
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[5]=DM5
	// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM1'
	begin object name="TDM1" class=Engine.MatchInfo
		LevelName="DM-Insidious"
		EnemyTeamName="xGame.TeamSupernova"
		SpecialEvent="TRADE Remus"
		DifficultyModifier=0.5000000
		GoalScore=10.0000000
		URLString="?TeamScreen=true"
		NumBots=3
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[0]=TDM1
	// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM2'
	begin object name="TDM2" class=Engine.MatchInfo
		LevelName="DM-Curse3"
		EnemyTeamName="xGame.TeamCrusaders"
		DifficultyModifier=0.7500000
		GoalScore=15.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[1]=TDM2
	// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM3'
	begin object name="TDM3" class=Engine.MatchInfo
		LevelName="DM-Antalus"
		EnemyTeamName="xGame.TeamSunBlades"
		SpecialEvent="TRADE Cannonball"
		DifficultyModifier=1.0000000
		GoalScore=15.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[2]=TDM3
	// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM4'
	begin object name="TDM4" class=Engine.MatchInfo
		LevelName="DM-Plunge"
		EnemyTeamName="xGame.TeamDragonBreath"
		SpecialEvent="DOM OPENED"
		DifficultyModifier=1.2500000
		GoalScore=20.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[3]=TDM4
	// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM5'
	begin object name="TDM5" class=Engine.MatchInfo
		LevelName="DM-Asbestos"
		EnemyTeamName="xGame.TeamBoneCrushers"
		SpecialEvent="TRADE Horus"
		DifficultyModifier=1.5000000
		GoalScore=20.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[4]=TDM5
	// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM6'
	begin object name="TDM6" class=Engine.MatchInfo
		LevelName="DM-TokaraForest"
		EnemyTeamName="xGame.TeamVenom"
		SpecialEvent="TDM COMPLETE"
		DifficultyModifier=2.0000000
		GoalScore=25.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[5]=TDM6
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM1'
	begin object name="DOM1" class=Engine.MatchInfo
		LevelName="DOM-ScorchedEarth"
		EnemyTeamName="xGame.TeamWarCry"
		SpecialEvent="TRADE Damarus"
		DifficultyModifier=0.5000000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[0]=DOM1
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM2'
	begin object name="DOM2" class=Engine.MatchInfo
		LevelName="DOM-Core"
		EnemyTeamName="xGame.TeamBoneCrushers"
		DifficultyModifier=0.7500000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[1]=DOM2
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM3'
	begin object name="DOM3" class=Engine.MatchInfo
		LevelName="DOM-SepukkuGorge"
		EnemyTeamName="xGame.TeamFirestorm"
		SpecialEvent="CTF OPENED"
		DifficultyModifier=1.2500000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[2]=DOM3
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM4'
	begin object name="DOM4" class=Engine.MatchInfo
		LevelName="DOM-Suntemple"
		EnemyTeamName="xGame.TeamApocalypse"
		SpecialEvent="TRADE Faraleth"
		DifficultyModifier=1.7500000
		GoalScore=4.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[3]=DOM4
	// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM5'
	begin object name="DOM5" class=Engine.MatchInfo
		LevelName="DOM-Outrigger"
		EnemyTeamName="xGame.TeamBlackLegion"
		SpecialEvent="DOM COMPLETE"
		DifficultyModifier=2.0000000
		GoalScore=4.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[4]=DOM5
	// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF1'
	begin object name="CTF1" class=Engine.MatchInfo
		LevelName="CTF-Maul"
		EnemyTeamName="xGame.TeamNightstalkers"
		SpecialEvent="TRADE Subversa"
		DifficultyModifier=0.5000000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[0]=CTF1
	// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF2'
	begin object name="CTF2" class=Engine.MatchInfo
		LevelName="CTF-Citadel"
		EnemyTeamName="xGame.TeamVenom"
		DifficultyModifier=1.0000000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[1]=CTF2
	// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF3'
	begin object name="CTF3" class=Engine.MatchInfo
		LevelName="CTF-Chrome"
		EnemyTeamName="xGame.TeamBlackLegion"
		SpecialEvent="TRADE Lilith"
		DifficultyModifier=1.2500000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[2]=CTF3
	// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF4'
	begin object name="CTF4" class=Engine.MatchInfo
		LevelName="CTF-Geothermal"
		EnemyTeamName="xGame.TeamBloodFists"
		SpecialEvent="BR OPENED"
		DifficultyModifier=1.7500000
		GoalScore=4.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[3]=CTF4
	// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF5'
	begin object name="CTF5" class=Engine.MatchInfo
		LevelName="CTF-Lostfaith"
		EnemyTeamName="xGame.TeamIronGuard"
		DifficultyModifier=2.0000000
		GoalScore=4.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[4]=CTF5
	// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF6'
	begin object name="CTF6" class=Engine.MatchInfo
		LevelName="CTF-Face3"
		EnemyTeamName="xGame.TeamColdSteel"
		SpecialEvent="CTF COMPLETE"
		DifficultyModifier=2.5000000
		GoalScore=4.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[5]=CTF6
	// Reference: MatchInfo'XGame.UT2003LadderInfo.BR1'
	begin object name="BR1" class=Engine.MatchInfo
		LevelName="BR-TwinTombs"
		EnemyTeamName="xGame.TeamVenom"
		SpecialEvent="TRADE Syzygy"
		DifficultyModifier=0.7500000
		GoalScore=15.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="xGame.xBombingRun"
	end object
	BRMatches[0]=BR1
	// Reference: MatchInfo'XGame.UT2003LadderInfo.BR2'
	begin object name="BR2" class=Engine.MatchInfo
		LevelName="BR-Disclosure"
		EnemyTeamName="xGame.TeamBlackLegion"
		DifficultyModifier=1.0000000
		GoalScore=15.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xBombingRun"
	end object
	BRMatches[1]=BR2
	// Reference: MatchInfo'XGame.UT2003LadderInfo.BR3'
	begin object name="BR3" class=Engine.MatchInfo
		LevelName="BR-Bifrost"
		EnemyTeamName="xGame.TeamColdSteel"
		SpecialEvent="TRADE Corrosion"
		DifficultyModifier=1.5000000
		GoalScore=20.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xBombingRun"
	end object
	BRMatches[2]=BR3
	// Reference: MatchInfo'XGame.UT2003LadderInfo.BR4'
	begin object name="BR4" class=Engine.MatchInfo
		LevelName="BR-Anubis"
		EnemyTeamName="xGame.TeamBloodFists"
		DifficultyModifier=2.0000000
		GoalScore=20.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xBombingRun"
	end object
	BRMatches[3]=BR4
	// Reference: MatchInfo'XGame.UT2003LadderInfo.BR5'
	begin object name="BR5" class=Engine.MatchInfo
		LevelName="BR-Skyline"
		EnemyTeamName="xGame.TeamPainMachine"
		SpecialEvent="BR COMPLETE"
		DifficultyModifier=2.5000000
		GoalScore=20.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xBombingRun"
	end object
	BRMatches[4]=BR5
	// Reference: MatchInfo'XGame.UT2003LadderInfo.CHAMP1'
	begin object name="CHAMP1" class=Engine.MatchInfo
		LevelName="DM-Compressed"
		MenuName="Tournament Semi-Final"
		EnemyTeamName="xGame.ChampRosterSemiFinal"
		DifficultyModifier=2.7500000
		GoalScore=20.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="xGame.xTeamGame"
	end object
	ChampionshipMatches[0]=CHAMP1
	// Reference: MatchInfo'XGame.UT2003LadderInfo.CHAMP2'
	begin object name="CHAMP2" class=Engine.MatchInfo
		LevelName="DM-1on1-Serpentine"
		MenuName="Tournament Final"
		EnemyTeamName="xGame.ChampRosterFinal"
		SpecialEvent="CHAMPIONSHIP COMPLETE"
		GoalScore=10.0000000
		URLString="?TeamScreen=false"
		NumBots=1
		GameType="xGame.BossDM"
	end object
	ChampionshipMatches[1]=CHAMP2
	OpenNextLadderAtRung[0]=5
	OpenNextLadderAtRung[4]=2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MatchInfo'XGame.UT2003LadderInfo.DM0'
begin object name="DM0" class=Engine.MatchInfo
	LevelName="TUT-DM"
	MenuName="Deathmatch Tutorial"
	EnemyTeamName="xGame.DMRosterTrainingDay"
	GoalScore=10.0000000
	URLString="?Quickstart=true"
	GameType="xGame.xDeathmatch"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DM1'
begin object name="DM1" class=Engine.MatchInfo
	LevelName="DM-TrainingDay"
	EnemyTeamName="xGame.DMRosterTrainingDay"
	DifficultyModifier=-0.3000000
	GoalScore=10.0000000
	URLString="?WeaponStay=true"
	NumBots=1
	GameType="xGame.xDeathmatch"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DM2'
begin object name="DM2" class=Engine.MatchInfo
	LevelName="DM-Gael"
	EnemyTeamName="xGame.DMRosterGael"
	DifficultyModifier=0.2000000
	GoalScore=10.0000000
	URLString="?WeaponStay=true"
	NumBots=1
	GameType="xGame.xDeathmatch"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DM3'
begin object name="DM3" class=Engine.MatchInfo
	LevelName="DM-Leviathan"
	EnemyTeamName="xGame.DMRosterLeviathan"
	DifficultyModifier=0.5000000
	GoalScore=15.0000000
	URLString="?WeaponStay=true"
	NumBots=2
	GameType="xGame.xDeathmatch"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DM4'
begin object name="DM4" class=Engine.MatchInfo
	LevelName="DM-Oceanic"
	EnemyTeamName="xGame.DMRosterOceanic"
	SpecialEvent="DRAFT"
	DifficultyModifier=0.1000000
	GoalScore=15.0000000
	URLString="?WeaponStay=true"
	NumBots=4
	GameType="xGame.xDeathmatch"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DM5'
begin object name="DM5" class=Engine.MatchInfo
	LevelName="DM-Phobos2"
	EnemyTeamName="xGame.DMRosterBeatTeam"
	SpecialEvent="TDM OPENED"
	DifficultyModifier=0.5000000
	GoalScore=20.0000000
	URLString="?WeaponStay=true"
	NumBots=7
	GameType="xGame.xDeathmatch"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM1'
begin object name="TDM1" class=Engine.MatchInfo
	LevelName="DM-Insidious"
	EnemyTeamName="xGame.TeamSupernova"
	SpecialEvent="TRADE Remus"
	DifficultyModifier=0.5000000
	GoalScore=10.0000000
	URLString="?TeamScreen=true"
	NumBots=3
	GameType="xGame.xTeamGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM2'
begin object name="TDM2" class=Engine.MatchInfo
	LevelName="DM-Curse3"
	EnemyTeamName="xGame.TeamCrusaders"
	DifficultyModifier=0.7500000
	GoalScore=15.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xTeamGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM3'
begin object name="TDM3" class=Engine.MatchInfo
	LevelName="DM-Antalus"
	EnemyTeamName="xGame.TeamSunBlades"
	SpecialEvent="TRADE Cannonball"
	DifficultyModifier=1.0000000
	GoalScore=15.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xTeamGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM4'
begin object name="TDM4" class=Engine.MatchInfo
	LevelName="DM-Plunge"
	EnemyTeamName="xGame.TeamDragonBreath"
	SpecialEvent="DOM OPENED"
	DifficultyModifier=1.2500000
	GoalScore=20.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xTeamGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM5'
begin object name="TDM5" class=Engine.MatchInfo
	LevelName="DM-Asbestos"
	EnemyTeamName="xGame.TeamBoneCrushers"
	SpecialEvent="TRADE Horus"
	DifficultyModifier=1.5000000
	GoalScore=20.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xTeamGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.TDM6'
begin object name="TDM6" class=Engine.MatchInfo
	LevelName="DM-TokaraForest"
	EnemyTeamName="xGame.TeamVenom"
	SpecialEvent="TDM COMPLETE"
	DifficultyModifier=2.0000000
	GoalScore=25.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xTeamGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM1'
begin object name="DOM1" class=Engine.MatchInfo
	LevelName="DOM-ScorchedEarth"
	EnemyTeamName="xGame.TeamWarCry"
	SpecialEvent="TRADE Damarus"
	DifficultyModifier=0.5000000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="xGame.xDoubleDom"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM2'
begin object name="DOM2" class=Engine.MatchInfo
	LevelName="DOM-Core"
	EnemyTeamName="xGame.TeamBoneCrushers"
	DifficultyModifier=0.7500000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="xGame.xDoubleDom"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM3'
begin object name="DOM3" class=Engine.MatchInfo
	LevelName="DOM-SepukkuGorge"
	EnemyTeamName="xGame.TeamFirestorm"
	SpecialEvent="CTF OPENED"
	DifficultyModifier=1.2500000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xDoubleDom"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM4'
begin object name="DOM4" class=Engine.MatchInfo
	LevelName="DOM-Suntemple"
	EnemyTeamName="xGame.TeamApocalypse"
	SpecialEvent="TRADE Faraleth"
	DifficultyModifier=1.7500000
	GoalScore=4.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xDoubleDom"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.DOM5'
begin object name="DOM5" class=Engine.MatchInfo
	LevelName="DOM-Outrigger"
	EnemyTeamName="xGame.TeamBlackLegion"
	SpecialEvent="DOM COMPLETE"
	DifficultyModifier=2.0000000
	GoalScore=4.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xDoubleDom"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF1'
begin object name="CTF1" class=Engine.MatchInfo
	LevelName="CTF-Maul"
	EnemyTeamName="xGame.TeamNightstalkers"
	SpecialEvent="TRADE Subversa"
	DifficultyModifier=0.5000000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="xGame.xCTFGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF2'
begin object name="CTF2" class=Engine.MatchInfo
	LevelName="CTF-Citadel"
	EnemyTeamName="xGame.TeamVenom"
	DifficultyModifier=1.0000000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xCTFGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF3'
begin object name="CTF3" class=Engine.MatchInfo
	LevelName="CTF-Chrome"
	EnemyTeamName="xGame.TeamBlackLegion"
	SpecialEvent="TRADE Lilith"
	DifficultyModifier=1.2500000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xCTFGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF4'
begin object name="CTF4" class=Engine.MatchInfo
	LevelName="CTF-Geothermal"
	EnemyTeamName="xGame.TeamBloodFists"
	SpecialEvent="BR OPENED"
	DifficultyModifier=1.7500000
	GoalScore=4.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xCTFGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF5'
begin object name="CTF5" class=Engine.MatchInfo
	LevelName="CTF-Lostfaith"
	EnemyTeamName="xGame.TeamIronGuard"
	DifficultyModifier=2.0000000
	GoalScore=4.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xCTFGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.CTF6'
begin object name="CTF6" class=Engine.MatchInfo
	LevelName="CTF-Face3"
	EnemyTeamName="xGame.TeamColdSteel"
	SpecialEvent="CTF COMPLETE"
	DifficultyModifier=2.5000000
	GoalScore=4.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xCTFGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.BR1'
begin object name="BR1" class=Engine.MatchInfo
	LevelName="BR-TwinTombs"
	EnemyTeamName="xGame.TeamVenom"
	SpecialEvent="TRADE Syzygy"
	DifficultyModifier=0.7500000
	GoalScore=15.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="xGame.xBombingRun"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.BR2'
begin object name="BR2" class=Engine.MatchInfo
	LevelName="BR-Disclosure"
	EnemyTeamName="xGame.TeamBlackLegion"
	DifficultyModifier=1.0000000
	GoalScore=15.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xBombingRun"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.BR3'
begin object name="BR3" class=Engine.MatchInfo
	LevelName="BR-Bifrost"
	EnemyTeamName="xGame.TeamColdSteel"
	SpecialEvent="TRADE Corrosion"
	DifficultyModifier=1.5000000
	GoalScore=20.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xBombingRun"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.BR4'
begin object name="BR4" class=Engine.MatchInfo
	LevelName="BR-Anubis"
	EnemyTeamName="xGame.TeamBloodFists"
	DifficultyModifier=2.0000000
	GoalScore=20.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xBombingRun"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.BR5'
begin object name="BR5" class=Engine.MatchInfo
	LevelName="BR-Skyline"
	EnemyTeamName="xGame.TeamPainMachine"
	SpecialEvent="BR COMPLETE"
	DifficultyModifier=2.5000000
	GoalScore=20.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xBombingRun"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.CHAMP1'
begin object name="CHAMP1" class=Engine.MatchInfo
	LevelName="DM-Compressed"
	MenuName="Tournament Semi-Final"
	EnemyTeamName="xGame.ChampRosterSemiFinal"
	DifficultyModifier=2.7500000
	GoalScore=20.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="xGame.xTeamGame"
end object
// Reference: MatchInfo'XGame.UT2003LadderInfo.CHAMP2'
begin object name="CHAMP2" class=Engine.MatchInfo
	LevelName="DM-1on1-Serpentine"
	MenuName="Tournament Final"
	EnemyTeamName="xGame.ChampRosterFinal"
	SpecialEvent="CHAMPIONSHIP COMPLETE"
	GoalScore=10.0000000
	URLString="?TeamScreen=false"
	NumBots=1
	GameType="xGame.BossDM"
end object
