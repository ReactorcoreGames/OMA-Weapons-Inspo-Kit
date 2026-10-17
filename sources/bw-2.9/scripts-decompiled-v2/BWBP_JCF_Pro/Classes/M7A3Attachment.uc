class M7A3Attachment extends BallisticAttachment;

var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var Rotator LaserRot;
var BallisticWeapon myWeap;
var Vector SpawnOffset;
var Pawn TazerHit;
var Pawn OldTazerHit;
var M7A3TazerEffect TazerEffect;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TazerHit;
}

simulated function PostNetReceive()
{
	// End:0x80
	if(TazerHit != OldTazerHit)
	{
		OldTazerHit = TazerHit;
		// End:0x33
		if(TazerHit != none)
		{
			GotTarget(TazerHit);			
		}
		else
		{
			TazerEffect.Kill();
			TazerEffect = none;
			// End:0x80
			if(M7A3AssaultRifle(Instigator.Weapon) != none)
			{
				M7A3AssaultRifle(Instigator.Weapon).TazerEffect = none;
			}
		}
	}
	super.PostNetReceive();
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
	if(TazerEffect == none)
	{
		TazerEffect = Spawn(Class'BWBP_JCF_Pro.M7A3TazerEffect', self,,, rot(0, 0, 0));
		// End:0xA3
		if(M7A3AssaultRifle(Instigator.Weapon) != none)
		{
			M7A3AssaultRifle(Instigator.Weapon).TazerEffect = TazerEffect;
		}
		TazerEffect.SetTarget(A);
		TazerEffect.Instigator = Instigator;
		TazerEffect.UpdateTargets();		
	}
	else
	{
		TazerEffect.SetTarget(A);
	}
	//return;	
}

simulated function TazeEnd()
{
	// End:0x3B
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		TazerHit = none;
	}
	// End:0xAD
	if(TazerEffect != none)
	{
		TazerEffect.KillFlashes();
		TazerEffect.SetTimer(0.0000000, false);
		TazerEffect.Kill();
		// End:0xAD
		if(M7A3AssaultRifle(Instigator.Weapon) != none)
		{
			M7A3AssaultRifle(Instigator.Weapon).TazerEffect = none;
		}
	}
	//return;	
}

simulated function Tick(float dt)
{
	super.Tick(dt);
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x63
	if((TazerEffect != none) && !Instigator.IsFirstPerson())
	{
		TazerEffect.SetLocation(GetBoneCoords('tip2').Origin);
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x3B
	if(TazerEffect != none)
	{
		TazerEffect.KillFlashes();
		TazerEffect.SetTimer(0.0000000, false);
		TazerEffect.Kill();
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_JCF_Pro.M7A3AssaultRifle'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=2.0000000
	BrassClass=Class'BWBP_JCF_Pro.Brass_M7A3AR'
	BrassMode=2
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerMix=-3
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.6600000
	CockAnimRate=0.6950000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_JCF_Anims.M7A3_TPm'
	DrawScale=0.3500000
}
