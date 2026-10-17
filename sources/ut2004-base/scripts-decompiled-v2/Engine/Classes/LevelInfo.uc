class LevelInfo extends ZoneInfo
	native
	nativereplication
	config
	notplaceable
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum EPhysicsDetailLevel
{
	PDL_Low,                        // 0
	PDL_Medium,                     // 1
	PDL_High                        // 2
};

enum EMeshLODDetailLevel
{
	MDL_Low,                        // 0
	MDL_Medium,                     // 1
	MDL_High,                       // 2
	MDL_Ultra                       // 3
};

enum ELevelAction
{
	LEVACT_None,                    // 0
	LEVACT_Loading,                 // 1
	LEVACT_Saving,                  // 2
	LEVACT_Connecting,              // 3
	LEVACT_Precaching               // 4
};

enum ENetMode
{
	NM_Standalone,                  // 0
	NM_DedicatedServer,             // 1
	NM_ListenServer,                // 2
	NM_Client                       // 3
};

var float TimeDilation;
var float TimeSeconds;
var transient int Year;
var transient int Month;
var transient int Day;
var transient int DayOfWeek;
var transient int Hour;
var transient int Minute;
var transient int Second;
var transient int Millisecond;
var float PauseDelay;
var(LevelSummary) localized string Title;
var(LevelSummary) string Author;
var(LevelSummary) string Description;
var(LevelSummary) Material Screenshot;
var(LevelSummary) string DecoTextName;
var(LevelSummary) int IdealPlayerCountMin;
var(LevelSummary) int IdealPlayerCountMax;
var(LevelSummary) string ExtraInfo;
var(SinglePlayer) int SinglePlayerTeamSize;
var(RadarMap) Material RadarMapImage;
var(RadarMap) float CustomRadarRange;
var() config LevelInfo.EPhysicsDetailLevel PhysicsDetailLevel;
var() config LevelInfo.EMeshLODDetailLevel MeshLODDetailLevel;
var(Karma) float KarmaTimeScale;
var(Karma) float RagdollTimeScale;
var(Karma) int MaxRagdolls;
var(Karma) float KarmaGravScale;
var(Karma) bool bKStaticFriction;
var() bool bKNoInit;
var int LastTaunt[2];
var config float DecalStayScale;
var() localized string LevelEnterText;
var() string LocalizedPkg;
var PlayerReplicationInfo Pauser;
var LevelSummary Summary;
var string VisibleGroups;
var(LevelSummary) bool HideFromMenus;
var() bool bLonePlayer;
var bool bBegunPlay;
var bool bPlayersOnly;
var bool bFreezeKarma;
var const Object.EDetailMode DetailMode;
var bool bDropDetail;
var bool bAggressiveLOD;
var bool bStartup;
var config bool bLowSoundDetail;
var bool bPathsRebuilt;
var bool bHasPathNodes;
var bool bLevelChange;
var globalconfig bool bShouldPreload;
var globalconfig bool bDesireSkinPreload;
var globalconfig bool bKickLiveIdlers;
var bool bSkinsPreloaded;
var bool bClassicView;
var(RadarMap) bool bShowRadarMap;
var(RadarMap) bool bUseTerrainForRadarRange;
var bool bIsSaveGame;
var(SaveGames) bool bSupportSaveGames;
var config bool bNeverPrecache;
var() int LevelTextureLODBias;
var float AnimMeshGlobalLOD;
var() Vector CameraLocationDynamic;
var() Vector CameraLocationTop;
var() Vector CameraLocationFront;
var() Vector CameraLocationSide;
var() Rotator CameraRotationDynamic;
var(Audio) string Song;
var(Audio) float PlayerDoppler;
var(Audio) float MusicVolumeOverride;
var() float Brightness;
var Texture DefaultTexture;
var Texture WireframeTexture;
var Texture WhiteSquareTexture;
var Texture LargeVertex;
var int HubStackLevel;
var transient LevelInfo.ELevelAction LevelAction;
var transient GameReplicationInfo GRI;
var LevelInfo.ENetMode NetMode;
var string ComputerName;
var string EngineVersion;
var string MinNetVersion;
var() string DefaultGameType;
var() string PreCacheGame;
var GameInfo Game;
var float DefaultGravity;
var float LastVehicleCheck;
var() float StallZ;
var const NavigationPoint NavigationPointList;
var const Controller ControllerList;
var private PlayerController LocalPlayerController;
var(Headlights) bool bUseHeadlights;
var(Headlights) float HeadlightScaling;
var string NextURL;
var bool bNextItems;
var float NextSwitchCountdown;
var transient ObjectPool ObjectPool;
var transient array<Material> PrecacheMaterials;
var transient array<StaticMesh> PrecacheStaticMeshes;
var private const array<string> OfflinePackageMap;
var(Camouflage) StaticMesh IndoorCamouflageMesh;
var(Camouflage) float IndoorMeshDrawscale;
var(Camouflage) StaticMesh OutdoorCamouflageMesh;
var(Camouflage) float OutdoorMeshDrawscale;
var(DustColor) Color DustColor;
var(DustColor) Color WaterDustColor;
var float MoveRepSize;
var globalconfig float MaxClientFrameRate;
var globalconfig float MaxTimeMargin;
var globalconfig float TimeMarginSlack;
var globalconfig float MinTimeMargin;
var const PlayerController ReplicationViewer;
var const Actor ReplicationViewTarget;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		DefaultGravity, Pauser, 
		TimeDilation;

	// Pos:0x018
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		KarmaGravScale, KarmaTimeScale, 
		RagdollTimeScale;
}

// Export ULevelInfo::execDetailChange(FFrame&, void* const)
native simulated function DetailChange(Object.EDetailMode NewDetailMode);

// Export ULevelInfo::execIsEntry(FFrame&, void* const)
native simulated function bool IsEntry();

// Export ULevelInfo::execUpdateDistanceFogLOD(FFrame&, void* const)
native simulated function UpdateDistanceFogLOD(float LOD);

// Export ULevelInfo::execForceLoadTexture(FFrame&, void* const)
native simulated function ForceLoadTexture(Texture Texture);

// Export ULevelInfo::execGetPhysicsVolume(FFrame&, void* const)
native simulated function PhysicsVolume GetPhysicsVolume(Vector loc);

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	DecalStayScale = float(Max(int(DecalStayScale), 0));
	//return;	
}

simulated function Class<GameInfo> GetGameClass()
{
	local Class<GameInfo> G;

	// End:0x2C
	if(Level.Game != none)
	{
		return Level.Game.Class;
	}
	// End:0x72
	if((GRI != none) && GRI.GameClass != "")
	{
		G = Class<GameInfo>(DynamicLoadObject(GRI.GameClass, Class'Core.Class'));
	}
	// End:0x83
	if(G != none)
	{
		return G;
	}
	// End:0xAA
	if(DefaultGameType != "")
	{
		G = Class<GameInfo>(DynamicLoadObject(DefaultGameType, Class'Core.Class'));
	}
	return G;
	//return;	
}

simulated event FillPrecacheMaterialsArray(bool FullPrecache)
{
	local Actor A;
	local Class<GameInfo> G;
	local bool bRealDesire;

	// End:0x12
	if(int(NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x14A
	if(!bSkinsPreloaded || FullPrecache)
	{
		// End:0x4A
		if(Game != none)
		{
			G = Game.Class;			
		}
		else
		{
			// End:0x90
			if((GRI != none) && GRI.GameClass != "")
			{
				G = Class<GameInfo>(DynamicLoadObject(GRI.GameClass, Class'Core.Class'));
			}
		}
		// End:0xB3
		if(G != none)
		{
			G.static.PrecacheGameTextures(self);
			bSkinsPreloaded = true;
		}
		// End:0xE7
		if((G == none) && DefaultGameType != "")
		{
			G = Class<GameInfo>(DynamicLoadObject(DefaultGameType, Class'Core.Class'));
		}
		// End:0x10D
		if(G == none)
		{
			G = Class<GameInfo>(DynamicLoadObject(PreCacheGame, Class'Core.Class'));
		}
		// End:0x14A
		if(G != none)
		{
			bRealDesire = bDesireSkinPreload;
			bDesireSkinPreload = false;
			G.static.PrecacheGameTextures(self);
			bDesireSkinPreload = bRealDesire;
		}
	}
	// End:0x19A
	foreach AllActors(Class'Engine.Actor', A)
	{
		// End:0x199
		if(!A.bAlreadyPrecachedMaterials || FullPrecache)
		{
			A.UpdatePrecacheMaterials();
			A.bAlreadyPrecachedMaterials = true;
		}		
	}	
	//return;	
}

simulated function PrecacheAnnouncements()
{
	//return;	
}

simulated event FillPrecacheStaticMeshesArray(bool FullPrecache)
{
	local Actor A;
	local Class<GameInfo> G;

	// End:0x12
	if(int(NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xD8
	if(Game == none)
	{
		// End:0x63
		if((GRI != none) && GRI.GameClass != "")
		{
			G = Class<GameInfo>(DynamicLoadObject(GRI.GameClass, Class'Core.Class'));
		}
		// End:0x97
		if((G == none) && DefaultGameType != "")
		{
			G = Class<GameInfo>(DynamicLoadObject(DefaultGameType, Class'Core.Class'));
		}
		// End:0xBD
		if(G == none)
		{
			G = Class<GameInfo>(DynamicLoadObject(PreCacheGame, Class'Core.Class'));
		}
		// End:0xD8
		if(G != none)
		{
			G.static.PrecacheGameStaticMeshes(self);
		}
	}
	// End:0x128
	foreach AllActors(Class'Engine.Actor', A)
	{
		// End:0x127
		if(!A.bAlreadyPrecachedMeshes || FullPrecache)
		{
			A.UpdatePrecacheStaticMeshes();
			A.bAlreadyPrecachedMeshes = true;
		}		
	}	
	//return;	
}

simulated function AddPrecacheMaterial(Material mat)
{
	local int Index;

	// End:0x12
	if(int(NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x1F
	if(mat == none)
	{
		return;
	}
	Index = Level.PrecacheMaterials.Length;
	PrecacheMaterials.Insert(Index, 1);
	PrecacheMaterials[Index] = mat;
	//return;	
}

simulated function AddPrecacheStaticMesh(StaticMesh stat)
{
	local int Index;

	// End:0x12
	if(int(NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x1F
	if(stat == none)
	{
		return;
	}
	Index = Level.PrecacheStaticMeshes.Length;
	PrecacheStaticMeshes.Insert(Index, 1);
	PrecacheStaticMeshes[Index] = stat;
	//return;	
}

// Export ULevelInfo::execGetLocalURL(FFrame&, void* const)
native simulated function string GetLocalURL();

// Export ULevelInfo::execIsDemoBuild(FFrame&, void* const)
native static final simulated function bool IsDemoBuild();

// Export ULevelInfo::execIsSoftwareRendering(FFrame&, void* const)
native static final simulated function bool IsSoftwareRendering();

// Export ULevelInfo::execGetAddressURL(FFrame&, void* const)
native simulated function string GetAddressURL();

// Export ULevelInfo::execIsPendingConnection(FFrame&, void* const)
native simulated function bool IsPendingConnection();

event ServerTravel(string URL, bool bItems)
{
	// End:0x39
	if(InStr(URL, "%") >= 0)
	{
		Log("URL Contains illegal character '%'.");
		return;
	}
	// End:0x7E
	if(((InStr(URL, ":") >= 0) || InStr(URL, "/") >= 0) || InStr(URL, "\\") >= 0)
	{
		Log("URL blocked");
		return;
	}
	// End:0xDD
	if(NextURL == "")
	{
		bLevelChange = true;
		bNextItems = bItems;
		NextURL = URL;
		// End:0xD2
		if(Game != none)
		{
			Game.ProcessServerTravel(URL, bItems);			
		}
		else
		{
			NextSwitchCountdown = 0.0000000;
		}
	}
	//return;	
}

function ThisIsNeverExecuted()
{
	local DefaultPhysicsVolume P;

	P = none;
	//return;	
}

function Reset()
{
	DefaultGravity = default.DefaultGravity;
	ConsoleCommand("OBJ GARBAGE");
	super(Actor).Reset();
	//return;	
}

simulated event PreBeginPlay()
{
	super.PreBeginPlay();
	ObjectPool = new (XLevel) Class'Engine.ObjectPool';
	//return;	
}

event PostLoadSavedGame()
{
	// End:0x1E
	if(ObjectPool == none)
	{
		ObjectPool = new (XLevel) Class'Engine.ObjectPool';
	}
	//return;	
}

// Export ULevelInfo::execGetLocalPlayerController(FFrame&, void* const)
native final function PlayerController GetLocalPlayerController();

defaultproperties
{
	TimeDilation=1.1000000
	Title="Untitled"
	Author="Anonymous"
	IdealPlayerCountMin=6
	IdealPlayerCountMax=10
	CustomRadarRange=10000.0000000
	PhysicsDetailLevel=1
	MeshLODDetailLevel=1
	KarmaTimeScale=0.9000000
	RagdollTimeScale=1.0000000
	MaxRagdolls=4
	KarmaGravScale=1.0000000
	bKStaticFriction=true
	DecalStayScale=1.0000000
	VisibleGroups="None"
	DetailMode=2
	bShowRadarMap=true
	bUseTerrainForRadarRange=true
	AnimMeshGlobalLOD=1.0000000
	MusicVolumeOverride=-1.0000000
	Brightness=1.0000000
	DefaultTexture=Texture'Engine.DefaultTexture'
	WireframeTexture=Texture'Engine.WhiteSquareTexture'
	WhiteSquareTexture=Texture'Engine.WhiteSquareTexture'
	LargeVertex=Texture'Engine.LargeVertex'
	PreCacheGame="xGame.xDeathMatch"
	DefaultGravity=-950.0000000
	StallZ=10000.0000000
	bUseHeadlights=true
	HeadlightScaling=1.0000000
	IndoorMeshDrawscale=1.0000000
	OutdoorMeshDrawscale=1.0000000
	WaterDustColor=(R=255,G=255,B=255,A=0)
	MoveRepSize=42.0000000
	MaxClientFrameRate=90.0000000
	MaxTimeMargin=1.0000000
	TimeMarginSlack=1.3500000
	MinTimeMargin=-1.0000000
	bWorldGeometry=true
	bAlwaysRelevant=true
	RemoteRole=1
	bHiddenEd=true
}
