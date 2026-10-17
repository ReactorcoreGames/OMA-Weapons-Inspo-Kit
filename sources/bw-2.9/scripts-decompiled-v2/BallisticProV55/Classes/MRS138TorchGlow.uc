class MRS138TorchGlow extends Light;

function PostBeginPlay()
{
	SetTimer(1.0000000, true);
	//return;	
}

function Timer()
{
	MakeNoise(0.3000000);
	//return;	
}

defaultproperties
{
	LightBrightness=96.0000000
	LightRadius=1.0000000
	LightPeriod=0
	bStatic=false
	bHidden=false
	bNoDelete=false
	bDynamicLight=true
	RemoteRole=0
	Texture=none
	bGameRelevant=true
	bMovable=true
	CollisionRadius=5.0000000
	CollisionHeight=5.0000000
	bDirectional=true
}
