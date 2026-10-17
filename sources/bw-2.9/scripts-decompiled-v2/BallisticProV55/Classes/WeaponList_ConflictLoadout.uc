class WeaponList_ConflictLoadout extends Object
	config(BallisticProV55)
	perobjectconfig;

struct Entry
{
	var() config string ClassName;
	var() config bool bRed;
	var() config bool bBlue;
};

var() config array<Entry> ConflictWeapons;
var() config byte LoadoutOption;

defaultproperties
{
	ConflictWeapons[0]=(ClassName="BallisticProV55.X3Knife",bRed=true,bBlue=true)
	ConflictWeapons[1]=(ClassName="BallisticProV55.X4Knife",bRed=true,bBlue=true)
	ConflictWeapons[2]=(ClassName="BallisticProV55.A909SkrithBlades",bRed=true,bBlue=true)
	ConflictWeapons[3]=(ClassName="BallisticProV55.EKS43Katana",bRed=true,bBlue=true)
	ConflictWeapons[4]=(ClassName="BallisticProV55.A42SkrithPistol",bRed=true,bBlue=true)
	ConflictWeapons[5]=(ClassName="BallisticProV55.AM67Pistol",bRed=true,bBlue=true)
	ConflictWeapons[6]=(ClassName="BallisticProV55.BOGPPistol",bRed=true,bBlue=true)
	ConflictWeapons[7]=(ClassName="BallisticProV55.D49Revolver",bRed=true,bBlue=true)
	ConflictWeapons[8]=(ClassName="BallisticProV55.M806Pistol",bRed=true,bBlue=true)
	ConflictWeapons[9]=(ClassName="BallisticProV55.MD24Pistol",bRed=true,bBlue=true)
	ConflictWeapons[10]=(ClassName="BallisticProV55.MRT6Shotgun",bRed=true,bBlue=true)
	ConflictWeapons[11]=(ClassName="BallisticProV55.RS8Pistol",bRed=true,bBlue=true)
	ConflictWeapons[12]=(ClassName="BallisticProV55.leMatRevolver",bRed=true,bBlue=true)
	ConflictWeapons[13]=(ClassName="BallisticProV55.A500Reptile",bRed=true,bBlue=true)
	ConflictWeapons[14]=(ClassName="BallisticProV55.A73SkrithRifle",bRed=true,bBlue=true)
	ConflictWeapons[15]=(ClassName="BallisticProV55.E23PlasmaRifle",bRed=true,bBlue=true)
	ConflictWeapons[16]=(ClassName="BallisticProV55.Fifty9MachinePistol",bRed=true,bBlue=true)
	ConflictWeapons[17]=(ClassName="BallisticProV55.G5Bazooka",bRed=true,bBlue=true)
	ConflictWeapons[18]=(ClassName="BallisticProV55.GRS9Pistol",bRed=true,bBlue=true)
	ConflictWeapons[19]=(ClassName="BallisticProV55.HVCMk9LightningGun",bRed=true,bBlue=true)
	ConflictWeapons[20]=(ClassName="BallisticProV55.M290Shotgun",bRed=true,bBlue=true)
	ConflictWeapons[21]=(ClassName="BallisticProV55.M353Machinegun",bRed=true,bBlue=true)
	ConflictWeapons[22]=(ClassName="BallisticProV55.M46AssaultRifle",bRed=true,bBlue=true)
	ConflictWeapons[23]=(ClassName="BallisticProV55.M50AssaultRifle",bRed=true,bBlue=true)
	ConflictWeapons[24]=(ClassName="BallisticProV55.M75Railgun",bRed=true,bBlue=true)
	ConflictWeapons[25]=(ClassName="BallisticProV55.M763Shotgun",bRed=true,bBlue=true)
	ConflictWeapons[26]=(ClassName="BallisticProV55.M925Machinegun",bRed=true,bBlue=true)
	ConflictWeapons[27]=(ClassName="BallisticProV55.MACWeapon",bRed=true,bBlue=true)
	ConflictWeapons[28]=(ClassName="BallisticProV55.MRS138Shotgun",bRed=true,bBlue=true)
	ConflictWeapons[29]=(ClassName="BallisticProV55.MRocketLauncher",bRed=true,bBlue=true)
	ConflictWeapons[30]=(ClassName="BallisticProV55.MarlinRifle",bRed=true,bBlue=true)
	ConflictWeapons[31]=(ClassName="BallisticProV55.R78Rifle",bRed=true,bBlue=true)
	ConflictWeapons[32]=(ClassName="BallisticProV55.RSDarkStar",bRed=true,bBlue=true)
	ConflictWeapons[33]=(ClassName="BallisticProV55.RSNovaStaff",bRed=true,bBlue=true)
	ConflictWeapons[34]=(ClassName="BallisticProV55.RX22AFlamer",bRed=true,bBlue=true)
	ConflictWeapons[35]=(ClassName="BallisticProV55.SARAssaultRifle",bRed=true,bBlue=true)
	ConflictWeapons[36]=(ClassName="BallisticProV55.SRS900Rifle",bRed=true,bBlue=true)
	ConflictWeapons[37]=(ClassName="BallisticProV55.XK2SubMachinegun",bRed=true,bBlue=true)
	ConflictWeapons[38]=(ClassName="BallisticProV55.XMK5SubMachinegun",bRed=true,bBlue=true)
	ConflictWeapons[39]=(ClassName="BallisticProV55.XMV850Minigun",bRed=true,bBlue=true)
	ConflictWeapons[40]=(ClassName="BallisticProV55.XRS10SubMachinegun",bRed=true,bBlue=true)
	ConflictWeapons[41]=(ClassName="BallisticProV55.FP7Grenade",bRed=true,bBlue=true)
	ConflictWeapons[42]=(ClassName="BallisticProV55.FP9Explosive",bRed=true,bBlue=true)
	ConflictWeapons[43]=(ClassName="BallisticProV55.M58Grenade",bRed=true,bBlue=true)
	ConflictWeapons[44]=(ClassName="BallisticProV55.NRP57Grenade",bRed=true,bBlue=true)
	ConflictWeapons[45]=(ClassName="BallisticProV55.SandbagLayer",bRed=true,bBlue=true)
	ConflictWeapons[46]=(ClassName="BallisticProV55.T10Grenade",bRed=true,bBlue=true)
}
