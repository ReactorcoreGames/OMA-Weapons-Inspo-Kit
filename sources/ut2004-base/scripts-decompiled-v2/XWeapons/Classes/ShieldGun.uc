class ShieldGun extends Weapon
	config(User)
	hidedropdown;

var Sound ShieldHitSound;
var string ShieldHitForce;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientTakeHit;
}

simulated function DoAutoSwitch()
{
	//return;	
}

simulated function Vector CenteredEffectStart()
{
	local Vector X, Y, Z;

	GetViewAxes(X, Y, Z);
	return ((Instigator.Location + Instigator.CalcDrawOffset(self)) + (EffectOffset.X * X)) + (EffectOffset.Z * Z);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local int M;

	// End:0x68
	if((hand < -1.0000000) || hand > 1.0000000)
	{
		M = 0;
		J0x27:

		// End:0x68 [Loop If]
		if(M < 2)
		{
			// End:0x5E
			if(FireMode[M] != none)
			{
				FireMode[M].DrawMuzzleFlash(Canvas);
			}
			M++;
			// [Loop Continue]
			goto J0x27;
		}
	}
	super.RenderOverlays(Canvas);
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	super.GiveTo(Other, Pickup);
	// End:0x48
	if(Bot(Other.Controller) != none)
	{
		Bot(Other.Controller).bHasImpactHammer = true;
	}
	//return;	
}

function bool CanAttack(Actor Other)
{
	return true;
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0xCA
	if(!AmmoMaxed(1))
	{
		J0x17:

		// End:0xCA [Loop If]
		if((FireMode[1].NextTimerPop < Level.TimeSeconds) && FireMode[1].TimerInterval > 0.0000000)
		{
			FireMode[1].Timer();
			// End:0xB1
			if(FireMode[1].bTimerLoop)
			{
				FireMode[1].NextTimerPop = FireMode[1].NextTimerPop + FireMode[1].TimerInterval;				
			}
			else
			{
				FireMode[1].TimerInterval = 0.0000000;
			}
			// [Loop Continue]
			goto J0x17;
		}
	}
	//return;	
}

simulated function Timer()
{
	local Bot B;

	// End:0x74
	if(int(ClientState) == int(2))
	{
		B = Bot(Instigator.Controller);
		// End:0x74
		if(((B != none) && B.bPreparingMove) && B.ImpactTarget != none)
		{
			B.ImpactJump();
			B = none;
		}
	}
	super.Timer();
	// End:0xA2
	if((B != none) && B.Enemy != none)
	{
		BotFire(false);
	}
	//return;	
}

function FireHack(byte Mode)
{
	// End:0x47
	if(int(Mode) == 0)
	{
		FireMode[0].PlayFiring();
		FireMode[0].FlashMuzzleFlash();
		FireMode[0].StartMuzzleSmoke();
		IncrementFlashCount(0);
	}
	//return;	
}

function byte BestMode()
{
	local float enemyDist;
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 1;
	}
	// End:0x66
	if(B.bShieldSelf && B.ShouldKeepShielding())
	{
		return 1;
	}
	enemyDist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0xB6
	if(enemyDist > (float(4) * Instigator.GroundSpeed))
	{
		return 1;
	}
	// End:0x10E
	if((B.MoveTarget != B.Enemy) && B.IsRetreating() || enemyDist > (float(2) * Instigator.GroundSpeed))
	{
		return 1;
	}
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float enemyDist;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x56
	if(B.bShieldSelf && B.ShouldKeepShielding())
	{
		return 9.0000000;
	}
	// End:0x84
	if(B.bPreparingMove && B.ImpactTarget != none)
	{
		return 9.0000000;
	}
	// End:0xD0
	if(B.PlayerReplicationInfo.HasFlag != none)
	{
		// End:0xC3
		if(Instigator.Health < 50)
		{
			return AIRating + 0.3500000;
		}
		return AIRating + 0.2500000;
	}
	// End:0xEA
	if(B.Enemy == none)
	{
		return AIRating;
	}
	enemyDist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x141
	if(B.Stopped() && enemyDist > float(100))
	{
		return 0.1000000;
	}
	// End:0x1CE
	if((((enemyDist < float(750)) && B.Skill <= float(2)) && !B.Enemy.IsA('Bot')) && ShieldGun(B.Enemy.Weapon) != none)
	{
		return FClamp(300.0000000 / (enemyDist + float(1)), 0.6000000, 0.7500000);
	}
	// End:0x1E5
	if(enemyDist > float(400))
	{
		return 0.1000000;
	}
	// End:0x20F
	if((Instigator.Weapon != self) && enemyDist < float(120))
	{
		return 0.2500000;
	}
	return FMin(0.6000000, 90.0000000 / (enemyDist + float(1)));
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local int Drain;
	local Vector Reflect, HitNormal;
	local float DamageMax;

	DamageMax = 100.0000000;
	// End:0x28
	if(DamageType == Class'Engine.fell')
	{
		DamageMax = 20.0000000;		
	}
	else
	{
		// End:0x76
		if((!DamageType.default.bArmorStops || !DamageType.default.bLocationalHit) || (DamageType == Class'XWeapons.DamTypeShieldImpact') && instigatedBy == Instigator)
		{
			return;
		}
	}
	// End:0x186
	if(CheckReflect(HitLocation, HitNormal, 0))
	{
		Drain = Min((AmmoAmount(1)) * 2, Damage);
		Drain = Min(Drain, int(DamageMax));
		Reflect = MirrorVectorByNormal(Normal(Location - HitLocation), Vector(Instigator.Rotation));
		Damage -= Drain;
		Momentum *= 1.2500000;
		// End:0x165
		if(((Instigator != none) && Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.HasFlag != none)
		{
			Drain = Min(AmmoAmount(1), Drain);
			ConsumeAmmo(1, float(Drain));
			DoReflectEffect(Drain);			
		}
		else
		{
			ConsumeAmmo(1, float(Drain / 2));
			DoReflectEffect(Drain / 2);
		}
	}
	//return;	
}

function DoReflectEffect(int Drain)
{
	PlaySound(ShieldHitSound, 0);
	ShieldAltFire(FireMode[1]).TakeHit(Drain);
	ClientTakeHit(Drain);
	//return;	
}

simulated function ClientTakeHit(int Drain)
{
	ClientPlayForceFeedback(ShieldHitForce);
	ShieldAltFire(FireMode[1]).TakeHit(Drain);
	//return;	
}

simulated function float AmmoStatus(optional int Mode)
{
	// End:0xD1
	if((Instigator == none) || Instigator.Weapon != self)
	{
		// End:0xD1
		if((FireMode[1].TimerInterval != 0.0000000) && FireMode[1].NextTimerPop < Level.TimeSeconds)
		{
			FireMode[1].Timer();
			// End:0xBB
			if(FireMode[1].bTimerLoop)
			{
				FireMode[1].NextTimerPop = FireMode[1].NextTimerPop + FireMode[1].TimerInterval;				
			}
			else
			{
				FireMode[1].TimerInterval = 0.0000000;
			}
		}
	}
	return super.AmmoStatus(Mode);
	//return;	
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
	local Vector HitDir, FaceDir;

	// End:0x3D
	if(((Instigator.Controller == none) || !FireMode[1].bIsFiring) || (AmmoAmount(0)) == 0)
	{
		return false;
	}
	FaceDir = Vector(Instigator.Controller.Rotation);
	HitDir = Normal((Instigator.Location - HitLocation) + vect(0.0000000, 0.0000000, 8.0000000));
	RefNormal = FaceDir;
	// End:0xC4
	if((FaceDir Dot HitDir) < -0.3700000)
	{
		// End:0xC2
		if(AmmoDrain > 0)
		{
			ConsumeAmmo(0, float(AmmoDrain));
		}
		return true;
	}
	return false;
	//return;	
}

function AnimEnd(int Channel)
{
	// End:0x1F
	if(FireMode[0].bIsFiring)
	{
		LoopAnim('Charged');		
	}
	else
	{
		// End:0x40
		if(!FireMode[1].bIsFiring)
		{
			super.AnimEnd(Channel);
		}
	}
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.8000000;
	//return;	
}

simulated function float ChargeBar()
{
	return FMin(1.0000000, FireMode[0].HoldTime / ShieldFire(FireMode[0]).FullyChargedTime);
	//return;	
}

defaultproperties
{
	ShieldHitSound=ProceduralSound'WeaponSounds.ShieldGun.ShieldReflection'
	ShieldHitForce="ShieldReflection"
	FireModeClass[0]=Class'XWeapons.ShieldFire'
	FireModeClass[1]=Class'XWeapons.ShieldAltFire'
	PutDownAnim="PutDown"
	SelectSound=Sound'WeaponSounds.Misc.shieldgun_change'
	SelectForce="ShieldGun_change"
	AIRating=0.3500000
	CurrentRating=0.3500000
	bMeleeWeapon=true
	bShowChargingBar=true
	bCanThrow=false
	Description="The Kemphler DD280 Riot Control Device has the ability to resist and reflect incoming projectiles and energy beams. The plasma wave inflicts massive damage, rupturing tissue, pulverizing organs, and flooding the bloodstream with dangerous gas bubbles.||This weapon may be intended for combat at close range, but when wielded properly should be considered as dangerous as any other armament in your arsenal."
	EffectOffset=(X=15.0000000,Y=5.5000000,Z=2.0000000)
	DisplayFOV=60.0000000
	Priority=2
	HudColor=(R=255,G=188,B=121,A=255)
	SmallViewOffset=(X=10.0000000,Y=3.3000000,Z=-6.7000000)
	CenteredOffsetY=-9.0000000
	CenteredRoll=1000
	CustomCrosshair=6
	CustomCrossHairColor=(R=255,G=188,B=121,A=255)
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Pointer"
	PickupClass=Class'XWeapons.ShieldGunPickup'
	PlayerViewOffset=(X=2.0000000,Y=-0.7000000,Z=-2.7000000)
	PlayerViewPivot=(Pitch=500,Yaw=500,Roll=0)
	BobDamping=2.2000000
	AttachmentClass=Class'XWeapons.ShieldAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=169,Y1=39,X2=241,Y2=77)
	ItemName="Shield Gun"
	Mesh=SkeletalMesh'Weapons.ShieldGun_1st'
	DrawScale=0.4000000
	HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}
