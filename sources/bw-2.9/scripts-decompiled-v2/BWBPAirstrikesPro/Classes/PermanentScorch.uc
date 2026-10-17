class PermanentScorch extends Projector
	abstract;

var() float Lifetime;
var() float PushBack;
var() bool RandomOrient;

event PreBeginPlay()
{
	local PlayerController PC;

	// End:0x35
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || Level.DecalStayScale == 0.0000000)
	{
		return;
	}
	PC = Level.GetLocalPlayerController();
	// End:0x68
	if(PC.BeyondViewDistance(Location, CullDistance))
	{
		return;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

function PostBeginPlay()
{
	local Vector RX, RY, RZ;
	local Rotator R;

	// End:0x17
	if(PhysicsVolume.bNoDecals)
	{
		Destroy();
		return;
	}
	// End:0xBC
	if(RandomOrient)
	{
		R.Yaw = 0;
		R.Pitch = 0;
		R.Roll = Rand(65535);
		GetAxes(R, RX, RY, RZ);
		RX = RX >> Rotation;
		RY = RY >> Rotation;
		RZ = RZ >> Rotation;
		R = OrthoRotation(RX, RY, RZ);
		SetRotation(R);
	}
	SetLocation(Location - (Vector(Rotation) * PushBack));
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	PushBack=24.0000000
	RandomOrient=true
	FOV=1
	MaxTraceDistance=70000
	bProjectActor=false
	bClipBSP=true
	FadeInTime=0.1250000
	bStatic=false
	LifeSpan=30.0000000
	bGameRelevant=true
}
