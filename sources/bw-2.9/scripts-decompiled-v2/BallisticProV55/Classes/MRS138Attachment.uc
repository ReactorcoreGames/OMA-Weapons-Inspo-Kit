class MRS138Attachment extends BallisticShotgunAttachment;

var bool bLightsOn;
var bool bLightsOnOld;
var bool bTazerOn;
var bool bTazerOnOld;
var Projector FlashLightProj;
var Emitter FlashLightEmitter;
var Emitter TazerEffect;
var byte TazerHitCount;
var Vector TazerHitLocation;
var Pawn TazerHit;
var Pawn OldTazerHit;
var MRS138TazerLineEffect TazerLineEffect;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TazerHit, bLightsOn, 
		bTazerOn;

	// Pos:0x00D
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		TazerHitCount, TazerHitLocation;
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	SwitchFlashLight();
	// End:0x3B
	if(NewbHidden)
	{
		KillProjector();
		// End:0x38
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}		
	}
	else
	{
		// End:0x4A
		if(bLightsOn)
		{
			SwitchFlashLight();
		}
	}
	//return;	
}

simulated event PostNetReceive()
{
	super(BallisticAttachment).PostNetReceive();
	// End:0x2A
	if(int(TazerHitCount) != int(default.TazerHitCount))
	{
		default.TazerHitCount = TazerHitCount;
		TazerHitEffects();
	}
	// End:0xAA
	if(TazerHit != OldTazerHit)
	{
		OldTazerHit = TazerHit;
		// End:0x5D
		if(TazerHit != none)
		{
			GotTarget(TazerHit);			
		}
		else
		{
			TazerLineEffect.Kill();
			TazerLineEffect = none;
			// End:0xAA
			if(MRS138Shotgun(Instigator.Weapon) != none)
			{
				MRS138Shotgun(Instigator.Weapon).TazerLineEffect = none;
			}
		}
	}
	//return;	
}

simulated function GotTarget(Pawn A)
{
	// End:0x3F
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		TazerHit = A;
	}
	// End:0xDD
	if(TazerLineEffect == none)
	{
		TazerLineEffect = Spawn(Class'BallisticProV55.MRS138TazerLineEffect', self,,, rot(0, 0, 0));
		// End:0xA3
		if(MRS138Shotgun(Instigator.Weapon) != none)
		{
			MRS138Shotgun(Instigator.Weapon).TazerLineEffect = TazerLineEffect;
		}
		TazerLineEffect.SetTarget(A);
		TazerLineEffect.Instigator = Instigator;
		TazerLineEffect.UpdateTargets();		
	}
	else
	{
		TazerLineEffect.SetTarget(A);
	}
	//return;	
}

simulated function PlayerTazeEnd()
{
	// End:0x3B
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		TazerHit = none;
	}
	// End:0xBD
	if(TazerLineEffect != none)
	{
		TazerLineEffect.SetTarget(none);
		TazerLineEffect.KillFlashes();
		TazerLineEffect.SetTimer(0.0000000, false);
		TazerLineEffect.Kill();
		// End:0xBD
		if(MRS138Shotgun(Instigator.Weapon) != none)
		{
			MRS138Shotgun(Instigator.Weapon).TazerLineEffect = none;
		}
	}
	//return;	
}

function TazerHitActor(Vector HitLocation)
{
	TazerHitLocation = HitLocation;
	TazerHitCount++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	// End:0x4A
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		TazerHitEffects();
	}
	//return;	
}

simulated function TazerHitEffects()
{
	Class'BallisticProV55.IM_MRS138TazerHit'.static.StartSpawn(TazerHitLocation, Normal((TazerHitLocation - Instigator.Location) + Instigator.EyePosition()), 0, Instigator);
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'tip2');
	FlashLightProj.SetRelativeLocation(vect(-32.0000000, 0.0000000, 0.0000000));
	//return;	
}

simulated function KillProjector()
{
	// End:0x1E
	if(FlashLightProj != none)
	{
		FlashLightProj.Destroy();
		FlashLightProj = none;
	}
	//return;	
}

simulated function SwitchFlashLight()
{
	// End:0x91
	if(bLightsOn)
	{
		// End:0x74
		if(FlashLightEmitter == none)
		{
			FlashLightEmitter = Spawn(Class'BallisticProV55.MRS138TorchEffect', self,, Location);
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(FlashLightEmitter, DrawScale);
			AttachToBone(FlashLightEmitter, 'tip2');
			FlashLightEmitter.bHidden = false;
			FlashLightEmitter.bCorona = true;
		}
		// End:0x8E
		if(!Instigator.IsFirstPerson())
		{
			StartProjector();
		}		
	}
	else
	{
		FlashLightEmitter.Destroy();
		KillProjector();
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(BallisticAttachment).Tick(dt);
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x4A
	if(bLightsOn != bLightsOnOld)
	{
		SwitchFlashLight();
		bLightsOnOld = bLightsOn;
	}
	// End:0x6E
	if(bTazerOn != bTazerOnOld)
	{
		SwitchTazer();
		bTazerOnOld = bTazerOn;
	}
	// End:0xAB
	if((TazerLineEffect != none) && !Instigator.IsFirstPerson())
	{
		TazerLineEffect.SetLocation(GetBoneCoords('tip2').Origin);
	}
	// End:0xB8
	if(!bLightsOn)
	{
		return;
	}
	// End:0x103
	if(Instigator.IsFirstPerson())
	{
		KillProjector();
		// End:0x100
		if((FlashLightEmitter != none) && FlashLightEmitter.bCorona)
		{
			FlashLightEmitter.bCorona = false;
		}		
	}
	else
	{
		// End:0x114
		if(FlashLightProj == none)
		{
			StartProjector();
		}
		// End:0x146
		if((FlashLightEmitter != none) && !FlashLightEmitter.bCorona)
		{
			FlashLightEmitter.bCorona = true;
		}
	}
	//return;	
}

simulated function SwitchTazer()
{
	// End:0x12
	if(bTazerOn)
	{
		StartTazer();		
	}
	else
	{
		KillTazer();
	}
	//return;	
}

simulated function StartTazer()
{
	// End:0x20
	if(TazerEffect == none)
	{
		TazerEffect = Spawn(Class'BallisticProV55.MRS138TazerEffect', self,, Location);
	}
	Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(TazerEffect, DrawScale);
	AttachToBone(TazerEffect, 'tip2');
	TazerEffect.bHidden = false;
	//return;	
}

simulated function KillTazer()
{
	// End:0x1A
	if(TazerEffect != none)
	{
		TazerEffect.Kill();
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	KillTazer();
	// End:0x5E
	if(TazerLineEffect != none)
	{
		TazerLineEffect.KillFlashes();
		TazerLineEffect.SetTimer(0.0000000, false);
		TazerLineEffect.Kill();
	}
	super(BallisticAttachment).Destroyed();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.MRS138Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MeleeImpactManager=Class'BallisticProV55.IM_MRS138TazerHit'
	BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	TracerChance=0.5000000
	CockAnimRate=1.6000000
	SingleFireAnim="RifleHip_FireCock"
	SingleAimedFireAnim="RifleAimed_FireCock"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.MRS138_TPm'
	DrawScale=0.0900000
}
