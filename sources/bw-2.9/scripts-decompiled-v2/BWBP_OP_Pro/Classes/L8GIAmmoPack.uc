class L8GIAmmoPack extends BallisticHandGrenade
	config(BallisticProV55);

var() float HealAmount;
var() Sound HealSound;

function DoExplosion()
{
	//return;	
}

function Notify_SupplySelf()
{
	PlaySound(HealSound, 3);
	xPawn(Owner).GiveHealth(int(HealAmount), int(xPawn(Owner).SuperHealthMax));
	GotoState('GiveAmmoSelf');
	Ammo[0].UseAmmo(1, true);
	//return;	
}

simulated function Notify_HealOther()
{
	PlaySound(HealSound, 3);
	// End:0x30
	if(int(Role) == int(ROLE_Authority))
	{
		L8GISecondaryFire(bFireMode[1]).NotifiedDoFireEffect();
	}
	Ammo[0].UseAmmo(1, true);
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	//return;	
}

function ServerStartReload(optional byte i)
{
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	//return;	
}

state GiveAmmoSelf
{
	function SupplySelf(Actor InvOwner)
	{
		local Inventory Inv, GW;
		local int Count;
		local Weapon W;
		local bool bGetIt;
		local Ammunition A;

		Count = 0;
		Inv = InvOwner.Inventory;
		J0x1B:

		// End:0xD0 [Loop If]
		if((Inv != none) && Count < 1000)
		{
			// End:0xC6
			if(!Inv.IsA('L8GIAmmoPack'))
			{
				// End:0xB2
				if((BCGhostWeapon(Inv) != none) && BCGhostWeapon(Inv).MyWeaponClass != Class'BWBP_OP_Pro.L8GIAmmoPack')
				{
					GW = Inv;
					Inv = Inv.Inventory;
					BCGhostWeapon(GW).ReviveWeapon();
					// [Explicit Continue]
					goto J0xC6;
				}
				Inv = Inv.Inventory;
			}
			J0xC6:

			Count++;
			// [Loop Continue]
			goto J0x1B;
		}
		Count = 0;
		Inv = InvOwner.Inventory;
		J0xEB:

		// End:0x2C9 [Loop If]
		if((Inv != none) && Count < 1000)
		{
			A = Ammunition(Inv);
			// End:0x183
			if((A != none) && !A.IsA('Ammo_L8GI'))
			{
				// End:0x180
				if(A.AmmoAmount < A.MaxAmmo)
				{
					A.AddAmmo(A.InitialAmount);
					bGetIt = true;
				}				
			}
			else
			{
				W = Weapon(Inv);
				// End:0x2AB
				if((W != none) && !W.IsA('L8GIAmmoPack'))
				{
					// End:0x2AB
					if(W.bNoAmmoInstances)
					{
						// End:0x226
						if(!W.AmmoMaxed(0) && W.GetAmmoClass(0) != none)
						{
							W.AddAmmo(W.static.GetAmmoClass(0).default.InitialAmount, 0);
							bGetIt = true;
						}
						// End:0x2AB
						if(((W.GetAmmoClass(1) != none) && W.GetAmmoClass(1) != W.GetAmmoClass(0)) && !W.AmmoMaxed(1))
						{
							bGetIt = true;
							W.AddAmmo(W.static.GetAmmoClass(1).default.InitialAmount, 1);
						}
					}
				}
			}
			Count++;
			Inv = Inv.Inventory;
			// [Loop Continue]
			goto J0xEB;
		}
		//return;		
	}
Begin:

	SupplySelf(xPawn(Owner));
	stop;				
}

defaultproperties
{
	HealAmount=5.0000000
	HealSound=Sound'BW_Core_WeaponSound.Ammo.AmmoPackPickup'
	HeldDamage=200
	HeldRadius=250
	HeldMomentum=55000
	GrenadeSmokeClass=Class'BallisticProV55.NRP57Trail'
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.5000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50CamDie',Volume=0.0000000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	PinBone="None"
	ClipBone="None"
	SmokeBone="None"
	SpecialInfo[0]=(Id="EvoDefs",Info="0.0;5.0;-999.0;25.0;-999.0;0.0;0.5")
	ParamsClasses[0]=Class'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.L8GIAmmoPackWeaponParamsComp'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.AmmoPack.BigIcon_AmmoPack'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.1110000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Cross1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=200,G=200,B=0,A=128),Color2=(R=255,G=255,B=0,A=212),StartSize1=98,StartSize2=101)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Grenade=true
	PlayerSpeedFactor=0.7500000
	FireModeClass[0]=Class'BWBP_OP_Pro.L8GIPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.L8GISecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	Description="L8 GI Ammunition Pack||Manufacturer: Various|Primary: Throw|Secondary: Supply Self||UTC soldiers are trained to use a wide variety of weaponry, and, as such, are often in need of supplies. The L8 GI ammo pack is filled with ammunition and will supply every gun in the user's inventory."
	Priority=20
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	PickupClass=Class'BWBP_OP_Pro.L8GIPickup'
	PlayerViewOffset=(X=0.0000000,Y=7.5000000,Z=-10.6000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BWBP_OP_Pro.L8GIAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.AmmoPack.SmallIcon_AmmoPack'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="L8 GI Ammunition Pack"
	Mesh=SkeletalMesh'BWBP_OP_Anim.L8GI_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.Ammo.AmmoPackSkin'
	Skins[2]=Texture'BW_Core_WeaponTex.A73.A73AmmoSkin'
	Skins[3]=Texture'BW_Core_WeaponTex.M925.M925AmmoBox'
	Skins[4]=Texture'BW_Core_WeaponTex.M353.M353_Ammo'
	Skins[5]=Texture'BW_Core_WeaponTex.MRT6.MRT6Skin'
	Skins[6]=Texture'BW_Core_WeaponTex.MRT6.MRT6Small'
	Skins[7]=Texture'BW_Core_WeaponTex.FP7.FP7Grenade'
	Skins[8]=Texture'BW_Core_WeaponTex.M50.M900Grenade'
	Skins[9]=Shader'BW_Core_WeaponTex.M50.M50Skin2Shiney'
	Skins[10]=Shader'BW_Core_WeaponTex.M806.M806_Main-SD'
	Skins[11]=Texture'BW_Core_WeaponTex.NRP57.Grenade'
	Skins[12]=Shader'BW_Core_WeaponTex.R78.R78_Main-SD'
	Skins[13]=Texture'BW_Core_WeaponTex.M75.M75Clip'
	Skins[14]=FinalBlend'BW_Core_WeaponTex.G5.G5RocketFinal'
	Skins[15]=Shader'BW_Core_WeaponTex.XK2.XK2_Main-Shiney'
}
