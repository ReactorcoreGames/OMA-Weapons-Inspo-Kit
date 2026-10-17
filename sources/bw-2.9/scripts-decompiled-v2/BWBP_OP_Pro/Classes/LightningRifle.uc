class LightningRifle extends BallisticWeapon
	config(BallisticProV55);

struct RevInfo
{
	var() name BoneName;
};

var float ChargePower;
var LightningProjectile ComboTarget;
var bool bRegisterTarget;
var bool bWaitForCombo;
var Vector ComboStart;

simulated function PostNetBeginPlay()
{
	SetBoneScale(1, 0.0000000, 'ScreenFlap');
	super.PostNetBeginPlay();
	//return;	
}

simulated function float ChargeBar()
{
	return ChargePower;
	//return;	
}

simulated function SetChargePower(float NewChargePower)
{
	ChargePower = NewChargePower;
	//return;	
}

function SetComboTarget(LightningProjectile L)
{
	// End:0x47
	if((!bRegisterTarget || Bot(Instigator.Controller) == none) || Instigator.Controller.Enemy == none)
	{
		return;
	}
	bRegisterTarget = false;
	ComboStart = Instigator.Location;
	ComboTarget = L;
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
	return FMin(2.0000000, 0.3000000 + (VSize(B.Enemy.Location - Instigator.Location) / Class'BWBP_OP_Pro.LightningProjectile'.default.Speed));
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
		MaxDist = 4.0000000 * Class'BWBP_OP_Pro.LightningProjectile'.default.Speed;		
	}
	else
	{
		MaxDist = 3.0000000 * Class'BWBP_OP_Pro.LightningProjectile'.default.Speed;
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

function float SuggestAttackStyle()
{
	return -0.4000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.9000000;
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.5;60.0;10.0;0.0;0.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.LightningWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.LightningWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.LightningWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.LightningWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.Arc.BigIcon_LightningRifle'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Pickup',Volume=0.2550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-Deselect',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ZoomInAnim="ZoomIn"
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=8.0000000
	ZoomStages=4
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BWBP_OP_Tex.Arc.ARCRifleScope'
	bNoCrosshairInScope=true
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.Law-TubeLock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Up',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=TexRotator'BW_Core_WeaponTex.DarkStar.DarkOutA-Rot',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross4',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=191,G=194,B=196,A=139),Color2=(R=0,G=69,B=255,A=90),StartSize1=96,StartSize2=38)
	bWT_Bullet=true
	ManualLines[0]="Uncharged lightning bolt shot. Deals reasonable damage for a small ammo cost."
	ManualLines[1]="Charged lightning bolt. The rifle will fire when the fire key is released, or immediately upon becoming fully charged. Damage improves with charge, and more ammo is consumed."
	ManualLines[2]="Upon releasing a charged lightning bolt, the electricity will arc between nearby players. The number of conducting players, radius and damage dropoff depends on the charge."
	SightOffset=(X=13.0000000,Y=0.0000000,Z=0.0000000)
	GunLength=60.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.LightningPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.LightningSecondaryFire'
	PutDownTime=0.7000000
	BringUpTime=0.6000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	bSniping=true
	bShowChargingBar=true
	Description="ARC-79 Lightning Rifle||Manufacturer: JAX Industrial Firm|Primary: Single lightning bolt|Secondary: Charged lightning bolt with arcing to nearby players||The pinnacle of electric based weaponry, an evolution of the lightning gun; the ARC-79 Lightning Rifle is the result of a collaboration between the UTC R&D and Nexron Defense.  Designed to fry the circuits of Cryon at a safer distance, the ARC-79 is a devastating rifle even against the Skrith, even the hordes of Krao since it's able to chain the electrical current between targets.  Though it's a recent development, the ARC-79 has been proven useful when a Nexron laboratory was invaded by the Krao on the planet Anschar, only 3 rifles were used to quell the mindless drones, the scientists having fried Krao that night as a reward."
	Priority=33
	HudColor=(R=200,G=50,B=50,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	GroupOffset=2
	PickupClass=Class'BWBP_OP_Pro.LightningPickup'
	PlayerViewOffset=(X=0.0000000,Y=4.5000000,Z=-2.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.LightningAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.Arc.SmallIcon_LightningRifle'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="ARC-79 Lightning Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.LightningRifle_FPm'
	DrawScale=0.3000000
}
