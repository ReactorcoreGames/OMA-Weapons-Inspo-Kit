class ONSMineLayer extends Weapon
	config(User);

const NUM_BARRELS = 4;
const BARREL_ROTATION_RATE = 2.0;

var() float ReloadDelay;
var float BarrelRotation;
var float FinalRotation;
var bool bRotateBarrel;
var array<Projectile> Mines;
var int CurrentMines;
var int MaxMines;
var Color FadedColor;
var int DrawWeaponInfoVersion;

replication
{
	// Pos:0x000
	reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
		CurrentMines;
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
	Half = (MaxMines + 1) / 2;
	Canvas.Style = 5;
	Canvas.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	i = 0;
	J0x8E:

	// End:0x135 [Loop If]
	if(i < Half)
	{
		// End:0xC0
		if(i >= CurrentMines)
		{
			Canvas.DrawColor = FadedColor;
		}
		Canvas.SetPos(Canvas.ClipX - ((float(i + 1) * ScaleFactor) * 1.2500000), YPos);
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 391.0000000, 383.0000000, 44.0000000, 49.0000000);
		i++;
		// [Loop Continue]
		goto J0x8E;
	}
	i = Half;
	J0x140:

	// End:0x1F5 [Loop If]
	if(i < MaxMines)
	{
		// End:0x172
		if(i >= CurrentMines)
		{
			Canvas.DrawColor = FadedColor;
		}
		Canvas.SetPos(Canvas.ClipX - ((float((i - Half) + 1) * ScaleFactor) * 1.2500000), YPos - ScaleFactor);
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 391.0000000, 383.0000000, 44.0000000, 49.0000000);
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
	Half = (MaxMines + 1) / 2;
	Canvas.Style = 5;
	Canvas.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	i = 0;
	J0xA3:

	// End:0x148 [Loop If]
	if(i < Half)
	{
		// End:0xD5
		if(i >= CurrentMines)
		{
			Canvas.DrawColor = FadedColor;
		}
		Canvas.SetPos(XPos - ((float(i + 1) * ScaleFactor) * 1.2500000), YPos - ScaleFactor);
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 391.0000000, 383.0000000, 44.0000000, 49.0000000);
		i++;
		// [Loop Continue]
		goto J0xA3;
	}
	i = Half;
	J0x153:

	// End:0x205 [Loop If]
	if(i < MaxMines)
	{
		// End:0x185
		if(i >= CurrentMines)
		{
			Canvas.DrawColor = FadedColor;
		}
		Canvas.SetPos(XPos - ((float((i - Half) + 1) * ScaleFactor) * 1.2500000), YPos - (float(2) * ScaleFactor));
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 391.0000000, 383.0000000, 44.0000000, 49.0000000);
		i++;
		// [Loop Continue]
		goto J0x153;
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x0D
	if(CurrentMines > 0)
	{
		return true;
	}
	return (FireMode[0] != none) && (AmmoAmount(0)) >= FireMode[0].AmmoPerFire;
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

simulated function Destroyed()
{
	local int X;

	// End:0x78
	if(int(Role) == int(ROLE_Authority))
	{
		X = 0;
		J0x17:

		// End:0x78 [Loop If]
		if(X < Mines.Length)
		{
			// End:0x6E
			if(Mines[X] != none)
			{
				Mines[X].Explode(Mines[X].Location, vect(0.0000000, 0.0000000, 1.0000000));
			}
			X++;
			// [Loop Continue]
			goto J0x17;
		}
	}
	super.Destroyed();
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float enemyDist;
	local Vector enemyDir;

	// End:0x13
	if((AmmoAmount(0)) <= 0)
	{
		return 0.0000000;
	}
	B = Bot(Instigator.Controller);
	// End:0x3D
	if(B == none)
	{
		return AIRating;
	}
	// End:0x178
	if(B.Enemy == none)
	{
		// End:0x172
		if((B.Formation() && B.Squad.SquadObjective != none) && B.Squad.SquadObjective.BotNearObjective(B))
		{
			// End:0x16C
			if(((DestroyableObjective(B.Squad.SquadObjective) != none) && B.Squad.SquadObjective.TeamLink(B.Squad.Team.TeamIndex)) && DestroyableObjective(B.Squad.SquadObjective).Health < DestroyableObjective(B.Squad.SquadObjective).DamageCapacity)
			{
				return 1.1000000;
			}
			return 1.5000000;
		}
		return AIRating;
	}
	enemyDir = B.Enemy.Location - Instigator.Location;
	enemyDist = VSize(enemyDir);
	// End:0x1C9
	if(enemyDist > float(1500))
	{
		return 0.1000000;
	}
	// End:0x1E8
	if(B.IsRetreating())
	{
		return AIRating + 0.4000000;
	}
	// End:0x212
	if((float(-1) * enemyDir.Z) > enemyDist)
	{
		return AIRating + 0.1000000;
	}
	// End:0x262
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		return AIRating + 0.3000000;
	}
	// End:0x279
	if(enemyDist > float(1000))
	{
		return 0.3500000;
	}
	return AIRating;
	//return;	
}

function byte BestMode()
{
	local AIController C;

	C = AIController(Instigator.Controller);
	// End:0x3D
	if((C == none) || C.Enemy == none)
	{
		return 0;
	}
	// End:0x91
	if(((CurrentMines < 2) || VSize(C.Enemy.Location - Instigator.Location) < float(2500)) || FRand() < 0.5000000)
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

function bool ShouldFireWithoutTarget()
{
	local ONSPowerCore OPC;

	// End:0xD3
	if(ShootTarget(Instigator.Controller.Target) != none)
	{
		OPC = ONSPowerCore(Instigator.Controller.Target.Owner);
		// End:0xD3
		if((OPC != none) && !OPC.Shield.bHidden)
		{
			Instigator.Controller.Target = OPC.PathList[Rand(OPC.PathList.Length)].End;
			return Instigator.Controller.Target != none;
		}
	}
	// End:0xE4
	if(CurrentMines < MaxMines)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function PlayFiring(bool plunge)
{
	GotoState('AnimateLoad', 'Begin');
	//return;	
}

simulated function RotateBarrel()
{
	FinalRotation -= (65535.0000000 / float(4));
	// End:0x39
	if(FinalRotation <= 0.0000000)
	{
		FinalRotation += 65535.0000000;
		BarrelRotation += 65535.0000000;
	}
	bRotateBarrel = true;
	//return;	
}

simulated function UpdateBarrel(float dt)
{
	local Rotator R;

	BarrelRotation -= (((dt * 65535.0000000) * 2.0000000) / float(4));
	// End:0x49
	if(BarrelRotation < FinalRotation)
	{
		BarrelRotation = FinalRotation;
		bRotateBarrel = false;
		GotoState('None');
	}
	R.Roll = int(BarrelRotation);
	SetBoneRotation('drum', R, 0, 1.0000000);
	//return;	
}

simulated state AnimateLoad
{
	simulated function Tick(float dt)
	{
		// End:0x14
		if(bRotateBarrel)
		{
			UpdateBarrel(dt);
		}
		//return;		
	}
Begin:

	Sleep(ReloadDelay);
	RotateBarrel();
	PlaySound(Sound'PickupSounds.FlakAmmoPickup', 1);
	ClientPlayForceFeedback("FlakAmmoPickup");
	stop;		
}

defaultproperties
{
	ReloadDelay=0.4000000
	MaxMines=8
	FadedColor=(R=128,G=128,B=128,A=160)
	FireModeClass[0]=Class'Onslaught.ONSMineThrowFire'
	FireModeClass[1]=Class'Onslaught.ONSMineLayerAltFire'
	PutDownAnim="PutDown"
	SelectAnimRate=2.0000000
	PutDownAnimRate=4.0000000
	PutDownTime=0.4000000
	BringUpTime=0.3500000
	SelectSound=Sound'WeaponSounds.FlakCannon.SwitchToFlakCannon'
	SelectForce="SwitchToFlakCannon"
	AIRating=0.5500000
	CurrentRating=0.5500000
	Description="The Spider Mine Layer is used for deploying spider mines, autonomous mobile mines that are highly effective against both foot soldiers and vehicles."
	EffectOffset=(X=100.0000000,Y=32.0000000,Z=-20.0000000)
	DisplayFOV=45.0000000
	Priority=5
	HudColor=(R=0,G=0,B=255,A=255)
	SmallViewOffset=(X=116.0000000,Y=43.5000000,Z=-40.5000000)
	CustomCrosshair=14
	CustomCrossHairTextureName="ONSInterface-TX.MineLayerReticle"
	InventoryGroup=3
	GroupOffset=1
	PickupClass=Class'Onslaught.ONSMineLayerPickup'
	PlayerViewOffset=(X=100.0000000,Y=35.5000000,Z=-32.5000000)
	BobDamping=2.2000000
	AttachmentClass=Class'Onslaught.ONSMineLayerAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=229,Y1=258,X2=296,Y2=307)
	ItemName="Mine Layer"
	Mesh=SkeletalMesh'ONSWeapons-A.MineLayer_1st'
	AmbientGlow=64
}
