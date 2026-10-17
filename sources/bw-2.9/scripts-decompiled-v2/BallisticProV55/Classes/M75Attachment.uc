class M75Attachment extends RailgunAttachment;

var M75Pack Pack;
var byte RailPower;
var Vector SpawnOffset;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		RailPower;
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x40
	if(Pack != none)
	{
		Pack.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	// End:0x2D
	if(Pack != none)
	{
		Pack.bHidden = NewbHidden;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(BallisticAttachment).PostNetBeginPlay();
	Pack = Spawn(Class'BallisticProV55.M75Pack');
	// End:0x38
	if(Instigator != none)
	{
		Instigator.AttachToBone(Pack, 'spine');
	}
	Pack.SetBoneScale(0, 0.0001000, 'Bone03');
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Pack != none)
	{
		Pack.Destroy();
	}
	super(BallisticAttachment).Destroyed();
	//return;	
}

simulated function SpawnTracer(byte Mode, Vector V)
{
	local M75Spiral Spiral;
	local TraceEmitter_Railgun TER;
	local float dist;

	// End:0x45
	if(VSize(V) < float(2))
	{
		V = (Instigator.Location + Instigator.EyePosition()) + (V * float(10000));
	}
	dist = VSize(V - (GetModeTipLocation()));
	Spiral = Spawn(Class'BallisticProV55.M75Spiral', self,, GetModeTipLocation(), Rotator(V - (GetModeTipLocation())));
	Spiral.InitSpiral(dist, RailPower);
	TER = Spawn(Class'BallisticProV55.TraceEmitter_Railgun', self,, GetModeTipLocation(), Rotator(V - (GetModeTipLocation())));
	TER.Initialize(dist, float(RailPower));
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z;

	// End:0xE1
	if(Instigator.IsFirstPerson())
	{
		// End:0x99
		if(M75Railgun(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			return ((Instigator.Location + Instigator.EyePosition()) + (X * float(20))) + (Z * float(-10));			
		}
		else
		{
			return Instigator.Weapon.GetBoneCoords('tip').Origin + Class'BCoreProV55.BUtil'.static.AlignedOffset(Instigator.GetViewRotation(), SpawnOffset);
		}
	}
	return GetBoneCoords('tip').Origin;
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=-120.0000000,Y=-5.0000000,Z=13.0000000)
	WeaponClass=Class'BallisticProV55.M75Railgun'
	MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_RailBullet'
	FlashScale=0.6000000
	BrassClass=Class'BallisticProV55.Brass_Railgun'
	BrassMode=2
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Railgun'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=Sound'BW_Core_WeaponSound.FlyBys.RailFlyBy',Volume=1.2000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FlyByBulletSpeed=-1.0000000
	ReloadAnimRate=0.7500000
	CockAnimRate=0.7100000
	AmbientSound=Sound'BW_Core_WeaponSound.M75.M75Hum'
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M75_TPm'
	DrawScale=0.1300000
	SoundVolume=48
	SoundRadius=128.0000000
}
