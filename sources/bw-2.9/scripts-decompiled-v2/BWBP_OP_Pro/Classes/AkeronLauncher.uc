class AkeronLauncher extends BallisticWeapon
	config(BallisticProV55);

var float PanicThreshold;
var AkeronWarhead ActiveWarhead;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientSetViewRotation;
}

simulated function PreBeginPlay()
{
	// End:0x1F
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
	{
		FireModeClass[1] = Class'BCoreProV55.BallisticScopeFire';
	}
	super(Actor).PreBeginPlay();
	//return;	
}

function LostWarhead()
{
	GotoState('ControllerRecovery');
	//return;	
}

function RecoverController()
{
	// End:0x27
	if((InstigatorController == none) || InstigatorController.Pawn == Instigator)
	{
		return;
	}
	InstigatorController.SetRotation(ActiveWarhead.InitialControllerRotation);
	ClientSetViewRotation(ActiveWarhead.InitialControllerRotation);
	InstigatorController.UnPossess();
	// End:0x11A
	if(!InstigatorController.IsInState('GameEnded'))
	{
		// End:0xB2
		if((Instigator != none) && Instigator.Health > 0)
		{
			InstigatorController.Possess(Instigator);			
		}
		else
		{
			// End:0xED
			if(Instigator != none)
			{
				InstigatorController.Pawn = Instigator;
				PlayerController(InstigatorController).SetViewTarget(Instigator);				
			}
			else
			{
				InstigatorController.Pawn = none;
			}
			InstigatorController.PawnDied(InstigatorController.Pawn);
		}
	}
	// End:0x14B
	if(!ActiveWarhead.bExploded)
	{
		ActiveWarhead.BlowUp(ActiveWarhead.Location);
	}
	ActiveWarhead = none;
	//return;	
}

simulated function ClientSetViewRotation(Rotator R)
{
	Level.GetLocalPlayerController().SetRotation(R);
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x15
	if(bBerserk)
	{
		Damage *= 0.7500000;
	}
	// End:0x8D
	if(((ActiveWarhead != none) && ((instigatedBy.Controller == none) || instigatedBy.Controller == InstigatorController) || !instigatedBy.Controller.SameTeamAs(InstigatorController)) && float(Damage) > PanicThreshold)
	{
		RecoverController();
	}
	// End:0x9C
	if(AimKnockScale == float(0))
	{
		return;
	}
	AimComponent.ApplyDamageFactor(Damage);
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super.GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.7500000, dist, 2048.0000000, 3072.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

state ControllerRecovery
{Begin:

	Sleep(1.0000000);
	RecoverController();
	GotoState('None');
	stop;			
}

defaultproperties
{
	PanicThreshold=4.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;35.0;1.0;80.0;0.8;0.0;1.0")
	AIReloadTime=4.0000000
	ParamsClasses[0]=Class'BWBP_OP_Pro.AkeronWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.AkeronWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.AkeronWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.AkeronWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.Akeron.BigIcon_Akeron'
	BigIconCoords=(X1=36,Y1=50,X2=486,Y2=220)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ScopeXScale=1.3330000
	MinZoom=2.0000000
	MaxZoom=8.0000000
	FullZoomFOV=10.0000000
	ScopeViewTex=Texture'BW_Core_WeaponTex.Artillery.Artillery-ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Lever',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOff',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=155,G=78,B=0,A=54),Color2=(R=1,G=235,B=0,A=255),StartSize1=181,StartSize2=14)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Projectile=true
	ManualLines[0]="Launches rockets with good fire rate. These rockets travel quickly and deal high damage upon direct impact. The blast of Akeron rockets is directed forwards, so targets perpendicular to or behind the rocket's target vector when it explodes will take very little damage."
	ManualLines[1]="Launches a manually guided rocket. While a rocket is active, the user views through the rocket's nose camera. Rockets are fast and quite manoeuverable, but much as the primary fire, have a directed blast and require the enemy to be struck directly to do much damage."
	ManualLines[2]="The Akeron is effective at close to medium range or in specialist situations where indirect fire is required. As a rocket launcher, it has no recoil, but its size makes it cumbersome to use without stability or aiming."
	SightOffset=(X=20.0000000,Y=-17.0000000,Z=-1.5000000)
	FireModeClass[0]=Class'BWBP_OP_Pro.AkeronPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.AkeronSecondaryFire'
	SelectAnimRate=0.6000000
	PutDownAnimRate=0.8000000
	PutDownTime=0.8000000
	BringUpTime=1.0000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="The AN-56 Akeron Light Missile Launcher was introduced to fulfill a pressing need for mobile indirect fire options within the UTC ranks. Launching directed-blast rockets for the safety of allied units, it has quickly become a staple due to its optional ability to attack fortifications with manually guided rockets without requiring the user's exposure to enemy fire. However, whilst guiding a rocket, the user is vulnerable to flank attacks, and the weapon is best employed with the support of teammates. Should the user choose to eschew manual guidance, undirected rockets can be launched at a fast rate from the weapon's three barrels."
	Priority=44
	HudColor=(R=110,G=95,B=80,A=255)
	CenteredOffsetY=10.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=8
	PickupClass=Class'BWBP_OP_Pro.AkeronPickup'
	PlayerViewOffset=(X=5.0000000,Y=13.0000000,Z=-6.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.AkeronAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.Akeron.Icon_Akeron'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AN-56 Akeron Launcher"
	LightType=2
	LightEffect=13
	LightHue=25
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.Akeron_FPm'
	DrawScale=0.3000000
}
