class xCTFGame extends CTFGame
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function PrecacheGameTextures(LevelInfo MyLevel)
{
	Class'XGame.xTeamGame'.static.PrecacheGameTextures(MyLevel);
	//return;	
}

static function PrecacheGameStaticMeshes(LevelInfo MyLevel)
{
	Class'XGame.xDeathMatch'.static.PrecacheGameStaticMeshes(MyLevel);
	//return;	
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
	local xPlayer PC;
	local Controller C;
	local CTFFlag Flags[2], F;

	PC = xPlayer(PRI.Owner);
	// End:0x26
	if(PC == none)
	{
		return none;
	}
	// End:0xB3
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		// End:0xB2
		if(((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.HasFlag != none) && (PC.ViewTarget == none) || PC.ViewTarget != C.Pawn)
		{			
			return C.Pawn;
		}		
	}	
	// End:0xE1
	foreach AllActors(Class'UnrealGame.CTFFlag', F)
	{
		Flags[int(F.TeamNum)] = F;		
	}	
	// End:0x136
	if(VSize(PC.Location - Flags[0].Location) < VSize(PC.Location - Flags[1].Location))
	{
		return Flags[1];		
	}
	else
	{
		return Flags[0];
	}
	return none;
	//return;	
}

event SetGrammar()
{
	LoadSRGrammar("CTF");
	//return;	
}

defaultproperties
{
	DefaultEnemyRosterClass="xGame.xTeamRoster"
	HUDType="XInterface.HudCCaptureTheFlag"
	MapListType="XInterface.MapListCaptureTheFlag"
	DeathMessageClass=Class'XGame.xDeathMessage'
	OtherMesgGroup="CTFGame"
	GameName="Capture the Flag"
	ScreenShotName="UT2004Thumbnails.CTFShots"
	DecoTextName="XGame.CTFGame"
	Acronym="CTF"
}
