class ShockRifle extends Weapon
	config(User);

var ShockProjectile ComboTarget;
var bool bRegisterTarget;
var bool bWaitForCombo;
var Vector ComboStart;
var Color EffectColor;

simulated function PostBeginPlay()
{
	ConstantColor'UT2004Weapons.Shaders.ShockControl'.Color = EffectColor;
	super.PostBeginPlay();
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local float A;

	A = 128.0000000 * (1.0000000 - FMax(0.0000000, FMax((FireMode[0].NextFireTime - Level.TimeSeconds) / FireMode[0].FireRate, (FireMode[1].NextFireTime - Level.TimeSeconds) / FireMode[1].FireRate)));
	ConstantColor'UT2004Weapons.Shaders.ShockControl'.Color.A = byte(A);
	super.RenderOverlays(Canvas);
	//return;	
}

simulated function Vector GetEffectStart()
{
	local Coords C;

	// End:0x50
	if(Instigator.IsFirstPerson())
	{
		// End:0x22
		if(WeaponCentered())
		{
			return CenteredEffectStart();
		}
		C = GetBoneCoords('tip');
		return C.Origin - (float(15) * C.XAxis);
	}
	return super.GetEffectStart();
	//return;	
}

simulated function bool WeaponCentered()
{
	return bSpectated || hand > float(1);
	//return;	
}

function float GetAIRating()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x9E
	if(B.Enemy == none)
	{
		// End:0x98
		if((B.Target != none) && VSize(B.Target.Location - B.Pawn.Location) > float(8000))
		{
			return 0.9000000;
		}
		return AIRating;
	}
	// End:0xAD
	if(bWaitForCombo)
	{
		return 1.5000000;
	}
	// End:0xC7
	if(!B.ProficientWithWeapon())
	{
		return AIRating;
	}
	// End:0x141
	if(B.Stopped())
	{
		// End:0x131
		if(!B.EnemyVisible() && VSize(B.Enemy.Location - Instigator.Location) < float(5000))
		{
			return AIRating + 0.5000000;
		}
		return AIRating + 0.3000000;		
	}
	else
	{
		// End:0x186
		if(VSize(B.Enemy.Location - Instigator.Location) > float(1600))
		{
			return AIRating + 0.1000000;			
		}
		else
		{
			// End:0x1CD
			if(B.Enemy.Location.Z > (B.Location.Z + float(200)))
			{
				return AIRating + 0.1500000;
			}
		}
	}
	return AIRating;
	//return;	
}

function SetComboTarget(ShockProjectile S)
{
	// End:0x47
	if((!bRegisterTarget || Bot(Instigator.Controller) == none) || Instigator.Controller.Enemy == none)
	{
		return;
	}
	bRegisterTarget = false;
	ComboStart = Instigator.Location;
	ComboTarget = S;
	ComboTarget.Monitor(Bot(Instigator.Controller).Enemy);
	//return;	
}

function float RangedAttackTime()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return 0.0000000;
	}
	// End:0x58
	if(B.CanComboMoving())
	{
		return 0.0000000;
	}
	return FMin(2.0000000, 0.3000000 + (VSize(B.Enemy.Location - Instigator.Location) / Class'XWeapons.ShockProjectile'.default.Speed));
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.4000000;
	//return;	
}

simulated function bool StartFire(int Mode)
{
	// End:0x50
	if(bWaitForCombo && Bot(Instigator.Controller) != none)
	{
		// End:0x4E
		if((ComboTarget == none) || ComboTarget.bDeleteMe)
		{
			bWaitForCombo = false;			
		}
		else
		{
			return false;
		}
	}
	return super.StartFire(Mode);
	//return;	
}

function DoCombo()
{
	// End:0x39
	if(bWaitForCombo)
	{
		bWaitForCombo = false;
		// End:0x39
		if((Instigator != none) && Instigator.Weapon == self)
		{
			StartFire(0);
		}
	}
	//return;	
}

function byte BestMode()
{
	local float enemyDist, MaxDist;
	local Bot B;

	bWaitForCombo = false;
	B = Bot(Instigator.Controller);
	// End:0x45
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x5A
	if(B.IsShootingObjective())
	{
		return 0;
	}
	// End:0xE9
	if(!B.EnemyVisible())
	{
		// End:0xAE
		if(((ComboTarget != none) && !ComboTarget.bDeleteMe) && B.CanCombo())
		{
			bWaitForCombo = true;
			return 0;
		}
		ComboTarget = none;
		// End:0xE6
		if(B.CanCombo() && B.ProficientWithWeapon())
		{
			bRegisterTarget = true;
			return 1;
		}
		return 0;
	}
	enemyDist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x14D
	if(B.Skill > float(5))
	{
		MaxDist = 4.0000000 * Class'XWeapons.ShockProjectile'.default.Speed;		
	}
	else
	{
		MaxDist = 3.0000000 * Class'XWeapons.ShockProjectile'.default.Speed;
	}
	// End:0x191
	if((enemyDist > MaxDist) || enemyDist < float(150))
	{
		ComboTarget = none;
		return 0;
	}
	// End:0x1D1
	if(((ComboTarget != none) && !ComboTarget.bDeleteMe) && B.CanCombo())
	{
		bWaitForCombo = true;
		return 0;
	}
	ComboTarget = none;
	// End:0x1FA
	if((enemyDist > float(2500)) && FRand() < 0.5000000)
	{
		return 0;
	}
	// End:0x22B
	if(B.CanCombo() && B.ProficientWithWeapon())
	{
		bRegisterTarget = true;
		return 1;
	}
	// End:0x23A
	if(FRand() < 0.7000000)
	{
		return 0;
	}
	return 1;
	//return;	
}

defaultproperties
{
	EffectColor=(R=192,G=0,B=255,A=128)
	FireModeClass[0]=Class'XWeapons.ShockBeamFire'
	FireModeClass[1]=Class'XWeapons.ShockProjFire'
	SelectAnim="Pickup"
	PutDownAnim="PutDown"
	SelectSound=Sound'WeaponSounds.ShockRifle.SwitchToShockRifle'
	SelectForce="SwitchToShockRifle"
	AIRating=0.6300000
	CurrentRating=0.6300000
	OldMesh=SkeletalMesh'Weapons.ShockRifle_1st'
	OldPickup="WeaponStaticMesh.ShockRiflePickup"
	OldCenteredOffsetY=-8.0000000
	OldPlayerViewOffset=(X=-15.0000000,Y=0.0000000,Z=-5.0000000)
	OldSmallViewOffset=(X=-8.0000000,Y=4.0000000,Z=-8.0000000)
	OldPlayerViewPivot=(Pitch=1000,Yaw=-800,Roll=-500)
	OldCenteredYaw=-500
	Description="The ASMD Shock Rifle has changed little since its incorporation into the Tournaments. The ASMD sports two firing modes capable of acting in concert to neutralize opponents in a devastating shockwave.||This combination attack is achieved when the weapon operator utilizes the secondary fire mode to deliver a charge of seeded plasma to the target.|Once the slow-moving plasma charge is within range of the target, the weapon operator may fire the photon beam into the plasma core, releasing the explosive energy of the anti-photons contained within the plasma's EM field."
	EffectOffset=(X=65.0000000,Y=14.0000000,Z=-10.0000000)
	DisplayFOV=70.0000000
	Priority=6
	HudColor=(R=128,G=0,B=255,A=255)
	SmallViewOffset=(X=11.0000000,Y=11.5000000,Z=-4.0000000)
	CenteredOffsetY=1.0000000
	CenteredRoll=1000
	CenteredYaw=-1000
	CustomCrosshair=1
	CustomCrossHairColor=(R=255,G=0,B=255,A=255)
	CustomCrossHairScale=1.3330000
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Cross2"
	InventoryGroup=4
	PickupClass=Class'XWeapons.ShockRiflePickup'
	PlayerViewOffset=(X=4.0000000,Y=8.0000000,Z=-2.0000000)
	PlayerViewPivot=(Pitch=-1000,Yaw=0,Roll=0)
	BobDamping=1.8000000
	AttachmentClass=Class'XWeapons.ShockAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=250,Y1=110,X2=330,Y2=145)
	ItemName="Shock Rifle"
	LightType=1
	LightEffect=13
	LightHue=200
	LightSaturation=70
	LightBrightness=255.0000000
	LightRadius=4.0000000
	LightPeriod=3
	Mesh=SkeletalMesh'NewWeapons2004.ShockRifle'
	DrawScale=0.7000000
	HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}
