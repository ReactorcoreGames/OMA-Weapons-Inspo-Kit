class AssaultAttachment extends xWeaponAttachment;

var byte OldSpawnHitCount;
var Class<xEmitter> mMuzFlashClass;
var xEmitter mMuzFlash3rd;
var xEmitter mMuzFlash3rdAlt;
var bool bDualGun;
var AssaultAttachment TwinGun;
var float AimAlpha;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		TwinGun, bDualGun;
}

simulated function Hide(bool NewbHidden)
{
	bHidden = NewbHidden;
	// End:0x2E
	if(TwinGun != none)
	{
		TwinGun.bHidden = bHidden;
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x54
	if(bDualGun)
	{
		// End:0x54
		if(Instigator != none)
		{
			Instigator.SetBoneDirection(AttachmentBone, Rotation,, 0.0000000, 0);
			Instigator.SetBoneDirection('lfarm', Rotation,, 0.0000000, 0);
		}
	}
	// End:0x6B
	if(mMuzFlash3rd != none)
	{
		mMuzFlash3rd.Destroy();
	}
	// End:0x82
	if(mMuzFlash3rdAlt != none)
	{
		mMuzFlash3rdAlt.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x4D
	if(!bDualGun && TwinGun != none)
	{
		TwinGun.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local Rotator newRot;

	// End:0x2F
	if(!bDualGun || int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Disable('Tick');
		return;
	}
	AimAlpha = AimAlpha * (float(1) - (float(2) * DeltaTime));
	// End:0xF2
	if(Instigator != none)
	{
		newRot = Instigator.Rotation;
		// End:0xA1
		if(AimAlpha < 0.5000000)
		{
			newRot.Yaw += int(float(4500) * (float(1) - (float(2) * AimAlpha)));
		}
		Instigator.SetBoneDirection('lfarm', newRot,, 1.0000000, 1);
		newRot.Roll += 32768;
		Instigator.SetBoneDirection(AttachmentBone, newRot,, 1.0000000, 1);
	}
	//return;	
}

function UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal)
{
	SpawnHitCount++;
	mHitLocation = HitLocation;
	mHitActor = HitActor;
	mHitNormal = HitNormal;
	//return;	
}

simulated function MakeMuzzleFlash()
{
	local Rotator R;

	AimAlpha = 1.0000000;
	// End:0x2A
	if(TwinGun != none)
	{
		TwinGun.AimAlpha = 1.0000000;
	}
	// End:0x53
	if(mMuzFlash3rd == none)
	{
		mMuzFlash3rd = Spawn(mMuzFlashClass);
		AttachToBone(mMuzFlash3rd, 'tip');
	}
	mMuzFlash3rd.mStartParticles++;
	R.Roll = Rand(65536);
	SetBoneRotation('Bone_Flash', R, 0, 1.0000000);
	//return;	
}

simulated event ThirdPersonEffects()
{
	local Rotator R;
	local PlayerController PC;

	// End:0x1CA
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		AimAlpha = 1.0000000;
		// End:0x43
		if(TwinGun != none)
		{
			TwinGun.AimAlpha = 1.0000000;
		}
		// End:0x147
		if(int(FiringMode) == 0)
		{
			WeaponLight();
			// End:0x117
			if(int(OldSpawnHitCount) != int(SpawnHitCount))
			{
				OldSpawnHitCount = SpawnHitCount;
				GetHitInfo();
				PC = Level.GetLocalPlayerController();
				// End:0x117
				if(((Instigator != none) && Instigator.Controller == PC) || VSize(PC.ViewTarget.Location - mHitLocation) < float(4000))
				{
					Spawn(Class'XWeapons.HitEffect'.static.GetHitEffect(mHitActor, mHitLocation, mHitNormal),,, mHitLocation, Rotator(mHitNormal));
					CheckForSplash();
				}
			}
			MakeMuzzleFlash();
			// End:0x144
			if(!bDualGun && TwinGun != none)
			{
				TwinGun.MakeMuzzleFlash();
			}			
		}
		else
		{
			// End:0x1CA
			if((int(FiringMode) == 1) && int(FlashCount) > 0)
			{
				WeaponLight();
				// End:0x192
				if(mMuzFlash3rdAlt == none)
				{
					mMuzFlash3rdAlt = Spawn(mMuzFlashClass);
					AttachToBone(mMuzFlash3rdAlt, 'tip2');
				}
				mMuzFlash3rdAlt.mStartParticles++;
				R.Roll = Rand(65536);
				SetBoneRotation('Bone_Flash02', R, 0, 1.0000000);
			}
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	mMuzFlashClass=Class'XEffects.AssaultMuzFlash3rd'
	bRapidFire=true
	SplashEffect=Class'XGame.BulletSplash'
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=255.0000000
	LightRadius=4.0000000
	LightPeriod=3
	Mesh=SkeletalMesh'NewWeapons2004.NewAssaultRifle_3rd'
	RelativeLocation=(X=-20.0000000,Y=-5.0000000,Z=0.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.3000000
}
