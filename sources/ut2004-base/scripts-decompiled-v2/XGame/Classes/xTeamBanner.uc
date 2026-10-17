class xTeamBanner extends Decoration;

var() byte Team;
var GameReplicationInfo GRI;

simulated function PostBeginPlay()
{
	LoopAnim('AnimFlag');
	SetAnimFrame(FRand());
	super(Actor).PostBeginPlay();
	//return;	
}

simulated function UpdateForTeam()
{
	// End:0x1D
	if(int(Team) == 0)
	{
		Skins[0] = Shader'XGameShaders.RedBannerShader';		
	}
	else
	{
		// End:0x3C
		if(int(Team) > 1)
		{
			Skins[0] = default.Skins[0];			
		}
		else
		{
			Skins[0] = Shader'XGameShaders.BlueBannerShader';
		}
	}
	// End:0xCA
	if(((GRI != none) && int(Team) < 2) && GRI.TeamSymbols[int(Team)] != none)
	{
		TexScaler(Combiner(Shader(Skins[0]).Diffuse).Material2).Material = GRI.TeamSymbols[int(Team)];
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

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
	local DominationPoint DPoint;

	DPoint = DominationPoint(Other);
	// End:0x80
	if(DPoint != none)
	{
		// End:0x3A
		if(!DPoint.bControllable)
		{
			Team = 254;			
		}
		else
		{
			// End:0x5B
			if(DPoint.ControllingTeam == none)
			{
				Team = byte(255);				
			}
			else
			{
				Team = byte(DPoint.ControllingTeam.TeamIndex);
			}
		}
		UpdateForTeam();
	}
	//return;	
}

defaultproperties
{
	bStatic=false
	bNoDelete=true
	bStasis=false
	RemoteRole=0
	Mesh=VertMesh'XGame_rc.TeamBannerMesh'
	Tag="'"
	DrawScale=1.7000000
	Skins[0]=Shader'XGameShaders.TeamBannerShader'
	bUnlit=true
	CollisionRadius=48.0000000
	CollisionHeight=90.0000000
	bCollideActors=true
	bCollideWorld=true
	bNetNotify=true
}
