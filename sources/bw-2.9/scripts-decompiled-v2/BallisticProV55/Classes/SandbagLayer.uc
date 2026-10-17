class SandbagLayer extends BallisticWeapon
	config(BallisticProV55);

var Sound DropSound;

static function bool ShouldGiveBags(Pawn Other)
{
	local int Count;
	local Inventory Inv;

	// End:0x1C
	if(Other.FindInventoryType(Class'BallisticProV55.SandbagLayer') != none)
	{
		return false;
	}
	Inv = Other.Inventory;
	J0x30:

	// End:0x9B [Loop If]
	if((Inv != none) && Count < 1000)
	{
		// End:0x7D
		if((BCGhostWeapon(Inv) != none) && BCGhostWeapon(Inv).MyWeaponClass == Class'BallisticProV55.SandbagLayer')
		{
			return false;
		}
		Inv = Inv.Inventory;
		Count++;
		// [Loop Continue]
		goto J0x30;
	}
	return true;
	//return;	
}

simulated function bool PutDown()
{
	// End:0x27
	if(super.PutDown())
	{
		// End:0x25
		if(Ammo[0].AmmoAmount < 1)
		{
			SaveGhost();
		}
		return true;
	}
	return false;
	//return;	
}

function SaveGhost()
{
	local BCGhostWeapon GW;

	GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
	// End:0x51
	if(GW != none)
	{
		GW.MyWeaponClass = Class;
		GW.GiveTo(Instigator);
	}
	//return;	
}

function bool CanAttack(Actor Other)
{
	return false;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float GetAIRating()
{
	return 0.0000000;
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local Vector HitNormal;

	// End:0x5E
	if(DamageType.default.bCausedByWorld || HitLocation.Z < (Instigator.Location.Z - float(22)))
	{
		super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);		
	}
	else
	{
		// End:0x11B
		if(CheckReflect(HitLocation, HitNormal, int(0.6000000)))
		{
			// End:0xA4
			if(Class<BallisticDamageType>(DamageType).default.bCanBeBlocked)
			{
				Damage = 0;
				Momentum *= float(2);				
			}
			else
			{
				// End:0xD8
				if(Class<DT_BWShell>(DamageType) != none)
				{
					Damage = Max(int(float(Damage) * 0.5000000), Damage - 35);					
				}
				else
				{
					Damage = Max(int(float(Damage) * 0.2500000), Damage - 35);
				}
				Momentum *= float(4);
			}
			AimComponent.ApplyDamageFactor(Damage);			
		}
		else
		{
			super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
		}
	}
	//return;	
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
	local Vector HitDir, FaceDir;

	FaceDir = Vector(Instigator.Controller.Rotation);
	HitDir = Normal((Instigator.Location - HitLocation) + vect(0.0000000, 0.0000000, 8.0000000));
	RefNormal = FaceDir;
	// End:0x6E
	if((FaceDir Dot HitDir) < 0.5000000)
	{
		return true;
	}
	return false;
	//return;	
}

function Notify_Deploy()
{
	local Vector HitLoc, HitNorm, Start, End;
	local Actor t;
	local Rotator CompressedEq;
	local Sandbag SB;
	local float Forward;

	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x2F
	if(Instigator.HeadVolume.bWaterVolume)
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	Forward = 75.0000000;
	J0x5F:

	// End:0x1F8 [Loop If]
	if(Forward >= float(45))
	{
		End = Start + (Vector(Instigator.Rotation) * Forward);
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(6.0000000, 6.0000000, 6.0000000));
		// End:0xE2
		if((t != none) && VSize(HitLoc - Start) < float(30))
		{
			return;
		}
		// End:0xF8
		if(t == none)
		{
			HitLoc = End;
		}
		End = HitLoc + vect(0.0000000, 0.0000000, 100.0000000);
		// End:0x127
		if(!FastTrace(End, HitLoc))
		{			
		}
		else
		{
			End = HitLoc - vect(0.0000000, 0.0000000, 100.0000000);
			t = Trace(HitLoc, HitNorm, End, HitLoc, true, vect(6.0000000, 6.0000000, 6.0000000));
			// End:0x1DA
			if((((t != none) && (t.bWorldGeometry && BallisticTurret(t) == none) && Sandbag(t) == none) && HitNorm.Z >= 0.9000000) && FastTrace(HitLoc, Start))
			{
				// [Explicit Break]
				goto J0x1F8;
			}
			// End:0x1EA
			if(Forward <= float(45))
			{
				return;
			}
		}
		Forward -= float(15);
		// [Loop Continue]
		goto J0x5F;
	}
	J0x1F8:

	FireMode[1].bIsFiring = false;
	FireMode[1].StopFiring();
	CompressedEq = Instigator.Rotation;
	CompressedEq.Pitch = (CompressedEq.Pitch >> 8) & 255;
	CompressedEq.Yaw = (CompressedEq.Yaw >> 8) & 255;
	CompressedEq.Pitch = CompressedEq.Pitch << 8;
	CompressedEq.Yaw = CompressedEq.Yaw << 8;
	SB = Spawn(Class'BallisticProV55.Sandbag', none,, HitLoc, CompressedEq);
	// End:0x2F2
	if(SB == none)
	{
		Log("Notify_Deploy: Could not spawn sandbag", 'Warning');
		return;
	}
	PlaySound(DropSound);
	ConsumeAmmo(0, 1.0000000);
	// End:0x391
	if(!HasAmmo())
	{
		SaveGhost();
		AIRating = -999.0000000;
		Priority = byte(-999);
		Instigator.Weapon = none;
		// End:0x38E
		if(((Instigator != none) && Instigator.Controller != none) && Instigator.PendingWeapon == none)
		{
			Instigator.Controller.ClientSwitchToBestWeapon();
		}
		Destroy();
	}
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0xB7
	if((W == none) || Class != W.Class)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		W = self;
		// End:0x9F
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;
		}
		ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
	}
	M = 0;
	J0xBE:

	// End:0x123 [Loop If]
	if(M < 2)
	{
		// End:0x119
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			W.GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0xBE;
	}
	W.ClientWeaponSet(false);
	// End:0x16B
	if(!bJustSpawned)
	{
		M = 0;
		J0x145:

		// End:0x168 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x145;
		}
		Destroy();
	}
	//return;	
}

defaultproperties
{
	DropSound=Sound'PlayerSounds.BFootsteps.BFootstepSnow5'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;10.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BallisticProV55.SandbagWeaponParams'
	ParamsClasses[1]=Class'BallisticProV55.SandbagWeaponParams'
	ParamsClasses[2]=Class'BallisticProV55.SandbagWeaponParams'
	ParamsClasses[3]=Class'BallisticProV55.SandbagWeaponParams'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Sandbags.Icon_Sandbags'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Pullout',Volume=0.1050000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway',Volume=0.1070000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Place",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	bUseSights=false
	bNoMag=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BallisticProV55.SandbagFire'
	FireModeClass[1]=Class'BallisticProV55.SandbagFire'
	PutDownTime=0.9000000
	BringUpTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.0000000
	CurrentRating=0.0000000
	bMeleeWeapon=true
	bNoInstagibReplace=true
	Description="Generic sandbags, as used in militaries for decades. Useful for laying temporary cover. Can be used as a base for most deployed weapons, reducing the chance of the user being directly hit by attacks. May be picked up with the Use key when no other players are near them. Vulnerable to destruction if hit by high-powered weaponry."
	Priority=12
	HudColor=(R=255,G=200,B=0,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	GroupOffset=8
	PickupClass=Class'BallisticProV55.SandbagPickup'
	PlayerViewOffset=(X=40.0000000,Y=0.0000000,Z=-10.0000000)
	AttachmentClass=Class'BallisticProV55.SandbagAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Sandbags.SmallIcon_Sandbags'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Sandbags"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.SandBags_FPm'
	DrawScale=0.6000000
	SoundVolume=150
	TransientSoundRadius=256.0000000
}
