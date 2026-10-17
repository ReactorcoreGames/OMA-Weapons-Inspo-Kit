class Actor extends Object
	abstract
	native
	nativereplication;

const MAXSTEPHEIGHT = 35.0;
const MINFLOORZ = 0.7;

enum ELightType
{
	LT_None,                        // 0
	LT_Steady,                      // 1
	LT_Pulse,                       // 2
	LT_Blink,                       // 3
	LT_Flicker,                     // 4
	LT_Strobe,                      // 5
	LT_BackdropLight,               // 6
	LT_SubtlePulse,                 // 7
	LT_TexturePaletteOnce,          // 8
	LT_TexturePaletteLoop,          // 9
	LT_FadeOut                      // 10
};

enum ELightEffect
{
	LE_None,                        // 0
	LE_TorchWaver,                  // 1
	LE_FireWaver,                   // 2
	LE_WateryShimmer,               // 3
	LE_Searchlight,                 // 4
	LE_SlowWave,                    // 5
	LE_FastWave,                    // 6
	LE_CloudCast,                   // 7
	LE_StaticSpot,                  // 8
	LE_Shock,                       // 9
	LE_Disco,                       // 10
	LE_Warp,                        // 11
	LE_Spotlight,                   // 12
	LE_NonIncidence,                // 13
	LE_Shell,                       // 14
	LE_OmniBumpMap,                 // 15
	LE_Interference,                // 16
	LE_Cylinder,                    // 17
	LE_Rotor,                       // 18
	LE_Negative,                    // 19
	LE_Sunlight,                    // 20
	LE_QuadraticNonIncidence        // 21
};

enum EDrawType
{
	DT_None,                        // 0
	DT_Sprite,                      // 1
	DT_Mesh,                        // 2
	DT_Brush,                       // 3
	DT_RopeSprite,                  // 4
	DT_VerticalSprite,              // 5
	DT_Terraform,                   // 6
	DT_SpriteAnimOnce,              // 7
	DT_StaticMesh,                  // 8
	DT_DrawType,                    // 9
	DT_Particle,                    // 10
	DT_AntiPortal,                  // 11
	DT_FluidSurface                 // 12
};

enum EFilterState
{
	FS_Maybe,                       // 0
	FS_Yes,                         // 1
	FS_No                           // 2
};

enum EPhysics
{
	PHYS_None,                      // 0
	PHYS_Walking,                   // 1
	PHYS_Falling,                   // 2
	PHYS_Swimming,                  // 3
	PHYS_Flying,                    // 4
	PHYS_Rotating,                  // 5
	PHYS_Projectile,                // 6
	PHYS_Interpolating,             // 7
	PHYS_MovingBrush,               // 8
	PHYS_Spider,                    // 9
	PHYS_Trailer,                   // 10
	PHYS_Ladder,                    // 11
	PHYS_RootMotion,                // 12
	PHYS_Karma,                     // 13
	PHYS_KarmaRagDoll,              // 14
	PHYS_Hovering,                  // 15
	PHYS_CinMotion                  // 16
};

enum ENetRole
{
	ROLE_None,                      // 0
	ROLE_DumbProxy,                 // 1
	ROLE_SimulatedProxy,            // 2
	ROLE_AutonomousProxy,           // 3
	ROLE_Authority                  // 4
};

enum EUV2Mode
{
	UVM_MacroTexture,               // 0
	UVM_LightMap,                   // 1
	UVM_Skin                        // 2
};

enum ESurfaceTypes
{
	EST_Default,                    // 0
	EST_Rock,                       // 1
	EST_Dirt,                       // 2
	EST_Metal,                      // 3
	EST_Wood,                       // 4
	EST_Plant,                      // 5
	EST_Flesh,                      // 6
	EST_Ice,                        // 7
	EST_Snow,                       // 8
	EST_Water,                      // 9
	EST_Glass,                      // 10
	EST_Custom00,                   // 11
	EST_Custom01,                   // 12
	EST_Custom02,                   // 13
	EST_Custom03,                   // 14
	EST_Custom04,                   // 15
	EST_Custom05,                   // 16
	EST_Custom06,                   // 17
	EST_Custom07,                   // 18
	EST_Custom08,                   // 19
	EST_Custom09,                   // 20
	EST_Custom10,                   // 21
	EST_Custom11,                   // 22
	EST_Custom12,                   // 23
	EST_Custom13,                   // 24
	EST_Custom14,                   // 25
	EST_Custom15,                   // 26
	EST_Custom16,                   // 27
	EST_Custom17,                   // 28
	EST_Custom18,                   // 29
	EST_Custom19,                   // 30
	EST_Custom20,                   // 31
	EST_Custom21,                   // 32
	EST_Custom22,                   // 33
	EST_Custom23,                   // 34
	EST_Custom24,                   // 35
	EST_Custom25,                   // 36
	EST_Custom26,                   // 37
	EST_Custom27,                   // 38
	EST_Custom28,                   // 39
	EST_Custom29,                   // 40
	EST_Custom30,                   // 41
	EST_Custom31                    // 42
};

enum ERenderStyle
{
	STY_None,                       // 0
	STY_Normal,                     // 1
	STY_Masked,                     // 2
	STY_Translucent,                // 3
	STY_Modulated,                  // 4
	STY_Alpha,                      // 5
	STY_Additive,                   // 6
	STY_Subtractive,                // 7
	STY_Particle,                   // 8
	STY_AlphaZ                      // 9
};

enum ESoundOcclusion
{
	OCCLUSION_Default,              // 0
	OCCLUSION_None,                 // 1
	OCCLUSION_BSP,                  // 2
	OCCLUSION_StaticMeshes          // 3
};

enum ESoundSlot
{
	SLOT_None,                      // 0
	SLOT_Misc,                      // 1
	SLOT_Pain,                      // 2
	SLOT_Interact,                  // 3
	SLOT_Ambient,                   // 4
	SLOT_Talk,                      // 5
	SLOT_Interface                  // 6
};

enum EMusicTransition
{
	MTRAN_None,                     // 0
	MTRAN_Instant,                  // 1
	MTRAN_Segue,                    // 2
	MTRAN_Fade,                     // 3
	MTRAN_FastFade,                 // 4
	MTRAN_SlowFade                  // 5
};

enum EForceType
{
	FT_None,                        // 0
	FT_DragAlong,                   // 1
	FT_Constant                     // 2
};

enum ETravelType
{
	TRAVEL_Absolute,                // 0
	TRAVEL_Partial,                 // 1
	TRAVEL_Relative                 // 2
};

enum EDoubleClickDir
{
	DCLICK_None,                    // 0
	DCLICK_Left,                    // 1
	DCLICK_Right,                   // 2
	DCLICK_Forward,                 // 3
	DCLICK_Back,                    // 4
	DCLICK_Active,                  // 5
	DCLICK_Done                     // 6
};

enum eKillZType
{
	KILLZ_None,                     // 0
	KILLZ_Lava,                     // 1
	KILLZ_Suicide                   // 2
};

enum EFlagState
{
	FLAG_Home,                      // 0
	FLAG_HeldFriendly,              // 1
	FLAG_HeldEnemy,                 // 2
	FLAG_Down                       // 3
};

struct BatchReference
{
	var int BatchIndex;
	var int ElementIndex;
};

struct PointRegion
{
	var ZoneInfo Zone;
	var int iLeaf;
	var byte ZoneNumber;
};

struct KRBVec
{
	var float X;
	var float Y;
	var float Z;
};

struct KRigidBodyState
{
	var KRBVec Position;
	var Quat Quaternion;
	var KRBVec LinVel;
	var KRBVec AngVel;
};

struct KSimParams
{
	var float GammaPerSec;
	var float Epsilon;
	var float PenetrationOffset;
	var float PenetrationScale;
	var float ContactSoftness;
	var float MaxPenetration;
	var float MaxTimestep;
};

struct AnimRep
{
	var name AnimSequence;
	var bool bAnimLoop;
	var byte AnimRate;
	var byte AnimFrame;
	var byte TweenRate;
};

struct FireProperties
{
	var Class<Ammunition> AmmoClass;
	var Class<Projectile> ProjectileClass;
	var float WarnTargetPct;
	var float MaxRange;
	var bool bTossed;
	var bool bTrySplash;
	var bool bLeadTarget;
	var bool bInstantHit;
	var bool bInitialized;
};

var(Lighting) Actor.ELightType LightType;
var(Lighting) Actor.ELightEffect LightEffect;
var(LightColor) byte LightHue;
var(LightColor) byte LightSaturation;
var(LightColor) float LightBrightness;
var(Lighting) float LightRadius;
var(Lighting) byte LightPeriod;
var(Lighting) byte LightPhase;
var(Lighting) byte LightCone;
var(Display) const Actor.EDrawType DrawType;
var native const Actor.EFilterState StaticFilterState;
var(Display) const StaticMesh StaticMesh;
var const Actor Owner;
var const Actor Base;
var private native transient pointer ActorRenderData;
var private native transient pointer LightRenderData;
var native const int RenderRevision;
var native const array<BatchReference> StaticSectionBatches;
var(Display) const name ForcedVisibilityZoneTag;
var(Display) float CullDistance;
var(Lighting) bool bSpecialLit;
var(Lighting) bool bActorShadows;
var(Lighting) bool bCorona;
var(Lighting) bool bDirectionalCorona;
var(Lighting) bool bAttenByLife;
var(Lighting) bool bLightingVisibility;
var(Display) bool bUseDynamicLights;
var bool bLightChanged;
var bool bDramaticLighting;
var const bool bStatic;
var(Advanced) bool bHidden;
var(Advanced) const bool bNoDelete;
var const bool bDeleteMe;
var const transient bool bTicked;
var(Lighting) bool bDynamicLight;
var bool bTimerLoop;
var bool bOnlyOwnerSee;
var(Advanced) bool bHighDetail;
var(Advanced) bool bSuperHighDetail;
var bool bOnlyDrawIfAttached;
var(Advanced) bool bStasis;
var bool bTrailerAllowRotation;
var bool bTrailerSameRotation;
var bool bTrailerPrePivot;
var bool bWorldGeometry;
var(Display) bool bAcceptsProjectors;
var bool bOrientOnSlope;
var const bool bOnlyAffectPawns;
var(Display) bool bDisableSorting;
var(Movement) bool bIgnoreEncroachers;
var bool bShowOctreeNodes;
var bool bWasSNFiltered;
var const transient bool bShouldStopKarma;
var const bool bDetailAttachment;
var const bool bNetTemporary;
var bool bOnlyRelevantToOwner;
var const transient bool bNetDirty;
var bool bAlwaysRelevant;
var bool bReplicateInstigator;
var bool bReplicateMovement;
var bool bSkipActorPropertyReplication;
var bool bUpdateSimulatedPosition;
var bool bTearOff;
var bool bOnlyDirtyReplication;
var bool bReplicateAnimations;
var const bool bNetInitialRotation;
var bool bCompressedPosition;
var bool bAlwaysZeroBoneOffset;
var bool bIgnoreVehicles;
var(Display) bool bDeferRendering;
var bool bBadStateCode;
var(Movement) const Actor.EPhysics Physics;
var Actor.ENetRole RemoteRole;
var Actor.ENetRole Role;
var const transient int NetTag;
var float NetUpdateTime;
var float NetUpdateFrequency;
var float NetPriority;
var Pawn Instigator;
var(Sound) Sound AmbientSound;
var const name AttachmentBone;
var const LevelInfo Level;
var const transient Level XLevel;
var(Advanced) float LifeSpan;
var const PointRegion Region;
var float TimerRate;
var(Display) Material OverlayMaterial;
var(Display) const Mesh Mesh;
var transient float LastRenderTime;
var(Events) name Tag;
var transient array<int> Leaves;
var(Events) name Event;
var Inventory Inventory;
var const float TimerCounter;
var transient MeshInstance MeshInstance;
var(Display) float LODBias;
var(Object) name InitialState;
var(Object) name Group;
var const array<Actor> Touching;
var private native transient array<native transient pointer> OctreeNodes;
var const transient Box OctreeBox;
var const transient Vector OctreeBoxCenter;
var const transient Vector OctreeBoxRadii;
var private native transient pointer NetInitialCache;
var const Actor Deleted;
var const float LatentFloat;
var native const int CollisionTag;
var const transient int JoinedTag;
var const PhysicsVolume PhysicsVolume;
var(Movement) const Vector Location;
var(Movement) const Rotator Rotation;
var(Movement) Vector Velocity;
var Vector Acceleration;
var const Vector RotationRemainder;
var const Vector CachedLocation;
var const Rotator CachedRotation;
var Matrix CachedLocalToWorld;
var(Movement) name AttachTag;
var const array<Actor> Attached;
var const Vector RelativeLocation;
var const Rotator RelativeRotation;
var const Matrix HardRelMatrix;
var native transient array<native transient pointer> Projectors;
var private native transient array<native transient pointer> StaticMeshProjectors;
var(Display) Material Texture;
var StaticMeshInstance StaticMeshInstance;
var const export Model Brush;
var(Display) const float DrawScale;
var(Display) const Vector DrawScale3D;
var(Display) Vector PrePivot;
var(Display) array<Material> Skins;
var Material RepSkin;
var(Display) byte AmbientGlow;
var(Display) byte MaxLights;
var(Display) Actor.EUV2Mode UV2Mode;
var(Display) export ConvexVolume AntiPortal;
var(Display) Material UV2Texture;
var(Display) float ScaleGlow;
var(Collision) Actor.ESurfaceTypes SurfaceType;
var(Display) Actor.ERenderStyle Style;
var(Display) bool bUnlit;
var(Display) bool bShadowCast;
var(Display) bool bStaticLighting;
var(Display) bool bUseLightingFromBase;
var bool bHurtEntry;
var(Advanced) bool bGameRelevant;
var(Advanced) bool bCollideWhenPlacing;
var bool bTravel;
var(Advanced) bool bMovable;
var bool bDestroyInPainVolume;
var bool bCanBeDamaged;
var(Advanced) bool bShouldBaseAtStartup;
var const bool bPendingDelete;
var bool bAnimByOwner;
var bool bOwnerNoSee;
var(Advanced) bool bCanTeleport;
var bool bClientAnim;
var bool bDisturbFluidSurface;
var float FluidSurfaceShootStrengthMod;
var const bool bAlwaysTick;
var(Sound) bool bFullVolume;
var bool bNotifyLocalPlayerTeamReceived;
var(Movement) bool bHardAttach;
var bool bForceSkelUpdate;
var const bool bClientAuthoritative;
var(Sound) byte SoundVolume;
var(Sound) byte SoundPitch;
var(Sound) Actor.ESoundOcclusion SoundOcclusion;
var(Sound) float SoundRadius;
var(Sound) float TransientSoundVolume;
var(Sound) float TransientSoundRadius;
var(Collision) const float CollisionRadius;
var(Collision) const float CollisionHeight;
var(Collision) const bool bCollideActors;
var bool bCollideWorld;
var(Collision) bool bBlockActors;
var bool bBlockPlayers;
var bool bBlockProjectiles;
var(Collision) bool bProjTarget;
var(Collision) bool bBlockZeroExtentTraces;
var(Collision) bool bBlockNonZeroExtentTraces;
var(Collision) bool bAutoAlignToTerrain;
var(Collision) bool bUseCylinderCollision;
var(Collision) const bool bBlockKarma;
var bool bBlocksTeleport;
var(Display) bool bAlwaysFaceCamera;
var bool bNetNotify;
var bool bClientTrigger;
var bool bUseCollisionStaticMesh;
var bool bSmoothKarmaStateUpdates;
var bool bIgnoreOutOfWorld;
var(Movement) bool bBounce;
var(Movement) bool bFixedRotationDir;
var(Movement) bool bRotateToDesired;
var(Movement) bool bIgnoreTerminalVelocity;
var(Movement) bool bOrientToVelocity;
var bool bInterpolating;
var const bool bJustTeleported;
var(Movement) float Mass;
var(Movement) float Buoyancy;
var(Movement) Rotator RotationRate;
var(Movement) Rotator DesiredRotation;
var Actor PendingTouch;
var const Vector ColLocation;
var(Events) name ExcludeTag[8];
var(Karma) export editinline KarmaParamsCollision KParams;
var native const int KStepTag;
var float AccumKarmaAngleError;
var AnimRep SimAnim;
var(Force) Actor.EForceType ForceType;
var(Force) float ForceRadius;
var(Force) float ForceScale;
var(Force) float ForceNoise;
var const bool bNetInitial;
var const bool bNetOwner;
var const bool bNetRelevant;
var const bool bDemoRecording;
var const bool bClientDemoRecording;
var const bool bRepClientDemo;
var const bool bClientDemoNetFunc;
var const bool bDemoOwner;
var bool bNoRepMesh;
var bool bNotOnDedServer;
var bool bAlreadyPrecachedMaterials;
var bool bAlreadyPrecachedMeshes;
var(Advanced) bool bHiddenEd;
var(Advanced) bool bHiddenEdGroup;
var(Advanced) bool bDirectional;
var const bool bSelected;
var(Advanced) bool bEdShouldSnap;
var transient bool bEdSnap;
var const transient bool bTempEditor;
var bool bObsolete;
var(Collision) bool bPathColliding;
var transient bool bPathTemp;
var bool bScriptInitialized;
var(Advanced) bool bLockLocation;
var bool bTraceWater;
var Class<LocalMessage> MessageClass;
var(Display) float OverlayTimer;
var(Display) transient float ClientOverlayTimer;
var(Display) transient float ClientOverlayCounter;
var Material HighDetailOverlay;

replication
{
	// Pos:0x63E
	unreliable if(bDemoRecording)
		DemoPlaySound;

	// Pos:0x000
	reliable if(((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && (((int(RemoteRole) == int(ROLE_AutonomousProxy)) && bNetInitial) || ((int(RemoteRole) == int(ROLE_SimulatedProxy)) && bNetInitial || bUpdateSimulatedPosition) && (Base == none) || Base.bWorldGeometry) || (int(RemoteRole) == int(ROLE_DumbProxy)) && (Base == none) || Base.bWorldGeometry)
		Location;

	// Pos:0x0B7
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && (int(DrawType) == int(2)) || int(DrawType) == int(8)) && (((int(RemoteRole) == int(ROLE_AutonomousProxy)) && bNetInitial) || ((int(RemoteRole) == int(ROLE_SimulatedProxy)) && bNetInitial || bUpdateSimulatedPosition) && (Base == none) || Base.bWorldGeometry) || (int(RemoteRole) == int(ROLE_DumbProxy)) && (Base == none) || Base.bWorldGeometry)
		Rotation;

	// Pos:0x192
	reliable if(((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && int(RemoteRole) <= int(ROLE_SimulatedProxy))
		Base, bOnlyDrawIfAttached;

	// Pos:0x1C2
	reliable if(((((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && int(RemoteRole) <= int(ROLE_SimulatedProxy)) && Base != none) && !Base.bWorldGeometry)
		AttachmentBone, RelativeLocation, 
		RelativeRotation;

	// Pos:0x215
	reliable if(((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && ((int(RemoteRole) == int(ROLE_SimulatedProxy)) && bNetInitial || bUpdateSimulatedPosition) || (int(RemoteRole) == int(ROLE_DumbProxy)) && int(Physics) == int(2))
		Velocity;

	// Pos:0x27F
	reliable if(((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && ((int(RemoteRole) == int(ROLE_SimulatedProxy)) && bNetInitial) || int(RemoteRole) == int(ROLE_DumbProxy))
		Physics;

	// Pos:0x2CC
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && bReplicateMovement) && int(RemoteRole) <= int(ROLE_SimulatedProxy)) && int(Physics) == int(5))
		DesiredRotation, RotationRate, 
		bFixedRotationDir, bRotateToDesired;

	// Pos:0x30E
	reliable if(((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && !bNetOwner || !bClientAnim)
		AmbientSound;

	// Pos:0x34D
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && !bNetOwner || !bClientAnim) && AmbientSound != none)
		SoundPitch, SoundRadius, 
		SoundVolume;

	// Pos:0x399
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && int(DrawType) == int(2)) && bReplicateAnimations)
		SimAnim;

	// Pos:0x3DB
	reliable if((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority))
		bHidden;

	// Pos:0x400
	reliable if(((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty)
		DrawScale, DrawType, 
		RepSkin, Style, 
		Texture, bClientTrigger, 
		bCollideActors, bCollideWorld, 
		bOnlyOwnerSee;

	// Pos:0x430
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && bCollideActors || bCollideWorld)
		CollisionHeight, CollisionRadius, 
		bBlockActors, bIgnoreEncroachers, 
		bProjTarget;

	// Pos:0x476
	reliable if((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority))
		LightType, RemoteRole, 
		Role, bNetOwner, 
		bTearOff;

	// Pos:0x49B
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && bNetOwner)
		Inventory, Owner;

	// Pos:0x4D6
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && bReplicateInstigator)
		Instigator;

	// Pos:0x511
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		OverlayMaterial, OverlayTimer;

	// Pos:0x529
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && int(DrawType) == int(2))
		AmbientGlow, PrePivot, 
		bUnlit;

	// Pos:0x56B
	reliable if(((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && !bNoRepMesh) && int(DrawType) == int(2))
		Mesh;

	// Pos:0x5BA
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && int(DrawType) == int(8))
		StaticMesh;

	// Pos:0x5FC
	reliable if((((!bSkipActorPropertyReplication || bNetInitial) && int(Role) == int(ROLE_Authority)) && bNetDirty) && int(LightType) != int(0))
		LightBrightness, LightEffect, 
		LightHue, LightPeriod, 
		LightPhase, LightRadius, 
		LightSaturation, bSpecialLit;
}

// Export UActor::execConsoleCommand(FFrame&, void* const)
native function string ConsoleCommand(string Command, optional bool bWriteToLog);

// Export UActor::execCopyObjectToClipboard(FFrame&, void* const)
native function CopyObjectToClipboard(Object obj);

// Export UActor::execTextToSpeech(FFrame&, void* const)
native function TextToSpeech(string Text, float Volume);

// Export UActor::execError(FFrame&, void* const)
native(233) final function Error(coerce string S);

// Export UActor::execShouldBeHidden(FFrame&, void* const)
native static final function bool ShouldBeHidden();

// Export UActor::execSleep(FFrame&, void* const)
native(256) final latent function Sleep(float Seconds);

// Export UActor::execSetCollision(FFrame&, void* const)
native(262) final function SetCollision(optional bool NewColActors, optional bool NewBlockActors, optional bool NewBlockPlayers);

// Export UActor::execSetCollisionSize(FFrame&, void* const)
native(283) final function bool SetCollisionSize(float NewRadius, float NewHeight);

// Export UActor::execSetDrawScale(FFrame&, void* const)
native final function SetDrawScale(float NewScale);

// Export UActor::execSetDrawScale3D(FFrame&, void* const)
native final function SetDrawScale3D(Vector NewScale3D);

// Export UActor::execSetStaticMesh(FFrame&, void* const)
native final function SetStaticMesh(StaticMesh NewStaticMesh);

// Export UActor::execSetDrawType(FFrame&, void* const)
native final function SetDrawType(Actor.EDrawType NewDrawType);

// Export UActor::execMove(FFrame&, void* const)
native(266) final function bool Move(Vector Delta);

// Export UActor::execSetLocation(FFrame&, void* const)
native(267) final function bool SetLocation(Vector NewLocation);

// Export UActor::execSetRotation(FFrame&, void* const)
native(299) final function bool SetRotation(Rotator NewRotation);

// Export UActor::execSetRelativeRotation(FFrame&, void* const)
native final function bool SetRelativeRotation(Rotator NewRotation);

// Export UActor::execSetRelativeLocation(FFrame&, void* const)
native final function bool SetRelativeLocation(Vector NewLocation);

// Export UActor::execMoveSmooth(FFrame&, void* const)
native(3969) final function bool MoveSmooth(Vector Delta);

// Export UActor::execAutonomousPhysics(FFrame&, void* const)
native(3971) final function AutonomousPhysics(float DeltaSeconds);

// Export UActor::execSetBase(FFrame&, void* const)
native(298) final function SetBase(Actor NewBase, optional Vector NewFloor);

// Export UActor::execSetOwner(FFrame&, void* const)
native(272) final function SetOwner(Actor NewOwner);

// Export UActor::execIsJoinedTo(FFrame&, void* const)
native final function bool IsJoinedTo(Actor Other);

// Export UActor::execGetMeshName(FFrame&, void* const)
native final function string GetMeshName();

// Export UActor::execPlayAnim(FFrame&, void* const)
native(259) final function bool PlayAnim(name Sequence, optional float Rate, optional float TweenTime, optional int Channel);

// Export UActor::execLoopAnim(FFrame&, void* const)
native(260) final function bool LoopAnim(name Sequence, optional float Rate, optional float TweenTime, optional int Channel);

// Export UActor::execTweenAnim(FFrame&, void* const)
native(294) final function bool TweenAnim(name Sequence, float Time, optional int Channel);

// Export UActor::execIsAnimating(FFrame&, void* const)
native(282) final function bool IsAnimating(optional int Channel);

// Export UActor::execFinishAnim(FFrame&, void* const)
native(261) final latent function FinishAnim(optional int Channel);

// Export UActor::execHasAnim(FFrame&, void* const)
native(263) final function bool HasAnim(name Sequence);

// Export UActor::execStopAnimating(FFrame&, void* const)
native final function StopAnimating(optional bool ClearAllButBase);

// Export UActor::execFreezeAnimAt(FFrame&, void* const)
native final function FreezeAnimAt(float Time, optional int Channel);

// Export UActor::execSetAnimFrame(FFrame&, void* const)
native final function SetAnimFrame(float Time, optional int Channel, optional int UnitFlag);

// Export UActor::execIsTweening(FFrame&, void* const)
native final function bool IsTweening(int Channel);

// Export UActor::execAnimStopLooping(FFrame&, void* const)
native final function AnimStopLooping(optional int Channel);

// Export UActor::execPlayLIPSincAnim(FFrame&, void* const)
native final function PlayLIPSincAnim(name LIPSincAnimName, optional float Volume, optional float Radius, optional float Pitch);

// Export UActor::execStopLIPSincAnim(FFrame&, void* const)
native final function StopLIPSincAnim();

// Export UActor::execHasLIPSincAnim(FFrame&, void* const)
native final function bool HasLIPSincAnim(name LIPSincAnimName);

// Export UActor::execIsPlayingLIPSincAnim(FFrame&, void* const)
native final function bool IsPlayingLIPSincAnim();

// Export UActor::execCurrentLIPSincAnim(FFrame&, void* const)
native final function string CurrentLIPSincAnim();

event LIPSincAnimEnd()
{
	//return;	
}

event AnimEnd(int Channel)
{
	//return;	
}

// Export UActor::execEnableChannelNotify(FFrame&, void* const)
native final function EnableChannelNotify(int Channel, int Switch);

// Export UActor::execGetNotifyChannel(FFrame&, void* const)
native final function int GetNotifyChannel();

// Export UActor::execLinkSkelAnim(FFrame&, void* const)
native final simulated function LinkSkelAnim(MeshAnimation Anim, optional Mesh NewMesh);

// Export UActor::execLinkMesh(FFrame&, void* const)
native final simulated function LinkMesh(Mesh NewMesh, optional bool bKeepAnim);

// Export UActor::execBoneRefresh(FFrame&, void* const)
native final function BoneRefresh();

// Export UActor::execAnimBlendParams(FFrame&, void* const)
native final function AnimBlendParams(int Stage, optional float BlendAlpha, optional float InTime, optional float OutTime, optional name BoneName, optional bool bGlobalPose);

// Export UActor::execAnimBlendToAlpha(FFrame&, void* const)
native final function AnimBlendToAlpha(int Stage, float TargetAlpha, float TimeInterval);

// Export UActor::execGetBoneCoords(FFrame&, void* const)
native final function Coords GetBoneCoords(name BoneName);

// Export UActor::execGetBoneRotation(FFrame&, void* const)
native final function Rotator GetBoneRotation(name BoneName, optional int Space);

// Export UActor::execGetRootLocation(FFrame&, void* const)
native final function Vector GetRootLocation();

// Export UActor::execGetRootRotation(FFrame&, void* const)
native final function Rotator GetRootRotation();

// Export UActor::execGetRootLocationDelta(FFrame&, void* const)
native final function Vector GetRootLocationDelta();

// Export UActor::execGetRootRotationDelta(FFrame&, void* const)
native final function Rotator GetRootRotationDelta();

// Export UActor::execAttachToBone(FFrame&, void* const)
native final function bool AttachToBone(Actor Attachment, name BoneName);

// Export UActor::execDetachFromBone(FFrame&, void* const)
native final function bool DetachFromBone(Actor Attachment);

// Export UActor::execLockRootMotion(FFrame&, void* const)
native final function LockRootMotion(int Lock);

// Export UActor::execSetBoneScale(FFrame&, void* const)
native final function SetBoneScale(int Slot, optional float BoneScale, optional name BoneName);

// Export UActor::execSetBoneDirection(FFrame&, void* const)
native final function SetBoneDirection(name BoneName, Rotator BoneTurn, optional Vector BoneTrans, optional float Alpha, optional int Space);

// Export UActor::execSetBoneLocation(FFrame&, void* const)
native final function SetBoneLocation(name BoneName, optional Vector BoneTrans, optional float Alpha);

// Export UActor::execSetBoneRotation(FFrame&, void* const)
native final simulated function SetBoneRotation(name BoneName, optional Rotator BoneTurn, optional int Space, optional float Alpha);

// Export UActor::execGetAnimParams(FFrame&, void* const)
native final function GetAnimParams(int Channel, out name OutSeqName, out float OutAnimFrame, out float OutAnimRate);

// Export UActor::execAnimIsInGroup(FFrame&, void* const)
native final function bool AnimIsInGroup(int Channel, name GroupName);

// Export UActor::execGetClosestBone(FFrame&, void* const)
native final function name GetClosestBone(Vector loc, Vector ray, out float boneDist, optional name BiasBone, optional float BiasDistance);

// Export UActor::execUpdateURL(FFrame&, void* const)
native final function UpdateURL(string NewOption, string NewValue, bool bSaveDefault);

// Export UActor::execGetUrlOption(FFrame&, void* const)
native final function string GetUrlOption(string Option);

// Export UActor::execGetRenderBoundingSphere(FFrame&, void* const)
native final function Plane GetRenderBoundingSphere();

// Export UActor::execDrawDebugLine(FFrame&, void* const)
native final function DrawDebugLine(Vector LineStart, Vector LineEnd, byte R, byte G, byte B, optional bool staying);

// Export UActor::execDrawDebugCircle(FFrame&, void* const)
native final function DrawDebugCircle(Vector Base, Vector X, Vector Y, float Radius, int NumSides, byte R, byte G, byte B, optional bool staying);

// Export UActor::execDrawDebugSphere(FFrame&, void* const)
native final function DrawDebugSphere(Vector Base, float Radius, int NumDivisions, byte R, byte G, byte B, optional bool staying);

// Export UActor::execDrawStayingDebugLine(FFrame&, void* const)
native final function DrawStayingDebugLine(Vector LineStart, Vector LineEnd, byte R, byte G, byte B);

// Export UActor::execClearStayingDebugLines(FFrame&, void* const)
native final function ClearStayingDebugLines();

// Export UActor::execDrawDebugBox(FFrame&, void* const)
native final function DrawDebugBox(Vector DiagonalStart, Vector DiagonalEnd, byte R, byte G, byte B, optional bool staying);

// Export UActor::execClearAttachedDecals(FFrame&, void* const)
native final function ClearAttachedDecals();

// Export UActor::execDebugClock(FFrame&, void* const)
native final function DebugClock();

// Export UActor::execDebugUnclock(FFrame&, void* const)
native final function DebugUnclock();

// Export UActor::execFinishInterpolation(FFrame&, void* const)
native(301) final latent function FinishInterpolation();

// Export UActor::execSetPhysics(FFrame&, void* const)
native(3970) final function SetPhysics(Actor.EPhysics newPhysics);

// Export UActor::execOnlyAffectPawns(FFrame&, void* const)
native final function OnlyAffectPawns(bool B);

// Export UActor::execKGetSimParams(FFrame&, void* const)
native final function KGetSimParams(out KSimParams SimParams);

// Export UActor::execKSetSimParams(FFrame&, void* const)
native final function KSetSimParams(KSimParams SimParams);

// Export UActor::execKGetRBQuaternion(FFrame&, void* const)
native final function Quat KGetRBQuaternion();

// Export UActor::execKGetRigidBodyState(FFrame&, void* const)
native final function KGetRigidBodyState(out KRigidBodyState RBstate);

// Export UActor::execKDrawRigidBodyState(FFrame&, void* const)
native final function KDrawRigidBodyState(KRigidBodyState RBstate, bool AltColour);

// Export UActor::execKRBVecToVector(FFrame&, void* const)
native final function Vector KRBVecToVector(KRBVec RBvec);

// Export UActor::execKRBVecFromVector(FFrame&, void* const)
native final function KRBVec KRBVecFromVector(Vector V);

// Export UActor::execKSetMass(FFrame&, void* const)
native final function KSetMass(float Mass);

// Export UActor::execKGetMass(FFrame&, void* const)
native final function float KGetMass();

// Export UActor::execKSetInertiaTensor(FFrame&, void* const)
native final function KSetInertiaTensor(Vector it1, Vector it2);

// Export UActor::execKGetInertiaTensor(FFrame&, void* const)
native final function KGetInertiaTensor(out Vector it1, out Vector it2);

// Export UActor::execKSetDampingProps(FFrame&, void* const)
native final function KSetDampingProps(float lindamp, float angdamp);

// Export UActor::execKGetDampingProps(FFrame&, void* const)
native final function KGetDampingProps(out float lindamp, out float angdamp);

// Export UActor::execKSetFriction(FFrame&, void* const)
native final function KSetFriction(float friction);

// Export UActor::execKGetFriction(FFrame&, void* const)
native final function float KGetFriction();

// Export UActor::execKSetRestitution(FFrame&, void* const)
native final function KSetRestitution(float rest);

// Export UActor::execKGetRestitution(FFrame&, void* const)
native final function float KGetRestitution();

// Export UActor::execKSetCOMOffset(FFrame&, void* const)
native final function KSetCOMOffset(Vector offset);

// Export UActor::execKGetCOMOffset(FFrame&, void* const)
native final function KGetCOMOffset(out Vector offset);

// Export UActor::execKGetCOMPosition(FFrame&, void* const)
native final function KGetCOMPosition(out Vector pos);

// Export UActor::execKSetImpactThreshold(FFrame&, void* const)
native final function KSetImpactThreshold(float thresh);

// Export UActor::execKGetImpactThreshold(FFrame&, void* const)
native final function float KGetImpactThreshold();

// Export UActor::execKWake(FFrame&, void* const)
native final function KWake();

// Export UActor::execKIsAwake(FFrame&, void* const)
native final function bool KIsAwake();

// Export UActor::execKAddImpulse(FFrame&, void* const)
native final function KAddImpulse(Vector Impulse, Vector Position, optional name BoneName);

// Export UActor::execKAddAngularImpulse(FFrame&, void* const)
native final function KAddAngularImpulse(Vector AngImpulse);

// Export UActor::execKSetStayUpright(FFrame&, void* const)
native final function KSetStayUpright(bool stayUpright, bool allowRotate);

// Export UActor::execKSetStayUprightParams(FFrame&, void* const)
native final function KSetStayUprightParams(float stiffness, float damping);

// Export UActor::execKSetBlockKarma(FFrame&, void* const)
native final function KSetBlockKarma(bool newBlock);

// Export UActor::execKSetActorGravScale(FFrame&, void* const)
native final function KSetActorGravScale(float ActorGravScale);

// Export UActor::execKGetActorGravScale(FFrame&, void* const)
native final function float KGetActorGravScale();

// Export UActor::execKDisableCollision(FFrame&, void* const)
native final function KDisableCollision(Actor Other);

// Export UActor::execKEnableCollision(FFrame&, void* const)
native final function KEnableCollision(Actor Other);

// Export UActor::execKSetSkelVel(FFrame&, void* const)
native final function KSetSkelVel(Vector Velocity, optional Vector AngVelocity, optional bool AddToCurrent);

// Export UActor::execKGetSkelMass(FFrame&, void* const)
native final function float KGetSkelMass();

// Export UActor::execKFreezeRagdoll(FFrame&, void* const)
native final function KFreezeRagdoll();

// Export UActor::execKScaleJointLimits(FFrame&, void* const)
native final function KScaleJointLimits(float Scale, float stiffness);

// Export UActor::execKAddBoneLifter(FFrame&, void* const)
native final function KAddBoneLifter(name BoneName, InterpCurve LiftVel, float LateralFriction, InterpCurve Softness);

// Export UActor::execKRemoveLifterFromBone(FFrame&, void* const)
native final function KRemoveLifterFromBone(name BoneName);

// Export UActor::execKRemoveAllBoneLifters(FFrame&, void* const)
native final function KRemoveAllBoneLifters();

// Export UActor::execKMakeRagdollAvailable(FFrame&, void* const)
native final function KMakeRagdollAvailable();

// Export UActor::execKIsRagdollAvailable(FFrame&, void* const)
native final function bool KIsRagdollAvailable();

// Export UActor::execKRagdollExists(FFrame&, void* const)
native final function bool KRagdollExists(string RagdollName);

event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
	//return;	
}

event KVelDropBelow()
{
	//return;	
}

event KSkelConvulse()
{
	//return;	
}

event KApplyForce(out Vector Force, out Vector Torque)
{
	//return;	
}

event bool KUpdateState(out KRigidBodyState NewState)
{
	//return;	
}

// Export UActor::execClock(FFrame&, void* const)
native final function Clock(out float Time);

// Export UActor::execUnClock(FFrame&, void* const)
native final function UnClock(out float Time);

// Export UActor::execAllowMusicPlayback(FFrame&, void* const)
native final function AllowMusicPlayback(bool Allow);

// Export UActor::execPlayStream(FFrame&, void* const)
native final function int PlayStream(string Song, optional bool UseMusicVolume, optional float Volume, optional float FadeInTime, optional float SeekTime);

// Export UActor::execStopStream(FFrame&, void* const)
native final function StopStream(int Handle, optional float FadeOutTime);

// Export UActor::execSeekStream(FFrame&, void* const)
native final function int SeekStream(int Handle, float Seconds);

// Export UActor::execAdjustVolume(FFrame&, void* const)
native final function bool AdjustVolume(int Handle, float NewVolume);

// Export UActor::execPauseStream(FFrame&, void* const)
native final function bool PauseStream(int Handle);

// Export UActor::execPlayMusic(FFrame&, void* const)
native final function int PlayMusic(string Song, optional float FadeInTime, optional float FadeOutTime, optional bool bCrossFade, optional float SeekTime);

// Export UActor::execStopMusic(FFrame&, void* const)
native final function StopMusic(int SongHandle, optional float FadeOutTime);

// Export UActor::execStopAllMusic(FFrame&, void* const)
native final function StopAllMusic(optional float FadeOutTime);

event Destroyed()
{
	//return;	
}

event GainedChild(Actor Other)
{
	//return;	
}

event LostChild(Actor Other)
{
	//return;	
}

event Tick(float DeltaTime)
{
	//return;	
}

event PostNetReceive()
{
	//return;	
}

event ClientTrigger()
{
	//return;	
}

event Trigger(Actor Other, Pawn EventInstigator)
{
	//return;	
}

event UnTrigger(Actor Other, Pawn EventInstigator)
{
	//return;	
}

event BeginEvent()
{
	//return;	
}

event EndEvent()
{
	//return;	
}

simulated function TimerPop(VolumeTimer t)
{
	//return;	
}

event Timer()
{
	//return;	
}

event HitWall(Vector HitNormal, Actor HitWall)
{
	//return;	
}

event Falling()
{
	//return;	
}

event Landed(Vector HitNormal)
{
	//return;	
}

event ZoneChange(ZoneInfo NewZone)
{
	//return;	
}

event PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	//return;	
}

event Touch(Actor Other)
{
	//return;	
}

event PostTouch(Actor Other)
{
	//return;	
}

event UnTouch(Actor Other)
{
	//return;	
}

event Bump(Actor Other)
{
	//return;	
}

event BaseChange()
{
	//return;	
}

event Attach(Actor Other)
{
	//return;	
}

event Detach(Actor Other)
{
	//return;	
}

event Actor SpecialHandling(Pawn Other)
{
	//return;	
}

event bool EncroachingOn(Actor Other)
{
	//return;	
}

event EncroachedBy(Actor Other)
{
	//return;	
}

event RanInto(Actor Other)
{
	//return;	
}

event FinishedInterpolation()
{
	bInterpolating = false;
	//return;	
}

event EndedRotation()
{
	//return;	
}

event UsedBy(Pawn User)
{
	//return;	
}

simulated event FellOutOfWorld(Actor.eKillZType KillType)
{
	SetPhysics(0);
	Destroy();
	//return;	
}

event KilledBy(Pawn EventInstigator)
{
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	//return;	
}

function bool HealDamage(int Amount, Controller Healer, Class<DamageType> DamageType)
{
	//return;	
}

// Export UActor::execTrace(FFrame&, void* const)
native(277) final function Actor Trace(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, optional Vector TraceStart, optional bool bTraceActors, optional Vector Extent, optional out Material Material);

// Export UActor::execFastTrace(FFrame&, void* const)
native(548) final function bool FastTrace(Vector TraceEnd, optional Vector TraceStart);

// Export UActor::execTraceThisActor(FFrame&, void* const)
native final function bool TraceThisActor(out Vector HitLocation, out Vector HitNormal, Vector TraceEnd, Vector TraceStart, optional Vector Extent);

// Export UActor::execSpawn(FFrame&, void* const)
native(278) final function Actor Spawn(Class<Actor> SpawnClass, optional Actor SpawnOwner, optional name SpawnTag, optional Vector SpawnLocation, optional Rotator SpawnRotation);

// Export UActor::execDestroy(FFrame&, void* const)
native(279) final function bool Destroy();

event TornOff()
{
	//return;	
}

// Export UActor::execSetTimer(FFrame&, void* const)
native(280) final function SetTimer(float NewTimerRate, bool bLoop);

event PreSaveGame()
{
	//return;	
}

event PostLoadSavedGame()
{
	//return;	
}

// Export UActor::execPlaySound(FFrame&, void* const)
native(264) final function PlaySound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate);

// Export UActor::execPlayOwnedSound(FFrame&, void* const)
native final simulated function PlayOwnedSound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate);

// Export UActor::execDemoPlaySound(FFrame&, void* const)
native simulated event DemoPlaySound(Sound Sound, optional Actor.ESoundSlot Slot, optional float Volume, optional bool bNoOverride, optional float Radius, optional float Pitch, optional bool Attenuate);

// Export UActor::execGetSoundDuration(FFrame&, void* const)
native final function float GetSoundDuration(Sound Sound);

// Export UActor::execPlayFeedbackEffect(FFrame&, void* const)
native(566) final function PlayFeedbackEffect(string EffectName);

// Export UActor::execStopFeedbackEffect(FFrame&, void* const)
native(567) final function StopFeedbackEffect(optional string EffectName);

// Export UActor::execChangeSpringFeedbackEffect(FFrame&, void* const)
native(568) final function ChangeSpringFeedbackEffect(string EffectName, float CenterX, float CenterY);

// Export UActor::execChangeBaseParamsFeedbackEffect(FFrame&, void* const)
native(569) final function ChangeBaseParamsFeedbackEffect(string EffectName, optional float DirectionX, optional float DirectionY, optional float Gain);

// Export UActor::execForceFeedbackSupported(FFrame&, void* const)
native final function bool ForceFeedbackSupported(optional bool Enable);

// Export UActor::execMakeNoise(FFrame&, void* const)
native(512) final function MakeNoise(float Loudness);

// Export UActor::execPlayerCanSeeMe(FFrame&, void* const)
native(532) final function bool PlayerCanSeeMe();

// Export UActor::execSuggestFallVelocity(FFrame&, void* const)
native final function Vector SuggestFallVelocity(Vector Destination, Vector Start, float MaxZ, float MaxXYSpeed);

event bool PreTeleport(Teleporter InTeleporter)
{
	//return;	
}

event PostTeleport(Teleporter OutTeleporter)
{
	//return;	
}

event BeginPlay()
{
	//return;	
}

// Export UActor::execResetStaticFilterState(FFrame&, void* const)
native final function ResetStaticFilterState();

// Export UActor::execAddToPackageMap(FFrame&, void* const)
native final function AddToPackageMap(optional string PackageName);

// Export UActor::execGetMapName(FFrame&, void* const)
native(539) final function string GetMapName(string NameEnding, string MapName, int Dir);

// Export UActor::execGetNextSkin(FFrame&, void* const)
native(545) final function GetNextSkin(string Prefix, string CurrentSkin, int Dir, out string SkinName, out string SkinDesc);

// Export UActor::execGetURLMap(FFrame&, void* const)
native(547) final function string GetURLMap(optional bool bIncludeOptions);

// Export UActor::execGetNextInt(FFrame&, void* const)
native final function string GetNextInt(string ClassName, int Num);

// Export UActor::execGetNextIntDesc(FFrame&, void* const)
native final function GetNextIntDesc(string ClassName, int Num, out string Entry, out string Description);

// Export UActor::execGetAllInt(FFrame&, void* const)
native static final function GetAllInt(string MetaClass, array<string> Entries);

// Export UActor::execGetAllIntDesc(FFrame&, void* const)
native static final function GetAllIntDesc(string MetaClass, out array<string> Entry, out array<string> Description);

// Export UActor::execGetCacheEntry(FFrame&, void* const)
native final function bool GetCacheEntry(int Num, out string Guid, out string FileName);

// Export UActor::execMoveCacheEntry(FFrame&, void* const)
native final function bool MoveCacheEntry(string Guid, optional string NewFilename);

// Export UActor::execAllActors(FFrame&, void* const)
native(304) final iterator function AllActors(Class<Actor> baseClass, out Actor Actor, optional name MatchTag);

// Export UActor::execDynamicActors(FFrame&, void* const)
native(313) final iterator function DynamicActors(Class<Actor> baseClass, out Actor Actor, optional name MatchTag);

// Export UActor::execChildActors(FFrame&, void* const)
native(305) final iterator function ChildActors(Class<Actor> baseClass, out Actor Actor);

// Export UActor::execBasedActors(FFrame&, void* const)
native(306) final iterator function BasedActors(Class<Actor> baseClass, out Actor Actor);

// Export UActor::execTouchingActors(FFrame&, void* const)
native(307) final iterator function TouchingActors(Class<Actor> baseClass, out Actor Actor);

// Export UActor::execTraceActors(FFrame&, void* const)
native(309) final iterator function TraceActors(Class<Actor> baseClass, out Actor Actor, out Vector HitLoc, out Vector HitNorm, Vector End, optional Vector Start, optional Vector Extent);

// Export UActor::execRadiusActors(FFrame&, void* const)
native(310) final iterator function RadiusActors(Class<Actor> baseClass, out Actor Actor, float Radius, optional Vector loc);

// Export UActor::execVisibleActors(FFrame&, void* const)
native(311) final iterator function VisibleActors(Class<Actor> baseClass, out Actor Actor, optional float Radius, optional Vector loc);

// Export UActor::execVisibleCollidingActors(FFrame&, void* const)
native(312) final iterator function VisibleCollidingActors(Class<Actor> baseClass, out Actor Actor, float Radius, optional Vector loc, optional bool bIgnoreHidden);

// Export UActor::execCollidingActors(FFrame&, void* const)
native(321) final iterator function CollidingActors(Class<Actor> baseClass, out Actor Actor, float Radius, optional Vector loc);

// Export UActor::execAllControllers(FFrame&, void* const)
native(325) final iterator function AllControllers(Class<Controller> baseClass, out Controller Actor);

// Export UActor::execSubtract_ColorColor(FFrame&, void* const)
native(549) static final operator(20) Color -(Color A, Color B);

// Export UActor::execMultiply_FloatColor(FFrame&, void* const)
native(550) static final operator(16) Color *(float A, Color B);

// Export UActor::execAdd_ColorColor(FFrame&, void* const)
native(551) static final operator(20) Color +(Color A, Color B);

// Export UActor::execMultiply_ColorFloat(FFrame&, void* const)
native(552) static final operator(16) Color *(Color A, float B);

event RecoverFromBadStateCode()
{
	//return;	
}

function RenderOverlays(Canvas Canvas)
{
	//return;	
}

event RenderTexture(ScriptedTexture Tex)
{
	//return;	
}

event PreBeginPlay()
{
	// End:0x55
	if((!bGameRelevant && int(Level.NetMode) != int(NM_Client)) && !Level.Game.BaseMutator.CheckRelevance(self))
	{
		Destroy();		
	}
	else
	{
		// End:0x8B
		if((int(Level.DetailMode) == int(0)) && CullDistance == default.CullDistance)
		{
			CullDistance *= 0.8000000;
		}
	}
	//return;	
}

event BroadcastLocalizedMessage(Class<LocalMessage> MessageClass, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	Level.Game.BroadcastLocalized(self, MessageClass, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	//return;	
}

event PostBeginPlay()
{
	//return;	
}

simulated event SetInitialState()
{
	bScriptInitialized = true;
	// End:0x21
	if(InitialState != 'None')
	{
		GotoState(InitialState);		
	}
	else
	{
		GotoState('Auto');
	}
	//return;	
}

event PostNetBeginPlay()
{
	//return;	
}

event PostNetChannelNotify(bool bReplicationEnded)
{
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	local int i;

	// End:0x58
	if(Skins.Length > 0)
	{
		i = 0;
		J0x13:

		// End:0x58 [Loop If]
		if(i < Skins.Length)
		{
			// End:0x4E
			if(Skins[i] != none)
			{
				Level.AddPrecacheMaterial(Skins[i]);
			}
			i++;
			// [Loop Continue]
			goto J0x13;
		}
	}
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	// End:0x3E
	if(((int(DrawType) == int(8)) && !bStatic) && !bNoDelete)
	{
		Level.AddPrecacheStaticMesh(StaticMesh);
	}
	//return;	
}

simulated function UpdateAnnouncements()
{
	//return;	
}

simulated function PrecacheAnnouncer(AnnouncerVoice V, bool bRewardSounds)
{
	//return;	
}

// Export UActor::execHurtRadius(FFrame&, void* const)
native simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation);

function bool CheckForErrors()
{
	// End:0x1E
	if(bObsolete)
	{
		Log(string(self) $ " is Obsolete");
	}
	return bObsolete;
	//return;	
}

event TravelPreAccept()
{
	//return;	
}

event TravelPostAccept()
{
	//return;	
}

function BecomeViewTarget()
{
	//return;	
}

function POVChanged(PlayerController PC, bool bBehindViewChanged)
{
	//return;	
}

simulated event string GetHumanReadableName()
{
	return string(Class.Name);
	//return;	
}

function SetDisplayProperties(Actor.ERenderStyle NewStyle, Material NewTexture, bool bLighting)
{
	Style = NewStyle;
	Texture = NewTexture;
	bUnlit = bLighting;
	//return;	
}

function SetDefaultDisplayProperties()
{
	Style = default.Style;
	Texture = default.Texture;
	bUnlit = default.bUnlit;
	//return;	
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
	return "";
	//return;	
}

function MatchStarting()
{
	//return;	
}

function SetGRI(GameReplicationInfo GRI)
{
	//return;	
}

function string GetDebugName()
{
	return GetItemName(string(self));
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local string t;
	local float XL;
	local int i;
	local Actor A;
	local name Anim;
	local float frame, Rate;

	Canvas.Style = 1;
	Canvas.StrLen("TEST", XL, YL);
	YPos = YPos + YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.SetDrawColor(byte(255), 0, 0);
	t = GetDebugName();
	// End:0xAF
	if(bDeleteMe)
	{
		t = t $ " DELETED (bDeleteMe == true)";
	}
	Canvas.DrawText(t, false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.SetDrawColor(byte(255), byte(255), byte(255));
	// End:0x2FB
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		t = "ROLE ";
		switch(Role)
		{
			// End:0x149
			case ROLE_None:
				t = t $ "None";
				// End:0x1D7
				break;
			// End:0x169
			case 1:
				t = t $ "DumbProxy";
				// End:0x1D7
				break;
			// End:0x18E
			case 2:
				t = t $ "SimulatedProxy";
				// End:0x1D7
				break;
			// End:0x1B4
			case 3:
				t = t $ "AutonomousProxy";
				// End:0x1D7
				break;
			// End:0x1D4
			case 4:
				t = t $ "Authority";
				// End:0x1D7
				break;
			// End:0xFFFF
			default:
				break;
		}
		t = t $ " REMOTE ROLE ";
		switch(RemoteRole)
		{
			// End:0x215
			case ROLE_None:
				t = t $ "None";
				// End:0x2A3
				break;
			// End:0x235
			case 1:
				t = t $ "DumbProxy";
				// End:0x2A3
				break;
			// End:0x25A
			case 2:
				t = t $ "SimulatedProxy";
				// End:0x2A3
				break;
			// End:0x280
			case 3:
				t = t $ "AutonomousProxy";
				// End:0x2A3
				break;
			// End:0x2A0
			case 4:
				t = t $ "Authority";
				// End:0x2A3
				break;
			// End:0xFFFF
			default:
				break;
		}
		// End:0x2C4
		if(bTearOff)
		{
			t = t $ " Tear Off";
		}
		Canvas.DrawText(t, false);
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);
	}
	t = "Physics ";
	switch(Physics)
	{
		// End:0x32D
		case 0:
			t = t $ "None";
			// End:0x4A2
			break;
		// End:0x34B
		case 1:
			t = t $ "Walking";
			// End:0x4A2
			break;
		// End:0x369
		case 2:
			t = t $ "Falling";
			// End:0x4A2
			break;
		// End:0x388
		case 3:
			t = t $ "Swimming";
			// End:0x4A2
			break;
		// End:0x3A5
		case 4:
			t = t $ "Flying";
			// End:0x4A2
			break;
		// End:0x3C4
		case 5:
			t = t $ "Rotating";
			// End:0x4A2
			break;
		// End:0x3E5
		case 6:
			t = t $ "Projectile";
			// End:0x4A2
			break;
		// End:0x409
		case 7:
			t = t $ "Interpolating";
			// End:0x4A2
			break;
		// End:0x42B
		case 8:
			t = t $ "MovingBrush";
			// End:0x4A2
			break;
		// End:0x448
		case 9:
			t = t $ "Spider";
			// End:0x4A2
			break;
		// End:0x466
		case 10:
			t = t $ "Trailer";
			// End:0x4A2
			break;
		// End:0x483
		case 11:
			t = t $ "Ladder";
			// End:0x4A2
			break;
		// End:0x49F
		case 13:
			t = t $ "Karma";
			// End:0x4A2
			break;
		// End:0xFFFF
		default:
			break;
	}
	t = (((t $ " in physicsvolume ") $ (GetItemName(string(PhysicsVolume)))) $ " on base ") $ (GetItemName(string(Base)));
	// End:0x514
	if(bBounce)
	{
		t = t $ " - will bounce";
	}
	Canvas.DrawText(t, false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((("Location: " $ string(Location)) $ " Rotation ") $ string(Rotation), false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((((("Velocity: " $ string(Velocity)) $ " Speed ") $ string(VSize(Velocity))) $ " Speed2D ") $ string(VSize(Velocity - (Velocity.Z * vect(0.0000000, 0.0000000, 1.0000000)))), false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText("Acceleration: " $ string(Acceleration), false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawColor.B = 0;
	Canvas.DrawText((("Collision Radius " $ string(CollisionRadius)) $ " Height ") $ string(CollisionHeight));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((((("Collides with Actors " $ string(bCollideActors)) $ ", world ") $ string(bCollideWorld)) $ ", proj. target ") $ string(bProjTarget));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText("Blocks Actors " $ string(bBlockActors));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	t = "Touching ";
	// End:0x80D
	foreach TouchingActors(Class'Engine.Actor', A)
	{
		t = (t $ (GetItemName(string(A)))) $ " ";		
	}	
	// End:0x83B
	if(t == "Touching ")
	{
		t = "Touching nothing";
	}
	Canvas.DrawText(t, false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawColor.R = 0;
	t = "Rendered: ";
	switch(Style)
	{
		// End:0x8B4
		case 0:
			t = t;
			// End:0x94F
			break;
		// End:0x8D1
		case 1:
			t = t $ "Normal";
			// End:0x94F
			break;
		// End:0x8EE
		case 2:
			t = t $ "Masked";
			// End:0x94F
			break;
		// End:0x910
		case 3:
			t = t $ "Translucent";
			// End:0x94F
			break;
		// End:0x930
		case 4:
			t = t $ "Modulated";
			// End:0x94F
			break;
		// End:0x94C
		case 5:
			t = t $ "Alpha";
			// End:0x94F
			break;
		// End:0xFFFF
		default:
			break;
	}
	switch(DrawType)
	{
		// End:0x972
		case 0:
			t = t $ " None";
			// End:0xA85
			break;
		// End:0x991
		case 1:
			t = t $ " Sprite ";
			// End:0xA85
			break;
		// End:0x9AE
		case 2:
			t = t $ " Mesh ";
			// End:0xA85
			break;
		// End:0x9CC
		case 3:
			t = t $ " Brush ";
			// End:0xA85
			break;
		// End:0x9EF
		case 4:
			t = t $ " RopeSprite ";
			// End:0xA85
			break;
		// End:0xA16
		case 5:
			t = t $ " VerticalSprite ";
			// End:0xA85
			break;
		// End:0xA38
		case 6:
			t = t $ " Terraform ";
			// End:0xA85
			break;
		// End:0xA5F
		case 7:
			t = t $ " SpriteAnimOnce ";
			// End:0xA85
			break;
		// End:0xA82
		case 8:
			t = t $ " StaticMesh ";
			// End:0xA85
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0xBEB
	if(int(DrawType) == int(2))
	{
		t = t $ (GetItemName(string(Mesh)));
		// End:0xB30
		if(Skins.Length > 0)
		{
			t = t $ " skins: ";
			i = 0;
			J0xAD9:

			// End:0xB30 [Loop If]
			if(i < Skins.Length)
			{
				// End:0xB00
				if(Skins[i] == none)
				{
					// [Explicit Break]
					goto J0xB30;
					// [Explicit Continue]
					goto J0xB26;
				}
				t = (t $ (GetItemName(string(Skins[i])))) $ ", ";
				J0xB26:

				i++;
				// [Loop Continue]
				goto J0xAD9;
			}
		}
		J0xB30:

		Canvas.DrawText(t, false);
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);
		GetAnimParams(0, Anim, frame, Rate);
		t = (((("AnimSequence " $ string(Anim)) $ " Frame ") $ string(frame)) $ " Rate ") $ string(Rate);
		// End:0xBE8
		if(bAnimByOwner)
		{
			t = t $ " Anim by Owner";
		}		
	}
	else
	{
		// End:0xC24
		if((int(DrawType) == int(1)) || int(DrawType) == int(7))
		{
			t = t $ string(Texture);			
		}
		else
		{
			// End:0xC48
			if(int(DrawType) == int(3))
			{
				t = t $ string(Brush);
			}
		}
	}
	Canvas.DrawText(t, false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawColor.B = byte(255);
	Canvas.DrawText((((("Tag: " $ string(Tag)) $ " Event: ") $ string(Event)) $ " STATE: ") $ string(GetStateName()), false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((("Instigator " $ (GetItemName(string(Instigator)))) $ " Owner ") $ (GetItemName(string(Owner))));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	Canvas.DrawText((((((("Timer: " $ string(TimerCounter)) $ " LifeSpan ") $ string(LifeSpan)) $ " AmbientSound ") $ string(AmbientSound)) $ " volume ") $ string(SoundVolume));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

final simulated function bool NearSpot(Vector Spot)
{
	local Vector Dir;

	Dir = Location - Spot;
	// End:0x2A
	if(Abs(Dir.Z) > CollisionHeight)
	{
		return false;
	}
	Dir.Z = 0.0000000;
	return VSize(Dir) <= CollisionRadius;
	//return;	
}

final simulated function bool TouchingActor(Actor A)
{
	local Vector Dir;

	Dir = Location - A.Location;
	// End:0x43
	if(Abs(Dir.Z) > (CollisionHeight + A.CollisionHeight))
	{
		return false;
	}
	Dir.Z = 0.0000000;
	return VSize(Dir) <= (CollisionRadius + A.CollisionRadius);
	//return;	
}

simulated function StartInterpolation()
{
	GotoState('None');
	SetCollision(true, false);
	bCollideWorld = false;
	bInterpolating = true;
	SetPhysics(0);
	//return;	
}

function Reset()
{
	//return;	
}

// Export UActor::execTriggerEvent(FFrame&, void* const)
native final function TriggerEvent(name EventName, Actor Other, Pawn EventInstigator);

// Export UActor::execUntriggerEvent(FFrame&, void* const)
native final function UntriggerEvent(name EventName, Actor Other, Pawn EventInstigator);

function bool IsInVolume(Volume aVolume)
{
	local Volume V;

	// End:0x23
	foreach TouchingActors(Class'Engine.Volume', V)
	{
		// End:0x22
		if(V == aVolume)
		{			
			return true;
		}		
	}	
	return false;
	//return;	
}

function bool IsInPain()
{
	local PhysicsVolume V;

	// End:0x3E
	foreach TouchingActors(Class'Engine.PhysicsVolume', V)
	{
		// End:0x3D
		if(V.bPainCausing && V.DamagePerSec > float(0))
		{			
			return true;
		}		
	}	
	return false;
	//return;	
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
	//return;	
}

simulated function bool CanSplash()
{
	return false;
	//return;	
}

function Vector GetCollisionExtent()
{
	local Vector Extent;

	Extent = CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
	Extent.Z = CollisionHeight;
	return Extent;
	//return;	
}

static function Crash()
{
	assert(false);
	//return;	
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	// End:0x90
	if(((OverlayMaterial == none) || OverlayMaterial == mat) || bOverride)
	{
		OverlayMaterial = mat;
		// End:0x56
		if(OverlayTimer == Time)
		{
			OverlayTimer = Time + 0.0010000;			
		}
		else
		{
			OverlayTimer = Time;
		}
		ClientOverlayTimer = OverlayTimer;
		ClientOverlayCounter = OverlayTimer;
		NetUpdateTime = Level.TimeSeconds - float(1);
	}
	//return;	
}

simulated function bool CheckMaxEffectDistance(PlayerController P, Vector SpawnLocation)
{
	return !P.BeyondViewDistance(SpawnLocation, 0.0000000);
	//return;	
}

simulated function bool EffectIsRelevant(Vector SpawnLocation, bool bForceDedicated)
{
	local PlayerController P;
	local bool bResult;

	// End:0x20
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return bForceDedicated;
	}
	// End:0x44
	if(int(Level.NetMode) != int(NM_Client))
	{
		bResult = true;		
	}
	else
	{
		// End:0x68
		if((Instigator != none) && Instigator.IsHumanControlled())
		{
			return true;			
		}
		else
		{
			// End:0x9C
			if(SpawnLocation == Location)
			{
				bResult = (Level.TimeSeconds - LastRenderTime) < float(3);				
			}
			else
			{
				// End:0xD8
				if((Instigator != none) && (Level.TimeSeconds - Instigator.LastRenderTime) < float(3))
				{
					bResult = true;
				}
			}
		}
	}
	// End:0x1D8
	if(bResult)
	{
		P = Level.GetLocalPlayerController();
		// End:0x122
		if((P == none) || P.ViewTarget == none)
		{
			bResult = false;			
		}
		else
		{
			// End:0x154
			if(P.Pawn == Instigator)
			{
				bResult = CheckMaxEffectDistance(P, SpawnLocation);				
			}
			else
			{
				// End:0x1C1
				if((Vector(P.Rotation) Dot (SpawnLocation - P.ViewTarget.Location)) < 0.0000000)
				{
					bResult = VSize(P.ViewTarget.Location - SpawnLocation) < float(1600);					
				}
				else
				{
					bResult = CheckMaxEffectDistance(P, SpawnLocation);
				}
			}
		}
	}
	return bResult;
	//return;	
}

function bool SelfTriggered()
{
	return false;
	//return;	
}

function bool TeamLink(int TeamNum)
{
	return false;
	//return;	
}

event SetDelayedDamageInstigatorController(Controller C)
{
	//return;	
}

function NotifyLocalPlayerDead(PlayerController PC)
{
	//return;	
}

function NotifyLocalPlayerTeamReceived()
{
	//return;	
}

function bool IsStationary()
{
	return true;
	//return;	
}

function PawnBaseDied()
{
	//return;	
}

function bool BlocksShotAt(Actor Other)
{
	return false;
	//return;	
}

defaultproperties
{
	DrawType=1
	bLightingVisibility=true
	bAcceptsProjectors=true
	bReplicateMovement=true
	bDeferRendering=true
	RemoteRole=1
	Role=4
	NetUpdateFrequency=100.0000000
	NetPriority=1.0000000
	LODBias=1.0000000
	Texture=Texture'Engine.S_Actor'
	DrawScale=1.0000000
	DrawScale3D=(X=1.0000000,Y=1.0000000,Z=1.0000000)
	MaxLights=4
	ScaleGlow=1.0000000
	Style=1
	bMovable=true
	FluidSurfaceShootStrengthMod=1.0000000
	SoundVolume=128
	SoundPitch=64
	SoundRadius=64.0000000
	TransientSoundVolume=0.3000000
	TransientSoundRadius=300.0000000
	CollisionRadius=22.0000000
	CollisionHeight=22.0000000
	bBlockZeroExtentTraces=true
	bBlockNonZeroExtentTraces=true
	bSmoothKarmaStateUpdates=true
	bJustTeleported=true
	Mass=100.0000000
	ForceNoise=0.5000000
	MessageClass=Class'Engine.LocalMessage'
}
