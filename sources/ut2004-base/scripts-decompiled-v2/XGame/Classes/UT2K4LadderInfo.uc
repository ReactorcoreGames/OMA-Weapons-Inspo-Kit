class UT2K4LadderInfo extends LadderInfo
	config;

var() editinline array<editinline UT2K4MatchInfo> ASMatches;
var int LID_DM;
var int LID_TDM;
var int LID_CTF;
var int LID_BR;
var int LID_DOM;
var int LID_AS;
var int LID_CHAMP;
var config array< Class<CustomLadderInfo> > AdditionalLadders;
var config array< Class<ChallengeGame> > ChallengeGames;

static function MatchInfo GetMatchInfo(int Ladder, int rung)
{
	return GetUT2K4MatchInfo(Ladder, rung, 0, true);
	//return;	
}

static function UT2K4MatchInfo GetUT2K4MatchInfo(int Ladder, int rung, optional int Path, optional bool bSelect)
{
	local array<MatchInfo> matcharray;
	local UT2K4MatchInfo selmatch;
	local string tmp;
	local int i;

	// End:0x19
	if(rung < 0)
	{
		Warn("rung < 0");
		return none;
	}
	switch(Ladder)
	{
		// End:0x36
		case default.LID_DM:
			matcharray = default.DMMatches;
			// End:0xFD
			break;
		// End:0x4C
		case default.LID_TDM:
			matcharray = default.TDMMatches;
			// End:0xFD
			break;
		// End:0x62
		case default.LID_CTF:
			matcharray = default.CTFMatches;
			// End:0xFD
			break;
		// End:0x78
		case default.LID_BR:
			matcharray = default.BRMatches;
			// End:0xFD
			break;
		// End:0x8E
		case default.LID_DOM:
			matcharray = default.DOMMatches;
			// End:0xFD
			break;
		// End:0xA4
		case default.LID_AS:
			matcharray = default.ASMatches;
			// End:0xFD
			break;
		// End:0xBA
		case default.LID_CHAMP:
			matcharray = default.ChampionshipMatches;
			// End:0xFD
			break;
		// End:0xFFFF
		default:
			// End:0xFD
			if((Ladder >= 10) && default.AdditionalLadders.Length > (Ladder - 10))
			{
				matcharray = default.AdditionalLadders[Ladder - 10].default.Matches;
			}
			break;
	}
	// End:0x125
	if(matcharray.Length <= 0)
	{
		Warn("matcharray.Length <= 0");
		return none;
	}
	// End:0x152
	if(rung >= matcharray.Length)
	{
		selmatch = UT2K4MatchInfo(matcharray[matcharray.Length - 1]);		
	}
	else
	{
		selmatch = UT2K4MatchInfo(matcharray[rung]);
	}
	// End:0x1E9
	if(((selmatch != none) && bSelect) && selmatch.AltLevels.Length > 0)
	{
		tmp = selmatch.AltLevels[int(float(Path) % float(selmatch.AltLevels.Length))];
		// End:0x1E6
		if(tmp != "")
		{
			selmatch.LevelName = tmp;
		}		
	}
	else
	{
		// End:0x2BB
		if((selmatch != none) && selmatch.AltLevels.Length > 0)
		{
			Path = int(Abs(float(Path + ((rung + 1) * (Ladder + 1)))));
			// End:0x25F
			if(int(selmatch.Priority) > 0)
			{
				i = int(selmatch.Priority);				
			}
			else
			{
				i = selmatch.AltLevels.Length;
			}
			tmp = selmatch.AltLevels[int(float(Path) % float(i))];
			// End:0x2BB
			if(tmp != "")
			{
				selmatch.LevelName = tmp;
			}
		}
	}
	// End:0x2DA
	if(selmatch == none)
	{
		Warn("selmatch == none");
	}
	return selmatch;
	//return;	
}

static function byte GetAltLevel(int Ladder, int rung, int Path, int selected)
{
	local array<MatchInfo> matcharray;
	local UT2K4MatchInfo selmatch;
	local int origpath;

	// End:0x13
	if(rung < 0)
	{
		return byte(-1);
	}
	switch(Ladder)
	{
		// End:0x30
		case default.LID_DM:
			matcharray = default.DMMatches;
			// End:0xF7
			break;
		// End:0x46
		case default.LID_TDM:
			matcharray = default.TDMMatches;
			// End:0xF7
			break;
		// End:0x5C
		case default.LID_CTF:
			matcharray = default.CTFMatches;
			// End:0xF7
			break;
		// End:0x72
		case default.LID_BR:
			matcharray = default.BRMatches;
			// End:0xF7
			break;
		// End:0x88
		case default.LID_DOM:
			matcharray = default.DOMMatches;
			// End:0xF7
			break;
		// End:0x9E
		case default.LID_AS:
			matcharray = default.ASMatches;
			// End:0xF7
			break;
		// End:0xB4
		case default.LID_CHAMP:
			matcharray = default.ChampionshipMatches;
			// End:0xF7
			break;
		// End:0xFFFF
		default:
			// End:0xF7
			if((Ladder >= 10) && default.AdditionalLadders.Length > (Ladder - 10))
			{
				matcharray = default.AdditionalLadders[Ladder - 10].default.Matches;
			}
			break;
	}
	// End:0x10B
	if(matcharray.Length <= 0)
	{
		return byte(-1);
	}
	// End:0x138
	if(rung >= matcharray.Length)
	{
		selmatch = UT2K4MatchInfo(matcharray[matcharray.Length - 1]);		
	}
	else
	{
		selmatch = UT2K4MatchInfo(matcharray[rung]);
	}
	// End:0x296
	if((selmatch != none) && selmatch.AltLevels.Length > 0)
	{
		origpath = int(Abs(float(Path + ((rung + 1) * (Ladder + 1)))));
		// End:0x1CF
		if(int(selmatch.Priority) > 0)
		{
			origpath = int(float(origpath) % float(selmatch.Priority));			
		}
		else
		{
			origpath = int(float(origpath) % float(selmatch.AltLevels.Length));
		}
		// End:0x28E
		if((selected == origpath) || selected == -1)
		{
			Path = int(float(int(Abs(float(Path + ((rung + 1) * (Ladder + 1)))) + float(1))) % float(selmatch.AltLevels.Length));
			// End:0x286
			if(Path == origpath)
			{
				Path = int(float(Path + 1) % float(selmatch.AltLevels.Length));
			}
			return byte(Path);
		}
		return byte(origpath);
	}
	return byte(-1);
	//return;	
}

static function bool HasAltLevel(int Ladder, int rung)
{
	local array<MatchInfo> matcharray;
	local UT2K4MatchInfo selmatch;

	// End:0x0D
	if(rung < 0)
	{
		return false;
	}
	switch(Ladder)
	{
		// End:0x2A
		case default.LID_DM:
			matcharray = default.DMMatches;
			// End:0xF1
			break;
		// End:0x40
		case default.LID_TDM:
			matcharray = default.TDMMatches;
			// End:0xF1
			break;
		// End:0x56
		case default.LID_CTF:
			matcharray = default.CTFMatches;
			// End:0xF1
			break;
		// End:0x6C
		case default.LID_BR:
			matcharray = default.BRMatches;
			// End:0xF1
			break;
		// End:0x82
		case default.LID_DOM:
			matcharray = default.DOMMatches;
			// End:0xF1
			break;
		// End:0x98
		case default.LID_AS:
			matcharray = default.ASMatches;
			// End:0xF1
			break;
		// End:0xAE
		case default.LID_CHAMP:
			matcharray = default.ChampionshipMatches;
			// End:0xF1
			break;
		// End:0xFFFF
		default:
			// End:0xF1
			if((Ladder >= 10) && default.AdditionalLadders.Length > (Ladder - 10))
			{
				matcharray = default.AdditionalLadders[Ladder - 10].default.Matches;
			}
			break;
	}
	// End:0xFF
	if(matcharray.Length <= 0)
	{
		return false;
	}
	// End:0x12C
	if(rung >= matcharray.Length)
	{
		selmatch = UT2K4MatchInfo(matcharray[matcharray.Length - 1]);		
	}
	else
	{
		selmatch = UT2K4MatchInfo(matcharray[rung]);
	}
	// End:0x14F
	if(selmatch == none)
	{
		return false;
	}
	return selmatch.AltLevels.Length > 1;
	//return;	
}

static function MatchInfo GetCurrentMatchInfo(GameProfile G)
{
	// End:0x3C
	if(UT2K4GameProfile(G) != none)
	{
		return G.GetMatchInfo(G.CurrentLadder, G.CurrentMenuRung);
	}
	return GetUT2K4MatchInfo(G.CurrentLadder, G.CurrentMenuRung);
	//return;	
}

static function int LengthOfLadder(int Ladder)
{
	switch(Ladder)
	{
		// End:0x16
		case default.LID_DM:
			return default.DMMatches.Length;
		// End:0x25
		case default.LID_TDM:
			return default.TDMMatches.Length;
		// End:0x34
		case default.LID_CTF:
			return default.CTFMatches.Length;
		// End:0x43
		case default.LID_BR:
			return default.BRMatches.Length;
		// End:0x52
		case default.LID_DOM:
			return default.DOMMatches.Length;
		// End:0x61
		case default.LID_AS:
			return default.ASMatches.Length;
		// End:0x70
		case default.LID_CHAMP:
			return default.ChampionshipMatches.Length;
		// End:0xFFFF
		default:
			// End:0xAF
			if((Ladder >= 10) && default.AdditionalLadders.Length > (Ladder - 10))
			{
				return default.AdditionalLadders[Ladder - 10].default.Matches.Length;
			}
			return -1;
			break;
	}
	//return;	
}

static function string UpdateLadders(GameProfile G, int CurrentLadder)
{
	local string SpecialEvent;
	local UT2K4GameProfile GP;
	local int i, j;

	GP = UT2K4GameProfile(G);
	// End:0x30
	if(GP == none)
	{
		Warn("PC Load Letter");
		return "";
	}
	// End:0x5A
	if(GP.bIsChallenge)
	{
		return GP.ChallengeInfo.SpecialEvent;
	}
	// End:0x90
	if(CurrentLadder < 10)
	{
		// End:0x90
		if(GP.LadderProgress[CurrentLadder] > G.CurrentMenuRung)
		{
			return "";
		}
	}
	switch(CurrentLadder)
	{
		// End:0xCB
		case default.LID_DM:
			SpecialEvent = default.DMMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
			// End:0x2BE
			break;
		// End:0xFF
		case default.LID_TDM:
			SpecialEvent = default.TDMMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
			// End:0x2BE
			break;
		// End:0x133
		case default.LID_CTF:
			SpecialEvent = default.CTFMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
			// End:0x2BE
			break;
		// End:0x167
		case default.LID_BR:
			SpecialEvent = default.BRMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
			// End:0x2BE
			break;
		// End:0x19B
		case default.LID_DOM:
			SpecialEvent = default.DOMMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
			// End:0x2BE
			break;
		// End:0x1CF
		case default.LID_AS:
			SpecialEvent = default.ASMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
			// End:0x2BE
			break;
		// End:0x203
		case default.LID_CHAMP:
			SpecialEvent = default.ChampionshipMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
			// End:0x2BE
			break;
		// End:0xFFFF
		default:
			i = CurrentLadder - 10;
			// End:0x2BB
			if((i >= 0) && default.AdditionalLadders.Length > i)
			{
				j = GP.GetCustomLadderProgress(string(default.AdditionalLadders[i]));
				// End:0x26F
				if(j > G.CurrentMenuRung)
				{
					return "";
				}
				SpecialEvent = default.AdditionalLadders[i].default.Matches[j].SpecialEvent;
				GP.SetCustomLadderProgress(string(default.AdditionalLadders[i]), 1);
				return SpecialEvent;
			}
			return "";
			break;
	}
	GP.LadderProgress[CurrentLadder] += 1;
	return SpecialEvent;
	//return;	
}

static function string GetMatchDescription(GameProfile G)
{
	return GetLadderDescription(G.CurrentLadder, G.CurrentMenuRung);
	//return;	
}

static function string GetLadderDescription(int LadderId, optional int MatchID)
{
	local string retval;
	local GameRecord GR;

	switch(LadderId)
	{
		// End:0x2C
		case default.LID_DM:
			retval = default.DMMatches[MatchID].GameType;
			// End:0x162
			break;
		// End:0x51
		case default.LID_TDM:
			retval = default.TDMMatches[MatchID].GameType;
			// End:0x162
			break;
		// End:0x76
		case default.LID_CTF:
			retval = default.CTFMatches[MatchID].GameType;
			// End:0x162
			break;
		// End:0x9B
		case default.LID_BR:
			retval = default.BRMatches[MatchID].GameType;
			// End:0x162
			break;
		// End:0xC0
		case default.LID_DOM:
			retval = default.DOMMatches[MatchID].GameType;
			// End:0x162
			break;
		// End:0xE5
		case default.LID_AS:
			retval = default.ASMatches[MatchID].GameType;
			// End:0x162
			break;
		// End:0x10A
		case default.LID_CHAMP:
			retval = default.ChampionshipMatches[MatchID].GameType;
			// End:0x162
			break;
		// End:0xFFFF
		default:
			// End:0x15F
			if((LadderId >= 10) && default.AdditionalLadders.Length > (LadderId - 10))
			{
				retval = default.AdditionalLadders[LadderId - 10].default.Matches[MatchID].GameType;				
			}
			else
			{
				return "";
			}
			break;
	}
	GR = Class'Engine.CacheManager'.static.GetGameRecord(retval);
	return GR.GameName;
	//return;	
}

static function int GetRandomLadder(optional bool bIncludeChamp)
{
	// End:0x17
	if(bIncludeChamp)
	{
		return Rand(default.LID_CHAMP) + 1;		
	}
	else
	{
		return Rand(default.LID_AS) + 1;
	}
	//return;	
}

static function string MakeURLFor(GameProfile G)
{
	// End:0x48
	if((UT2K4GameProfile(G) != none) && UT2K4GameProfile(G).bIsChallenge)
	{
		return MakeURLFoMatchInfo(UT2K4GameProfile(G).ChallengeInfo, G);
	}
	return MakeURLFoMatchInfo(GetCurrentMatchInfo(G), G);
	//return;	
}

static function string MakeURLFoMatchInfo(MatchInfo M, GameProfile G)
{
	local string URL;

	// End:0x23
	if(M == none)
	{
		Warn("MatchInfo == none");
		return "";
	}
	G.EnemyTeam = M.EnemyTeamName;
	G.Difficulty = G.BaseDifficulty + M.DifficultyModifier;
	URL = ((((((M.LevelName $ "?Name=") $ G.PlayerName) $ "?Character=") $ G.PlayerCharacter) $ "?SaveGame=") $ G.PackageName) $ M.URLString;
	// End:0x126
	if(M.GoalScore != float(0))
	{
		URL $= ("?GoalScore=" $ string(M.GoalScore));
	}
	// End:0x160
	if(M.NumBots > 0)
	{
		URL $= ("?NumBots=" $ string(M.NumBots));
	}
	// End:0x196
	if(M.GameType != "")
	{
		URL $= ("?Game=" $ M.GameType);
	}
	URL $= "?Team=1?NoSaveDefPlayer?ResetDefPlayer";
	// End:0x21F
	if(UT2K4MatchInfo(M) != none)
	{
		// End:0x21F
		if(UT2K4MatchInfo(M).TimeLimit > float(0))
		{
			URL $= ("?TimeLimit=" $ string(UT2K4MatchInfo(M).TimeLimit));
		}
	}
	return URL;
	//return;	
}

static function Class<ChallengeGame> GetChallengeGame(optional string ClassName, optional UT2K4GameProfile GP)
{
	local array< Class<ChallengeGame> > chalgames;
	local int i;

	// End:0x6B
	if(ClassName == "")
	{
		chalgames = default.ChallengeGames;
		J0x17:

		// End:0x69 [Loop If]
		if(chalgames.Length > 0)
		{
			i = Rand(chalgames.Length);
			// End:0x5A
			if(chalgames[i].static.canChallenge(GP))
			{
				return chalgames[i];
			}
			chalgames.Remove(i, 1);
			// [Loop Continue]
			goto J0x17;
		}
		return none;
	}
	i = 0;
	J0x72:

	// End:0xCE [Loop If]
	if(i < default.ChallengeGames.Length)
	{
		// End:0xC4
		if(string(default.ChallengeGames[i]) ~= ClassName)
		{
			// End:0xC2
			if(default.ChallengeGames[i].static.canChallenge(GP))
			{
				return default.ChallengeGames[i];
			}
			return none;
		}
		i++;
		// [Loop Continue]
		goto J0x72;
	}
	return none;
	//return;	
}

defaultproperties
{
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS1'
	begin object name="AS1" class=XGame.UT2K4MatchInfo
		AltLevels[0]="AS-FallenCity"
		AltLevels[1]="AS-BP2-Thrust"
		PrizeMoney=1500
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		DifficultyModifier=0.7500000
		URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=10?ReinforcementsFreq=7?RoundLimit=1"
		NumBots=9
		GameType="UT2k4Assault.ASGameInfo"
	end object
	ASMatches[0]=AS1
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS2'
	begin object name="AS2" class=XGame.UT2K4MatchInfo
		AltLevels[0]="AS-RobotFactory"
		AltLevels[1]="AS-BP2-SubRosa"
		PrizeMoney=1750
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		SpecialEvent="UPDATETEAMS"
		DifficultyModifier=1.2500000
		URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=11?ReinforcementsFreq=7?RoundLimit=1"
		NumBots=9
		GameType="UT2k4Assault.ASGameInfo"
	end object
	ASMatches[1]=AS2
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS3'
	begin object name="AS3" class=XGame.UT2K4MatchInfo
		PrizeMoney=2000
		TimeLimit=20.0000000
		LevelName="AS-Convoy"
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		DifficultyModifier=1.7500000
		URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=12?ReinforcementsFreq=7?RoundLimit=1"
		NumBots=9
		GameType="UT2k4Assault.ASGameInfo"
	end object
	ASMatches[2]=AS3
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS4'
	begin object name="AS4" class=XGame.UT2K4MatchInfo
		AltLevels[0]="AS-Glacier"
		AltLevels[1]="AS-BP2-Jumpship"
		PrizeMoney=2500
		TimeLimit=25.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		DifficultyModifier=2.0000000
		URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=13?ReinforcementsFreq=7?RoundLimit=1"
		NumBots=9
		GameType="UT2k4Assault.ASGameInfo"
	end object
	ASMatches[3]=AS4
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS5'
	begin object name="AS5" class=XGame.UT2K4MatchInfo
		AltLevels[0]="AS-Junkyard"
		AltLevels[1]="AS-BP2-Outback"
		PrizeMoney=3000
		TimeLimit=30.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		SpecialEvent="UPDATETEAMS"
		DifficultyModifier=2.2500000
		URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=14?ReinforcementsFreq=7?RoundLimit=1"
		NumBots=9
		GameType="UT2k4Assault.ASGameInfo"
	end object
	ASMatches[4]=AS5
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS6'
	begin object name="AS6" class=XGame.UT2K4MatchInfo
		AltLevels[0]="AS-MotherShip"
		AltLevels[1]="AS-BP2-Acatana"
		PrizeMoney=3500
		TimeLimit=30.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
		SpecialEvent="COMPLETED AS;UPDATETEAMS"
		DifficultyModifier=2.5000000
		URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=15?ReinforcementsFreq=7?RoundLimit=1"
		NumBots=9
		GameType="UT2k4Assault.ASGameInfo"
	end object
	ASMatches[5]=AS6
	LID_TDM=1
	LID_CTF=2
	LID_BR=3
	LID_DOM=4
	LID_AS=5
	LID_CHAMP=6
	AdditionalLadders[0]=Class'XGame.CLOnslaught'
	ChallengeGames[0]=Class'XGame.BloodRites'
	ChallengeGames[1]=Class'XGame.ManoEMano'
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM0'
	begin object name="DM0" class=XGame.UT2K4MatchInfo
		TimeLimit=15.0000000
		LevelName="TUT-DM"
		MenuName="Deathmatch Tutorial"
		EnemyTeamName="xGame.UT2K4DMRoster"
		GoalScore=10.0000000
		URLString="?Quickstart=true?TeamScreen=true"
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[0]=DM0
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM1'
	begin object name="DM1" class=XGame.UT2K4MatchInfo
		PrizeMoney=150
		EntryFee=50
		TimeLimit=10.0000000
		LevelName="DM-1on1-Idoma"
		EnemyTeamName="xGame.UT2K4DMRoster"
		GoalScore=10.0000000
		URLString="?WeaponStay=true?TeamScreen=true"
		NumBots=1
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[1]=DM1
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM2'
	begin object name="DM2" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DM-1on1-Spirit"
		AltLevels[1]="DM-1on1-Trite"
		PrizeMoney=250
		EntryFee=75
		TimeLimit=15.0000000
		EnemyTeamName="xGame.UT2K4DMRoster"
		DifficultyModifier=0.2000000
		GoalScore=10.0000000
		URLString="?WeaponStay=true?TeamScreen=true"
		NumBots=2
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[2]=DM2
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM3'
	begin object name="DM3" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DM-1on1-Albatross"
		AltLevels[1]="DM-1on1-Roughinery"
		PrizeMoney=500
		EntryFee=100
		TimeLimit=15.0000000
		EnemyTeamName="xGame.UT2K4DMRoster"
		DifficultyModifier=0.3000000
		GoalScore=15.0000000
		URLString="?WeaponStay=true?TeamScreen=true"
		NumBots=2
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[3]=DM3
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM4'
	begin object name="DM4" class=XGame.UT2K4MatchInfo
		PrizeMoney=650
		EntryFee=200
		TimeLimit=15.0000000
		LevelName="DM-1on1-Desolation"
		EnemyTeamName="xGame.UT2K4DMRoster"
		SpecialEvent="BALANCE 2000;DRAFT"
		DifficultyModifier=0.4000000
		GoalScore=15.0000000
		URLString="?WeaponStay=true?TeamScreen=true"
		NumBots=4
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[4]=DM4
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM5'
	begin object name="DM5" class=XGame.UT2K4MatchInfo
		PrizeMoney=750
		EntryFee=250
		Requirements="FULLTEAM"
		TimeLimit=15.0000000
		LevelName="DM-1on1-Irondust"
		EnemyTeamName="xGame.DMRosterBeatTeam"
		SpecialEvent="OPEN TDM;QUALIFIED SINGLE"
		DifficultyModifier=0.5000000
		GoalScore=20.0000000
		URLString="?WeaponStay=true?TeamScreen=true"
		NumBots=5
		GameType="xGame.xDeathmatch"
	end object
	DMMatches[5]=DM5
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.TDM1'
	begin object name="TDM1" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DM-Sulphur"
		AltLevels[1]="DM-Curse4"
		PrizeMoney=500
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterEasy;least"
		DifficultyModifier=0.5000000
		GoalScore=30.0000000
		URLString="?TeamScreen=true"
		NumBots=3
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[0]=TDM1
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.TDM2'
	begin object name="TDM2" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DM-Rankin"
		AltLevels[1]="DM-Rrajigar"
		PrizeMoney=750
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterEasy;least"
		DifficultyModifier=0.7500000
		GoalScore=40.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[1]=TDM2
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.TDM3'
	begin object name="TDM3" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DM-Corrugation"
		AltLevels[1]="DM-Antalus"
		Priority=1
		PrizeMoney=1000
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterEasy;least"
		DifficultyModifier=1.0000000
		GoalScore=50.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[2]=TDM3
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.TDM4'
	begin object name="TDM4" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DM-Morpheus3"
		AltLevels[1]="DM-Goliath"
		PrizeMoney=1250
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterEasy;best"
		SpecialEvent="OPEN DOM;QUALIFIED TEAM;UPDATETEAMS"
		DifficultyModifier=1.5000000
		GoalScore=60.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xTeamGame"
	end object
	TDMMatches[3]=TDM4
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM1'
	begin object name="DOM1" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DOM-Atlantis"
		AltLevels[1]="DOM-ScorchedEarth"
		Priority=1
		PrizeMoney=1000
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		DifficultyModifier=0.7500000
		GoalScore=2.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[0]=DOM1
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM2'
	begin object name="DOM2" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DOM-Renascent"
		AltLevels[1]="DOM-Junkyard"
		Priority=1
		PrizeMoney=1500
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		SpecialEvent="OPEN CTF"
		DifficultyModifier=1.2500000
		GoalScore=2.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[1]=DOM2
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM3'
	begin object name="DOM3" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DOM-Access"
		AltLevels[1]="DOM-Outrigger"
		Priority=1
		PrizeMoney=2000
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		SpecialEvent="UPDATETEAMS"
		DifficultyModifier=1.7500000
		GoalScore=2.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[2]=DOM3
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM4'
	begin object name="DOM4" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DOM-Ruination"
		AltLevels[1]="DOM-Suntemple"
		PrizeMoney=2500
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		DifficultyModifier=2.0000000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[3]=DOM4
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM5'
	begin object name="DOM5" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DOM-Conduit"
		AltLevels[1]="DOM-Core"
		Priority=1
		PrizeMoney=3000
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		SpecialEvent="UPDATETEAMS"
		DifficultyModifier=2.2500000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[4]=DOM5
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM6'
	begin object name="DOM6" class=XGame.UT2K4MatchInfo
		AltLevels[0]="DOM-Aswan"
		AltLevels[1]="DOM-SepukkuGorge"
		Priority=1
		PrizeMoney=3500
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
		SpecialEvent="COMPLETED DOM;UPDATETEAMS"
		DifficultyModifier=2.5000000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xDoubleDom"
	end object
	DOMMatches[5]=DOM6
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF1'
	begin object name="CTF1" class=XGame.UT2K4MatchInfo
		AltLevels[0]="CTF-FaceClassic"
		AltLevels[1]="CTF-Maul"
		AltLevels[2]="CTF-Citadel"
		Priority=1
		PrizeMoney=1000
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		DifficultyModifier=0.7500000
		GoalScore=2.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[0]=CTF1
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF2'
	begin object name="CTF2" class=XGame.UT2K4MatchInfo
		AltLevels[0]="CTF-Grendelkeep"
		AltLevels[1]="CTF-Magma"
		AltLevels[2]="CTF-Geothermal"
		Priority=1
		PrizeMoney=1500
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		SpecialEvent="OPEN BR"
		DifficultyModifier=1.0000000
		GoalScore=2.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[1]=CTF2
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF3'
	begin object name="CTF3" class=XGame.UT2K4MatchInfo
		AltLevels[0]="CTF-Smote"
		AltLevels[1]="CTF-TwinTombs"
		PrizeMoney=1750
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		SpecialEvent="UPDATETEAMS"
		DifficultyModifier=1.2500000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[2]=CTF3
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF4'
	begin object name="CTF4" class=XGame.UT2K4MatchInfo
		AltLevels[0]="CTF-Grassyknoll"
		AltLevels[1]="CTF-Avaris"
		AltLevels[2]="CTF-BP2-Pistola"
		Priority=1
		PrizeMoney=2000
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		DifficultyModifier=1.5000000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[3]=CTF4
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF5'
	begin object name="CTF5" class=XGame.UT2K4MatchInfo
		AltLevels[0]="CTF-January"
		AltLevels[1]="CTF-Lostfaith"
		Priority=1
		PrizeMoney=2250
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		DifficultyModifier=1.7500000
		GoalScore=3.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[4]=CTF5
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF6'
	begin object name="CTF6" class=XGame.UT2K4MatchInfo
		AltLevels[0]="CTF-MoonDragon"
		AltLevels[1]="CTF-Orbital2"
		Priority=1
		PrizeMoney=2500
		TimeLimit=20.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		SpecialEvent="UPDATETEAMS"
		DifficultyModifier=2.0000000
		GoalScore=4.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[5]=CTF6
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF7'
	begin object name="CTF7" class=XGame.UT2K4MatchInfo
		Priority=1
		PrizeMoney=3000
		TimeLimit=25.0000000
		LevelName="CTF-BridgeOfFate"
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
		DifficultyModifier=2.2500000
		GoalScore=4.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[6]=CTF7
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF8'
	begin object name="CTF8" class=XGame.UT2K4MatchInfo
		AltLevels[0]="CTF-AbsoluteZero"
		AltLevels[1]="CTF-DoubleDammage"
		Priority=1
		PrizeMoney=3500
		TimeLimit=25.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
		SpecialEvent="COMPLETED CTF;UPDATETEAMS"
		DifficultyModifier=2.5000000
		GoalScore=4.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xCTFGame"
	end object
	CTFMatches[7]=CTF8
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR1'
	begin object name="BR1" class=XGame.UT2K4MatchInfo
		PrizeMoney=1000
		TimeLimit=15.0000000
		LevelName="BR-Serenity"
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		DifficultyModifier=0.7500000
		GoalScore=15.0000000
		URLString="?TeamScreen=true"
		NumBots=5
		GameType="xGame.xBombingRun"
	end object
	BRMatches[0]=BR1
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR2'
	begin object name="BR2" class=XGame.UT2K4MatchInfo
		AltLevels[0]="BR-Bifrost"
		AltLevels[1]="BR-Anubis"
		Priority=1
		PrizeMoney=1500
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		SpecialEvent="OPEN AS"
		DifficultyModifier=1.0000000
		GoalScore=15.0000000
		URLString="?TeamScreen=true"
		NumBots=7
		GameType="xGame.xBombingRun"
	end object
	BRMatches[1]=BR2
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR3'
	begin object name="BR3" class=XGame.UT2K4MatchInfo
		AltLevels[0]="BR-Canyon"
		AltLevels[1]="BR-DE-ElecFields"
		Priority=1
		PrizeMoney=2000
		TimeLimit=15.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
		SpecialEvent="UPDATETEAMS"
		DifficultyModifier=1.2500000
		GoalScore=20.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xBombingRun"
	end object
	BRMatches[2]=BR3
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR4'
	begin object name="BR4" class=XGame.UT2K4MatchInfo
		PrizeMoney=2250
		TimeLimit=20.0000000
		LevelName="BR-Disclosure"
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		DifficultyModifier=1.5000000
		GoalScore=20.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xBombingRun"
	end object
	BRMatches[3]=BR4
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR5'
	begin object name="BR5" class=XGame.UT2K4MatchInfo
		PrizeMoney=2500
		TimeLimit=20.0000000
		LevelName="BR-TwinTombs"
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		DifficultyModifier=1.7500000
		GoalScore=25.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xBombingRun"
	end object
	BRMatches[4]=BR5
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR6'
	begin object name="BR6" class=XGame.UT2K4MatchInfo
		PrizeMoney=2750
		TimeLimit=20.0000000
		LevelName="BR-IceFields"
		EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
		SpecialEvent="UPDATETEAMS"
		DifficultyModifier=2.0000000
		GoalScore=25.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xBombingRun"
	end object
	BRMatches[5]=BR6
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR7'
	begin object name="BR7" class=XGame.UT2K4MatchInfo
		AltLevels[0]="BR-Skyline"
		AltLevels[1]="BR-BridgeOfFate"
		Priority=1
		PrizeMoney=3000
		TimeLimit=25.0000000
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
		DifficultyModifier=2.2500000
		GoalScore=30.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xBombingRun"
	end object
	BRMatches[6]=BR7
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR8'
	begin object name="BR8" class=XGame.UT2K4MatchInfo
		PrizeMoney=3500
		TimeLimit=25.0000000
		LevelName="BR-Colossus"
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
		SpecialEvent="COMPLETED BR;UPDATETEAMS"
		DifficultyModifier=2.5000000
		GoalScore=30.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xBombingRun"
	end object
	BRMatches[7]=BR8
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CHAMP1'
	begin object name="CHAMP1" class=XGame.UT2K4MatchInfo
		PrizeMoney=5000
		LevelName="DM-Deck17"
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;final"
		DifficultyModifier=3.0000000
		GoalScore=35.0000000
		URLString="?TeamScreen=true"
		NumBots=9
		GameType="xGame.xTeamGame"
	end object
	ChampionshipMatches[0]=CHAMP1
	// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CHAMP2'
	begin object name="CHAMP2" class=XGame.UT2K4MatchInfo
		PrizeMoney=10000
		LevelName="DM-HyperBlast2"
		EnemyTeamName=";xGame.UT2K4TeamRosterStrong;final"
		SpecialEvent="COMPLETED CHAMP"
		DifficultyModifier=3.0000000
		GoalScore=20.0000000
		URLString="?TeamScreen=true"
		NumBots=1
		GameType="xGame.BossDM"
	end object
	ChampionshipMatches[1]=CHAMP2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM0'
begin object name="DM0" class=XGame.UT2K4MatchInfo
	TimeLimit=15.0000000
	LevelName="TUT-DM"
	MenuName="Deathmatch Tutorial"
	EnemyTeamName="xGame.UT2K4DMRoster"
	GoalScore=10.0000000
	URLString="?Quickstart=true?TeamScreen=true"
	GameType="xGame.xDeathmatch"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM1'
begin object name="DM1" class=XGame.UT2K4MatchInfo
	PrizeMoney=150
	EntryFee=50
	TimeLimit=10.0000000
	LevelName="DM-1on1-Idoma"
	EnemyTeamName="xGame.UT2K4DMRoster"
	GoalScore=10.0000000
	URLString="?WeaponStay=true?TeamScreen=true"
	NumBots=1
	GameType="xGame.xDeathmatch"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM2'
begin object name="DM2" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DM-1on1-Spirit"
	AltLevels[1]="DM-1on1-Trite"
	PrizeMoney=250
	EntryFee=75
	TimeLimit=15.0000000
	EnemyTeamName="xGame.UT2K4DMRoster"
	DifficultyModifier=0.2000000
	GoalScore=10.0000000
	URLString="?WeaponStay=true?TeamScreen=true"
	NumBots=2
	GameType="xGame.xDeathmatch"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM3'
begin object name="DM3" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DM-1on1-Albatross"
	AltLevels[1]="DM-1on1-Roughinery"
	PrizeMoney=500
	EntryFee=100
	TimeLimit=15.0000000
	EnemyTeamName="xGame.UT2K4DMRoster"
	DifficultyModifier=0.3000000
	GoalScore=15.0000000
	URLString="?WeaponStay=true?TeamScreen=true"
	NumBots=2
	GameType="xGame.xDeathmatch"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM4'
begin object name="DM4" class=XGame.UT2K4MatchInfo
	PrizeMoney=650
	EntryFee=200
	TimeLimit=15.0000000
	LevelName="DM-1on1-Desolation"
	EnemyTeamName="xGame.UT2K4DMRoster"
	SpecialEvent="BALANCE 2000;DRAFT"
	DifficultyModifier=0.4000000
	GoalScore=15.0000000
	URLString="?WeaponStay=true?TeamScreen=true"
	NumBots=4
	GameType="xGame.xDeathmatch"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DM5'
begin object name="DM5" class=XGame.UT2K4MatchInfo
	PrizeMoney=750
	EntryFee=250
	Requirements="FULLTEAM"
	TimeLimit=15.0000000
	LevelName="DM-1on1-Irondust"
	EnemyTeamName="xGame.DMRosterBeatTeam"
	SpecialEvent="OPEN TDM;QUALIFIED SINGLE"
	DifficultyModifier=0.5000000
	GoalScore=20.0000000
	URLString="?WeaponStay=true?TeamScreen=true"
	NumBots=5
	GameType="xGame.xDeathmatch"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.TDM1'
begin object name="TDM1" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DM-Sulphur"
	AltLevels[1]="DM-Curse4"
	PrizeMoney=500
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterEasy;least"
	DifficultyModifier=0.5000000
	GoalScore=30.0000000
	URLString="?TeamScreen=true"
	NumBots=3
	GameType="xGame.xTeamGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.TDM2'
begin object name="TDM2" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DM-Rankin"
	AltLevels[1]="DM-Rrajigar"
	PrizeMoney=750
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterEasy;least"
	DifficultyModifier=0.7500000
	GoalScore=40.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="xGame.xTeamGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.TDM3'
begin object name="TDM3" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DM-Corrugation"
	AltLevels[1]="DM-Antalus"
	Priority=1
	PrizeMoney=1000
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterEasy;least"
	DifficultyModifier=1.0000000
	GoalScore=50.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xTeamGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.TDM4'
begin object name="TDM4" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DM-Morpheus3"
	AltLevels[1]="DM-Goliath"
	PrizeMoney=1250
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterEasy;best"
	SpecialEvent="OPEN DOM;QUALIFIED TEAM;UPDATETEAMS"
	DifficultyModifier=1.5000000
	GoalScore=60.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xTeamGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF1'
begin object name="CTF1" class=XGame.UT2K4MatchInfo
	AltLevels[0]="CTF-FaceClassic"
	AltLevels[1]="CTF-Maul"
	AltLevels[2]="CTF-Citadel"
	Priority=1
	PrizeMoney=1000
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	DifficultyModifier=0.7500000
	GoalScore=2.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xCTFGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF2'
begin object name="CTF2" class=XGame.UT2K4MatchInfo
	AltLevels[0]="CTF-Grendelkeep"
	AltLevels[1]="CTF-Magma"
	AltLevels[2]="CTF-Geothermal"
	Priority=1
	PrizeMoney=1500
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	SpecialEvent="OPEN BR"
	DifficultyModifier=1.0000000
	GoalScore=2.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xCTFGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF3'
begin object name="CTF3" class=XGame.UT2K4MatchInfo
	AltLevels[0]="CTF-Smote"
	AltLevels[1]="CTF-TwinTombs"
	PrizeMoney=1750
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	SpecialEvent="UPDATETEAMS"
	DifficultyModifier=1.2500000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xCTFGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF4'
begin object name="CTF4" class=XGame.UT2K4MatchInfo
	AltLevels[0]="CTF-Grassyknoll"
	AltLevels[1]="CTF-Avaris"
	AltLevels[2]="CTF-BP2-Pistola"
	Priority=1
	PrizeMoney=2000
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	DifficultyModifier=1.5000000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xCTFGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF5'
begin object name="CTF5" class=XGame.UT2K4MatchInfo
	AltLevels[0]="CTF-January"
	AltLevels[1]="CTF-Lostfaith"
	Priority=1
	PrizeMoney=2250
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	DifficultyModifier=1.7500000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xCTFGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF6'
begin object name="CTF6" class=XGame.UT2K4MatchInfo
	AltLevels[0]="CTF-MoonDragon"
	AltLevels[1]="CTF-Orbital2"
	Priority=1
	PrizeMoney=2500
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	SpecialEvent="UPDATETEAMS"
	DifficultyModifier=2.0000000
	GoalScore=4.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xCTFGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF7'
begin object name="CTF7" class=XGame.UT2K4MatchInfo
	Priority=1
	PrizeMoney=3000
	TimeLimit=25.0000000
	LevelName="CTF-BridgeOfFate"
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
	DifficultyModifier=2.2500000
	GoalScore=4.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xCTFGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CTF8'
begin object name="CTF8" class=XGame.UT2K4MatchInfo
	AltLevels[0]="CTF-AbsoluteZero"
	AltLevels[1]="CTF-DoubleDammage"
	Priority=1
	PrizeMoney=3500
	TimeLimit=25.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
	SpecialEvent="COMPLETED CTF;UPDATETEAMS"
	DifficultyModifier=2.5000000
	GoalScore=4.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xCTFGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM1'
begin object name="DOM1" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DOM-Atlantis"
	AltLevels[1]="DOM-ScorchedEarth"
	Priority=1
	PrizeMoney=1000
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	DifficultyModifier=0.7500000
	GoalScore=2.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="xGame.xDoubleDom"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM2'
begin object name="DOM2" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DOM-Renascent"
	AltLevels[1]="DOM-Junkyard"
	Priority=1
	PrizeMoney=1500
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	SpecialEvent="OPEN CTF"
	DifficultyModifier=1.2500000
	GoalScore=2.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="xGame.xDoubleDom"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM3'
begin object name="DOM3" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DOM-Access"
	AltLevels[1]="DOM-Outrigger"
	Priority=1
	PrizeMoney=2000
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	SpecialEvent="UPDATETEAMS"
	DifficultyModifier=1.7500000
	GoalScore=2.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xDoubleDom"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM4'
begin object name="DOM4" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DOM-Ruination"
	AltLevels[1]="DOM-Suntemple"
	PrizeMoney=2500
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	DifficultyModifier=2.0000000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xDoubleDom"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM5'
begin object name="DOM5" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DOM-Conduit"
	AltLevels[1]="DOM-Core"
	Priority=1
	PrizeMoney=3000
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	SpecialEvent="UPDATETEAMS"
	DifficultyModifier=2.2500000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xDoubleDom"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.DOM6'
begin object name="DOM6" class=XGame.UT2K4MatchInfo
	AltLevels[0]="DOM-Aswan"
	AltLevels[1]="DOM-SepukkuGorge"
	Priority=1
	PrizeMoney=3500
	TimeLimit=20.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
	SpecialEvent="COMPLETED DOM;UPDATETEAMS"
	DifficultyModifier=2.5000000
	GoalScore=3.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xDoubleDom"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR1'
begin object name="BR1" class=XGame.UT2K4MatchInfo
	PrizeMoney=1000
	TimeLimit=15.0000000
	LevelName="BR-Serenity"
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	DifficultyModifier=0.7500000
	GoalScore=15.0000000
	URLString="?TeamScreen=true"
	NumBots=5
	GameType="xGame.xBombingRun"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR2'
begin object name="BR2" class=XGame.UT2K4MatchInfo
	AltLevels[0]="BR-Bifrost"
	AltLevels[1]="BR-Anubis"
	Priority=1
	PrizeMoney=1500
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	SpecialEvent="OPEN AS"
	DifficultyModifier=1.0000000
	GoalScore=15.0000000
	URLString="?TeamScreen=true"
	NumBots=7
	GameType="xGame.xBombingRun"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR3'
begin object name="BR3" class=XGame.UT2K4MatchInfo
	AltLevels[0]="BR-Canyon"
	AltLevels[1]="BR-DE-ElecFields"
	Priority=1
	PrizeMoney=2000
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	SpecialEvent="UPDATETEAMS"
	DifficultyModifier=1.2500000
	GoalScore=20.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xBombingRun"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR4'
begin object name="BR4" class=XGame.UT2K4MatchInfo
	PrizeMoney=2250
	TimeLimit=20.0000000
	LevelName="BR-Disclosure"
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	DifficultyModifier=1.5000000
	GoalScore=20.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xBombingRun"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR5'
begin object name="BR5" class=XGame.UT2K4MatchInfo
	PrizeMoney=2500
	TimeLimit=20.0000000
	LevelName="BR-TwinTombs"
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	DifficultyModifier=1.7500000
	GoalScore=25.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xBombingRun"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR6'
begin object name="BR6" class=XGame.UT2K4MatchInfo
	PrizeMoney=2750
	TimeLimit=20.0000000
	LevelName="BR-IceFields"
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	SpecialEvent="UPDATETEAMS"
	DifficultyModifier=2.0000000
	GoalScore=25.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xBombingRun"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR7'
begin object name="BR7" class=XGame.UT2K4MatchInfo
	AltLevels[0]="BR-Skyline"
	AltLevels[1]="BR-BridgeOfFate"
	Priority=1
	PrizeMoney=3000
	TimeLimit=25.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
	DifficultyModifier=2.2500000
	GoalScore=30.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xBombingRun"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.BR8'
begin object name="BR8" class=XGame.UT2K4MatchInfo
	PrizeMoney=3500
	TimeLimit=25.0000000
	LevelName="BR-Colossus"
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
	SpecialEvent="COMPLETED BR;UPDATETEAMS"
	DifficultyModifier=2.5000000
	GoalScore=30.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xBombingRun"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS1'
begin object name="AS1" class=XGame.UT2K4MatchInfo
	AltLevels[0]="AS-FallenCity"
	AltLevels[1]="AS-BP2-Thrust"
	PrizeMoney=1500
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	DifficultyModifier=0.7500000
	URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=10?ReinforcementsFreq=7?RoundLimit=1"
	NumBots=9
	GameType="UT2k4Assault.ASGameInfo"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS2'
begin object name="AS2" class=XGame.UT2K4MatchInfo
	AltLevels[0]="AS-RobotFactory"
	AltLevels[1]="AS-BP2-SubRosa"
	PrizeMoney=1750
	TimeLimit=15.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterWeak;least"
	SpecialEvent="UPDATETEAMS"
	DifficultyModifier=1.2500000
	URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=11?ReinforcementsFreq=7?RoundLimit=1"
	NumBots=9
	GameType="UT2k4Assault.ASGameInfo"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS3'
begin object name="AS3" class=XGame.UT2K4MatchInfo
	PrizeMoney=2000
	TimeLimit=20.0000000
	LevelName="AS-Convoy"
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	DifficultyModifier=1.7500000
	URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=12?ReinforcementsFreq=7?RoundLimit=1"
	NumBots=9
	GameType="UT2k4Assault.ASGameInfo"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS4'
begin object name="AS4" class=XGame.UT2K4MatchInfo
	AltLevels[0]="AS-Glacier"
	AltLevels[1]="AS-BP2-Jumpship"
	PrizeMoney=2500
	TimeLimit=25.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	DifficultyModifier=2.0000000
	URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=13?ReinforcementsFreq=7?RoundLimit=1"
	NumBots=9
	GameType="UT2k4Assault.ASGameInfo"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS5'
begin object name="AS5" class=XGame.UT2K4MatchInfo
	AltLevels[0]="AS-Junkyard"
	AltLevels[1]="AS-BP2-Outback"
	PrizeMoney=3000
	TimeLimit=30.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterMid;least"
	SpecialEvent="UPDATETEAMS"
	DifficultyModifier=2.2500000
	URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=14?ReinforcementsFreq=7?RoundLimit=1"
	NumBots=9
	GameType="UT2k4Assault.ASGameInfo"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.AS6'
begin object name="AS6" class=XGame.UT2K4MatchInfo
	AltLevels[0]="AS-MotherShip"
	AltLevels[1]="AS-BP2-Acatana"
	PrizeMoney=3500
	TimeLimit=30.0000000
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;least"
	SpecialEvent="COMPLETED AS;UPDATETEAMS"
	DifficultyModifier=2.5000000
	URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=15?ReinforcementsFreq=7?RoundLimit=1"
	NumBots=9
	GameType="UT2k4Assault.ASGameInfo"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CHAMP1'
begin object name="CHAMP1" class=XGame.UT2K4MatchInfo
	PrizeMoney=5000
	LevelName="DM-Deck17"
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;final"
	DifficultyModifier=3.0000000
	GoalScore=35.0000000
	URLString="?TeamScreen=true"
	NumBots=9
	GameType="xGame.xTeamGame"
end object
// Reference: UT2K4MatchInfo'XGame.UT2K4LadderInfo.CHAMP2'
begin object name="CHAMP2" class=XGame.UT2K4MatchInfo
	PrizeMoney=10000
	LevelName="DM-HyperBlast2"
	EnemyTeamName=";xGame.UT2K4TeamRosterStrong;final"
	SpecialEvent="COMPLETED CHAMP"
	DifficultyModifier=3.0000000
	GoalScore=20.0000000
	URLString="?TeamScreen=true"
	NumBots=1
	GameType="xGame.BossDM"
end object
