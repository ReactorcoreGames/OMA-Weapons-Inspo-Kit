class GameEngine extends Engine
	transient
	native
	config
	noexport;

struct URL
{
	var string Protocol;
	var string Host;
	var int Port;
	var string Map;
	var array<string> Op;
	var string Portal;
	var int Valid;
};

var Level GLevel;
var Level GEntry;
var PendingLevel GPendingLevel;
var URL LastURL;
var config array<string> ServerActors;
var config array<string> ServerPackages;
var array<Object> DummyArray;
var Object DummyObject;
var string DummyString;
var globalconfig string MainMenuClass;
var globalconfig string SinglePlayerMenuClass;
var globalconfig string ConnectingMenuClass;
var globalconfig string DisconnectMenuClass;
var globalconfig string LoadingClass;
var bool bCheatProtection;
var(Settings) config bool ColorHighDetailMeshes;
var(Settings) config bool ColorSlowCollisionMeshes;
var(Settings) config bool ColorNoCollisionMeshes;
var(Settings) config bool ColorWorldTextures;
var(Settings) config bool ColorPlayerAndWeaponTextures;
var(Settings) config bool ColorInterfaceTextures;
var(VoiceChat) globalconfig bool VoIPAllowVAD;

defaultproperties
{
	CacheSizeMegs=32
}
