class Mut_BallisticMelee extends Mut_Ballistic
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated event PreBeginPlay()
{
	Replacements.Length = 23;
	super.PreBeginPlay();
	//return;	
}

function ModifyPlayer(Pawn Other)
{
	local Class<Weapon> fw;
	local int i;

	// End:0x29
	if(xPawn(Other) != none)
	{
		xPawn(Other).UDamageSound = UDamageSnd;
	}
	xPlayerReplicationInfo(Other.PlayerReplicationInfo).bForceNoPlayerLights = true;
	// End:0x132
	if(((Other.Controller != none) && Bot(Other.Controller) != none) && Bot(Other.Controller).FavoriteWeapon != none)
	{
		fw = Bot(Other.Controller).FavoriteWeapon;
		i = 0;
		J0xC4:

		// End:0x132 [Loop If]
		if(i < Replacements.Length)
		{
			// End:0x128
			if((GetInventoryFor(Replacements[i].OldItem)) == fw)
			{
				Bot(Other.Controller).FavoriteWeapon = Class<Weapon>(GetInventoryFor(GetNewItem(i, true)));
			}
			i++;
			// [Loop Continue]
			goto J0xC4;
		}
	}
	super(Mutator).ModifyPlayer(Other);
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	// End:0x1A
	if(Ammo(Other) != none)
	{
		bSuperRelevant = 0;
		return false;
	}
	return super.CheckReplacement(Other, bSuperRelevant);
	//return;	
}

defaultproperties
{
	Replacements[0]=(OldItemName="XWeapons.ShieldGun",OldItem=Class'XWeapons.ShieldGun',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.X3Pickup"),NewItems=none)
	Replacements[1]=(OldItemName="XWeapons.AssaultRifle",OldItem=Class'XWeapons.AssaultRifle',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.X3Pickup"),NewItems=none)
	Replacements[2]=(OldItemName="XWeapons.BioRiflePickup",OldItem=Class'XWeapons.BioRiflePickup',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.Melee_M763Pickup"),NewItems=none)
	Replacements[3]=(OldItemName="XWeapons.ShockRiflePickup",OldItem=Class'XWeapons.ShockRiflePickup',bUseBase=false,bSuper=false,NewItemNames=("BWBP_OP_Pro.DefibFistsPickup"),NewItems=none)
	Replacements[4]=(OldItemName="XWeapons.LinkGunPickup",OldItem=Class'XWeapons.LinkGunPickup',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.Melee_A73Pickup"),NewItems=none)
	Replacements[5]=(OldItemName="XWeapons.MinigunPickup",OldItem=Class'XWeapons.MinigunPickup',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.A909Pickup"),NewItems=none)
	Replacements[6]=(OldItemName="XWeapons.FlakCannonPickup",OldItem=Class'XWeapons.FlakCannonPickup',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.EKS43Pickup"),NewItems=none)
	Replacements[7]=(OldItemName="XWeapons.RocketLauncherPickup",OldItem=Class'XWeapons.RocketLauncherPickup',bUseBase=false,bSuper=false,NewItemNames=("BWBP_OP_Pro.BallisticShieldPickup"),NewItems=none)
	Replacements[8]=(OldItemName="XWeapons.SniperRiflePickup",OldItem=Class'XWeapons.SniperRiflePickup',bUseBase=false,bSuper=false,NewItemNames=("BWBP_SKC_Pro.BlackOpsWristBladePickup"),NewItems=none)
	Replacements[9]=(OldItemName="XWeapons.PainterPickup",OldItem=Class'XWeapons.PainterPickup',bUseBase=false,bSuper=true,NewItemNames=("BWBP_OP_Pro.FlameSwordPickup"),NewItems=none)
	Replacements[10]=(OldItemName="XWeapons.RedeemerPickup",OldItem=Class'XWeapons.RedeemerPickup',bUseBase=false,bSuper=true,NewItemNames=("BWBP_SKC_Pro.DragonsToothPickup"),NewItems=none)
	Replacements[11]=(OldItemName="UTClassic.ClassicSniperRiflePickup",OldItem=Class'UTClassic.ClassicSniperRiflePickup',bUseBase=false,bSuper=false,NewItemNames=("BWBP_SKC_Pro.X8Pickup"),NewItems=none)
	Replacements[12]=(OldItemName="Onslaught.ONSAVRiLPickup",OldItem=Class'Onslaught.ONSAVRiLPickup',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.EKS43Pickup"),NewItems=none)
	Replacements[13]=(OldItemName="Onslaught.ONSGrenadePickup",OldItem=Class'Onslaught.ONSGrenadePickup',bUseBase=false,bSuper=false,NewItemNames=("BWBP_SKC_Pro.ChaffPickup"),NewItems=none)
	Replacements[14]=(OldItemName="Onslaught.ONSMineLayerPickup",OldItem=Class'Onslaught.ONSMineLayerPickup',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.Melee_A73Pickup"),NewItems=none)
	Replacements[15]=(OldItemName="OnslaughtFull.ONSPainterPickup",OldItem=Class'OnslaughtFull.ONSPainterPickup',bUseBase=false,bSuper=true,NewItemNames=("BWBP_OP_Pro.MAG78Pickup"),NewItems=none)
	Replacements[16]=(OldItemName="XWeapons.AssaultAmmoPickup",OldItem=Class'XPickups.HealthPack',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_HealthKit"),NewItems=none)
	Replacements[17]=(OldItemName="XWeapons.BioAmmoPickup",OldItem=Class'XPickups.MiniHealthPack',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_Bandage"),NewItems=none)
	Replacements[18]=(OldItemName="XWeapons.ShockAmmoPickup",OldItem=Class'XPickups.AdrenalinePickup',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_Adrenaline"),NewItems=none)
	Replacements[19]=(OldItemName="XWeapons.LinkAmmoPickup",OldItem=Class'XPickups.UDamagePack',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_UDamage"),NewItems=none)
	Replacements[20]=(OldItemName="XWeapons.MinigunAmmoPickup",OldItem=Class'XPickups.SuperHealthPack',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_SuperHealthKit"),NewItems=none)
	Replacements[21]=(OldItemName="XWeapons.FlakAmmoPickup",OldItem=Class'XPickups.SuperShieldPack',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_BigArmor"),NewItems=none)
	Replacements[22]=(OldItemName="XWeapons.RocketAmmoPickup",OldItem=Class'XPickups.ShieldPack',bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_SmallArmor"),NewItems=none)
	Replacements[23]=(OldItemName="XWeapons.SniperAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_R78Clip","BallisticProV55.AP_M75Clip","BallisticProV55.AP_R9Clip","BallisticProV55.AP_MarlinAmmo"),NewItems=none)
	Replacements[24]=(OldItemName="UTClassic.ClassicSniperAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_R78Clip","BallisticProV55.AP_M75Clip","BallisticProV55.AP_R9Clip","BallisticProV55.AP_MarlinAmmo"),NewItems=none)
	Replacements[25]=(OldItemName="Onslaught.ONSAVRiLAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.AP_G5Ammo","BallisticProV55.AP_M75Clip","BallisticProV55.AP_MACShells"),NewItems=none)
	Replacements[26]=(OldItemName="Onslaught.ONSGrenadeAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.NRP57Pickup","BallisticProV55.FP7Pickup","BallisticProV55.T10Pickup"),NewItems=none)
	Replacements[27]=(OldItemName="Onslaught.ONSMineAmmoPickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.FP9Pickup","BallisticProV55.BX5Pickup"),NewItems=none)
	Replacements[28]=(OldItemName="XPickups.HealthPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_HealthKit"),NewItems=none)
	Replacements[29]=(OldItemName="XPickups.MiniHealthPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_Bandage"),NewItems=none)
	Replacements[30]=(OldItemName="XPickups.AdrenalinePickup",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_Adrenaline"),NewItems=none)
	Replacements[31]=(OldItemName="XPickups.UDamagePack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_UDamage"),NewItems=none)
	Replacements[32]=(OldItemName="XPickups.SuperHealthPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_SuperHealthKit"),NewItems=none)
	Replacements[33]=(OldItemName="XPickups.SuperShieldPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_BigArmor"),NewItems=none)
	Replacements[34]=(OldItemName="XPickups.ShieldPack",OldItem=none,bUseBase=false,bSuper=false,NewItemNames=("BallisticProV55.IP_SmallArmor"),NewItems=none)
	DefaultWeaponName="BallisticProV55.X3knife"
	FriendlyName="BallisticPro: Melee Only"
	Description="Play with Ballistic Weapons mutator using only the melee weapons.||http://www.runestorm.com"
}
