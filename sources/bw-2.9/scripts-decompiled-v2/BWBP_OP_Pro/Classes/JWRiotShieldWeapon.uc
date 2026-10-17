class JWRiotShieldWeapon extends BallisticMeleeWeapon
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var float AimDisplacementBlockThreshold;

function bool CanAttack(Actor Other)
{
	return true;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function AttachToPawn(Pawn P)
{
	local name BoneName;

	Instigator = P;
	// End:0x41
	if(ThirdPersonActor == none)
	{
		ThirdPersonActor = Spawn(AttachmentClass, Owner);
		InventoryAttachment(ThirdPersonActor).InitFor(self);		
	}
	else
	{
		ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
	}
	BoneName = P.GetOffhandBoneFor(self);
	// End:0xB6
	if(BoneName == 'None')
	{
		ThirdPersonActor.SetLocation(P.Location);
		ThirdPersonActor.SetBase(P);		
	}
	else
	{
		P.AttachToBone(ThirdPersonActor, BoneName);
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local Vector HitNormal;
	local Class<BallisticDamageType> BDT;

	// End:0x45
	if(((instigatedBy != none) && instigatedBy.Controller != none) && instigatedBy.Controller.SameTeamAs(InstigatorController))
	{
		return;
	}
	// End:0x5A
	if(bBerserk)
	{
		Damage *= 0.7500000;
	}
	BDT = Class<BallisticDamageType>(DamageType);
	// End:0x105
	if((BDT != none) && CheckReflect(HitLocation, HitNormal, int(0.2000000)))
	{
		// End:0xDC
		if(bBlocked)
		{
			// End:0xC4
			if(Instigator.bIsCrouched)
			{
				HandleCrouchBlockingDamageMitigation(Damage, Momentum, BDT);				
			}
			else
			{
				HandleBlockingDamageMitigation(Damage, Momentum, BDT);
			}			
		}
		else
		{
			HandlePassiveDamageMitigation(Damage, Momentum, BDT);
		}
		BallisticAttachment(ThirdPersonActor).UpdateBlockHit();
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

function HandleCrouchBlockingDamageMitigation(out int Damage, out Vector Momentum, Class<BallisticDamageType> DamageType)
{
	// End:0x16
	if(!DamageType.default.bArmorStops)
	{
		return;
	}
	// End:0x3C
	if(DamageType.default.bCanBeBlocked)
	{
		Damage = 0;
		Momentum *= float(2);
		return;
	}
	Damage *= 0.2000000;
	Momentum *= float(2);
	return;
	// End:0xA2
	if(DamageType.default.bCanBeBlocked || DamageType.default.bMetallic)
	{
		Damage = Max(Damage / 6, Damage - 35);
		Momentum *= float(2);
		return;
	}
	// End:0xD0
	if(DamageType.default.bLocationalHit)
	{
		Damage = Max(Damage / 6, Damage - 30);
		return;
	}
	Damage = Max(Damage / 20, Damage - 50);
	Momentum *= float(2);
	//return;	
}

function HandleBlockingDamageMitigation(out int Damage, out Vector Momentum, Class<BallisticDamageType> DamageType)
{
	// End:0x16
	if(!DamageType.default.bArmorStops)
	{
		return;
	}
	// End:0x3C
	if(DamageType.default.bCanBeBlocked)
	{
		Damage = 0;
		Momentum *= float(2);
		return;
	}
	Damage *= 0.3000000;
	Momentum *= float(2);
	return;
	// End:0x8E
	if(DamageType.default.bMetallic)
	{
		Damage = Max(Damage / 5, Damage - 20);
		Momentum *= float(2);
		return;
	}
	// End:0xBC
	if(DamageType.default.bLocationalHit)
	{
		Damage = Max(Damage / 5, Damage - 20);
		return;
	}
	Damage = Max(1, Damage - 30);
	Momentum *= float(2);
	//return;	
}

function HandlePassiveDamageMitigation(out int Damage, out Vector Momentum, Class<BallisticDamageType> DamageType)
{
	// End:0x16
	if(!DamageType.default.bArmorStops)
	{
		return;
	}
	Damage *= 0.4500000;
	Momentum *= float(2);
	return;
	// End:0x68
	if(DamageType.default.bMetallic)
	{
		Damage = Max(Damage / 3, Damage - 10);
		Momentum *= float(2);
		return;
	}
	// End:0x96
	if(DamageType.default.bLocationalHit)
	{
		Damage = Max(Damage / 2, Damage - 10);
		return;
	}
	Damage = Max(Damage / 4, Damage - 15);
	Momentum *= float(2);
	//return;	
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
	local Vector HitDir, FaceDir;

	FaceDir = Vector(Instigator.Controller.Rotation);
	HitDir = Normal((Instigator.Location - HitLocation) + vect(0.0000000, 0.0000000, 8.0000000));
	RefNormal = FaceDir;
	// End:0x6C
	if((FaceDir Dot HitDir) < float(0))
	{
		return true;
	}
	return false;
	//return;	
}

function float GetAIRating()
{
	return AIRating;
	//return;	
}

function float SuggestAttackStyle()
{
	return 1.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -1.0000000;
	//return;	
}

defaultproperties
{
	AimDisplacementBlockThreshold=40.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;10.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.BallisticShieldWeaponParamsComp'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.RiotShield.BigIcon_Shield'
	BigIconCoords=(X1=180,Y1=0,X2=320,Y2=255)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Pullout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=none,Pic2=Texture'BW_Core_WeaponTex.Crosshairs.R78OutA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=255),Color2=(R=0,G=125,B=255,A=255),StartSize1=96,StartSize2=96)
	ManualLines[0]="Attacks with the weapon and shield. The shield continues to block whilst attacking."
	ManualLines[1]="Prepared strike with the weapons."
	ManualLines[2]="The ballistic shield reduces movement speed whilst active."
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.BallisticShieldPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.BallisticShieldSecondaryFire'
	PutDownTime=0.5000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.5000000
	CurrentRating=0.5000000
	bMeleeWeapon=true
	Description="Civilian Riot Shield||Manufacturer: Various Civilian Manufacturers|Primary: Smash|Secondary: Prepared Bash||A defensive weapon capable of blocking many attack types. Reduces incoming frontal damage by 35 or reduces it to 25% of the original amount, whichever is greater. Blocks melee damage outright. Has no effect on non-locational damage such as gas and fire."
	DisplayFOV=65.0000000
	Priority=12
	HudColor=(R=200,G=200,B=255,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=4
	PickupClass=Class'BWBP_OP_Pro.JWRiotShieldPickup'
	PlayerViewOffset=(X=0.0000000,Y=75.0000000,Z=-100.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.JWRiotShieldAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.Icon_JWRiot'
	IconCoords=(X1=0,Y1=0,X2=256,Y2=31)
	ItemName="Civilian Riot Shield"
	Mesh=SkeletalMesh'BWBP_OP_Anim.CivShield_FPm'
	DrawScale=1.2500000
}
