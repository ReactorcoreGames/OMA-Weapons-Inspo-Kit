class uTeamBanner extends Decoration;

var GameReplicationInfo GRI;
var int Team;

simulated function UpdateForTeam()
{
	// End:0x89
	if(((GRI != none) && Team < 2) && GRI.TeamSymbols[Team] != none)
	{
		TexScaler(Combiner(Shader(FinalBlend(Skins[0]).Material).Diffuse).Material2).Material = GRI.TeamSymbols[Team];
	}
	//return;	
}

simulated function SetGRI(GameReplicationInfo NewGRI)
{
	GRI = NewGRI;
	UpdateForTeam();
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	// End:0x37
	if(Level.Game != none)
	{
		SetGRI(Level.Game.GameReplicationInfo);
	}
	//return;	
}

defaultproperties
{
	bStatic=false
	bNoDelete=true
	RemoteRole=0
	Mesh=VertMesh'XGame_rc.banner'
}
