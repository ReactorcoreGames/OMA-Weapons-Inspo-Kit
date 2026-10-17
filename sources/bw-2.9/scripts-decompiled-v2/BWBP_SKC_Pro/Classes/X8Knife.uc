class X8Knife extends BallisticMeleeWeapon
	config(BallisticProV55);

var() name KnifeBone;
var() name PinBone;
var() FullSound PinPullSound;

simulated function BringUp(optional Weapon PrevWeapon)
{
	super(BallisticWeapon).BringUp(PrevWeapon);
	SetBoneScale(0, 1.0000000, KnifeBone);
	SetBoneScale(1, 1.0000000, PinBone);
	//return;	
}

simulated function bool PutDown()
{
	local BCGhostWeapon GW;

	// End:0x9D
	if(super(BallisticWeapon).PutDown())
	{
		SetBoneScale(1, 1.0000000, PinBone);
		// End:0x9B
		if(Ammo[0].AmmoAmount < 1)
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0x81
			if(GW != none)
			{
				GW.MyWeaponClass = Class;
				GW.GiveTo(Instigator);
			}
			Timer();
			PickupClass = none;
			DropFrom(Location);
			return true;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function PlayIdle()
{
	super(BallisticWeapon).PlayIdle();
	SetBoneScale(1, 0.0000000, PinBone);
	//return;	
}

simulated function Notify_KnifeLeaveHand()
{
	SetBoneScale(0, 0.0000000, KnifeBone);
	//return;	
}

simulated function Notify_KnifePinPull()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, PinPullSound);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x5B
	if(Anim == FireMode[1].FireAnim)
	{
		SetBoneScale(1, 1.0000000, PinBone);
		SetBoneScale(0, 1.0000000, KnifeBone);
		CheckNoGrenades();		
	}
	else
	{
		// End:0x73
		if(Anim == SelectAnim)
		{
			PlayIdle();			
		}
		else
		{
			super.AnimEnd(Channel);
		}
	}
	//return;	
}

simulated function CheckNoGrenades()
{
	local Inventory Inv;
	local BCGhostWeapon GW;

	// End:0x1E3
	if((Ammo[0] != none) && (Ammo[0].AmmoAmount < 1) || (Ammo[0].AmmoAmount == 1) && (bFireMode[0].ConsumedLoad > 0) || bFireMode[1].ConsumedLoad > 0)
	{
		AIRating = -999.0000000;
		Priority = byte(-999);
		// End:0xE6
		if(int(Role) == int(ROLE_Authority))
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0xE6
			if(GW != none)
			{
				GW.MyWeaponClass = Class;
				GW.GiveTo(Instigator);
			}
		}
		// End:0x1DD
		if(Instigator != none)
		{
			// End:0x125
			if(PlayerController(Instigator.Controller) != none)
			{
				Instigator.Controller.ClientSwitchToBestWeapon();				
			}
			else
			{
				// End:0x1DD
				if(AIController(Instigator.Controller) != none)
				{
					Inv = Instigator.Inventory;
					J0x152:

					// End:0x1DD [Loop If]
					if(Inv != none)
					{
						// End:0x1C6
						if((Weapon(Inv) != none) && Weapon(Inv) != self)
						{
							// End:0x19B
							if(!Weapon(Inv).HasAmmo())
							{								
							}
							else
							{
								Instigator.PendingWeapon = Weapon(Inv);
								Instigator.ChangedWeapon();
								// [Explicit Break]
								goto J0x1DD;
							}
						}
						Inv = Inv.Inventory;
						// [Loop Continue]
						goto J0x152;
					}
				}
			}
		}
		J0x1DD:

		Destroy();		
	}
	else
	{
		PlayAnim(SelectAnim, SelectAnimRate, 0.0000000);
	}
	//return;	
}

simulated function RemoteKill()
{
	local BCGhostWeapon GW;

	AIRating = -999.0000000;
	Priority = byte(-999);
	// End:0x79
	if(int(Role) == int(ROLE_Authority))
	{
		GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
		// End:0x79
		if(GW != none)
		{
			GW.MyWeaponClass = Class;
			GW.GiveTo(Instigator);
		}
	}
	Destroy();
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x45
	if(((instigatedBy != none) && instigatedBy.Controller != none) && instigatedBy.Controller.SameTeamAs(InstigatorController))
	{
		return;
	}
	// End:0x99
	if((VSize(Instigator.Location - instigatedBy.Location) < float(512)) && VSize(Momentum) < float(60))
	{
		Momentum = vect(0.0000000, 0.0000000, 0.0000000);		
	}
	else
	{
		Momentum *= 0.5000000;
	}
	// End:0xBA
	if(bBerserk)
	{
		Damage *= 0.7500000;
	}
	//return;	
}

function bool CanAttack(Actor Other)
{
	return true;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x86
	if(VSize(B.Enemy.Location - Instigator.Location) > (FireMode[0].MaxRange() * 1.5000000))
	{
		return 1;
	}
	Result = FRand();
	// End:0xEB
	if((Vector(B.Enemy.Rotation) Dot Normal(Instigator.Location - B.Enemy.Location)) < 0.0000000)
	{
		Result += 0.3000000;		
	}
	else
	{
		Result -= 0.3000000;
	}
	// End:0x109
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local BallisticWeapon BW;
	local Vector Dir;
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x44
	if(B.Enemy == none)
	{
		return 0.0000000;
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	// End:0xC6
	if((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000)
	{
		rating += (0.0800000 * B.Skill);
	}
	BW = BallisticWeapon(B.Enemy.Weapon);
	// End:0x147
	if(BW != none)
	{
		// End:0x111
		if(BW.bMeleeWeapon)
		{
			rating *= 0.7500000;
		}
		// End:0x147
		if(BW.bWT_Shotgun || int(BW.InventoryGroup) == 3)
		{
			rating = 0.0000000;
		}
	}
	rating = Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3000000, dist, 128.0000000, 128.0000000);
	return rating;
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
	KnifeBone="Blade"
	PinBone="Pin"
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.0750000,Radius=24.0000000,Slot=3,Pitch=1.6000000,bAtten=true,bNoOverride=false)
	bCanBlock=false
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;-999.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.X8WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.X8WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.X8WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.X8WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.AK490.BigIcon_X8'
	BigIconCoords=(X1=0,Y1=25,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePullOut',Volume=0.1100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway',Volume=0.1100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.X3InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=129,G=0,B=0,A=192),Color2=(R=0,G=196,B=0,A=192),StartSize1=99,StartSize2=107)
	NDCrosshairInfo=(SpreadRatios=(X1=0.2500000,Y1=0.3750000,X2=1.0000000,Y2=1.0000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	ManualLines[0]="Slashes rapidly with the knife."
	ManualLines[1]="When held, readies the ballistic knife. When released, the knife is fired in a straight trajectory, dealing good damage to targets hit."
	ManualLines[2]="Effective at close range and while moving."
	MagAmmo=1
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.X8PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.X8SecondaryFire'
	SelectAnimRate=2.5000000
	PutDownAnimRate=2.0000000
	PutDownTime=0.2000000
	BringUpTime=0.4000000
	SelectForce="SwitchToAssaultRifle"
	bMeleeWeapon=true
	bShowChargingBar=false
	Description="A counterpart to Enravionï¿½s X3 Knife, the X8 Ballistic Knife is the Eastern Blocï¿½s preferred way to deal with CQC enemies. While primarily used as a bayonet on the venerable AK490, the X8 is still quite effective in hand to hand fighting thanks to its lethally sharp blade. When opponents are too far to gut personally, the unique gas propellant mechanism inside the hilt of the knife lets the user turn their knife into a fast moving spear. Several unfortunate accidents have caused the X8 to be considered unfit for civilian use."
	Priority=13
	HudColor=(R=200,G=25,B=25,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=7
	PickupClass=Class'BWBP_SKC_Pro.X8Pickup'
	PlayerViewOffset=(X=20.0000000,Y=0.0000000,Z=-10.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.X8Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.AK490.SmallIcon_X8'
	IconCoords=(X1=0,Y1=0,X2=128,Y2=32)
	ItemName="X8 Ballistic Knife"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.X8Knife_FPm'
	DrawScale=0.3000000
}
