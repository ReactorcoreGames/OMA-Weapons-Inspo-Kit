class BallisticShieldWeapon extends BallisticMeleeWeapon
	config(BallisticProV55);

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

function ServerSetBlocked(bool NewValue)
{
	// End:0x13
	if(bBlocked == NewValue)
	{
		return;
	}
	bBlocked = NewValue;
	BallisticAttachment(ThirdPersonActor).SetBlocked(NewValue);
	// End:0x51
	if(bBlocked)
	{
		AddSpeedModification(0.7000000);		
	}
	else
	{
		RemoveSpeedModification(0.7000000);
	}
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
	// End:0x10E
	if((BDT != none) && CheckReflect(instigatedBy.Location, HitNormal, int(0.2000000)))
	{
		// End:0xE5
		if(bBlocked)
		{
			// End:0xCD
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
	// End:0x3D
	if(DamageType.default.bCanBeBlocked)
	{
		Damage = 0;
		Momentum *= 1.2500000;
		return;
	}
	// End:0x8B
	if(DamageType.default.bCanBeBlocked || DamageType.default.bMetallic)
	{
		Damage = Max(Damage / 6, Damage - 35);
		Momentum *= 1.2500000;
		return;
	}
	// End:0xB9
	if(DamageType.default.bLocationalHit)
	{
		Damage = Max(Damage / 6, Damage - 50);
		return;
	}
	Damage = Max(int(float(Damage) * 0.3500000), Damage - 35);
	Momentum *= 1.2500000;
	//return;	
}

function HandleBlockingDamageMitigation(out int Damage, out Vector Momentum, Class<BallisticDamageType> DamageType)
{
	// End:0x16
	if(!DamageType.default.bArmorStops)
	{
		return;
	}
	// End:0x3D
	if(DamageType.default.bCanBeBlocked)
	{
		Damage = 0;
		Momentum *= 1.2500000;
		return;
	}
	// End:0x7E
	if(DamageType.default.bMetallic)
	{
		Damage = Max(int(float(Damage) * 0.2500000), Damage - 40);
		Momentum *= 1.2500000;
		return;
	}
	// End:0xB3
	if(DamageType.default.bLocationalHit)
	{
		Damage = Max(int(float(Damage) * 0.2500000), Damage - 40);
		return;
	}
	Damage = Max(int(float(Damage) * 0.5000000), Damage - 25);
	Momentum *= 1.2500000;
	//return;	
}

function HandlePassiveDamageMitigation(out int Damage, out Vector Momentum, Class<BallisticDamageType> DamageType)
{
	// End:0x16
	if(!DamageType.default.bArmorStops)
	{
		return;
	}
	// End:0x57
	if(DamageType.default.bMetallic)
	{
		Damage = Max(int(float(Damage) * 0.5000000), Damage - 20);
		Momentum *= 1.2500000;
		return;
	}
	// End:0x8C
	if(DamageType.default.bLocationalHit)
	{
		Damage = Max(int(float(Damage) * 0.5000000), Damage - 20);
		return;
	}
	Damage = Max(int(float(Damage) * 0.7500000), Damage - 15);
	Momentum *= 1.2500000;
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
	ParamsClasses[1]=Class'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.BallisticShieldWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.BallisticShieldWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.BallisticShield.BigIcon_BallisticShield'
	BigIconCoords=(X1=180,Y1=0,X2=320,Y2=255)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Pullout',Volume=0.2090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway',Volume=0.2090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=none,Pic2=Texture'BW_Core_WeaponTex.Crosshairs.R78OutA',USize1=128,VSize1=128,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=255),Color2=(R=0,G=255,B=210,A=255),StartSize1=96,StartSize2=96)
	ManualLines[0]="Attacks with the weapon and shield. The shield continues to block whilst attacking."
	ManualLines[1]="Prepared strike with the weapons."
	ManualLines[2]="Hold Weapon Function to block with the shield, which dramatically increases its defensive effectiveness at the cost of your ability to see. The shield is further bolstered in effectiveness if the user is crouching while blocking.||The ballistic shield reduces movement speed whilst active."
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.BallisticShieldPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.BallisticShieldSecondaryFire'
	PutDownTime=0.5000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.5000000
	CurrentRating=0.5000000
	bMeleeWeapon=true
	Description="RSH-1034 Riot Shield||Manufacturer: Apollo Industries|Primary: Smash|Secondary: Prepared Bash||A defensive weapon capable of blocking many attack types. Reduces incoming frontal damage by 35 or reduces it to 25% of the original amount, whichever is greater. Blocks melee damage outright. Has no effect on non-locational damage such as gas and fire."
	Priority=12
	HudColor=(R=200,G=200,B=255,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=4
	PickupClass=Class'BWBP_OP_Pro.BallisticShieldPickup'
	PlayerViewOffset=(X=0.0000000,Y=75.0000000,Z=-125.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.BallisticShieldAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.BallisticShield.Icon_BallisticShield'
	IconCoords=(X1=0,Y1=0,X2=110,Y2=32)
	ItemName="RSH-1034 Riot Shield"
	Mesh=SkeletalMesh'BWBP_OP_Anim.BallisticShield_FPm'
	DrawScale=1.2500000
}
