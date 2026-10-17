class xRealCTFBase extends CTFBase
	abstract
	hidecategories(Lighting,LightColor,Karma,Force);

var GameReplicationInfo GRI;
var() Vector BaseOffset;

simulated function UpdateForTeam()
{
	// End:0x8F
	if(((GRI != none) && int(DefenderTeamIndex) < 2) && GRI.TeamSymbols[int(DefenderTeamIndex)] != none)
	{
		TexScaler(Combiner(Shader(FinalBlend(Skins[0]).Material).Diffuse).Material2).Material = GRI.TeamSymbols[int(DefenderTeamIndex)];
	}
	//return;	
}

simulated function SetGRI(GameReplicationInfo NewGRI)
{
	GRI = NewGRI;
	UpdateForTeam();
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x2C
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		LoopAnim('flag', 0.8000000);
	}
	// End:0x5D
	if(Level.Game != none)
	{
		SetGRI(Level.Game.GameReplicationInfo);
	}
	//return;	
}

defaultproperties
{
	BaseOffset=(X=2.0000000,Y=0.0000000,Z=-18.0000000)
	TakenSound=Sound'GameSounds.CTFAlarm'
	bHidden=false
	Mesh=VertMesh'XGame_rc.FlagMesh'
	DrawScale=1.2000000
	CollisionHeight=80.0000000
	bNetNotify=true
}
