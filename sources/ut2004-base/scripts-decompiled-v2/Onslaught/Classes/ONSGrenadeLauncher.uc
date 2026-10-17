class ONSGrenadeLauncher extends Weapon
	config(User);

var array<ONSGrenadeProjectile> Grenades;
var int CurrentGrenades;
var int MaxGrenades;
var Color FadedColor;
var int DrawWeaponInfoVersion;

replication
{
	// Pos:0x000
	reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
		CurrentGrenades;
}

simulated function DrawWeaponInfo(Canvas Canvas)
{
	NewDrawWeaponInfo(Canvas, 0.7050000 * Canvas.ClipY);
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas Canvas, float YPos)
{
	local int i, Half;
	local float ScaleFactor;

	// End:0x1B
	if((DrawWeaponInfoVersion > 0) && DrawWeaponInfoVersion != 2)
	{
		return;
	}
	DrawWeaponInfoVersion = 2;
	ScaleFactor = (99.0000000 * Canvas.ClipX) / float(3200);
	Half = (MaxGrenades + 1) / 2;
	Canvas.Style = 5;
	Canvas.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	i = 0;
	J0x8E:

	// End:0x135 [Loop If]
	if(i < Half)
	{
		// End:0xC0
		if(i >= CurrentGrenades)
		{
			Canvas.DrawColor = FadedColor;
		}
		Canvas.SetPos(Canvas.ClipX - ((float(i + 1) * ScaleFactor) * 1.2500000), YPos);
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 324.0000000, 325.0000000, 54.0000000, 54.0000000);
		i++;
		// [Loop Continue]
		goto J0x8E;
	}
	i = Half;
	J0x140:

	// End:0x1F5 [Loop If]
	if(i < MaxGrenades)
	{
		// End:0x172
		if(i >= CurrentGrenades)
		{
			Canvas.DrawColor = FadedColor;
		}
		Canvas.SetPos(Canvas.ClipX - ((float((i - Half) + 1) * ScaleFactor) * 1.2500000), YPos - ScaleFactor);
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 324.0000000, 325.0000000, 54.0000000, 54.0000000);
		i++;
		// [Loop Continue]
		goto J0x140;
	}
	//return;	
}

simulated function DrawWeaponInfo3(Canvas Canvas, float XPos, float YPos)
{
	local int i, Half;
	local float ScaleFactor;

	// End:0x1B
	if((DrawWeaponInfoVersion > 0) && DrawWeaponInfoVersion != 3)
	{
		return;
	}
	DrawWeaponInfoVersion = 3;
	ScaleFactor = 99.0000000 * FMin(Canvas.ClipX / 3200.0000000, Canvas.ClipY / 2400.0000000);
	Half = (MaxGrenades + 1) / 2;
	Canvas.Style = 5;
	Canvas.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	i = 0;
	J0xA3:

	// End:0x148 [Loop If]
	if(i < Half)
	{
		// End:0xD5
		if(i >= CurrentGrenades)
		{
			Canvas.DrawColor = FadedColor;
		}
		Canvas.SetPos(XPos - ((float(i + 1) * ScaleFactor) * 1.2500000), YPos - ScaleFactor);
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 324.0000000, 325.0000000, 54.0000000, 54.0000000);
		i++;
		// [Loop Continue]
		goto J0xA3;
	}
	i = Half;
	J0x153:

	// End:0x205 [Loop If]
	if(i < MaxGrenades)
	{
		// End:0x185
		if(i >= CurrentGrenades)
		{
			Canvas.DrawColor = FadedColor;
		}
		Canvas.SetPos(XPos - ((float((i - Half) + 1) * ScaleFactor) * 1.2500000), YPos - (float(2) * ScaleFactor));
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 324.0000000, 325.0000000, 54.0000000, 54.0000000);
		i++;
		// [Loop Continue]
		goto J0x153;
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x0D
	if(CurrentGrenades > 0)
	{
		return true;
	}
	return super.HasAmmo();
	//return;	
}

simulated function bool CanThrow()
{
	// End:0x0F
	if((AmmoAmount(0)) <= 0)
	{
		return false;
	}
	return super.CanThrow();
	//return;	
}

simulated function OutOfAmmo()
{
	//return;	
}

singular simulated function ClientStopFire(int Mode)
{
	// End:0x1E
	if((Mode == 1) && !HasAmmo())
	{
		DoAutoSwitch();
	}
	super.ClientStopFire(Mode);
	//return;	
}

simulated function Destroyed()
{
	local int X;

	// End:0x80
	if(int(Role) == int(ROLE_Authority))
	{
		X = 0;
		J0x17:

		// End:0x78 [Loop If]
		if(X < Grenades.Length)
		{
			// End:0x6E
			if(Grenades[X] != none)
			{
				Grenades[X].Explode(Grenades[X].Location, vect(0.0000000, 0.0000000, 1.0000000));
			}
			X++;
			// [Loop Continue]
			goto J0x17;
		}
		Grenades.Length = 0;
	}
	super.Destroyed();
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
		if((B.Target != none) && VSize(B.Target.Location - B.Pawn.Location) > float(1000))
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
	// End:0x138
	if((float(-1) * enemyDir.Z) > enemyDist)
	{
		return AIRating + 0.1000000;
	}
	// End:0x188
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		return AIRating + 0.3000000;
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
	local int X;

	// End:0x46
	if((CurrentGrenades >= MaxGrenades) || ((AmmoAmount(0)) <= 0) && FireMode[0].NextFireTime <= Level.TimeSeconds)
	{
		return 1;
	}
	X = 0;
	J0x4D:

	// End:0x9C [Loop If]
	if(X < Grenades.Length)
	{
		// End:0x92
		if((Grenades[X] != none) && Pawn(Grenades[X].Base) != none)
		{
			return 1;
		}
		X++;
		// [Loop Continue]
		goto J0x4D;
	}
	return 0;
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

defaultproperties
{
	MaxGrenades=8
	FadedColor=(R=128,G=128,B=128,A=128)
	FireModeClass[0]=Class'Onslaught.ONSGrenadeFire'
	FireModeClass[1]=Class'Onslaught.ONSGrenadeAltFire'
	PutDownAnim="PutDown"
	SelectAnimRate=3.1000000
	PutDownAnimRate=2.8000000
	SelectSound=Sound'WeaponSounds.FlakCannon.SwitchToFlakCannon'
	SelectForce="SwitchToFlakCannon"
	AIRating=0.5500000
	CurrentRating=0.5500000
	Description="The MGG Grenade Launcher fires magnetic sticky grenades, which will attach to enemy players and vehicles."
	EffectOffset=(X=100.0000000,Y=32.0000000,Z=-20.0000000)
	DisplayFOV=45.0000000
	Priority=10
	HudColor=(R=0,G=0,B=255,A=255)
	SmallViewOffset=(X=166.0000000,Y=48.0000000,Z=-54.0000000)
	CustomCrosshair=15
	CustomCrossHairTextureName="ONSInterface-TX.grenadeLauncherReticle"
	InventoryGroup=7
	GroupOffset=1
	PickupClass=Class'Onslaught.ONSGrenadePickup'
	PlayerViewOffset=(X=150.0000000,Y=40.0000000,Z=-46.0000000)
	BobDamping=2.2000000
	AttachmentClass=Class'Onslaught.ONSGrenadeAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=434,Y1=253,X2=506,Y2=292)
	ItemName="Grenade Launcher"
	Mesh=SkeletalMesh'ONSWeapons-A.GrenadeLauncher_1st'
	AmbientGlow=64
}
