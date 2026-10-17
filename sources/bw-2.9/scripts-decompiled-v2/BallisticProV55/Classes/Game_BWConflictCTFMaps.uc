class Game_BWConflictCTFMaps extends Game_BWConflict
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated event PostBeginPlay()
{
	super(TeamGame).PostBeginPlay();
	FixFlags();
	// End:0x28
	if(int(Level.NetMode) == int(NM_Client))
	{
		Destroy();
	}
	//return;	
}

simulated function FixFlags()
{
	local CTFFlag F;
	local xCTFBase B;

	// End:0x37
	foreach AllActors(Class'UnrealGame.CTFFlag', F)
	{
		F.HomeBase.bActive = false;
		F.Destroy();		
	}	
	// End:0x74
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x73
		foreach AllActors(Class'XGame.xCTFBase', B)
		{
			B.bHidden = true;			
		}		
	}
	//return;	
}

defaultproperties
{
	MapPrefix="CTF"
	GameName="Ballistic Conflict (CTF Maps)"
	Description="Standard Ballistic Conflict, but played in the CTF maps.||www.runestorm.com"
	DecoTextName="BallisticProV55.Game_BWConflictCTFMaps"
	Acronym="BWCCM"
	bNetTemporary=true
	bAlwaysRelevant=true
	RemoteRole=2
}
