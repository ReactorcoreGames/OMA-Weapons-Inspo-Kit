class BioRifle extends Weapon
	config(User);

function DropFrom(Vector StartLocation)
{
	// End:0x20
	if(bCanThrow && (AmmoAmount(0)) == 0)
	{
		AddAmmo(1, 0);
	}
	super.DropFrom(StartLocation);
	//return;	
}

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
	// End:0x9E
	if(B.Enemy == none)
	{
		// End:0x98
		if((B.Target != none) && VSize(B.Target.Location - B.Pawn.Location) > float(3500))
		{
			return 0.2000000;
		}
		return AIRating;
	}
	enemyDir = B.Enemy.Location - Instigator.Location;
	enemyDist = VSize(enemyDir);
	// End:0xEF
	if(enemyDist > float(1500))
	{
		return 0.1000000;
	}
	// End:0x10E
	if(B.IsRetreating())
	{
		return AIRating + 0.4000000;
	}
	// End:0x15E
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		return AIRating + 0.3500000;
	}
	// End:0x188
	if((float(-1) * enemyDir.Z) > enemyDist)
	{
		return AIRating + 0.1000000;
	}
	// End:0x19F
	if(enemyDist > float(1000))
	{
		return 0.3500000;
	}
	return AIRating;
	//return;	
}

function byte BestMode()
{
	// End:0x0F
	if(FRand() < 0.8000000)
	{
		return 0;
	}
	return 1;
	//return;	
}

function float SuggestAttackStyle()
{
	local Bot B;
	local float enemyDist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return 0.4000000;
	}
	enemyDist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x86
	if(enemyDist > float(1500))
	{
		return 1.0000000;
	}
	// End:0x9D
	if(enemyDist > float(1000))
	{
		return 0.4000000;
	}
	return -0.4000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return 0.0000000;
	}
	// End:0x7B
	if(VSize(B.Enemy.Location - Instigator.Location) < float(1600))
	{
		return -0.6000000;
	}
	return 0.0000000;
	//return;	
}

simulated function AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x3A
	if(Anim == 'AltFire')
	{
		LoopAnim('HOLD', 1.0000000, 0.1000000);		
	}
	else
	{
		super.AnimEnd(Channel);
	}
	//return;	
}

simulated function bool HasAmmo()
{
	return ((AmmoAmount(0)) >= 1) || FireMode[1].bIsFiring;
	//return;	
}

defaultproperties
{
	FireModeClass[0]=Class'XWeapons.BioFire'
	FireModeClass[1]=Class'XWeapons.BioChargedFire'
	PutDownAnim="PutDown"
	SelectSound=Sound'WeaponSounds.FlakCannon.SwitchToFlakCannon'
	SelectForce="SwitchToFlakCannon"
	AIRating=0.5500000
	CurrentRating=0.5500000
	Description="The GES BioRifle continues to be one of the most controversial weapons in the Tournament. Loved by some, loathed by others, the BioRifle has long been the subject of debate over its usefulness.||Some Tournament purists argue that it is the equivalent of a cowardly minefield. Others argue that it enhances the tactical capabilities of defensive combatants.|Despite the debate, the weapon provides rapid-fire wide-area coverage in primary firing mode, and a single-fire variable payload secondary firing mode. In layman's terms, this equates to being able to pepper an area with small globs of Biosludge, or launch one large glob at the target."
	EffectOffset=(X=100.0000000,Y=32.0000000,Z=-20.0000000)
	DisplayFOV=60.0000000
	Priority=4
	HudColor=(R=0,G=0,B=255,A=255)
	SmallViewOffset=(X=19.0000000,Y=9.0000000,Z=-6.0000000)
	CenteredOffsetY=-8.0000000
	CustomCrosshair=7
	CustomCrossHairColor=(R=0,G=0,B=255,A=255)
	CustomCrossHairScale=1.3330000
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Triad1"
	InventoryGroup=3
	PickupClass=Class'XWeapons.BioRiflePickup'
	PlayerViewOffset=(X=7.0000000,Y=3.0000000,Z=0.0000000)
	BobDamping=2.2000000
	AttachmentClass=Class'XWeapons.BioAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=179,Y1=127,X2=241,Y2=175)
	ItemName="Bio-Rifle"
	Mesh=SkeletalMesh'Weapons.BioRifle_1st'
}
