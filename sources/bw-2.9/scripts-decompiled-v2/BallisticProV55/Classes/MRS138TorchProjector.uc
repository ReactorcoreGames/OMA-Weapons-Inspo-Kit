class MRS138TorchProjector extends DynamicProjector;

var MRS138TorchGlow Glow;

simulated function PostBeginPlay()
{
	// End:0x0F
	if(bProjectActor)
	{
		SetCollision(true, false, false);
	}
	Glow = Spawn(Class'BallisticProV55.MRS138TorchGlow');
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local Vector StartTrace, EndTrace, HitLocation, HitNormal;
	local Actor SurfaceActor;
	local float BeamLength;

	super.Tick(DeltaTime);
	StartTrace = Location;
	EndTrace = StartTrace + (float(MaxTraceDistance) * Vector(Rotation));
	SurfaceActor = Trace(HitLocation, HitNormal, EndTrace, StartTrace, true);
	BeamLength = VSize(StartTrace - HitLocation);
	// End:0x112
	if(SurfaceActor != none)
	{
		Glow.LightBrightness = Glow.default.LightBrightness * (float(1) - (BeamLength / float(MaxTraceDistance)));
		Glow.LightRadius = Glow.default.LightRadius + (float(23) * (BeamLength / float(MaxTraceDistance)));
		Glow.SetLocation(HitLocation - (Vector(Rotation) * float(16)));
		Glow.SetRotation(Rotator(HitLocation - StartTrace));		
	}
	else
	{
		Glow.LightRadius = Glow.default.LightRadius;
		Glow.LightBrightness = 24.0000000;
		Glow.SetLocation(StartTrace + (Vector(Rotation) * float(84)));
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Glow != none)
	{
		Glow.Destroy();
	}
	//return;	
}

defaultproperties
{
	MaterialBlendingOp=1
	FrameBufferBlendingOp=3
	ProjTexture=Texture'BW_Core_WeaponTex.Light.MRS138LightMark'
	FOV=25
	MaxTraceDistance=3072
	bClipBSP=true
	bClipStaticMesh=true
	bGradient=true
	bProjectOnAlpha=true
	bProjectOnParallelBSP=true
	bNoProjectOnOwner=true
	DrawType=0
	CullDistance=3072.0000000
	bHidden=false
	bDetailAttachment=true
	DrawScale=0.0200000
	bGameRelevant=true
}
