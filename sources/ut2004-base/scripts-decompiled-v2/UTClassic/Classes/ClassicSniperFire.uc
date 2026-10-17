class ClassicSniperFire extends InstantFire;

var() float HeadShotDamageMult;
var() Class<DamageType> DamageTypeHeadShot;
var name FireAnims[3];

function InitEffects()
{
	super(WeaponFire).InitEffects();
	// End:0x2A
	if(FlashEmitter != none)
	{
		Weapon.AttachToBone(FlashEmitter, 'Dummy01');
	}
	//return;	
}

function FlashMuzzleFlash()
{
	local Rotator R;

	R.Yaw = 16384;
	Weapon.SetBoneRotation('Dummy01', R, 0, 1.0000000);
	super(WeaponFire).FlashMuzzleFlash();
	//return;	
}

function DoTrace(Vector Start, Rotator Dir)
{
	local Vector X, Y, Z, End, HitLocation, HitNormal,
		arcEnd;

	local Actor Other;
	local SniperWallHitEffect S;
	local Pawn HeadShotPawn;

	Weapon.GetViewAxes(X, Y, Z);
	// End:0x86
	if(Weapon.WeaponCentered())
	{
		arcEnd = (Instigator.Location + (Weapon.EffectOffset.X * X)) + ((1.5000000 * Weapon.EffectOffset.Z) * Z);		
	}
	else
	{
		arcEnd = (((Instigator.Location + Instigator.CalcDrawOffset(Weapon)) + (Weapon.EffectOffset.X * X)) + ((Weapon.hand * Weapon.EffectOffset.Y) * Y)) + (Weapon.EffectOffset.Z * Z);
	}
	X = Vector(Dir);
	End = Start + (TraceRange * X);
	Other = Weapon.Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x1BF
	if((int(Level.NetMode) != int(NM_Standalone)) || PlayerController(Instigator.Controller) == none)
	{
		Weapon.Spawn(Class'UTClassic.TracerProjectile', Instigator.Controller,, Start, Dir);
	}
	// End:0x333
	if((Other != none) && Other != Instigator)
	{
		// End:0x317
		if(!Other.bWorldGeometry)
		{
			// End:0x228
			if(Vehicle(Other) != none)
			{
				HeadShotPawn = Vehicle(Other).CheckForHeadShot(HitLocation, X, 1.0000000);
			}
			// End:0x270
			if(HeadShotPawn != none)
			{
				HeadShotPawn.TakeDamage(int(float(DamageMax) * HeadShotDamageMult), Instigator, HitLocation, Momentum * X, DamageTypeHeadShot);				
			}
			else
			{
				// End:0x2E5
				if((Pawn(Other) != none) && Pawn(Other).IsHeadShot(HitLocation, X, 1.0000000))
				{
					Other.TakeDamage(int(float(DamageMax) * HeadShotDamageMult), Instigator, HitLocation, Momentum * X, DamageTypeHeadShot);					
				}
				else
				{
					Other.TakeDamage(DamageMax, Instigator, HitLocation, Momentum * X, DamageType);
				}
			}			
		}
		else
		{
			HitLocation = HitLocation + (2.0000000 * HitNormal);
		}		
	}
	else
	{
		HitLocation = End;
		HitNormal = Normal(Start - End);
	}
	// End:0x3C8
	if((HitNormal != vect(0.0000000, 0.0000000, 0.0000000)) && HitScanBlockingVolume(Other) == none)
	{
		S = Weapon.Spawn(Class'UTClassic.SniperWallHitEffect',,, HitLocation, Rotator(float(-1) * HitNormal));
		// End:0x3C8
		if(S != none)
		{
			S.FireStart = Start;
		}
	}
	//return;	
}

function PlayFiring()
{
	Weapon.PlayAnim(FireAnims[Rand(3)], FireAnimRate, TweenTime);
	Weapon.PlayOwnedSound(FireSound, 3, TransientSoundVolume,,, default.FireAnimRate / FireAnimRate, false);
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	//return;	
}

defaultproperties
{
	HeadShotDamageMult=2.0000000
	DamageTypeHeadShot=Class'UTClassic.DamTypeClassicHeadshot'
	FireAnims[0]="Fire1"
	FireAnims[1]="Fire2"
	FireAnims[2]="fire3"
	DamageType=Class'UTClassic.DamTypeClassicSniper'
	DamageMin=60
	DamageMax=60
	TraceRange=17000.0000000
	FireAnimRate=1.5000000
	FireSound=Sound'NewWeaponSounds.NewSniperShot'
	FireForce="NewSniperShot"
	FireRate=1.3300000
	AmmoClass=Class'UTClassic.ClassicSniperAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=-4000.0000000,Y=0.0000000,Z=4000.0000000)
	ShakeOffsetTime=1.6000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
	FlashEmitterClass=Class'XEffects.AssaultMuzFlash1st'
	aimerror=850.0000000
}
