class Mut_BallisticPreLoad extends Mutator
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var config array< Class<Weapon> > WeaponClassNames;
var() int WeaponsToLoad;
var() string WeaponName;
var globalconfig bool bEnablePreloading;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		WeaponName, WeaponsToLoad;
}

event PostBeginPlay()
{
	local BallisticPreloadReplicationInfo MyRI;
	local int i;
	local Class<Weapon> WeaponClass;

	// End:0xD0
	if(bEnablePreloading)
	{
		MyRI = Spawn(Class'BallisticProV55.BallisticPreloadReplicationInfo');
		WeaponsToLoad = WeaponClassNames.Length;
		MyRI.PreloadNum = WeaponsToLoad;
		i = 0;
		J0x3E:

		// End:0xD0 [Loop If]
		if(i < WeaponsToLoad)
		{
			WeaponClass = Class<Weapon>(DynamicLoadObject(string(WeaponClassNames[i]), Class'Core.Class', true));
			// End:0xC6
			if(WeaponClass != none)
			{
				MyRI.CurrentName[i] = string(WeaponClass.Name);
				MyRI.MeshList[i] = string(WeaponClass.default.Mesh);
			}
			i++;
			// [Loop Continue]
			goto J0x3E;
		}
	}
	SaveConfig();
	super(Actor).PostBeginPlay();
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local PlayerController PC;

	// End:0x2D
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || !bEnablePreloading)
	{
		Disable('Tick');
	}
	PC = Level.GetLocalPlayerController();
	// End:0xBB
	if((PC != none) && bEnablePreloading)
	{
		PC.Player.InteractionMaster.AddInteraction("BallisticProV55.BallisticPreloadInteraction", PC.Player);
		Disable('Tick');
	}
	//return;	
}

function ModifyPlayer(Pawn Other)
{
	local Inventory Inv;

	// End:0xFB
	if((((((bEnablePreloading && Other != none) && Other.Controller != none) && Other.Controller.PlayerReplicationInfo != none) && Other.Controller.PlayerReplicationInfo.Deaths == float(0)) && Other.Controller.PlayerReplicationInfo.bBot == false) && Other.Controller.PlayerReplicationInfo.Score == float(0))
	{
		Inv = Spawn(Class'BallisticProV55.BallisticPreloadInv', Other);
		// End:0xFB
		if(Inv != none)
		{
			Inv.GiveTo(Other);
		}
	}
	super.ModifyPlayer(Other);
	//return;	
}

defaultproperties
{
	WeaponClassNames[0]=Class'BallisticProV55.A42SkrithPistol'
	WeaponClassNames[1]=Class'BallisticProV55.A500Reptile'
	WeaponClassNames[2]=Class'BallisticProV55.A73SkrithRifle'
	WeaponClassNames[3]=Class'BallisticProV55.A909SkrithBlades'
	WeaponClassNames[4]=Class'BallisticProV55.A42SkrithPistol'
	WeaponClassNames[5]=Class'BallisticProV55.AM67Pistol'
	WeaponClassNames[6]=Class'BallisticProV55.BOGPPistol'
	WeaponClassNames[7]=Class'BallisticProV55.BX5Mine'
	WeaponClassNames[8]=Class'BallisticProV55.D49Revolver'
	WeaponClassNames[9]=Class'BallisticProV55.E23PlasmaRifle'
	WeaponClassNames[10]=Class'BallisticProV55.EKS43Katana'
	WeaponClassNames[11]=Class'BallisticProV55.FP7Grenade'
	WeaponClassNames[12]=Class'BallisticProV55.FP9Explosive'
	WeaponClassNames[13]=Class'BallisticProV55.Fifty9MachinePistol'
	WeaponClassNames[14]=Class'BallisticProV55.G5Bazooka'
	WeaponClassNames[15]=Class'BallisticProV55.GRS9Pistol'
	WeaponClassNames[16]=Class'BallisticProV55.HVCMk9LightningGun'
	WeaponClassNames[17]=Class'BallisticProV55.M290Shotgun'
	WeaponClassNames[18]=Class'BallisticProV55.M353Machinegun'
	WeaponClassNames[19]=Class'BallisticProV55.M46AssaultRifle'
	WeaponClassNames[20]=Class'BallisticProV55.M50AssaultRifle'
	WeaponClassNames[21]=Class'BallisticProV55.M58Grenade'
	WeaponClassNames[22]=Class'BallisticProV55.M75Railgun'
	WeaponClassNames[23]=Class'BallisticProV55.M763Shotgun'
	WeaponClassNames[24]=Class'BallisticProV55.M806Pistol'
	WeaponClassNames[25]=Class'BallisticProV55.M925Machinegun'
	WeaponClassNames[26]=Class'BallisticProV55.MACWeapon'
	WeaponClassNames[27]=Class'BallisticProV55.MD24Pistol'
	WeaponClassNames[28]=Class'BallisticProV55.MRS138Shotgun'
	WeaponClassNames[29]=Class'BallisticProV55.MRT6Shotgun'
	WeaponClassNames[30]=Class'BallisticProV55.MRocketLauncher'
	WeaponClassNames[31]=Class'BallisticProV55.MarlinRifle'
	WeaponClassNames[32]=Class'BallisticProV55.NRP57Grenade'
	WeaponClassNames[33]=Class'BallisticProV55.R78Rifle'
	WeaponClassNames[34]=Class'BallisticProV55.RS8Pistol'
	WeaponClassNames[35]=Class'BallisticProV55.RSDarkStar'
	WeaponClassNames[36]=Class'BallisticProV55.RSNovaStaff'
	WeaponClassNames[37]=Class'BallisticProV55.RX22AFlamer'
	WeaponClassNames[38]=Class'BallisticProV55.SARAssaultRifle'
	WeaponClassNames[39]=Class'BallisticProV55.SRS900Rifle'
	WeaponClassNames[40]=Class'BallisticProV55.SandbagLayer'
	WeaponClassNames[41]=Class'BallisticProV55.T10Grenade'
	WeaponClassNames[42]=Class'BallisticProV55.X3Knife'
	WeaponClassNames[43]=Class'BallisticProV55.X4Knife'
	WeaponClassNames[44]=Class'BallisticProV55.XK2SubMachinegun'
	WeaponClassNames[45]=Class'BallisticProV55.XMK5SubMachinegun'
	WeaponClassNames[46]=Class'BallisticProV55.XMV850Minigun'
	WeaponClassNames[47]=Class'BallisticProV55.XRS10SubMachinegun'
	WeaponClassNames[48]=Class'BallisticProV55.leMatRevolver'
	bEnablePreloading=true
	bAddToServerPackages=true
	GroupName="BallisticPro: Resource Preload"
	FriendlyName="BallisticPro: Resource Preload"
	Description="Preloads weapon resources, designed for use with BallisticPro. This will improve overall performance on all machines"
	bAlwaysRelevant=true
	RemoteRole=2
}
