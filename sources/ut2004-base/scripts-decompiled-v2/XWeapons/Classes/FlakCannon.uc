class FlakCannon extends Weapon
	config(User);

function float GetAIRating()
{
	local Bot B;
	local float enemyDist;
	local Vector enemyDir;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x96
	if(((B.Target != none) && Pawn(B.Target) == none) && VSize(B.Target.Location - Instigator.Location) < float(1250))
	{
		return 0.9000000;
	}
	// End:0x10A
	if(B.Enemy == none)
	{
		// End:0x104
		if((B.Target != none) && VSize(B.Target.Location - B.Pawn.Location) > float(3500))
		{
			return 0.2000000;
		}
		return AIRating;
	}
	enemyDir = B.Enemy.Location - Instigator.Location;
	enemyDist = VSize(enemyDir);
	// End:0x1B5
	if(enemyDist > float(750))
	{
		// End:0x18A
		if(enemyDist > float(2000))
		{
			// End:0x17D
			if(enemyDist > float(3500))
			{
				return 0.2000000;
			}
			return AIRating - 0.3000000;
		}
		// End:0x1B2
		if(enemyDir.Z < (-0.5000000 * enemyDist))
		{
			return AIRating - 0.3000000;
		}		
	}
	else
	{
		// End:0x208
		if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
		{
			return AIRating + 0.3500000;			
		}
		else
		{
			// End:0x226
			if(enemyDist < float(400))
			{
				return AIRating + 0.2000000;
			}
		}
	}
	return FMax((AIRating + 0.2000000) - ((enemyDist - float(400)) * 0.0008000), 0.2000000);
	//return;	
}

function byte BestMode()
{
	local Vector enemyDir;
	local float enemyDist;
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	enemyDir = B.Enemy.Location - Instigator.Location;
	enemyDist = VSize(enemyDir);
	// End:0xAC
	if(enemyDist > float(750))
	{
		// End:0xA6
		if(enemyDir.Z < (-0.5000000 * enemyDist))
		{
			return 1;
		}
		return 0;		
	}
	else
	{
		// End:0xF5
		if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
		{
			return 0;			
		}
		else
		{
			// End:0x121
			if((enemyDist < float(400)) || enemyDir.Z > float(30))
			{
				return 0;				
			}
			else
			{
				// End:0x130
				if(FRand() < 0.6500000)
				{
					return 1;
				}
			}
		}
	}
	return 0;
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x46
	if((AIController(Instigator.Controller) != none) && AIController(Instigator.Controller).Skill < float(3))
	{
		return 0.4000000;
	}
	return 0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.4000000;
	//return;	
}

defaultproperties
{
	FireModeClass[0]=Class'XWeapons.FlakFire'
	FireModeClass[1]=Class'XWeapons.FlakAltFire'
	SelectAnim="Pickup"
	PutDownAnim="PutDown"
	SelectSound=Sound'WeaponSounds.FlakCannon.SwitchToFlakCannon'
	SelectForce="SwitchToFlakCannon"
	AIRating=0.7500000
	CurrentRating=0.7500000
	Description="Trident Defensive Technologies Series 7 Flechette Cannon has been taken to the next step in evolution with the production of the Mk3 \"Negotiator\". The ionized flechettes are capable of delivering second and third-degree burns to organic tissue, cauterizing the wound instantly.||Payload delivery is achieved via one of two methods: ionized flechettes launched in a spread pattern directly from the barrel; or via fragmentation grenades that explode on impact, radiating flechettes in all directions."
	EffectOffset=(X=200.0000000,Y=32.0000000,Z=-25.0000000)
	DisplayFOV=60.0000000
	Priority=13
	HudColor=(R=255,G=128,B=0,A=255)
	SmallViewOffset=(X=5.0000000,Y=14.0000000,Z=-6.0000000)
	CenteredOffsetY=-4.0000000
	CenteredRoll=3000
	CenteredYaw=-500
	CustomCrosshair=9
	CustomCrossHairColor=(R=255,G=128,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Triad3"
	InventoryGroup=7
	PickupClass=Class'XWeapons.FlakCannonPickup'
	PlayerViewOffset=(X=-7.0000000,Y=8.0000000,Z=0.0000000)
	PlayerViewPivot=(Pitch=0,Yaw=16884,Roll=200)
	BobDamping=1.4000000
	AttachmentClass=Class'XWeapons.FlakAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=169,Y1=172,X2=245,Y2=208)
	ItemName="Flak Cannon"
	LightType=1
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=255.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'Weapons.Flak_1st'
	HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}
