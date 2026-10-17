class CacheManager extends Object
	transient
	native
	exportstructs;

struct native init GameRecord
{
	var() const string ClassName;
	var() const string GameName;
	var() const string Description;
	var() const string TextName;
	var() const string GameAcronym;
	var() const string MapListClassName;
	var() const string MapPrefix;
	var() const string ScreenshotRef;
	var() const string HUDMenu;
	var() const string RulesMenu;
	var() const bool bTeamGame;
	var() const byte GameTypeGroup;
	var const int RecordIndex;
};

struct native init MutatorRecord
{
	var() const string ClassName;
	var() const string FriendlyName;
	var() const string Description;
	var() const string IconMaterialName;
	var() const string ConfigMenuClassName;
	var() const string GroupName;
	var const int RecordIndex;
	var const byte bActivated;
};

struct native init MapRecord
{
	var() const string Acronym;
	var() const string MapName;
	var() const string TextName;
	var() const string FriendlyName;
	var() const string Author;
	var() const string Description;
	var() const int PlayerCountMin;
	var() const int PlayerCountMax;
	var() const string ScreenshotRef;
	var() const string ExtraInfo;
	var const int RecordIndex;
};

struct native init WeaponRecord
{
	var() const string ClassName;
	var() const string PickupClassName;
	var() const string AttachmentClassName;
	var() const string Description;
	var() const string TextName;
	var() const string FriendlyName;
	var const int RecordIndex;
};

struct native init VehicleRecord
{
	var() const string ClassName;
	var() const string FriendlyName;
	var() const string Description;
	var const int RecordIndex;
};

struct native init CrosshairRecord
{
	var() const string FriendlyName;
	var() const Texture CrosshairTexture;
	var const int RecordIndex;
};

struct native init AnnouncerRecord
{
	var() const string ClassName;
	var() const string FriendlyName;
	var() const string PackageName;
	var() const string FallbackPackage;
	var() const bool bEnglishOnly;
	var const int RecordIndex;
};

struct native Standard
{
	var() const array<string> Classes;
	var() const array<string> Maps;
};

var() private const array<Standard> DefaultContent;
var() private const array<MutatorRecord> CacheMutators;
var() private const array<MapRecord> CacheMaps;
var() private const array<WeaponRecord> CacheWeapons;
var() private const array<VehicleRecord> CacheVehicles;
var() private const array<CrosshairRecord> CacheCrosshairs;
var() private const array<GameRecord> CacheGameTypes;
var() private const array<AnnouncerRecord> CacheAnnouncers;
var private native transient pointer FileManager;
var private native transient pointer Tracker;

// Export UCacheManager::execInitCache(FFrame&, void* const)
native(800) static final function InitCache();

// Export UCacheManager::execIs2003Content(FFrame&, void* const)
native(801) static final function bool Is2003Content(string Item);

// Export UCacheManager::execIs2004Content(FFrame&, void* const)
native(802) static final function bool Is2004Content(string Item);

// Export UCacheManager::execIsBPContent(FFrame&, void* const)
native(803) static final function bool IsBPContent(string Item);

// Export UCacheManager::execIsDefaultContent(FFrame&, void* const)
native(830) static final function bool IsDefaultContent(string Item);

// Export UCacheManager::execGetGameTypeList(FFrame&, void* const)
native(804) static final function GetGameTypeList(out array<GameRecord> GameRecords, optional string FilterType);

// Export UCacheManager::execGetMapList(FFrame&, void* const)
native(805) static final function GetMapList(out array<MapRecord> MapRecords, optional string Acronym);

// Export UCacheManager::execGetWeaponList(FFrame&, void* const)
native(806) static final function GetWeaponList(out array<WeaponRecord> WeaponRecords);

// Export UCacheManager::execGetVehicleList(FFrame&, void* const)
native(807) static final function GetVehicleList(out array<VehicleRecord> VehicleRecords);

// Export UCacheManager::execGetCrosshairList(FFrame&, void* const)
native(808) static final function GetCrosshairList(out array<CrosshairRecord> CrosshairRecords);

// Export UCacheManager::execGetMutatorList(FFrame&, void* const)
native(809) static final function GetMutatorList(out array<MutatorRecord> MutatorRecords);

// Export UCacheManager::execGetAnnouncerList(FFrame&, void* const)
native(810) static final function GetAnnouncerList(out array<AnnouncerRecord> AnnouncerRecords);

// Export UCacheManager::execGetTeamSymbolList(FFrame&, void* const)
native(811) static final function GetTeamSymbolList(out array<string> SymbolNames, optional bool bNoSinglePlayer);

// Export UCacheManager::execGetGameRecord(FFrame&, void* const)
native(818) static final function GameRecord GetGameRecord(coerce string ClassName);

// Export UCacheManager::execGetMapRecord(FFrame&, void* const)
native(819) static final function MapRecord GetMapRecord(string MapName);

// Export UCacheManager::execGetMutatorRecord(FFrame&, void* const)
native(880) static final function MutatorRecord GetMutatorRecord(coerce string ClassName);

// Export UCacheManager::execGetWeaponRecord(FFrame&, void* const)
native(881) static final function WeaponRecord GetWeaponRecord(coerce string ClassName);

// Export UCacheManager::execGetVehicleRecord(FFrame&, void* const)
native(882) static final function VehicleRecord GetVehicleRecord(coerce string ClassName);

// Export UCacheManager::execGetAnnouncerRecord(FFrame&, void* const)
native(883) static final function AnnouncerRecord GetAnnouncerRecord(coerce string ClassName);

defaultproperties
{
	DefaultContent[0]=(Classes=("UTClassic.MutUTClassic","UnrealGame.MutLowGrav","UnrealGame.MutBigHead","XGame.xTeamGame","XGame.xDeathMatch","XGame.xCTFGame","XGame.InstagibCTF","XGame.xVehicleCTFGame","XGame.xDoubleDom","XGame.xBombingRun","XGame.MutRegen","XGame.MutInstaGib","XGame.MutQuadJump","XGame.MutSpeciesStats","XGame.MutVampire","XGame.MutSlomoDeath","XGame.MutNoAdrenaline","XGame.MutZoomInstagib","XWeapons.Translauncher","XWeapons.ShockRifle","XWeapons.LinkGun","XWeapons.MutArena","XWeapons.Minigun","XWeapons.BioRifle","XWeapons.FlakCannon","XWeapons.RocketLauncher","XWeapons.ShieldGun","XWeapons.SniperRifle","XWeapons.Painter","XWeapons.MutNoSuperWeapon","XWeapons.AssaultRifle","XWeapons.Redeemer","Vehicles.Bulldog"),Maps=("BR-Anubis","BR-Bifrost","BR-Disclosure","BR-IceFields","BR-Skyline","BR-Slaughterhouse","BR-TwinTombs","CTF-Chrome","CTF-Citadel","CTF-December","CTF-Face3","CTF-Geothermal","CTF-Lostfaith","CTF-Magma","CTF-Maul","CTF-Orbital2","DM-Antalus","DM-Asbestos","DM-Compressed","DM-Flux2","DM-Gael","DM-Inferno","DM-Insidious","DM-Leviathan","DM-Oceanic","DM-Phobos2","DM-Plunge","DM-1on1-Serpentine","DM-TokaraForest","DM-TrainingDay","DOM-Core","DOM-OutRigger","DOM-Ruination","DOM-ScorchedEarth","DOM-SepukkuGorge","DOM-Suntemple","TUT-BR","TUT-CTF","TUT-DM","TUT-DOM2"))
	DefaultContent[1]=(Classes=("BonusPack.xLastManStandingGame","BonusPack.xMutantGame","BonusPack.MutCrateCombo","SkaarjPack.Invasion"),Maps=("BR-Canyon","CTF-Avaris","CTF-DoubleDammage","DM-1on1-Crash","DM-1on1-Mixer","DM-Icetomb","DM-Injector","DM-IronDeity","DM-Rustatorium","DOM-Junkyard","BR-DE-ElecFields","CTF-DE-ElecFields","CTF-DE-LavaGiant2","DM-DE-GrendelKeep","DM-DE-Ironic","DM-DE-Osiris2"))
	DefaultContent[2]=(Classes=("XInterface.DefaultCrosshairs","Onslaught.ONSCrosshairs","UTClassic.MutUseSniper","UTClassic.MutUseLightning","Onslaught.ONSOnslaughtGame","Onslaught.MutOnslaughtWeapons","Onslaught.ONSAVRiL","Onslaught.ONSGrenadeLauncher","Onslaught.ONSMineLayer","Onslaught.MutLightweightVehicles","UT2k4Assault.ASGameInfo","UTClassic.ClassicSniperRifle","UnrealGame.FemaleAnnouncer","UnrealGame.MaleAnnouncer","UnrealGame.SexyFemaleAnnouncer"),Maps=("AS-Convoy","AS-FallenCity","AS-Glacier","AS-MotherShip","AS-RobotFactory","AS-Junkyard","BR-BridgeOfFate","BR-Colossus","BR-Serenity","CTF-AbsoluteZero","CTF-Colossus","CTF-Grendelkeep","CTF-MoonDragon","DM-1on1-Albatross","DM-1on1-Idoma","DM-1on1-Irondust","DM-1on1-Roughinery","DM-1on1-Spirit","DM-1on1-Squader","DM-1on1-Trite","DM-1on1-Desolation","DM-Corrugation","DM-Gestalt","DM-Goliath","DM-Hyperblast2","DM-Junkyard","DM-Metallurgy","DM-Morpheus3","DM-Rankin","DM-Rrajigar","DM-Sulphur","DOM-Atlantis","DOM-Aswan","DOM-Conduit","DOM-Renascent","ONS-ArcticStronghold","ONS-Crossfire","ONS-Torlan","CTF-1on1-Joust","CTF-BridgeOfFate","CTF-Grassyknoll","CTF-Smote","DM-DesertIsle","DOM-Access","ONS-Dria","ONS-Severance","ONS-RedPlanet","ONS-Dawn","CTF-FaceClassic","CTF-January","DM-Curse4","DM-Deck17","ONS-Frostbite","TUT-ONS","CTF-TwinTombs","ONS-Primeval","ONS-Adara","ONS-Aridoom","ONS-Ascendancy","ONS-IslandHop","ONS-Tricky","ONS-Urban","AS-BP2-Acatana","AS-BP2-JumpShip","AS-BP2-Outback","AS-BP2-SubRosa","AS-BP2-Thrust","CTF-BP2-Concentrate","CTF-BP2-Pistola","DM-BP2-Calandras","DM-BP2-GoopGod"))
	DefaultContent[3]=(Classes=("OnslaughtFull.MutVehicleArena","OnslaughtFull.ONSBomber","OnslaughtFull.ONSPainter","OnslaughtFull.ONSMobileAssaultStation","UT2k4AssaultFull.ASVehicle_SpaceFighter_Human","UT2k4AssaultFull.ASVehicle_SpaceFighter_Skaarj","XGame.MutUDamageReward","UTV2004s.utvMutator"),Maps=("MOV-UT2004-Intro","Mov-UT2-intro"))
}
