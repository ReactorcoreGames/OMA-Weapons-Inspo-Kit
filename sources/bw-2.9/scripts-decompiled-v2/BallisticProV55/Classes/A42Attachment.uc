class A42Attachment extends HandgunAttachment;

var Actor GlowFX;

simulated event PostBeginPlay()
{
	super(BallisticAttachment).PostBeginPlay();
	// End:0x7D
	if(((int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GlowFX == none) || GlowFX.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BallisticProV55.A42AmbientFX', DrawScale, self, 'tip');
	}
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function SpawnTracer(byte Mode, Vector V)
{
	local TraceEmitter_A42Beam Tracer;
	local float dist;

	// End:0x1B
	if(int(Level.DetailMode) < int(1))
	{
		return;
	}
	// End:0x6F
	if(((int(TracerMode) == int(3)) || (int(TracerMode) == int(1)) && int(Mode) == 0) || (int(TracerMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x7C
	if(TracerClass == none)
	{
		return;
	}
	// End:0x99
	if((TracerChance < float(1)) && FRand() > TracerChance)
	{
		return;
	}
	// End:0xDE
	if(VSize(V) < float(2))
	{
		V = (Instigator.Location + Instigator.EyePosition()) + (V * float(5000));
	}
	dist = VSize(V - (GetModeTipLocation(Mode)));
	// End:0x149
	if(dist > float(25))
	{
		Tracer = Spawn(Class'BallisticProV55.TraceEmitter_A42Beam', self,, GetModeTipLocation(Mode), Rotator(V - (GetModeTipLocation(Mode))));
		Tracer.Initialize(dist);
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.A42SkrithPistol'
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_A42Projectile'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	BrassMode=3
	TracerMode=1
	InstantMode=1
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_A42Beam'
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.A42_TPm'
	DrawScale=0.0800000
}
