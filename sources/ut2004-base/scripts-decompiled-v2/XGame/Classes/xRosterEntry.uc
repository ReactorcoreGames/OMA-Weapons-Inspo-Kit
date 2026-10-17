class xRosterEntry extends RosterEntry
	transient
	editinlinenew;

var() PlayerRecord PlrProfile;

static function xRosterEntry CreateRosterEntry(int prIdx)
{
	local xRosterEntry xre;
	local PlayerRecord PR;

	PR = Class'XGame.xUtil'.static.GetPlayerRecord(prIdx);
	xre = new (none) Class'XGame.xRosterEntry';
	xre.PlayerName = PR.DefaultName;
	xre.PawnClassName = "xGame.xPawn";
	xre.PlrProfile = PR;
	xre.Init();
	return xre;
	//return;	
}

static function xRosterEntry CreateRosterEntryCharacter(string charName)
{
	local xRosterEntry xre;
	local PlayerRecord PR;

	PR = Class'XGame.xUtil'.static.FindPlayerRecord(charName);
	xre = new (none) Class'XGame.xRosterEntry';
	xre.PlayerName = PR.DefaultName;
	xre.PawnClassName = "xGame.xPawn";
	xre.PlrProfile = PR;
	xre.Init();
	return xre;
	//return;	
}

function PrecacheRosterFor(UnrealTeamInfo t)
{
	// End:0x50
	if(PlrProfile.Species == none)
	{
		Warn((("Could not load species " $ string(PlrProfile.Species)) $ " for ") $ PlrProfile.DefaultName);
		return;
	}
	PlrProfile.Species.static.LoadResources(PlrProfile, t.Level, none, t.TeamIndex);
	//return;	
}

function InitBot(Bot B)
{
	B.SetPawnClass(PawnClassName, PlayerName);
	CombatStyle = FClamp(Class'UnrealGame.Bot'.default.CombatStyle + float(PlrProfile.CombatStyle), -1.0000000, 1.0000000);
	Aggressiveness = FClamp(Class'UnrealGame.Bot'.default.BaseAggressiveness + float(PlrProfile.Aggressiveness), 0.0000000, 1.0000000);
	Accuracy = FClamp(float(PlrProfile.Accuracy), -4.0000000, 4.0000000);
	StrafingAbility = FClamp(float(PlrProfile.StrafingAbility), -4.0000000, 4.0000000);
	Tactics = FClamp(float(PlrProfile.Tactics), -4.0000000, 4.0000000);
	ReactionTime = FClamp(float(PlrProfile.ReactionTime), -4.0000000, 4.0000000);
	// End:0x108
	if(PlrProfile.FavoriteWeapon == "")
	{
		FavoriteWeapon = none;		
	}
	else
	{
		FavoriteWeapon = Class<Weapon>(DynamicLoadObject(PlrProfile.FavoriteWeapon, Class'Core.Class'));
	}
	Jumpiness = float(PlrProfile.Jumpiness);
	super.InitBot(B);
	//return;	
}

