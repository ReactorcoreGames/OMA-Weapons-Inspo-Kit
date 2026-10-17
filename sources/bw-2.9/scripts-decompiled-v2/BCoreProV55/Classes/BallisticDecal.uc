class BallisticDecal extends Projector
	abstract;

var(Decal) array<Texture> DecalTextures;
var(Decal) bool bRandomRotate;
var(Decal) float StayTime;
var(Decal) float ZoomDist;
var(Decal) float DrawScaleVariance;
var(Decal) bool bDynamicDecal;
var(Decal) bool bOwnerOnly;
var(Decal) bool bWaitForInit;
var name PaintBone;
var Vector PaintDir;
var Rotator PaintAngle;
var bool bPaintToBone;
var Actor PaintedActor;
var(DecalEx) float MaxDrawScale;
var(DecalEx) float MinDrawScale;
var(DecalEx) float ExpandTime;
var(DecalEx) bool bAbandonOnFinish;
var(DecalEx) bool bExpandingDecal;
var float ExpandTimePassed;
var float InitialDrawScale;

simulated event PreBeginPlay()
{
	// End:0x38
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || Level.DecalStayScale == 0.0000000)
	{
		Destroy();
		return;
	}
	// End:0x87
	if(DecalTextures.Length < 1)
	{
		// End:0x84
		if(ProjTexture == none)
		{
			Log(("BallisticDecal:" $ string(self)) $ " no ProjTexture", 'Warning');
			Destroy();
			return;
		}		
	}
	else
	{
		ProjTexture = DecalTextures[Rand(DecalTextures.Length)];
	}
	super(Actor).PreBeginPlay();
	//return;	
}

simulated event PostBeginPlay()
{
	local Rotator Rot;

	// End:0x0B
	if(bWaitForInit)
	{
		return;
	}
	// End:0x36
	if(bRandomRotate)
	{
		Rot.Roll = Rand(65536);
		SetRotation(Rotation + Rot);
	}
	// End:0x5B
	if(ZoomDist != float(0))
	{
		SetLocation(Location + (Vector(Rotation) * ZoomDist));
	}
	// End:0x83
	if(DrawScaleVariance != float(0))
	{
		SetDrawScale(DrawScale * (float(1) + (DrawScaleVariance * FRand())));
	}
	// End:0xA9
	if(bExpandingDecal)
	{
		InitialDrawScale = DrawScale;
		SetDrawScale(DrawScale * MinDrawScale);
	}
	super.PostBeginPlay();
	// End:0xC5
	if(bDynamicDecal || bExpandingDecal)
	{
		return;
	}
	AbandonProjector(StayTime * Level.DecalStayScale);
	Destroy();
	//return;	
}

simulated function InitDecal()
{
	bWaitForInit = false;
	PostBeginPlay();
	//return;	
}

event Tick(float dt)
{
	local Rotator BoneRot, TRot;
	local Vector BoneLoc, X, Y, Z;

	super(Actor).Tick(dt);
	// End:0x16
	if(bWaitForInit)
	{
		return;
	}
	// End:0x30
	if(!bDynamicDecal && !bExpandingDecal)
	{
		return;
	}
	DetachProjector();
	// End:0x9B
	if(bExpandingDecal)
	{
		// End:0x61
		if(ExpandTimePassed > ExpandTime)
		{
			bExpandingDecal = false;
			LifeSpan = StayTime;
		}
		SetDrawScale(InitialDrawScale * (MinDrawScale + ((MaxDrawScale - MinDrawScale) * (ExpandTimePassed / ExpandTime))));
		ExpandTimePassed += dt;
	}
	// End:0x1B8
	if(bPaintToBone)
	{
		// End:0xB4
		if(PaintedActor == none)
		{
			Destroy();
			return;
		}
		BoneLoc = PaintedActor.GetBoneCoords(PaintBone).Origin;
		BoneRot = PaintedActor.GetBoneRotation(PaintBone);
		TRot = PaintAngle;
		GetAxes(TRot, X, Y, Z);
		X = X >> BoneRot;
		Y = Y >> BoneRot;
		Z = Z >> BoneRot;
		TRot = OrthoRotation(X, Y, Z);
		SetRotation(TRot);
		// End:0x1A1
		if(ZoomDist != float(0))
		{
			SetLocation(((Vector(Rotation) * ZoomDist) + BoneLoc) + (PaintDir >> BoneRot));			
		}
		else
		{
			SetLocation(BoneLoc + (PaintDir >> BoneRot));
		}
	}
	AttachProjector();
	//return;	
}

function StopExpanding()
{
	bExpandingDecal = false;
	LifeSpan = StayTime;
	//return;	
}

function InitPaintedDecal(Vector loc, Rotator Rot, name HitBone, Actor Other)
{
	local Rotator BoneRot, TRot;
	local Vector X, Y, Z;

	bPaintToBone = true;
	BoneRot = Other.GetBoneRotation(HitBone);
	PaintDir = (loc - Other.GetBoneCoords(HitBone).Origin) << BoneRot;
	TRot = Rot;
	GetAxes(TRot, X, Y, Z);
	X = X << BoneRot;
	Y = Y << BoneRot;
	Z = Z << BoneRot;
	TRot = OrthoRotation(X, Y, Z);
	PaintAngle = TRot;
	PaintBone = HitBone;
	PaintedActor = Other;
	//return;	
}

simulated event Touch(Actor Other)
{
	// End:0x0D
	if(!bDynamicDecal)
	{
		return;
	}
	// End:0x25
	if(!bOwnerOnly)
	{
		super.Touch(Other);
		return;
	}
	// End:0x32
	if(Owner == none)
	{
		return;
	}
	// End:0x60
	if((Other == Owner) && Other.bAcceptsProjectors)
	{
		AttachActor(Other);
	}
	//return;	
}

defaultproperties
{
	bProjectOnAlpha=true
	GradientTexture=Texture'Engine.GRADIENT_Clip'
}
