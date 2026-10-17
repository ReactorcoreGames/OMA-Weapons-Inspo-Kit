class LS14Attachment extends BallisticAttachment;

var byte CurrentTracerMode;
var Class<BCTraceEmitter> TracerClasses[5];
var Vector SpawnOffset;
var byte LasPower;
var bool bDouble;
var bool bTopBarrel;
var bool bBigLaser;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		LasPower, bDouble;
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x59
	if(LS14Carbine(i) != none)
	{
		// End:0x3A
		if(LS14Carbine(i).bGatling)
		{
			CurrentTracerMode = 3;
		}
		// End:0x59
		if(LS14Carbine(i).bHighPower)
		{
			CurrentTracerMode = 2;
		}
	}
	//return;	
}

simulated function SpawnTracer(byte Mode, Vector V)
{
	local BCTraceEmitter Tracer;
	local TraceEmitter_LS14C TE_Top, TE_Bottom;
	local float dist;

	// End:0x45
	if(VSize(V) < float(2))
	{
		V = (Instigator.Location + Instigator.EyePosition()) + (V * float(10000));
	}
	dist = VSize(V - (GetModeTipLocation()));
	// End:0xE6
	if(bDouble)
	{
		TE_Top = Spawn(Class'BWBP_SKC_Pro.TraceEmitter_LS14C', self,, GetModeTipLocation(), Rotator(V - (GetModeTipLocation())));
		TE_Bottom = Spawn(Class'BWBP_SKC_Pro.TraceEmitter_LS14C', self,, GetModeTipLocationStyleTwo(), Rotator(V - (GetModeTipLocationStyleTwo())));
		TE_Top.Initialize(dist, float(LasPower));
		TE_Bottom.Initialize(dist, float(LasPower));		
	}
	else
	{
		// End:0x12E
		if(bTopBarrel || int(CurrentTracerMode) != 0)
		{
			Tracer = Spawn(TracerClasses[int(CurrentTracerMode)], self,, GetModeTipLocation(), Rotator(V - (GetModeTipLocation())));			
		}
		else
		{
			TE_Bottom = Spawn(Class'BWBP_SKC_Pro.TraceEmitter_LS14C', self,, GetModeTipLocationStyleTwo(), Rotator(V - (GetModeTipLocationStyleTwo())));
			TE_Bottom.Initialize(dist, float(LasPower));
		}
	}
	bTopBarrel = !bTopBarrel;
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z, loc;

	// End:0xBF
	if(Instigator.IsFirstPerson())
	{
		// End:0x9E
		if(LS14Carbine(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			loc = ((Instigator.Location + Instigator.EyePosition()) + (X * float(20))) + (Z * float(-10));			
		}
		else
		{
			loc = Instigator.Weapon.GetEffectStart();
		}		
	}
	else
	{
		loc = GetBoneCoords('tip').Origin;
	}
	return loc;
	//return;	
}

simulated function Vector GetModeTipLocationStyleTwo()
{
	local Vector X, Y, Z, loc;

	// End:0xEE
	if(Instigator.IsFirstPerson())
	{
		// End:0x9E
		if(LS14Carbine(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			loc = ((Instigator.Location + Instigator.EyePosition()) + (X * float(20))) + (Z * float(-20));			
		}
		else
		{
			loc = Instigator.Weapon.GetBoneCoords('tip2').Origin + Class'BCoreProV55.BUtil'.static.AlignedOffset(Instigator.GetViewRotation(), SpawnOffset);
		}		
	}
	else
	{
		loc = GetBoneCoords('tip2').Origin;
	}
	return loc;
	//return;	
}

simulated function EjectBrass(byte Mode)
{
	//return;	
}

defaultproperties
{
	TracerClasses[0]=Class'BWBP_SKC_Pro.TraceEmitter_LS14C'
	TracerClasses[1]=Class'BWBP_SKC_Pro.TraceEmitter_LS14B'
	TracerClasses[2]=Class'BWBP_SKC_Pro.TraceEmitter_LS14H'
	TracerClasses[3]=Class'BWBP_SKC_Pro.TraceEmitter_LS14Auto'
	WeaponClass=Class'BWBP_SKC_Pro.LS14Carbine'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXLaserFlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	ImpactManager=Class'BWBP_SKC_Pro.IM_LS14Impacted'
	AltFlashBone="tip3"
	BrassClass=Class'BallisticProV55.Brass_Railgun'
	FlashMode=2
	LightMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_LS14C'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-FlyBy',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FlyByBulletSpeed=-1.0000000
	ReloadAnimRate=0.9200000
	CockAnimRate=0.9000000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.LS14_TPm'
	RelativeLocation=(X=-3.0000000,Y=0.0000000,Z=2.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.2000000
}
