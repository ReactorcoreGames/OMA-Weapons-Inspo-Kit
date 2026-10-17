class CLOnslaught extends CustomLadderInfo;

defaultproperties
{
	LadderName="Onslaught"
	EntryLabels[0]="Hit & Run"
	EntryLabels[1]="Roadkill"
	EntryLabels[2]="Drive-by shooting"
	EntryLabels[3]="Road warrior"
	EntryLabels[4]="Core meltdown"
	EntryLabels[5]="Vehicle slaughter"
	// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS1'
	begin object name="ONS1" class=XGame.UT2K4MatchInfo
		AltLevels[0]="ONS-FrostBite"
		AltLevels[1]="ONS-Primeval"
		PrizeMoney=3000
		TimeLimit=16.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		DifficultyModifier=2.0000000
		GoalScore=1.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="Onslaught.ONSOnslaughtGame"
	end object
	Matches[0]=ONS1
	// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS2'
	begin object name="ONS2" class=XGame.UT2K4MatchInfo
		AltLevels[0]="ONS-Dawn"
		AltLevels[1]="ONS-Torlan"
		AltLevels[2]="ONS-Aridoom"
		PrizeMoney=4000
		TimeLimit=18.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterEasy;least"
		DifficultyModifier=2.2500000
		GoalScore=1.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="Onslaught.ONSOnslaughtGame"
	end object
	Matches[1]=ONS2
	// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS3'
	begin object name="ONS3" class=XGame.UT2K4MatchInfo
		AltLevels[0]="ONS-ArcticStronghold"
		AltLevels[1]="ONS-Crossfire"
		PrizeMoney=5000
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		DifficultyModifier=2.5000000
		GoalScore=1.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="Onslaught.ONSOnslaughtGame"
	end object
	Matches[2]=ONS3
	// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS4'
	begin object name="ONS4" class=XGame.UT2K4MatchInfo
		AltLevels[0]="ONS-Dria"
		AltLevels[1]="ONS-IslandHop"
		PrizeMoney=6000
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		DifficultyModifier=2.7500000
		GoalScore=1.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="Onslaught.ONSOnslaughtGame"
	end object
	Matches[3]=ONS4
	// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS5'
	begin object name="ONS5" class=XGame.UT2K4MatchInfo
		AltLevels[0]="ONS-RedPlanet"
		AltLevels[1]="ONS-Adara"
		AltLevels[2]="ONS-Tricky"
		PrizeMoney=7000
		TimeLimit=25.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
		DifficultyModifier=3.0000000
		GoalScore=2.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="Onslaught.ONSOnslaughtGame"
	end object
	Matches[4]=ONS5
	// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS6'
	begin object name="ONS6" class=XGame.UT2K4MatchInfo
		AltLevels[0]="ONS-Severance"
		AltLevels[1]="ONS-Urban"
		AltLevels[2]="ONS-Ascendancy"
		PrizeMoney=8000
		TimeLimit=30.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
		DifficultyModifier=3.0000000
		GoalScore=2.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="Onslaught.ONSOnslaughtGame"
	end object
	Matches[5]=ONS6
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS1'
begin object name="ONS1" class=XGame.UT2K4MatchInfo
	AltLevels[0]="ONS-FrostBite"
	AltLevels[1]="ONS-Primeval"
	PrizeMoney=3000
	TimeLimit=16.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	DifficultyModifier=2.0000000
	GoalScore=1.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="Onslaught.ONSOnslaughtGame"
end object
// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS2'
begin object name="ONS2" class=XGame.UT2K4MatchInfo
	AltLevels[0]="ONS-Dawn"
	AltLevels[1]="ONS-Torlan"
	AltLevels[2]="ONS-Aridoom"
	PrizeMoney=4000
	TimeLimit=18.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterEasy;least"
	DifficultyModifier=2.2500000
	GoalScore=1.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="Onslaught.ONSOnslaughtGame"
end object
// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS3'
begin object name="ONS3" class=XGame.UT2K4MatchInfo
	AltLevels[0]="ONS-ArcticStronghold"
	AltLevels[1]="ONS-Crossfire"
	PrizeMoney=5000
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	DifficultyModifier=2.5000000
	GoalScore=1.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="Onslaught.ONSOnslaughtGame"
end object
// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS4'
begin object name="ONS4" class=XGame.UT2K4MatchInfo
	AltLevels[0]="ONS-Dria"
	AltLevels[1]="ONS-IslandHop"
	PrizeMoney=6000
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	DifficultyModifier=2.7500000
	GoalScore=1.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="Onslaught.ONSOnslaughtGame"
end object
// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS5'
begin object name="ONS5" class=XGame.UT2K4MatchInfo
	AltLevels[0]="ONS-RedPlanet"
	AltLevels[1]="ONS-Adara"
	AltLevels[2]="ONS-Tricky"
	PrizeMoney=7000
	TimeLimit=25.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
	DifficultyModifier=3.0000000
	GoalScore=2.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="Onslaught.ONSOnslaughtGame"
end object
// Reference: UT2K4MatchInfo'XGame.CLOnslaught.ONS6'
begin object name="ONS6" class=XGame.UT2K4MatchInfo
	AltLevels[0]="ONS-Severance"
	AltLevels[1]="ONS-Urban"
	AltLevels[2]="ONS-Ascendancy"
	PrizeMoney=8000
	TimeLimit=30.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
	DifficultyModifier=3.0000000
	GoalScore=2.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="Onslaught.ONSOnslaughtGame"
end object
