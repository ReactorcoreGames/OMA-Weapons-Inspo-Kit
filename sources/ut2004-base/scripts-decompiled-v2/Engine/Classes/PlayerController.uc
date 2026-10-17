class PlayerController extends Controller
	native
	nativereplication
	config(User)
	exportstructs
	notplaceable;

const MaxMoveChainLength = 100;

struct StoredChatPassword
{
	var string ChatRoomName;
	var string ChatRoomPassword;
};

struct PlayerNameInfo
{
	var string mInfo;
	var Color mColor;
	var float mXPos;
	var float mYPos;
};

struct ClientAdjustment
{
	var float TimeStamp;
	var name NewState;
	var Actor.EPhysics newPhysics;
	var Vector NewLoc;
	var Vector NewVel;
	var Actor NewBase;
	var Vector NewFloor;
};

var const Player Player;
var globalconfig bool bLookUpStairs;
var globalconfig bool bSnapToLevel;
var globalconfig bool bAlwaysMouseLook;
var globalconfig bool bKeyboardLook;
var bool bCenterView;
var bool bBehindView;
var bool bFrozen;
var bool bPressedJump;
var bool bDoubleJump;
var bool bUpdatePosition;
var bool bIsTyping;
var bool bFixedCamera;
var bool bJumpStatus;
var bool bUpdating;
var globalconfig bool bNeverSwitchOnPickup;
var bool bHideSpectatorBeacons;
var bool bZooming;
var bool bHideVehicleNoEntryIndicator;
var globalconfig bool bAlwaysLevel;
var bool bSetTurnRot;
var bool bCheatFlying;
var bool bFreeCamera;
var bool bZeroRoll;
var bool bCameraPositionLocked;
var bool bViewBot;
var bool UseFixedVisibility;
var bool bFreeCam;
var bool bFreeCamZoom;
var bool bFreeCamSwivel;
var bool bBlockCloseCamera;
var bool bValidBehindCamera;
var bool bForcePrecache;
var bool bClientDemo;
var const bool bAllActorsRelevant;
var bool bShortConnectTimeOut;
var bool bPendingDestroy;
var bool bEnableAmbientShake;
var bool bShownNoChatRoomMsg;
var globalconfig bool bNoVoiceMessages;
var globalconfig bool bNoTextToSpeechVoiceMessages;
var globalconfig bool bNoVoiceTaunts;
var globalconfig bool bNoAutoTaunts;
var globalconfig bool bAutoTaunt;
var globalconfig bool bNoMatureLanguage;
var globalconfig bool bDynamicNetSpeed;
var globalconfig bool bSmallWeapons;
var bool bWeaponViewShake;
var globalconfig bool bLandingShake;
var globalconfig bool bAimingHelp;
var(ForceFeedback) globalconfig bool bEnablePickupForceFeedback;
var(ForceFeedback) globalconfig bool bEnableWeaponForceFeedback;
var(ForceFeedback) globalconfig bool bEnableDamageForceFeedback;
var(ForceFeedback) globalconfig bool bEnableGUIForceFeedback;
var(ForceFeedback) bool bForceFeedbackSupported;
var(VoiceChat) bool bVoiceChatEnabled;
var(VoiceChat) globalconfig bool bEnableInitialChatRoom;
var bool bViewingMatineeCinematic;
var bool bCustomListener;
var bool bAcuteHearing;
var bool bMenuBeforeRespawn;
var bool bSkippedLastUpdate;
var bool bLastPressedJump;
var globalconfig bool bEnableStatsTracking;
var globalconfig bool bOnlySpeakTeamText;
var bool bWasSpeedHack;
var bool bIsSpaceFighter;
var const bool bWasSaturated;
var float FOVBias;
var(VoiceChat) globalconfig byte AutoJoinMask;
var input byte bStrafe;
var input byte bSnapLevel;
var input byte bLook;
var input byte bFreeLook;
var input byte bTurn180;
var input byte bTurnToNearest;
var input byte bXAxis;
var input byte bYAxis;
var Actor.EDoubleClickDir DoubleClickDir;
var globalconfig byte AnnouncerLevel;
var globalconfig byte AnnouncerVolume;
var globalconfig float TextToSpeechVoiceVolume;
var float MaxResponseTime;
var float WaitDelay;
var Pawn AcknowledgedPawn;
var input float aBaseX;
var input float aBaseY;
var input float aBaseZ;
var input float aMouseX;
var input float aMouseY;
var input float aForward;
var input float aTurn;
var input float aStrafe;
var input float aUp;
var input float aLookUp;
var float aLastForward;
var float aLastStrafe;
var float aLastUp;
var float NumServerDrives;
var float NumSkips;
var float VehicleCheckRadius;
var bool bSuccessfulUse;
var int ShowFlags;
var int Misc1;
var int Misc2;
var private native transient pointer MiscPointer1;
var private native transient pointer MiscPointer2;
var int RendMap;
var float OrthoZoom;
var const Actor ViewTarget;
var const Controller RealViewTarget;
var PlayerController DemoViewer;
var float CameraDist;
var Range CameraDistRange;
var Vector OldCameraLoc;
var Rotator OldCameraRot;
var transient array<CameraEffect> CameraEffects;
var globalconfig float DesiredFOV;
var globalconfig float DefaultFOV;
var globalconfig float HorizPlusFOVScale;
var float ZoomLevel;
var float DesiredZoomLevel;
var Vector ListenerLocation;
var Rotator ListenerRotation;
var Vector FixedLocation;
var Rotator FixedRotation;
var Matrix RenderWorldToCamera;
var Vector FlashScale;
var Vector FlashFog;
var float ConstantGlowScale;
var Vector ConstantGlowFog;
var globalconfig float ScreenFlashScaling;
var Color LastDistanceFogColor;
var float LastDistanceFogStart;
var float LastDistanceFogEnd;
var float CurrentDistanceFogEnd;
var float TimeSinceLastFogChange;
var int LastZone;
var Rotator TargetViewRotation;
var Rotator BlendedTargetViewRotation;
var float TargetEyeHeight;
var Vector TargetWeaponViewOffset;
var HUD myHUD;
var float LastPlaySound;
var float LastPlaySpeech;
var string Song;
var Actor.EMusicTransition Transition;
var SavedMove SavedMoves;
var SavedMove FreeMoves;
var SavedMove PendingMove;
var float CurrentTimeStamp;
var float LastUpdateTime;
var float ServerTimeStamp;
var float TimeMargin;
var float ClientUpdateTime;
var float MaxTimeMargin;
var globalconfig float TimeMarginSlack;
var Weapon OldClientWeapon;
var int WeaponUpdate;
var string ProgressMessage[4];
var Color ProgressColor[4];
var float ProgressTimeOut;
var localized string QuickSaveString;
var localized string NoPauseMessage;
var localized string ViewingFrom;
var localized string OwnCamera;
var GameReplicationInfo GameReplicationInfo;
var VoiceChatReplicationInfo VoiceReplicationInfo;
var VotingReplicationInfoBase VoteReplicationInfo;
var globalconfig string StatsUsername;
var globalconfig string StatsPassword;
var Class<LocalMessage> LocalMessageClass;
var(VoiceChat) Class<ChatRoomMessage> ChatRoomMessageClass;
var Vector ShakeOffsetRate;
var Vector ShakeOffset;
var Vector ShakeOffsetTime;
var Vector ShakeOffsetMax;
var Vector ShakeRotRate;
var Vector ShakeRotMax;
var Rotator ShakeRot;
var Vector ShakeRotTime;
var float AmbientShakeFalloffStartTime;
var float AmbientShakeFalloffTime;
var Vector AmbientShakeOffsetMag;
var float AmbientShakeOffsetFreq;
var Rotator AmbientShakeRotMag;
var float AmbientShakeRotFreq;
var Pawn TurnTarget;
var config int EnemyTurnSpeed;
var int GroundPitch;
var Rotator TurnRot180;
var Vector OldFloor;
var private transient CheatManager CheatManager;
var Class<CheatManager> CheatClass;
var private transient PlayerInput PlayerInput;
var config Class<PlayerInput> InputClass;
var private transient AdminBase AdminManager;
var transient MaplistManagerBase MapHandler;
var string PlayerChatType;
var PlayerChatManager ChatManager;
var const Vector FailedPathStart;
var Rotator CameraDeltaRotation;
var float CameraDeltaRad;
var Rotator CameraSwivel;
var(TeamBeacon) float TeamBeaconMaxDist;
var(TeamBeacon) float TeamBeaconPlayerInfoMaxDist;
var(TeamBeacon) Texture TeamBeaconTexture;
var(TeamBeacon) Texture LinkBeaconTexture;
var(TeamBeacon) Texture SpeakingBeaconTexture;
var(TeamBeacon) Color TeamBeaconTeamColors[2];
var(TeamBeacon) Color TeamBeaconCustomColor;
var private const array<PlayerNameInfo> PlayerNameArray;
var int DemoViewPitch;
var int DemoViewYaw;
var Security PlayerSecurity;
var float LoginDelay;
var float NextLoginTime;
var float ForcePrecacheTime;
var float LastPingUpdate;
var float ExactPing;
var float OldPing;
var float SpectateSpeed;
var globalconfig float DynamicPingThreshold;
var float NextSpeedChange;
var float VoiceChangeLimit;
var int ClientCap;
var(Menu) config string MidGameMenuClass;
var(Menu) config string DemoMenuClass;
var(Menu) config string AdminMenuClass;
var(Menu) config string ChatPasswordMenuClass;
var(VoiceChat) globalconfig array<StoredChatPassword> StoredChatPasswords;
var VoiceChatRoom ActiveRoom;
var(VoiceChat) globalconfig string LastActiveChannel;
var(VoiceChat) globalconfig string VoiceChatCodec;
var(VoiceChat) globalconfig string VoiceChatLANCodec;
var(VoiceChat) globalconfig string ChatPassword;
var(VoiceChat) globalconfig string DefaultActiveChannel;
var ClientAdjustment PendingAdjustment;
var AnnouncerQueueManager AnnouncerQueueManager;
var AnnouncerVoice StatusAnnouncer;
var AnnouncerVoice RewardAnnouncer;
var float LastActiveTime;
var Actor CalcViewActor;
var Vector CalcViewActorLocation;
var Vector CalcViewLocation;
var Rotator CalcViewRotation;
var float LastPlayerCalcView;
var float LastBroadcastTime;
var string LastBroadcastString[4];
var float LastSpeedHackLog;
var string PlayerOwnerName;
var int SSTOCalls;
var int SSTOCritical;
var int SwitchCount;
var int SUCalls;
var int VCCount;
var float SSTOTimestamp;
var float SwitchTimestamp;
var float SUTimeStamp;
var float VCTimeStamp;
var bool bSSTOKicked;
var bool bTempSpec;
var globalconfig bool bTogglescreenshotmodeOn;
var globalconfig float savedHandedness;
var globalconfig bool savedbCrosshairShow;
var globalconfig bool savedbHideHUD;
var globalconfig float savedTeamBeaconMaxDist;
var globalconfig bool savedbHideVehicleNoEntryIndicator;

replication
{
	// Pos:0x090
	unreliable if((int(Role) == int(ROLE_Authority)) && !bDemoRecording)
		ClientPlaySound, PlayAnnouncement, 
		PlayRewardAnnouncement, PlayStatusAnnouncement;

	// Pos:0x0C4
	unreliable if(int(Role) == int(ROLE_Authority))
		ClientAdjustPosition, ClientDamageShake, 
		ClientFlash, ClientUpdateFlagHolder, 
		LongClientAdjustPosition, SetFOVAngle, 
		ShortClientAdjustPosition, VeryShortClientAdjustPosition;

	// Pos:0x0D1
	unreliable if((!bDemoRecording || bClientDemoRecording && bClientDemoNetFunc) && int(Role) == int(ROLE_Authority))
		ClientHearSound;

	// Pos:0x119
	unreliable if(int(Role) < int(ROLE_Authority))
		RocketServerMove, ServerMove, 
		ServerUpdatePing, ShortServerMove;

	// Pos:0x133
	unreliable if(int(Role) < int(ROLE_Authority))
		DualRocketServerMove, DualServerMove, 
		DualSpaceFighterServerMove, DualTurretServerMove, 
		ServerDrive, ServerSay, 
		ServerSetAutoTaunt, ServerSetHandedness, 
		ServerTeamSay, ServerToggleBehindView, 
		ServerUse, ServerViewNextPlayer, 
		ServerViewSelf, ServerVoiceCommand, 
		SpaceFighterServerMove, TurretServerMove;

	// Pos:0x000
	reliable if((bNetDirty && bNetOwner) && int(Role) == int(ROLE_Authority))
		ChatManager, GameReplicationInfo, 
		LoginDelay, VoiceReplicationInfo;

	// Pos:0x023
	reliable if(((bNetOwner && int(Role) == int(ROLE_Authority)) && ViewTarget != Pawn) && Pawn(ViewTarget) != none)
		TargetEyeHeight, TargetViewRotation;

	// Pos:0x05E
	reliable if(bDemoRecording && int(Role) == int(ROLE_Authority))
		DemoViewPitch, DemoViewYaw;

	// Pos:0x076
	reliable if(int(Role) == int(ROLE_Authority))
		AdminReply, ChatRoomMessage, 
		ClearProgressMessages, ClientAdjustGlow, 
		ClientCapBandwidth, ClientCloseMenu, 
		ClientGotoState, ClientNetworkMessage, 
		ClientOpenMenu, ClientReStart, 
		ClientReliablePlaySound, ClientReplaceMenu, 
		ClientReset, ClientSetActiveRoom, 
		ClientSetBehindView, ClientSetFixedCamera, 
		ClientSetHUD, ClientSetMusic, 
		ClientSetViewTarget, ClientSetWeaponViewShake, 
		ClientValidate, EndZoom, 
		FOV, GivePawn, 
		ProgressCommand, SetProgressMessage, 
		SetProgressTime, StartZoom, 
		StopZoom, ToggleZoom;

	// Pos:0x083
	reliable if(int(Role) == int(ROLE_Authority))
		ClientMessage, QueueAnnouncement, 
		ReceiveLocalizedMessage, TeamMessage;

	// Pos:0x0AA
	reliable if((int(Role) == int(ROLE_Authority)) && !bDemoRecording)
		ClientSetClassicView, ClientStopForceFeedback, 
		ClientTravel;

	// Pos:0x101
	reliable if(bClientDemoRecording && int(Role) == int(ROLE_Authority))
		DemoClientSetHUD;

	// Pos:0x126
	reliable if(int(Role) < int(ROLE_Authority))
		ServerShortTimeout;

	// Pos:0x140
	reliable if(int(Role) < int(ROLE_Authority))
		ActivateItem, AskForPawn, 
		BecomeActivePlayer, BecomeSpectator, 
		BehindView, ChangeName, 
		ChangeVoiceType, PrevItem, 
		ServerAcknowledgePossession, ServerChangeTeam, 
		ServerMutate, ServerPause, 
		ServerRestartGame, ServerSetClientDemo, 
		ServerSpectate, ServerSpectateSpeed, 
		ServerSpeech, ServerThrowWeapon, 
		ServerUTrace, ServerValidationResponse, 
		ServerVerifyViewTarget, SetPause, 
		Suicide, Typing;

	// Pos:0x14D
	reliable if(int(Role) < int(ROLE_Authority))
		Admin, AdminCommand, 
		AdminDebug, AdminLogout, 
		ServerAdminLogin;

	// Pos:0x15A
	reliable if(int(Role) < int(ROLE_Authority))
		ServerChangeVoiceChatMode, ServerChatRestriction, 
		ServerGetWeaponStats, ServerJoinVoiceChannel, 
		ServerLeaveVoiceChannel, ServerRequestBanInfo, 
		ServerSetChatPassword, ServerSpeak;

	// Pos:0x167
	reliable if(int(Role) < int(ROLE_Authority))
		ServerChatDebug;

	// Pos:0x174
	reliable if(int(Role) == int(ROLE_Authority))
		ClientBecameActivePlayer, ClientBecameSpectator, 
		ResetFOV;
}

// Export UPlayerController::execSetNetSpeed(FFrame&, void* const)
native final function SetNetSpeed(int NewSpeed);

// Export UPlayerController::execGetPlayerIDHash(FFrame&, void* const)
native final function string GetPlayerIDHash();

// Export UPlayerController::execGetPlayerNetworkAddress(FFrame&, void* const)
native final function string GetPlayerNetworkAddress();

// Export UPlayerController::execGetServerNetworkAddress(FFrame&, void* const)
native final function string GetServerNetworkAddress();

// Export UPlayerController::execConsoleCommand(FFrame&, void* const)
native function string ConsoleCommand(string Command, optional bool bWriteToLog);

// Export UPlayerController::execGetEntryLevel(FFrame&, void* const)
native final function LevelInfo GetEntryLevel();

// Export UPlayerController::execResetKeyboard(FFrame&, void* const)
native(544) final function ResetKeyboard();

// Export UPlayerController::execResetInput(FFrame&, void* const)
private native final function ResetInput();

// Export UPlayerController::execSetViewTarget(FFrame&, void* const)
native final function SetViewTarget(Actor NewViewTarget);

// Export UPlayerController::execClientTravel(FFrame&, void* const)
native event ClientTravel(string URL, Actor.ETravelType TravelType, bool bItems);

// Export UPlayerController::execGetURLProtocol(FFrame&, void* const)
native static final function string GetURLProtocol();

// Export UPlayerController::execGetDefaultURL(FFrame&, void* const)
native final function string GetDefaultURL(string Option);

// Export UPlayerController::execCopyToClipboard(FFrame&, void* const)
native static final function CopyToClipboard(string Text);

// Export UPlayerController::execPasteFromClipboard(FFrame&, void* const)
native static final function string PasteFromClipboard();

// Export UPlayerController::execClientValidate(FFrame&, void* const)
private native event ClientValidate(string C);

// Export UPlayerController::execServerValidationResponse(FFrame&, void* const)
private native event ServerValidationResponse(string R);

// Export UPlayerController::execCheckSpeedHack(FFrame&, void* const)
native final function bool CheckSpeedHack(float DeltaTime);

// Export UPlayerController::execFindStairRotation(FFrame&, void* const)
native(524) final function int FindStairRotation(float DeltaTime);

// Export UPlayerController::execClientHearSound(FFrame&, void* const)
native event ClientHearSound(Actor Actor, int Id, Sound S, Vector SoundLocation, Vector Parameters, bool Attenuate);

function ServerUTrace()
{
	// End:0x31
	if((int(Level.NetMode) != int(NM_Standalone)) && !PlayerReplicationInfo.bAdmin)
	{
		return;
	}
	UTrace();
	//return;	
}

exec function UTrace()
{
	ConsoleCommand("HideLog");
	// End:0x26
	if(int(Role) != int(ROLE_Authority))
	{
		ServerUTrace();
	}
	SetUTracing(!IsUTracing());
	Log((("UTracing changed to " $ string(IsUTracing())) $ " at ") $ string(Level.TimeSeconds));
	//return;	
}

exec function GetWeaponStats()
{
	//return;	
}

function ServerGetWeaponStats(Weapon W)
{
	// End:0x23
	if((Pawn == none) || Pawn.Weapon == none)
	{
		return;
	}
	// End:0x3D
	if(W != none)
	{
		W.StartDebugging();
	}
	Pawn.Weapon.StartDebugging();
	//return;	
}

simulated event PostBeginPlay()
{
	local Class<PlayerChatManager> PlayerChatClass;

	super.PostBeginPlay();
	MaxTimeMargin = Level.MaxTimeMargin;
	MaxResponseTime = default.MaxResponseTime * Level.TimeDilation;
	// End:0x54
	if(int(Level.NetMode) == int(NM_Client))
	{
		SpawnDefaultHUD();
	}
	// End:0x7D
	if(Level.LevelEnterText != "")
	{
		ClientMessage(Level.LevelEnterText);
	}
	FixFOV();
	SetViewTarget(self);
	LastActiveTime = Level.TimeSeconds;
	// End:0xBD
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		AddCheats();
	}
	bForcePrecache = int(Role) < int(ROLE_Authority);
	ForcePrecacheTime = Level.TimeSeconds + 1.2000000;
	// End:0x11D
	if(Level.Game != none)
	{
		MapHandler = Level.Game.MaplistHandler;
	}
	// End:0x170
	if((PlayerChatType != "") && int(Role) == int(ROLE_Authority))
	{
		PlayerChatClass = Class<PlayerChatManager>(DynamicLoadObject(PlayerChatType, Class'Core.Class'));
		// End:0x170
		if(PlayerChatClass != none)
		{
			ChatManager = Spawn(PlayerChatClass, self);
		}
	}
	//return;	
}

simulated function bool BeyondViewDistance(Vector OtherLocation, float CullDistance)
{
	local float Dist;

	// End:0x0D
	if(ViewTarget == none)
	{
		return true;
	}
	Dist = VSize(OtherLocation - ViewTarget.Location);
	// End:0x51
	if((CullDistance > float(0)) && CullDistance < (Dist * FOVBias))
	{
		return true;
	}
	return Region.Zone.bDistanceFog && Dist > Region.Zone.DistanceFogEnd;
	//return;	
}

event KickWarning()
{
	ReceiveLocalizedMessage(Class'Engine.GameMessage', 15);
	//return;	
}

function ResetTimeMargin()
{
	TimeMargin = -0.1000000;
	MaxTimeMargin = Level.MaxTimeMargin;
	//return;	
}

function ServerShortTimeout()
{
	local Actor A;

	// End:0x0B
	if(bSSTOKicked)
	{
		return;
	}
	// End:0x65
	if((Level.TimeSeconds - SSTOTimestamp) < 60.0000000)
	{
		++SSTOCalls;
		// End:0x62
		if(SSTOCalls > 2)
		{
			++SSTOCritical;
			SSTOCalls = 0;
			// End:0x62
			if(SSTOCritical > 5)
			{
				bSSTOKicked = true;
				Destroy();
			}
		}		
	}
	else
	{
		SSTOTimestamp = Level.TimeSeconds;
		SSTOCalls = 0;
	}
	bShortConnectTimeOut = true;
	ResetTimeMargin();
	// End:0x125
	if(Level.Game.NumPlayers < 8)
	{
		// End:0x121
		foreach AllActors(Class'Engine.Actor', A)
		{
			// End:0x120
			if((A.NetUpdateFrequency < float(1)) && !A.bOnlyRelevantToOwner)
			{
				A.NetUpdateTime = FMin(A.NetUpdateTime, Level.TimeSeconds + (0.2000000 * FRand()));
			}			
		}				
	}
	else
	{
		// End:0x19A
		foreach AllActors(Class'Engine.Actor', A)
		{
			// End:0x199
			if((A.NetUpdateFrequency < float(1)) && !A.bOnlyRelevantToOwner)
			{
				A.NetUpdateTime = FMin(A.NetUpdateTime, Level.TimeSeconds + (0.5000000 * FRand()));
			}			
		}		
	}
	//return;	
}

function Actor GetPathTo(Actor Dest)
{
	local int i;
	local Actor Best;
	local Vector Dir;

	// End:0x11
	if(Dest == none)
	{
		return Dest;
	}
	// End:0x7E
	if((int(Pawn.Physics) != int(2)) && (RouteGoal != Dest) || (Level.TimeSeconds - LastRouteFind) > (float(1) + FRand()))
	{
		MoveTarget = FindPathToward(Dest, false);
		// End:0x7E
		if(MoveTarget == none)
		{
			return Dest;
		}
	}
	// End:0x91
	if(RouteCache[0] == none)
	{
		return Dest;
	}
	// End:0xA6
	if(RouteCache[1] == none)
	{
		return RouteCache[0];
	}
	Best = RouteCache[0];
	Dir = Normal(RouteCache[1].Location - RouteCache[0].Location);
	i = 0;
	J0xE4:

	// End:0x19F [Loop If]
	if(i < 5)
	{
		// End:0x138
		if((RouteCache[i] == none) || VSize(Pawn.Location - RouteCache[i].Location) > float(2000))
		{
			// [Explicit Break]
			goto J0x19F;
		}
		// End:0x195
		if(((Normal(RouteCache[i].Location - RouteCache[0].Location) Dot Dir) > 0.7000000) && LineOfSightTo(RouteCache[i]))
		{
			Best = RouteCache[i];
		}
		i++;
		// [Loop Continue]
		goto J0xE4;
	}
	J0x19F:

	return Best;
	//return;	
}

simulated event StreamFinished(int StreamHandle, Interactions.EStreamFinishReason Reason)
{
	local int i;

	// End:0x77
	if(Player != none)
	{
		i = 0;
		J0x12:

		// End:0x77 [Loop If]
		if(i < Player.LocalInteractions.Length)
		{
			// End:0x6D
			if(Player.LocalInteractions[i] != none)
			{
				Player.LocalInteractions[i].StreamFinished(StreamHandle, Reason);
			}
			i++;
			// [Loop Continue]
			goto J0x12;
		}
	}
	//return;	
}

exec function KillAll(Class<Actor> aClass)
{
	local Actor A;
	local PlayerController C;

	// End:0x12
	if(int(Role) != int(ROLE_Authority))
	{
		return;
	}
	// End:0x35
	if(CheatManager != none)
	{
		CheatManager.ReportCheat("KillAll");
	}
	// End:0x6B
	foreach __NFUN_325__(Class'Engine.PlayerController', C)
	{
		C.ClientMessage("Killed all " $ string(aClass));		
	}	
	// End:0xAD
	if(ClassIsChildOf(aClass, Class'Engine.AIController'))
	{
		Level.Game.KillBots(Level.Game.NumBots);
		return;
	}
	// End:0xCF
	if(ClassIsChildOf(aClass, Class'Engine.Pawn'))
	{
		KillAllPawns(Class<Pawn>(aClass));
		return;
	}
	// End:0x105
	foreach DynamicActors(Class'Engine.Actor', A)
	{
		// End:0x104
		if(ClassIsChildOf(A.Class, aClass))
		{
			A.Destroy();
		}		
	}	
	//return;	
}

function KillAllPawns(Class<Pawn> aClass)
{
	local Pawn P;

	Level.Game.KillBots(Level.Game.NumBots);
	// End:0xA4
	foreach DynamicActors(Class'Engine.Pawn', P)
	{
		// End:0xA3
		if(ClassIsChildOf(P.Class, aClass) && !P.IsPlayerPawn())
		{
			// End:0x97
			if(P.Controller != none)
			{
				P.Controller.Destroy();
			}
			P.Destroy();
		}		
	}	
	//return;	
}

exec function ToggleScreenShotMode()
{
	// End:0x68
	if(bTogglescreenshotmodeOn)
	{
		SetHand(int(savedHandedness));
		myHUD.bCrosshairShow = savedbCrosshairShow;
		myHUD.bHideHUD = savedbHideHUD;
		TeamBeaconMaxDist = savedTeamBeaconMaxDist;
		bHideVehicleNoEntryIndicator = savedbHideVehicleNoEntryIndicator;
		bTogglescreenshotmodeOn = false;
		SaveConfig();		
	}
	else
	{
		savedHandedness = Handedness;
		savedbCrosshairShow = myHUD.bCrosshairShow;
		savedbHideHUD = myHUD.bHideHUD;
		savedTeamBeaconMaxDist = TeamBeaconMaxDist;
		savedbHideVehicleNoEntryIndicator = bHideVehicleNoEntryIndicator;
		myHUD.bCrosshairShow = false;
		SetWeaponHand("Hidden");
		myHUD.bHideHUD = true;
		TeamBeaconMaxDist = 0.0000000;
		bHideVehicleNoEntryIndicator = true;
		bTogglescreenshotmodeOn = true;
		SaveConfig();
	}
	//return;	
}

exec function SetSpectateSpeed(float F)
{
	SpectateSpeed = F;
	ServerSpectateSpeed(F);
	//return;	
}

function ClientSetWeaponViewShake(bool B)
{
	bWeaponViewShake = B;
	//return;	
}

function ClientSetClassicView()
{
	Level.bClassicView = true;
	//return;	
}

function ServerSpectateSpeed(float F)
{
	SpectateSpeed = F;
	//return;	
}

function ServerGivePawn()
{
	GivePawn(Pawn);
	//return;	
}

function ClientCapBandwidth(int Cap)
{
	ClientCap = Cap;
	// End:0x3B
	if((Player != none) && Player.CurrentNetSpeed > Cap)
	{
		SetNetSpeed(Cap);
	}
	//return;	
}

function PendingStasis()
{
	bStasis = true;
	Pawn = none;
	GotoState('Scripting');
	//return;	
}

function AddCheats()
{
	// End:0x35
	if((CheatManager == none) && int(Level.NetMode) == int(NM_Standalone))
	{
		CheatManager = new (self) CheatClass;
	}
	//return;	
}

function MakeAdmin()
{
	// End:0xB6
	if((((AdminManager == none) && Level != none) && Level.Game != none) && Level.Game.AccessControl != none)
	{
		// End:0x8C
		if(Level.Game.AccessControl.AdminClass == none)
		{
			Log("AdminClass is None");			
		}
		else
		{
			AdminManager = new (self) Level.Game.AccessControl.AdminClass;
		}
	}
	//return;	
}

function HandlePickup(Pickup pick)
{
	ReceiveLocalizedMessage(pick.MessageClass,,,, pick.Class);
	//return;	
}

event ClientSetViewTarget(Actor A)
{
	local bool bNewViewTarget;

	// End:0x27
	if(A == none)
	{
		// End:0x1E
		if(ViewTarget != self)
		{
			SetLocation(CalcViewLocation);
		}
		ServerVerifyViewTarget();		
	}
	else
	{
		bNewViewTarget = ViewTarget != A;
		SetViewTarget(A);
		// End:0x5F
		if(bNewViewTarget)
		{
			A.POVChanged(self, false);
		}
	}
	//return;	
}

function ServerVerifyViewTarget()
{
	// End:0x0D
	if(ViewTarget == self)
	{
		return;
	}
	// End:0x1A
	if(ViewTarget == none)
	{
		return;
	}
	ClientSetViewTarget(ViewTarget);
	//return;	
}

function SpawnDefaultHUD()
{
	myHUD = Spawn(Class'Engine.HUD', self);
	//return;	
}

function Reset()
{
	local Vehicle DrivenVehicle;

	DrivenVehicle = Vehicle(Pawn);
	// End:0x2B
	if(DrivenVehicle != none)
	{
		DrivenVehicle.KDriverLeave(true);
	}
	// End:0x41
	if(Pawn != none)
	{
		PawnDied(Pawn);
	}
	super.Reset();
	SetViewTarget(self);
	ClientSetViewTarget(self);
	ClientSetFixedCamera(false);
	bBehindView = false;
	WaitDelay = Level.TimeSeconds + float(2);
	FixFOV();
	// End:0xA0
	if(PlayerReplicationInfo.bOnlySpectator)
	{
		GotoState('Spectating');		
	}
	else
	{
		GotoState('PlayerWaiting');
	}
	//return;	
}

event ClientReset()
{
	bBehindView = false;
	bFixedCamera = false;
	SetViewTarget(self);
	// End:0x33
	if(PlayerReplicationInfo.bOnlySpectator)
	{
		GotoState('Spectating');		
	}
	else
	{
		GotoState('PlayerWaiting');
	}
	//return;	
}

function CleanOutSavedMoves()
{
	local SavedMove Next;

	J0x00:
	// End:0x39 [Loop If]
	if(SavedMoves != none)
	{
		Next = SavedMoves.NextMove;
		SavedMoves.Destroy();
		SavedMoves = Next;
		// [Loop Continue]
		goto J0x00;
	}
	// End:0x57
	if(PendingMove != none)
	{
		PendingMove.Destroy();
		PendingMove = none;
	}
	//return;	
}

event InitInputSystem()
{
	PlayerInput = new (self) InputClass;
	//return;	
}

function ClientGotoState(name NewState, name NewLabel)
{
	GotoState(NewState, NewLabel);
	//return;	
}

function AskForPawn()
{
	// End:0x1E
	if(IsInState('GameEnded'))
	{
		ClientGotoState('GameEnded', 'Begin');		
	}
	else
	{
		// End:0x3C
		if(IsInState('RoundEnded'))
		{
			ClientGotoState('RoundEnded', 'Begin');			
		}
		else
		{
			// End:0x5A
			if(IsInState('Spectating'))
			{
				ClientGotoState('Spectating', 'Begin');				
			}
			else
			{
				// End:0x73
				if(Pawn != none)
				{
					GivePawn(Pawn);					
				}
				else
				{
					bFrozen = false;
					ServerReStartPlayer();
				}
			}
		}
	}
	//return;	
}

function GivePawn(Pawn NewPawn)
{
	// End:0x0D
	if(NewPawn == none)
	{
		return;
	}
	Pawn = NewPawn;
	NewPawn.Controller = self;
	ClientReStart(Pawn);
	//return;	
}

function int GetFacingDirection()
{
	local Vector X, Y, Z, Dir;

	GetAxes(Pawn.Rotation, X, Y, Z);
	Dir = Normal(Pawn.Acceleration);
	// End:0x6D
	if((Y Dot Dir) > float(0))
	{
		return int(float(49152) + (float(16384) * (X Dot Dir)));		
	}
	else
	{
		return int(float(16384) - (float(16384) * (X Dot Dir)));
	}
	//return;	
}

function Possess(Pawn aPawn)
{
	// End:0x14
	if(PlayerReplicationInfo.bOnlySpectator)
	{
		return;
	}
	TargetEyeHeight = aPawn.BaseEyeHeight;
	ResetFOV();
	aPawn.PossessedBy(self);
	Pawn = aPawn;
	Pawn.bStasis = false;
	ResetTimeMargin();
	CleanOutSavedMoves();
	// End:0xC1
	if((Vehicle(Pawn) != none) && Vehicle(Pawn).Driver != none)
	{
		PlayerReplicationInfo.bIsFemale = Vehicle(Pawn).Driver.bIsFemale;		
	}
	else
	{
		PlayerReplicationInfo.bIsFemale = Pawn.bIsFemale;
	}
	ServerSetHandedness(Handedness);
	ServerSetAutoTaunt(bAutoTaunt);
	Restart();
	//return;	
}

function AcknowledgePossession(Pawn P)
{
	// End:0x4B
	if(Viewport(Player) != none)
	{
		AcknowledgedPawn = P;
		// End:0x35
		if(P != none)
		{
			P.SetBaseEyeheight();
		}
		ServerAcknowledgePossession(P, Handedness, bAutoTaunt);
	}
	//return;	
}

function ServerAcknowledgePossession(Pawn P, float NewHand, bool bNewAutoTaunt)
{
	AcknowledgedPawn = P;
	ServerSetHandedness(NewHand);
	ServerSetAutoTaunt(bNewAutoTaunt);
	//return;	
}

function UnPossess()
{
	// End:0x58
	if(Pawn != none)
	{
		SetLocation(Pawn.Location);
		Pawn.RemoteRole = ROLE_SimulatedProxy;
		Pawn.UnPossessed();
		CleanOutSavedMoves();
		// End:0x58
		if(ViewTarget == Pawn)
		{
			SetViewTarget(self);
		}
	}
	Pawn = none;
	GotoState('Spectating');
	//return;	
}

function ViewNextBot()
{
	// End:0x1A
	if(CheatManager != none)
	{
		CheatManager.ViewBot();
	}
	//return;	
}

function PawnDied(Pawn P)
{
	// End:0x11
	if(P != Pawn)
	{
		return;
	}
	EndZoom();
	// End:0x33
	if(Pawn != none)
	{
		Pawn.RemoteRole = ROLE_SimulatedProxy;
	}
	// End:0x4A
	if(ViewTarget == Pawn)
	{
		bBehindView = true;
	}
	super.PawnDied(P);
	//return;	
}

simulated function ClientUpdateFlagHolder(PlayerReplicationInfo PRI, int i)
{
	// End:0x1F
	if((int(Role) == int(ROLE_Authority)) || GameReplicationInfo == none)
	{
		return;
	}
	GameReplicationInfo.FlagHolder[i] = PRI;
	//return;	
}

simulated function ClientSetHUD(Class<HUD> newHUDClass, Class<ScoreBoard> newScoringClass)
{
	// End:0x17
	if(myHUD != none)
	{
		myHUD.Destroy();
	}
	// End:0x2C
	if(newHUDClass == none)
	{
		myHUD = none;		
	}
	else
	{
		myHUD = Spawn(newHUDClass, self);
		// End:0x9C
		if(myHUD == none)
		{
			Log("PlayerController::ClientSetHUD(): Could not spawn a HUD of class " $ string(newHUDClass), 'Error');			
		}
		else
		{
			myHUD.SetScoreBoardClass(newScoringClass);
		}
	}
	// End:0xF6
	if((Level.Song != "") && Level.Song != "None")
	{
		ClientSetInitialMusic(Level.Song, 3);
	}
	//return;	
}

simulated function ClientPlayForceFeedback(string EffectName)
{
	// End:0x23
	if(bForceFeedbackSupported && Viewport(Player) != none)
	{
		PlayFeedbackEffect(EffectName);
	}
	//return;	
}

simulated function StopForceFeedback(optional string EffectName)
{
	// End:0x23
	if(bForceFeedbackSupported && Viewport(Player) != none)
	{
		StopFeedbackEffect(EffectName);
	}
	//return;	
}

function ClientStopForceFeedback(optional string EffectName)
{
	// End:0x23
	if(bForceFeedbackSupported && Viewport(Player) != none)
	{
		StopFeedbackEffect(EffectName);
	}
	//return;	
}

final function float UpdateFlashComponent(float Current, float Step, float Goal)
{
	// End:0x26
	if(Goal > Current)
	{
		return FMin(Current + Step, Goal);		
	}
	else
	{
		return FMax(Current - Step, Goal);
	}
	//return;	
}

function ViewFlash(float DeltaTime)
{
	local Vector goalFog;
	local float goalscale, Delta, Step;
	local PhysicsVolume ViewVolume;

	Delta = FMin(0.1000000, DeltaTime);
	goalscale = 1.0000000;
	goalFog = vect(0.0000000, 0.0000000, 0.0000000);
	// End:0xA4
	if(Pawn != none)
	{
		// End:0x61
		if(bBehindView)
		{
			ViewVolume = Level.GetPhysicsVolume(CalcViewLocation);			
		}
		else
		{
			ViewVolume = Pawn.HeadVolume;
		}
		goalscale += ViewVolume.ViewFlash.X;
		goalFog += ViewVolume.ViewFog;
	}
	Step = (0.6000000 * Delta) * ScreenFlashScaling;
	FlashScale.X = UpdateFlashComponent(FlashScale.X, Step, goalscale);
	FlashScale = FlashScale.X * vect(1.0000000, 1.0000000, 1.0000000);
	FlashFog.X = UpdateFlashComponent(FlashFog.X, Step, goalFog.X);
	FlashFog.Y = UpdateFlashComponent(FlashFog.Y, Step, goalFog.Y);
	FlashFog.Z = UpdateFlashComponent(FlashFog.Z, Step, goalFog.Z);
	//return;	
}

simulated event ReceiveLocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
	{
		return;
	}
	Message.static.ClientReceive(self, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	// End:0xC6
	if((Message.static.IsConsoleMessage(Switch) && Player != none) && Player.Console != none)
	{
		Player.Console.Message(Message.static.GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 0.0000000);
	}
	//return;	
}

simulated event ChatRoomMessage(byte Result, int ChannelIndex, optional PlayerReplicationInfo RelatedPRI)
{
	local VoiceChatRoom VCR;
	local string str;

	// End:0xD2
	if((VoiceReplicationInfo != none) && ChatRoomMessageClass != none)
	{
		VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
		// End:0x52
		if(VCR != none)
		{
			str = VCR.GetTitle();
		}
		// End:0x8B
		if(((str ~= "Team") || str ~= "Public") || str ~= "Local")
		{
			return;
		}
		// End:0xAC
		if(int(Result) == 15)
		{
			// End:0xA4
			if(bShownNoChatRoomMsg)
			{
				return;
			}
			bShownNoChatRoomMsg = true;
		}
		ClientMessage(ChatRoomMessageClass.static.AssembleMessage(int(Result), str, RelatedPRI));
	}
	//return;	
}

final function ShowNoVoiceChatMsg()
{
	// End:0x0B
	if(bShownNoChatRoomMsg)
	{
		return;
	}
	ChatRoomMessage(15, -1);
	bShownNoChatRoomMsg = true;
	//return;	
}

event ClientMessage(coerce string S, optional name Type)
{
	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
	{
		return;
	}
	// End:0x42
	if(Type == 'None')
	{
		Type = 'Event';
	}
	TeamMessage(PlayerReplicationInfo, S, Type);
	//return;	
}

function bool AllowTextToSpeech(PlayerReplicationInfo PRI, name Type)
{
	// End:0x18
	if(bNoTextToSpeechVoiceMessages || PRI == none)
	{
		return false;
	}
	// End:0x95
	if(Type == 'Say')
	{
		// End:0x6F
		if((PRI.bAdmin || (GameReplicationInfo != none) && !GameReplicationInfo.bTeamGame) || PRI == PlayerReplicationInfo)
		{
			return true;
		}
		// End:0x89
		if(IsInState('GameEnded') || IsInState('RoundEnded'))
		{
			return true;
		}
		return !bOnlySpeakTeamText;		
	}
	else
	{
		// End:0xA6
		if(Type == 'TeamSay')
		{
			return true;
		}
	}
	return false;
	//return;	
}

event TeamMessage(PlayerReplicationInfo PRI, coerce string S, name Type)
{
	local string C;

	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
	{
		return;
	}
	// End:0x4B
	if(AllowTextToSpeech(PRI, Type))
	{
		TextToSpeech(S, TextToSpeechVoiceVolume);
	}
	// End:0x65
	if(Type == 'TeamSayQuiet')
	{
		Type = 'TeamSay';
	}
	// End:0x95
	if(myHUD != none)
	{
		myHUD.Message(PRI, C $ S, Type);
	}
	// End:0x1AB
	if((Player != none) && Player.Console != none)
	{
		// End:0x17D
		if(PRI != none)
		{
			// End:0x15C
			if((PRI.Team != none) && GameReplicationInfo.bTeamGame)
			{
				// End:0x123
				if(PRI.Team.TeamIndex == 0)
				{
					C = ((Chr(27) $ Chr(200)) $ Chr(1)) $ Chr(1);					
				}
				else
				{
					// End:0x15C
					if(PRI.Team.TeamIndex == 1)
					{
						C = ((Chr(27) $ Chr(125)) $ Chr(200)) $ Chr(253);
					}
				}
			}
			S = (PRI.PlayerName $ ": ") $ S;
		}
		Player.Console.Chat(C $ S, 6.0000000, PRI);
	}
	//return;	
}

simulated function PlayBeepSound()
{
	//return;	
}

simulated function PrecacheAnnouncements()
{
	// End:0x1B
	if(RewardAnnouncer != none)
	{
		RewardAnnouncer.PrecacheAnnouncements(true);
	}
	// End:0x36
	if(StatusAnnouncer != none)
	{
		StatusAnnouncer.PrecacheAnnouncements(false);
	}
	//return;	
}

simulated function PlayStatusAnnouncement(name AName, byte AnnouncementLevel, optional bool bForce)
{
	local float Atten;
	local Sound ASound;

	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
	{
		return;
	}
	// End:0x4A
	if((int(AnnouncementLevel) > int(AnnouncerLevel)) || StatusAnnouncer == none)
	{
		return;
	}
	// End:0x76
	if(!bForce && (Level.TimeSeconds - LastPlaySound) < float(1))
	{
		return;
	}
	LastPlaySound = Level.TimeSeconds;
	LastPlaySpeech = Level.TimeSeconds;
	Atten = 2.0000000 * FClamp(0.1000000 + (float(AnnouncerVolume) * 0.2250000), 0.2000000, 1.0000000);
	ASound = StatusAnnouncer.GetSound(AName);
	// End:0x104
	if(ASound != none)
	{
		ClientPlaySound(ASound, true, Atten, 5);
	}
	//return;	
}

simulated function PlayRewardAnnouncement(name AName, byte AnnouncementLevel, optional bool bForce)
{
	local float Atten;
	local Sound ASound;

	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
	{
		return;
	}
	// End:0x4A
	if((int(AnnouncementLevel) > int(AnnouncerLevel)) || RewardAnnouncer == none)
	{
		return;
	}
	// End:0x76
	if(!bForce && (Level.TimeSeconds - LastPlaySound) < float(1))
	{
		return;
	}
	LastPlaySound = Level.TimeSeconds;
	LastPlaySpeech = Level.TimeSeconds;
	Atten = 2.0000000 * FClamp(0.1000000 + (float(AnnouncerVolume) * 0.2250000), 0.2000000, 1.0000000);
	ASound = RewardAnnouncer.GetSound(AName);
	// End:0x104
	if(ASound != none)
	{
		ClientPlaySound(ASound, true, Atten, 5);
	}
	//return;	
}

simulated function PlayAnnouncement(Sound ASound, byte AnnouncementLevel, optional bool bForce)
{
	local float Atten;

	// End:0x15
	if(int(AnnouncementLevel) > int(AnnouncerLevel))
	{
		return;
	}
	// End:0x41
	if(!bForce && (Level.TimeSeconds - LastPlaySound) < float(1))
	{
		return;
	}
	LastPlaySound = Level.TimeSeconds;
	LastPlaySpeech = Level.TimeSeconds;
	Atten = 2.0000000 * FClamp(0.1000000 + (float(AnnouncerVolume) * 0.2250000), 0.2000000, 1.0000000);
	ClientPlaySound(ASound, true, Atten, 5);
	//return;	
}

function Sound CustomizeAnnouncer(Sound AnnouncementSound)
{
	return AnnouncementSound;
	//return;	
}

simulated function QueueAnnouncement(name ASoundName, byte AnnouncementLevel, optional AnnouncerQueueManager.EAPriority Priority, optional byte Switch)
{
	// End:0x3D
	if(((int(AnnouncementLevel) > int(AnnouncerLevel)) || int(Level.NetMode) == int(NM_DedicatedServer)) || GameReplicationInfo == none)
	{
		return;
	}
	// End:0x66
	if(AnnouncerQueueManager == none)
	{
		AnnouncerQueueManager = Spawn(Class'Engine.AnnouncerQueueManager');
		AnnouncerQueueManager.InitFor(self);
	}
	// End:0x8F
	if(AnnouncerQueueManager != none)
	{
		AnnouncerQueueManager.AddItemToQueue(ASoundName, Priority, Switch);
	}
	//return;	
}

function bool AllowVoiceMessage(name messagetype)
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return true;
	}
	// End:0x7A
	if((Level.TimeSeconds - OldMessageTime) < float(3))
	{
		// End:0x5B
		if((messagetype == 'TAUNT') || messagetype == 'AutoTaunt')
		{
			return false;
		}
		// End:0x7A
		if((Level.TimeSeconds - OldMessageTime) < float(1))
		{
			return false;
		}
	}
	// End:0xB5
	if((Level.TimeSeconds - OldMessageTime) < float(6))
	{
		OldMessageTime = Level.TimeSeconds + float(3);		
	}
	else
	{
		OldMessageTime = Level.TimeSeconds;
	}
	return true;
	//return;	
}

simulated function ClientPlaySound(Sound ASound, optional bool bVolumeControl, optional float inAtten, optional Actor.ESoundSlot Slot)
{
	local float Atten;

	Atten = 1.0000000;
	// End:0x2B
	if(bVolumeControl)
	{
		Atten = FClamp(inAtten, 0.0000000, 2.0000000);
	}
	// End:0x55
	if(ViewTarget != none)
	{
		ViewTarget.PlaySound(ASound, Slot, Atten,,,, false);
	}
	//return;	
}

simulated function ClientReliablePlaySound(Sound ASound, optional bool bVolumeControl)
{
	ClientPlaySound(ASound, bVolumeControl);
	//return;	
}

simulated event Destroyed()
{
	local SavedMove Next;
	local Vehicle DrivenVehicle;
	local Pawn Driver;

	// End:0x1A
	if(AdminManager != none)
	{
		AdminManager.DoLogout();
	}
	StopFeedbackEffect();
	// End:0xDB
	if(Pawn != none)
	{
		DrivenVehicle = Vehicle(Pawn);
		// End:0xA8
		if(DrivenVehicle != none)
		{
			Driver = DrivenVehicle.Driver;
			DrivenVehicle.KDriverLeave(true);
			// End:0xA5
			if(Driver != none)
			{
				Driver.Health = 0;
				Driver.Died(self, Class'Engine.Suicided', Driver.Location);
			}			
		}
		else
		{
			Pawn.Health = 0;
			Pawn.Died(self, Class'Engine.Suicided', Pawn.Location);
		}
	}
	// End:0xF2
	if(myHUD != none)
	{
		myHUD.Destroy();
	}
	// End:0x109
	if(AnnouncerQueueManager != none)
	{
		AnnouncerQueueManager.Destroy();
	}
	J0x109:

	// End:0x142 [Loop If]
	if(FreeMoves != none)
	{
		Next = FreeMoves.NextMove;
		FreeMoves.Destroy();
		FreeMoves = Next;
		// [Loop Continue]
		goto J0x109;
	}
	J0x142:

	// End:0x17B [Loop If]
	if(SavedMoves != none)
	{
		Next = SavedMoves.NextMove;
		SavedMoves.Destroy();
		SavedMoves = Next;
		// [Loop Continue]
		goto J0x142;
	}
	// End:0x199
	if(PlayerSecurity != none)
	{
		PlayerSecurity.Destroy();
		PlayerSecurity = none;
	}
	// End:0x1B0
	if(ChatManager != none)
	{
		ChatManager.Destroy();
	}
	super.Destroyed();
	//return;	
}

function ClientSetMusic(string NewSong, Actor.EMusicTransition NewTransition)
{
	local float FadeIn, FadeOut;
	local bool bCrossFade;

	// End:0xEA
	if((Viewport(Player) != none) || int(Level.NetMode) == int(NM_Client))
	{
		switch(NewTransition)
		{
			// End:0x58
			case 2:
				FadeIn = 7.0000000;
				FadeOut = 3.0000000;
				bCrossFade = true;
				// End:0xB5
				break;
			// End:0x76
			case 3:
				FadeIn = 3.0000000;
				FadeOut = 3.0000000;
				// End:0xB5
				break;
			// End:0x94
			case 4:
				FadeIn = 1.0000000;
				FadeOut = 1.0000000;
				// End:0xB5
				break;
			// End:0xB2
			case 5:
				FadeIn = 5.0000000;
				FadeOut = 5.0000000;
				// End:0xB5
				break;
			// End:0xFFFF
			default:
				break;
		}
		// End:0xDF
		if(NewSong != "")
		{
			PlayMusic(NewSong, FadeIn, FadeOut, bCrossFade);			
		}
		else
		{
			StopAllMusic(FadeOut);
		}
	}
	Song = NewSong;
	Transition = NewTransition;
	// End:0x13E
	if((Player != none) && Player.Console != none)
	{
		Player.Console.SetMusic(NewSong);
	}
	//return;	
}

function ClientSetInitialMusic(string NewSong, Actor.EMusicTransition NewTransition)
{
	local string SongName;

	// End:0x0E
	if(Song != "")
	{
		return;
	}
	SongName = NewSong;
	// End:0x5D
	if((Player != none) && Player.Console != none)
	{
		SongName = Player.Console.SetInitialMusic(NewSong);
	}
	ClientSetMusic(SongName, NewTransition);
	//return;	
}

function ToggleZoomWithMax(float MaxZoomLevel)
{
	// End:0x18
	if(DefaultFOV != DesiredFOV)
	{
		EndZoom();		
	}
	else
	{
		StartZoomWithMax(MaxZoomLevel);
	}
	//return;	
}

function StartZoomWithMax(float MaxZoomLevel)
{
	DesiredZoomLevel = MaxZoomLevel;
	myHUD.FadeZoom();
	ZoomLevel = 0.0000000;
	bZooming = true;
	//return;	
}

function ToggleZoom()
{
	ToggleZoomWithMax(0.9000000);
	//return;	
}

function StartZoom()
{
	StartZoomWithMax(0.9000000);
	//return;	
}

function StopZoom()
{
	bZooming = false;
	//return;	
}

function EndZoom()
{
	// End:0x1E
	if(DesiredFOV != DefaultFOV)
	{
		myHUD.FadeZoom();
	}
	bZooming = false;
	DesiredFOV = DefaultFOV;
	//return;	
}

simulated function FixFOV()
{
	FovAngle = default.DefaultFOV;
	DesiredFOV = default.DefaultFOV;
	DefaultFOV = default.DefaultFOV;
	//return;	
}

function SetFOV(float NewFOV)
{
	DesiredFOV = NewFOV;
	FovAngle = NewFOV;
	//return;	
}

function ResetFOV()
{
	DesiredFOV = DefaultFOV;
	FovAngle = DefaultFOV;
	//return;	
}

exec function FOV(float F)
{
	// End:0x63
	if(((F >= 80.0000000) || int(Level.NetMode) == int(NM_Standalone)) || PlayerReplicationInfo.bOnlySpectator)
	{
		DefaultFOV = FClamp(F, 1.0000000, 179.0000000);
		DesiredFOV = DefaultFOV;
		SaveConfig();
	}
	//return;	
}

exec function Mutate(string MutateString)
{
	ServerMutate(MutateString);
	//return;	
}

function ServerMutate(string MutateString)
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	Level.Game.BaseMutator.Mutate(MutateString, self);
	//return;	
}

exec function SetSensitivity(float F)
{
	PlayerInput.UpdateSensitivity(F);
	//return;	
}

exec function SetMouseSmoothing(int Mode)
{
	PlayerInput.UpdateSmoothing(Mode);
	//return;	
}

exec function SetMouseAccel(float F)
{
	PlayerInput.UpdateAccel(F);
	//return;	
}

exec function ForceReload()
{
	// End:0x21
	if((Pawn != none) && Pawn.Weapon != none)
	{
	}
	//return;	
}

function bool AllowTextMessage(string Msg)
{
	local int i;

	// End:0x2F
	if((int(Level.NetMode) == int(NM_Standalone)) || PlayerReplicationInfo.bAdmin)
	{
		return true;
	}
	// End:0x65
	if((Level.Pauser == none) && (Level.TimeSeconds - LastBroadcastTime) < float(2))
	{
		return false;
	}
	// End:0xD5
	if((Level.TimeSeconds - LastBroadcastTime) < float(5))
	{
		Msg = Left(Msg, Clamp(Len(Msg) - 4, 8, 64));
		i = 0;
		J0xA8:

		// End:0xD5 [Loop If]
		if(i < 4)
		{
			// End:0xCB
			if(LastBroadcastString[i] ~= Msg)
			{
				return false;
			}
			i++;
			// [Loop Continue]
			goto J0xA8;
		}
	}
	i = 3;
	J0xDD:

	// End:0x10C [Loop If]
	if(i > 0)
	{
		LastBroadcastString[i] = LastBroadcastString[i - 1];
		i--;
		// [Loop Continue]
		goto J0xDD;
	}
	LastBroadcastString[0] = Msg;
	LastBroadcastTime = Level.TimeSeconds;
	return true;
	//return;	
}

exec function Say(string Msg)
{
	Msg = Left(Msg, 128);
	// End:0x28
	if(AllowTextMessage(Msg))
	{
		ServerSay(Msg);
	}
	//return;	
}

function ServerSay(string Msg)
{
	local PlayerController C;

	Msg = Level.Game.StripColor(Msg);
	// End:0xD9
	if(PlayerReplicationInfo.bAdmin && Left(Msg, 1) == "#")
	{
		Msg = Right(Msg, Len(Msg) - 1);
		// End:0xD6
		foreach __NFUN_325__(Class'Engine.PlayerController', C)
		{
			// End:0xD5
			if(C.Player != none)
			{
				C.ClearProgressMessages();
				C.SetProgressTime(6.0000000);
				C.SetProgressMessage(0, Msg, Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
			}			
		}		
		return;
	}
	Level.Game.Broadcast(self, Msg, 'Say');
	//return;	
}

exec function TeamSay(string Msg)
{
	Msg = Left(Msg, 128);
	// End:0x28
	if(AllowTextMessage(Msg))
	{
		ServerTeamSay(Msg);
	}
	//return;	
}

function ServerTeamSay(string Msg)
{
	LastActiveTime = Level.TimeSeconds;
	Msg = Level.Game.StripColor(Msg);
	// End:0x58
	if(!GameReplicationInfo.bTeamGame)
	{
		Say(Msg);
		return;
	}
	Level.Game.BroadcastTeam(self, Level.Game.ParseMessageString(Level.Game.BaseMutator, self, Msg), 'TeamSay');
	//return;	
}

function ServerSetAutoTaunt(bool Value)
{
	bAutoTaunt = Value;
	//return;	
}

exec function SetAutoTaunt(bool Value)
{
	Class'Engine.PlayerController'.default.bAutoTaunt = Value;
	Class'Engine.PlayerController'.static.StaticSaveConfig();
	bAutoTaunt = Value;
	ServerSetAutoTaunt(Value);
	//return;	
}

function ServerSetHandedness(float hand)
{
	Handedness = hand;
	// End:0x49
	if((Pawn != none) && Pawn.Weapon != none)
	{
		Pawn.Weapon.SetHand(Handedness);
	}
	//return;	
}

function SetHand(int IntValue)
{
	Handedness = float(IntValue);
	SaveConfig();
	// End:0x4E
	if((Pawn != none) && Pawn.Weapon != none)
	{
		Pawn.Weapon.SetHand(Handedness);
	}
	ServerSetHandedness(Handedness);
	//return;	
}

exec function SetWeaponHand(string S)
{
	// End:0x1E
	if(S ~= "Left")
	{
		Handedness = -1.0000000;		
	}
	else
	{
		// End:0x3D
		if(S ~= "Right")
		{
			Handedness = 1.0000000;			
		}
		else
		{
			// End:0x5D
			if(S ~= "Center")
			{
				Handedness = 0.0000000;				
			}
			else
			{
				// End:0x7A
				if(S ~= "Hidden")
				{
					Handedness = 2.0000000;
				}
			}
		}
	}
	SetHand(int(Handedness));
	//return;	
}

function bool IsDead()
{
	return false;
	//return;	
}

exec function ShowGun()
{
	// End:0x1C
	if(Handedness == float(2))
	{
		Handedness = 1.0000000;		
	}
	else
	{
		Handedness = 2.0000000;
	}
	SetHand(int(Handedness));
	//return;	
}

event PreClientTravel()
{
	Log("PreClientTravel");
	ClientStopForceFeedback();
	//return;	
}

function ClientSetFixedCamera(bool B)
{
	bFixedCamera = B;
	//return;	
}

function ClientSetBehindView(bool B)
{
	local bool bWasBehindView;

	bWasBehindView = bBehindView;
	bBehindView = B;
	CameraDist = default.CameraDist;
	// End:0x47
	if(bBehindView != bWasBehindView)
	{
		ViewTarget.POVChanged(self, true);
	}
	// End:0x7E
	if(Vehicle(Pawn) != none)
	{
		Vehicle(Pawn).bDesiredBehindView = B;
		Pawn.SaveConfig();
	}
	//return;	
}

function ClientVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name messagetype, byte MessageID)
{
	local VoicePack V;

	// End:0x46
	if((((Sender == none) || Sender.VoiceType == none) || Player == none) || Player.Console == none)
	{
		return;
	}
	V = Spawn(Sender.VoiceType, self);
	// End:0x8C
	if(V != none)
	{
		V.ClientInitialize(Sender, Recipient, messagetype, MessageID);
	}
	//return;	
}

function ForceDeathUpdate()
{
	LastUpdateTime = Level.TimeSeconds - float(10);
	//return;	
}

function RocketServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, byte ClientRoll, int View)
{
	ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, false, false, 0, ClientRoll, View);
	//return;	
}

function DualRocketServerMove(float TimeStamp0, Vector InAccel0, bool NewbDuck0, byte ClientRoll0, int View0, float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, byte ClientRoll, int View)
{
	ServerMove(TimeStamp0, InAccel0, vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, false, false, 0, ClientRoll0, View0);
	ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, false, false, 0, ClientRoll, View);
	//return;	
}

function SpaceFighterServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, int ViewPitch, int ViewYaw, int ViewRoll)
{
	local Rotator BackupView;

	BackupView.Pitch = ViewPitch;
	BackupView.Yaw = ViewYaw;
	BackupView.Roll = ViewRoll;
	SetRotation(BackupView);
	// End:0x54
	if(Pawn != none)
	{
		Pawn.SetRotation(BackupView);
	}
	global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, false, false, 0, 0, 0);
	//return;	
}

function DualSpaceFighterServerMove(float TimeStamp0, Vector InAccel0, bool NewbDuck0, int ViewPitch0, int ViewYaw0, int ViewRoll0, float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, int ViewPitch, int ViewYaw, int ViewRoll)
{
	local Rotator BackupView;

	BackupView.Pitch = ViewPitch0;
	BackupView.Yaw = ViewYaw0;
	BackupView.Roll = ViewRoll0;
	SetRotation(BackupView);
	// End:0x54
	if(Pawn != none)
	{
		Pawn.SetRotation(BackupView);
	}
	global.ServerMove(TimeStamp0, InAccel0, vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, false, false, 0, 0, 0);
	BackupView.Pitch = ViewPitch;
	BackupView.Yaw = ViewYaw;
	BackupView.Roll = ViewRoll;
	SetRotation(BackupView);
	// End:0xD3
	if(Pawn != none)
	{
		Pawn.SetRotation(BackupView);
	}
	global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, false, false, 0, 0, 0);
	//return;	
}

function TurretServerMove(float TimeStamp, Vector ClientLoc, bool NewbDuck, byte ClientRoll, int View)
{
	ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, false, NewbDuck, false, false, 0, ClientRoll, View);
	//return;	
}

function DualTurretServerMove(float TimeStamp0, bool NewbDuck0, byte ClientRoll0, int View0, float TimeStamp, Vector ClientLoc, bool NewbDuck, byte ClientRoll, int View)
{
	ServerMove(TimeStamp0, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, false, false, 0, ClientRoll0, View0);
	ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, false, NewbDuck, false, false, 0, ClientRoll, View);
	//return;	
}

function ShortServerMove(float TimeStamp, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, byte ClientRoll, int View)
{
	ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, NewbRun, NewbDuck, NewbJumpStatus, false, 0, ClientRoll, View);
	//return;	
}

function DualServerMove(float TimeStamp0, Vector InAccel0, byte PendingCompress, Actor.EDoubleClickDir DoubleClickMove0, int View0, float TimeStamp, Vector InAccel, Vector ClientLoc, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
	local bool NewbRun0, NewbDuck0, NewbJumpStatus0, NewbDoubleJump0, NewbRun, NewbDuck,
		NewbJumpStatus, NewbDoubleJump;

	NewbRun0 = (int(PendingCompress) & 1) != 0;
	NewbDuck0 = (int(PendingCompress) & 2) != 0;
	NewbJumpStatus0 = (int(PendingCompress) & 4) != 0;
	NewbDoubleJump0 = (int(PendingCompress) & 8) != 0;
	NewbRun = (int(PendingCompress) & 16) != 0;
	NewbDuck = (int(PendingCompress) & 32) != 0;
	NewbJumpStatus = (int(PendingCompress) & 64) != 0;
	NewbDoubleJump = (int(PendingCompress) & 128) != 0;
	ServerMove(TimeStamp0, InAccel0, vect(0.0000000, 0.0000000, 0.0000000), NewbRun0, NewbDuck0, NewbJumpStatus0, NewbDoubleJump0, DoubleClickMove0, ClientRoll, View0);
	// End:0x115
	if(ClientLoc == vect(0.0000000, 0.0000000, 0.0000000))
	{
		ClientLoc = vect(0.1000000, 0.0000000, 0.0000000);
	}
	ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
	//return;	
}

function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
	local float DeltaTime, clientErr, OldTimeStamp;
	local Rotator DeltaRot, Rot, ViewRot;
	local Vector Accel, LocDiff;
	local int maxPitch, ViewPitch, ViewYaw;
	local bool NewbPressedJump, OldbRun, OldbDoubleJump;
	local Actor.EDoubleClickDir OldDoubleClickMove;

	// End:0x11
	if(CurrentTimeStamp >= TimeStamp)
	{
		return;
	}
	// End:0x46
	if(AcknowledgedPawn != Pawn)
	{
		OldTimeDelta = 0;
		InAccel = vect(0.0000000, 0.0000000, 0.0000000);
		GivePawn(Pawn);
	}
	// End:0x29D
	if(int(OldTimeDelta) != 0)
	{
		OldTimeStamp = (TimeStamp - (float(OldTimeDelta) / float(500))) - 0.0010000;
		// End:0x29D
		if(CurrentTimeStamp < (OldTimeStamp - 0.0010000))
		{
			Accel.X = float(OldAccel >>> 23);
			// End:0xD8
			if(Accel.X > float(127))
			{
				Accel.X = -1.0000000 * (Accel.X - float(128));
			}
			Accel.Y = float(int(float(OldAccel >>> 15)) & 255);
			// End:0x12B
			if(Accel.Y > float(127))
			{
				Accel.Y = -1.0000000 * (Accel.Y - float(128));
			}
			Accel.Z = float(int(float(OldAccel >>> 7)) & 255);
			// End:0x17E
			if(Accel.Z > float(127))
			{
				Accel.Z = -1.0000000 * (Accel.Z - float(128));
			}
			Accel *= float(20);
			OldbRun = (OldAccel & 64) != 0;
			OldbDoubleJump = (OldAccel & 32) != 0;
			NewbPressedJump = (OldAccel & 16) != 0;
			// End:0x1D8
			if(NewbPressedJump)
			{
				bJumpStatus = NewbJumpStatus;
			}
			switch(OldAccel & 7)
			{
				// End:0x1F2
				case 0:
					OldDoubleClickMove = 0;
					// End:0x234
					break;
				// End:0x201
				case 1:
					OldDoubleClickMove = 1;
					// End:0x234
					break;
				// End:0x211
				case 2:
					OldDoubleClickMove = 2;
					// End:0x234
					break;
				// End:0x221
				case 3:
					OldDoubleClickMove = 3;
					// End:0x234
					break;
				// End:0x231
				case 4:
					OldDoubleClickMove = 4;
					// End:0x234
					break;
				// End:0xFFFF
				default:
					break;
			}
			OldTimeStamp = FMin(OldTimeStamp, CurrentTimeStamp + MaxResponseTime);
			MoveAutonomous(OldTimeStamp - CurrentTimeStamp, OldbRun, int(bDuck) == 1, NewbPressedJump, OldbDoubleJump, OldDoubleClickMove, Accel, rot(0, 0, 0));
			CurrentTimeStamp = OldTimeStamp;
		}
	}
	ViewPitch = View / 32768;
	ViewYaw = 2 * (View - (32768 * ViewPitch));
	ViewPitch *= float(2);
	Accel = InAccel * 0.1000000;
	NewbPressedJump = bJumpStatus != NewbJumpStatus;
	bJumpStatus = NewbJumpStatus;
	DeltaTime = FMin(MaxResponseTime, TimeStamp - CurrentTimeStamp);
	// End:0x338
	if(Pawn == none)
	{
		ResetTimeMargin();		
	}
	else
	{
		// End:0x37A
		if(!CheckSpeedHack(DeltaTime))
		{
			bWasSpeedHack = true;
			DeltaTime = 0.0000000;
			Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);			
		}
		else
		{
			// End:0x3C6
			if(bWasSpeedHack)
			{
				// End:0x3C6
				if((TimeMargin > (0.5000000 * Level.MaxTimeMargin)) && Level.MaxTimeMargin > float(0))
				{
					DeltaTime *= 0.8000000;
				}
			}
		}
	}
	CurrentTimeStamp = TimeStamp;
	ServerTimeStamp = Level.TimeSeconds;
	ViewRot.Pitch = ViewPitch;
	ViewRot.Yaw = ViewYaw;
	ViewRot.Roll = 0;
	// End:0x447
	if(NewbPressedJump || InAccel != vect(0.0000000, 0.0000000, 0.0000000))
	{
		LastActiveTime = Level.TimeSeconds;
	}
	// End:0x46E
	if((Pawn == none) || Pawn.bServerMoveSetPawnRot)
	{
		SetRotation(ViewRot);
	}
	// End:0x47F
	if(AcknowledgedPawn != Pawn)
	{
		return;
	}
	// End:0x5D4
	if((Pawn != none) && Pawn.bServerMoveSetPawnRot)
	{
		Rot.Roll = 256 * int(ClientRoll);
		Rot.Yaw = ViewYaw;
		// End:0x506
		if((int(Pawn.Physics) == int(3)) || int(Pawn.Physics) == int(4))
		{
			maxPitch = 2;			
		}
		else
		{
			maxPitch = 0;
		}
		// End:0x5A0
		if((ViewPitch > (maxPitch * RotationRate.Pitch)) && ViewPitch < (65536 - (maxPitch * RotationRate.Pitch)))
		{
			// End:0x57A
			if(ViewPitch < 32768)
			{
				Rot.Pitch = maxPitch * RotationRate.Pitch;				
			}
			else
			{
				Rot.Pitch = 65536 - (maxPitch * RotationRate.Pitch);
			}			
		}
		else
		{
			Rot.Pitch = ViewPitch;
		}
		DeltaRot = Rotation - Rot;
		Pawn.SetRotation(Rot);
	}
	// End:0x629
	if((Level.Pauser == none) && DeltaTime > float(0))
	{
		MoveAutonomous(DeltaTime, NewbRun, NewbDuck, NewbPressedJump, NewbDoubleJump, DoubleClickMove, Accel, DeltaRot);
	}
	// End:0x645
	if(ClientLoc == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;		
	}
	else
	{
		// End:0x672
		if((Level.TimeSeconds - LastUpdateTime) > 0.3000000)
		{
			clientErr = 10000.0000000;			
		}
		else
		{
			// End:0x6F0
			if((Level.TimeSeconds - LastUpdateTime) > (180.0000000 / float(Player.CurrentNetSpeed)))
			{
				// End:0x6C3
				if(Pawn == none)
				{
					LocDiff = Location - ClientLoc;					
				}
				else
				{
					LocDiff = Pawn.Location - ClientLoc;
				}
				clientErr = LocDiff Dot LocDiff;
			}
		}
	}
	// End:0x854
	if(clientErr > float(3))
	{
		// End:0x73C
		if(Pawn == none)
		{
			PendingAdjustment.newPhysics = Physics;
			PendingAdjustment.NewLoc = Location;
			PendingAdjustment.NewVel = Velocity;			
		}
		else
		{
			PendingAdjustment.newPhysics = Pawn.Physics;
			PendingAdjustment.NewVel = Pawn.Velocity;
			PendingAdjustment.NewBase = Pawn.Base;
			// End:0x7F0
			if((Mover(Pawn.Base) != none) || Vehicle(Pawn.Base) != none)
			{
				PendingAdjustment.NewLoc = Pawn.Location - Pawn.Base.Location;				
			}
			else
			{
				PendingAdjustment.NewLoc = Pawn.Location;
			}
			PendingAdjustment.NewFloor = Pawn.Floor;
		}
		LastUpdateTime = Level.TimeSeconds;
		PendingAdjustment.TimeStamp = TimeStamp;
		PendingAdjustment.NewState = GetStateName();
	}
	//return;	
}

event SendClientAdjustment()
{
	// End:0x21
	if(AcknowledgedPawn != Pawn)
	{
		PendingAdjustment.TimeStamp = 0.0000000;
		return;
	}
	// End:0x14C
	if((Pawn == none) || int(Pawn.Physics) != int(9))
	{
		// End:0xC1
		if(PendingAdjustment.NewVel == vect(0.0000000, 0.0000000, 0.0000000))
		{
			ShortClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewState, PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewBase);			
		}
		else
		{
			ClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewState, PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewVel.X, PendingAdjustment.NewVel.Y, PendingAdjustment.NewVel.Z, PendingAdjustment.NewBase);
		}		
	}
	else
	{
		LongClientAdjustPosition(PendingAdjustment.TimeStamp, PendingAdjustment.NewState, PendingAdjustment.newPhysics, PendingAdjustment.NewLoc.X, PendingAdjustment.NewLoc.Y, PendingAdjustment.NewLoc.Z, PendingAdjustment.NewVel.X, PendingAdjustment.NewVel.Y, PendingAdjustment.NewVel.Z, PendingAdjustment.NewBase, PendingAdjustment.NewFloor.X, PendingAdjustment.NewFloor.Y, PendingAdjustment.NewFloor.Z);
	}
	PendingAdjustment.TimeStamp = 0.0000000;
	//return;	
}

function ServerDrive(float InForward, float InStrafe, float aUp, bool InJump, int View)
{
	local Rotator ViewRotation;

	ViewRotation.Pitch = View / 32768;
	ViewRotation.Yaw = 2 * (View - (32768 * ViewRotation.Pitch));
	ViewRotation.Pitch *= float(2);
	ViewRotation.Roll = 0;
	SetRotation(ViewRotation);
	ProcessDrive(InForward, InStrafe, aUp, InJump);
	//return;	
}

function ProcessDrive(float InForward, float InStrafe, float InUp, bool InJump)
{
	ClientGotoState(GetStateName(), 'Begin');
	//return;	
}

function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
{
	// End:0x39
	if((Pawn != none) && Pawn.Acceleration != NewAccel)
	{
		Pawn.Acceleration = NewAccel;
	}
	//return;	
}

final function MoveAutonomous(float DeltaTime, bool NewbRun, bool NewbDuck, bool NewbPressedJump, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, Vector NewAccel, Rotator DeltaRot)
{
	// End:0x21
	if((Pawn != none) && Pawn.bHardAttach)
	{
		return;
	}
	// End:0x35
	if(NewbRun)
	{
		bRun = 1;		
	}
	else
	{
		bRun = 0;
	}
	// End:0x51
	if(NewbDuck)
	{
		bDuck = 1;		
	}
	else
	{
		bDuck = 0;
	}
	bPressedJump = NewbPressedJump;
	bDoubleJump = NewbDoubleJump;
	HandleWalking();
	ProcessMove(DeltaTime, NewAccel, DoubleClickMove, DeltaRot);
	// End:0xB2
	if(Pawn != none)
	{
		Pawn.AutonomousPhysics(DeltaTime);		
	}
	else
	{
		AutonomousPhysics(DeltaTime);
	}
	bDoubleJump = false;
	//return;	
}

function VeryShortClientAdjustPosition(float TimeStamp, float NewLocX, float NewLocY, float NewLocZ, Actor NewBase)
{
	local Vector Floor;

	// End:0x1F
	if(Pawn != none)
	{
		Floor = Pawn.Floor;
	}
	LongClientAdjustPosition(TimeStamp, 'PlayerWalking', 1, NewLocX, NewLocY, NewLocZ, 0.0000000, 0.0000000, 0.0000000, NewBase, Floor.X, Floor.Y, Floor.Z);
	//return;	
}

function ShortClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, Actor NewBase)
{
	local Vector Floor;

	// End:0x1F
	if(Pawn != none)
	{
		Floor = Pawn.Floor;
	}
	LongClientAdjustPosition(TimeStamp, NewState, newPhysics, NewLocX, NewLocY, NewLocZ, 0.0000000, 0.0000000, 0.0000000, NewBase, Floor.X, Floor.Y, Floor.Z);
	//return;	
}

function ClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase)
{
	local Vector Floor;

	// End:0x1F
	if(Pawn != none)
	{
		Floor = Pawn.Floor;
	}
	LongClientAdjustPosition(TimeStamp, NewState, newPhysics, NewLocX, NewLocY, NewLocZ, NewVelX, NewVelY, NewVelZ, NewBase, Floor.X, Floor.Y, Floor.Z);
	//return;	
}

function LongClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase, float NewFloorX, float NewFloorY, float NewFloorZ)
{
	local Vector NewLocation, NewVelocity, NewFloor;
	local Actor MoveActor;
	local SavedMove CurrentMove;
	local float NewPing;

	// End:0x1E1
	if((PlayerReplicationInfo != none) && !bDemoOwner)
	{
		NewPing = FMin(1.5000000, Level.TimeSeconds - TimeStamp);
		// End:0x5E
		if(ExactPing < 0.0040000)
		{
			ExactPing = FMin(0.3000000, NewPing);			
		}
		else
		{
			// End:0x8C
			if(NewPing > (float(2) * ExactPing))
			{
				NewPing = FMin(NewPing, 3.0000000 * ExactPing);
			}
			ExactPing = FMin(0.9900000, (0.9900000 * ExactPing) + (0.0080000 * NewPing));
		}
		PlayerReplicationInfo.Ping = byte(Min(int(float(250) * ExactPing), 255));
		PlayerReplicationInfo.bReceivedPing = true;
		// End:0x1E1
		if((Level.TimeSeconds - LastPingUpdate) > float(4))
		{
			// End:0x1AC
			if((bDynamicNetSpeed && OldPing > (DynamicPingThreshold * 0.0010000)) && ExactPing > (DynamicPingThreshold * 0.0010000))
			{
				// End:0x16B
				if(Level.MoveRepSize < float(64))
				{
					Level.MoveRepSize += float(8);					
				}
				else
				{
					// End:0x19E
					if(Player.CurrentNetSpeed >= 6000)
					{
						SetNetSpeed(Player.CurrentNetSpeed - 1000);
					}
				}
				OldPing = 0.0000000;				
			}
			else
			{
				OldPing = ExactPing;
			}
			LastPingUpdate = Level.TimeSeconds;
			ServerUpdatePing(int(float(1000) * ExactPing));
		}
	}
	// End:0x2A3
	if(Pawn != none)
	{
		// End:0x239
		if(Pawn.bTearOff)
		{
			Pawn = none;
			// End:0x237
			if((!IsInState('GameEnded') && !IsInState('RoundEnded')) && !IsInState('Dead'))
			{
				GotoState('Dead');
			}
			return;
		}
		MoveActor = Pawn;
		// End:0x2A0
		if((ViewTarget != Pawn) && (ViewTarget == self) || (Pawn(ViewTarget) != none) && Pawn(ViewTarget).Health <= 0)
		{
			bBehindView = false;
			SetViewTarget(Pawn);
		}		
	}
	else
	{
		MoveActor = self;
		// End:0x32E
		if(GetStateName() != NewState)
		{
			// End:0x2E1
			if((NewState == 'GameEnded') || NewState == 'RoundEnded')
			{
				GotoState(NewState);				
			}
			else
			{
				// End:0x318
				if(IsInState('Dead'))
				{
					// End:0x313
					if((NewState != 'PlayerWalking') && NewState != 'PlayerSwimming')
					{
						GotoState(NewState);
					}
					return;					
				}
				else
				{
					// End:0x32E
					if(NewState == 'Dead')
					{
						GotoState(NewState);
					}
				}
			}
		}
	}
	// End:0x33F
	if(CurrentTimeStamp >= TimeStamp)
	{
		return;
	}
	CurrentTimeStamp = TimeStamp;
	NewLocation.X = NewLocX;
	NewLocation.Y = NewLocY;
	NewLocation.Z = NewLocZ;
	NewVelocity.X = NewVelX;
	NewVelocity.Y = NewVelY;
	NewVelocity.Z = NewVelZ;
	CurrentMove = SavedMoves;
	J0x3B5:

	// End:0x61A [Loop If]
	if(CurrentMove != none)
	{
		// End:0x610
		if(CurrentMove.TimeStamp <= CurrentTimeStamp)
		{
			SavedMoves = CurrentMove.NextMove;
			CurrentMove.NextMove = FreeMoves;
			FreeMoves = CurrentMove;
			// End:0x5F3
			if(CurrentMove.TimeStamp == CurrentTimeStamp)
			{
				FreeMoves.Clear();
				// End:0x54C
				if(((Mover(NewBase) != none) || Vehicle(NewBase) != none) && NewBase == CurrentMove.EndBase)
				{
					// End:0x549
					if(((GetStateName() == NewState) && IsInState('PlayerWalking')) && (int(MoveActor.Physics) == int(1)) || int(MoveActor.Physics) == int(2))
					{
						// End:0x4EA
						if(VSize(CurrentMove.SavedRelativeLocation - NewLocation) < float(3))
						{
							CurrentMove = none;
							return;							
						}
						else
						{
							// End:0x549
							if((((Vehicle(NewBase) != none) && VSize(Velocity) < float(3)) && VSize(NewVelocity) < float(3)) && VSize(CurrentMove.SavedRelativeLocation - NewLocation) < float(30))
							{
								CurrentMove = none;
								return;
							}
						}
					}					
				}
				else
				{
					// End:0x5E9
					if(((((VSize(CurrentMove.SavedLocation - NewLocation) < float(3)) && VSize(CurrentMove.SavedVelocity - NewVelocity) < float(3)) && GetStateName() == NewState) && IsInState('PlayerWalking')) && (int(MoveActor.Physics) == int(1)) || int(MoveActor.Physics) == int(2))
					{
						CurrentMove = none;
						return;
					}
				}
				CurrentMove = none;				
			}
			else
			{
				FreeMoves.Clear();
				CurrentMove = SavedMoves;
			}			
		}
		else
		{
			CurrentMove = none;
		}
		// [Loop Continue]
		goto J0x3B5;
	}
	// End:0x68B
	if(MoveActor.bHardAttach)
	{
		// End:0x689
		if(MoveActor.Base == none)
		{
			// End:0x65C
			if(NewBase != none)
			{
				MoveActor.SetBase(NewBase);
			}
			// End:0x684
			if(MoveActor.Base == none)
			{
				MoveActor.bHardAttach = false;				
			}
			else
			{
				return;
			}			
		}
		else
		{
			return;
		}
	}
	NewFloor.X = NewFloorX;
	NewFloor.Y = NewFloorY;
	NewFloor.Z = NewFloorZ;
	// End:0x6F2
	if((Mover(NewBase) != none) || Vehicle(NewBase) != none)
	{
		NewLocation += NewBase.Location;
	}
	// End:0x857
	if(!bDemoOwner)
	{
		MoveActor.bCanTeleport = false;
		// End:0x846
		if((((((!MoveActor.SetLocation(NewLocation) && Pawn(MoveActor) != none) && MoveActor.CollisionHeight > Pawn(MoveActor).CrouchHeight) && !Pawn(MoveActor).bIsCrouched) && int(newPhysics) == int(1)) && int(MoveActor.Physics) != int(13)) && int(MoveActor.Physics) != int(14))
		{
			MoveActor.SetPhysics(newPhysics);
			// End:0x826
			if(!MoveActor.SetLocation(NewLocation + (vect(0.0000000, 0.0000000, 1.0000000) * 35.0000000)))
			{
				Pawn(MoveActor).ForceCrouch();
				MoveActor.SetLocation(NewLocation);				
			}
			else
			{
				MoveActor.MoveSmooth(vect(0.0000000, 0.0000000, -1.0000000) * 35.0000000);
			}
		}
		MoveActor.bCanTeleport = true;
	}
	// End:0x8DE
	if(((((int(MoveActor.Physics) != int(newPhysics)) && int(MoveActor.Physics) != int(13)) && int(MoveActor.Physics) != int(14)) && int(newPhysics) != int(13)) && int(newPhysics) != int(14))
	{
		MoveActor.SetPhysics(newPhysics);
	}
	// End:0x8FF
	if(MoveActor != self)
	{
		MoveActor.SetBase(NewBase, NewFloor);
	}
	MoveActor.Velocity = NewVelocity;
	// End:0x927
	if(GetStateName() != NewState)
	{
		GotoState(NewState);
	}
	bUpdatePosition = true;
	//return;	
}

function ServerUpdatePing(int NewPing)
{
	PlayerReplicationInfo.Ping = byte(Min(int(0.2500000 * float(NewPing)), 250));
	PlayerReplicationInfo.bReceivedPing = true;
	//return;	
}

function ClientUpdatePosition()
{
	local SavedMove CurrentMove;
	local int realbRun, realbDuck;
	local bool bRealJump;

	// End:0x43
	if((Pawn != none) && (int(Pawn.Physics) == int(13)) || int(Pawn.Physics) == int(14))
	{
		return;
	}
	bUpdatePosition = false;
	realbRun = int(bRun);
	realbDuck = int(bDuck);
	bRealJump = bPressedJump;
	CurrentMove = SavedMoves;
	bUpdating = true;
	J0x85:

	// End:0x283 [Loop If]
	if(CurrentMove != none)
	{
		// End:0xC0
		if((PendingMove == CurrentMove) && Pawn != none)
		{
			PendingMove.SetInitialPosition(Pawn);
		}
		// End:0x128
		if(CurrentMove.TimeStamp <= CurrentTimeStamp)
		{
			SavedMoves = CurrentMove.NextMove;
			CurrentMove.NextMove = FreeMoves;
			FreeMoves = CurrentMove;
			FreeMoves.Clear();
			CurrentMove = SavedMoves;			
		}
		else
		{
			MoveAutonomous(CurrentMove.Delta, CurrentMove.bRun, CurrentMove.bDuck, CurrentMove.bPressedJump, CurrentMove.bDoubleJump, CurrentMove.DoubleClickMove, CurrentMove.Acceleration, rot(0, 0, 0));
			// End:0x26C
			if(Pawn != none)
			{
				CurrentMove.SavedLocation = Pawn.Location;
				CurrentMove.SavedVelocity = Pawn.Velocity;
				CurrentMove.EndBase = Pawn.Base;
				// End:0x26C
				if((CurrentMove.EndBase != none) && !CurrentMove.EndBase.bWorldGeometry)
				{
					CurrentMove.SavedRelativeLocation = Pawn.Location - CurrentMove.EndBase.Location;
				}
			}
			CurrentMove = CurrentMove.NextMove;
		}
		// [Loop Continue]
		goto J0x85;
	}
	bUpdating = false;
	bDuck = byte(realbDuck);
	bRun = byte(realbRun);
	bPressedJump = bRealJump;
	//return;	
}

final function SavedMove GetFreeMove()
{
	local SavedMove S;

	// End:0x17
	if(FreeMoves == none)
	{
		return Spawn(Class'Engine.SavedMove');		
	}
	else
	{
		S = FreeMoves;
		FreeMoves = FreeMoves.NextMove;
		S.NextMove = none;
		return S;
	}
	//return;	
}

function int CompressAccel(int C)
{
	// End:0x1D
	if(C >= 0)
	{
		C = Min(C, 127);		
	}
	else
	{
		C = Min(int(Abs(float(C))), 127) + 128;
	}
	return C;
	//return;	
}

function ReplicateMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
{
	local SavedMove NewMove, OldMove, AlmostLastMove, LastMove;
	local byte ClientRoll;
	local float OldTimeDelta, NetMoveDelta;
	local int OldAccel, MoveCount;
	local Vector BuildAccel, AccelNorm, MoveLoc, CompareAccel;
	local bool bPendingJumpStatus;

	MaxResponseTime = default.MaxResponseTime * Level.TimeDilation;
	DeltaTime = FMin(DeltaTime, MaxResponseTime);
	// End:0x21E
	if(SavedMoves != none)
	{
		LastMove = SavedMoves;
		AlmostLastMove = LastMove;
		AccelNorm = Normal(NewAccel);
		J0x5B:

		// End:0x15B [Loop If]
		if(LastMove.NextMove != none)
		{
			MoveCount++;
			// End:0x96
			if(LastMove.IsJumpMove())
			{
				OldMove = LastMove;				
			}
			else
			{
				// End:0x139
				if((Pawn != none) && (OldMove == none) || !OldMove.IsJumpMove())
				{
					// End:0xE8
					if(OldMove != none)
					{
						CompareAccel = Normal(OldMove.Acceleration);						
					}
					else
					{
						CompareAccel = AccelNorm;
					}
					// End:0x139
					if((LastMove.Acceleration != CompareAccel) && (Normal(LastMove.Acceleration) Dot CompareAccel) < 0.9500000)
					{
						OldMove = LastMove;
					}
				}
			}
			AlmostLastMove = LastMove;
			LastMove = LastMove.NextMove;
			// [Loop Continue]
			goto J0x5B;
		}
		// End:0x17B
		if(LastMove.IsJumpMove())
		{
			OldMove = LastMove;			
		}
		else
		{
			// End:0x21E
			if((Pawn != none) && (OldMove == none) || !OldMove.IsJumpMove())
			{
				// End:0x1CD
				if(OldMove != none)
				{
					CompareAccel = Normal(OldMove.Acceleration);					
				}
				else
				{
					CompareAccel = AccelNorm;
				}
				// End:0x21E
				if((LastMove.Acceleration != CompareAccel) && (Normal(LastMove.Acceleration) Dot CompareAccel) < 0.9500000)
				{
					OldMove = LastMove;
				}
			}
		}
	}
	MoveCount -= 100;
	J0x227:

	// End:0x289 [Loop If]
	if(MoveCount > 0)
	{
		NewMove = SavedMoves.NextMove;
		SavedMoves.Clear();
		SavedMoves.NextMove = FreeMoves;
		FreeMoves = SavedMoves;
		SavedMoves = NewMove;
		MoveCount--;
		// [Loop Continue]
		goto J0x227;
	}
	NewMove = none;
	NewMove = GetFreeMove();
	// End:0x2A9
	if(NewMove == none)
	{
		return;
	}
	NewMove.SetMoveFor(self, DeltaTime, NewAccel, DoubleClickMove);
	bDoubleJump = false;
	ProcessMove(NewMove.Delta, NewMove.Acceleration, NewMove.DoubleClickMove, DeltaRot);
	// End:0x60A
	if(((((((((((((((PendingMove != none) && Pawn != none) && int(Pawn.Physics) == int(1)) && (NewMove.Delta + PendingMove.Delta) < MaxResponseTime) && NewAccel != vect(0.0000000, 0.0000000, 0.0000000)) && int(PendingMove.SavedPhysics) == int(1)) && !PendingMove.bPressedJump) && !NewMove.bPressedJump) && PendingMove.bRun == NewMove.bRun) && PendingMove.bDuck == NewMove.bDuck) && PendingMove.bDoubleJump == NewMove.bDoubleJump) && int(PendingMove.DoubleClickMove) == int(0)) && int(NewMove.DoubleClickMove) == int(0)) && (Normal(PendingMove.Acceleration) Dot Normal(NewAccel)) > 0.9900000) && Level.TimeDilation >= 0.9000000)
	{
		Pawn.SetLocation(PendingMove.GetStartLocation());
		Pawn.Velocity = PendingMove.StartVelocity;
		// End:0x519
		if(PendingMove.StartBase != Pawn.Base)
		{
			Pawn.SetBase(PendingMove.StartBase);
		}
		Pawn.Floor = PendingMove.StartFloor;
		NewMove.Delta += PendingMove.Delta;
		NewMove.SetInitialPosition(Pawn);
		// End:0x603
		if(LastMove == PendingMove)
		{
			// End:0x5AF
			if(SavedMoves == PendingMove)
			{
				SavedMoves.NextMove = FreeMoves;
				FreeMoves = SavedMoves;
				SavedMoves = none;				
			}
			else
			{
				PendingMove.NextMove = FreeMoves;
				FreeMoves = PendingMove;
				// End:0x5F4
				if(AlmostLastMove != none)
				{
					AlmostLastMove.NextMove = none;
					LastMove = AlmostLastMove;
				}
			}
			FreeMoves.Clear();
		}
		PendingMove = none;
	}
	// End:0x632
	if(Pawn != none)
	{
		Pawn.AutonomousPhysics(NewMove.Delta);		
	}
	else
	{
		AutonomousPhysics(DeltaTime);
	}
	NewMove.PostUpdate(self);
	// End:0x663
	if(SavedMoves == none)
	{
		SavedMoves = NewMove;		
	}
	else
	{
		LastMove.NextMove = NewMove;
	}
	// End:0x6F9
	if(PendingMove == none)
	{
		NetMoveDelta = FMax(0.0110000, (2.0000000 * Level.MoveRepSize) / float(Player.CurrentNetSpeed));
		// End:0x6F9
		if((((Level.TimeSeconds - ClientUpdateTime) * Level.TimeDilation) * 0.9100000) < NetMoveDelta)
		{
			PendingMove = NewMove;
			return;
		}
	}
	ClientUpdateTime = Level.TimeSeconds;
	// End:0x82A
	if(OldMove != none)
	{
		OldTimeDelta = FMin(255.0000000, (Level.TimeSeconds - OldMove.TimeStamp) * float(500));
		BuildAccel = (0.0500000 * OldMove.Acceleration) + vect(0.5000000, 0.5000000, 0.5000000);
		OldAccel = (((CompressAccel(int(BuildAccel.X))) << 23) + ((CompressAccel(int(BuildAccel.Y))) << 15)) + ((CompressAccel(int(BuildAccel.Z))) << 7);
		// End:0x7DD
		if(OldMove.bRun)
		{
			OldAccel += 64;
		}
		// End:0x7F8
		if(OldMove.bDoubleJump)
		{
			OldAccel += 32;
		}
		// End:0x813
		if(OldMove.bPressedJump)
		{
			OldAccel += 16;
		}
		OldAccel += int(OldMove.DoubleClickMove);
	}
	ClientRoll = byte(int(byte(Rotation.Roll >> 8)) & 255);
	// End:0x881
	if(PendingMove != none)
	{
		// End:0x874
		if(PendingMove.bPressedJump)
		{
			bJumpStatus = !bJumpStatus;
		}
		bPendingJumpStatus = bJumpStatus;
	}
	// End:0x8A2
	if(NewMove.bPressedJump)
	{
		bJumpStatus = !bJumpStatus;
	}
	// End:0x8BB
	if(Pawn == none)
	{
		MoveLoc = Location;		
	}
	else
	{
		MoveLoc = Pawn.Location;
	}
	CallServerMove(NewMove.TimeStamp, NewMove.Acceleration * float(10), MoveLoc, NewMove.bRun, NewMove.bDuck, bPendingJumpStatus, bJumpStatus, NewMove.bDoubleJump, NewMove.DoubleClickMove, ClientRoll, ((32767 & (Rotation.Pitch / 2)) * 32768) + (32767 & (Rotation.Yaw / 2)), byte(OldTimeDelta), OldAccel);
	PendingMove = none;
	//return;	
}

function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbPendingJumpStatus, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
{
	local byte PendingCompress;
	local bool bCombine;

	// End:0x394
	if(PendingMove != none)
	{
		// End:0x25
		if(PendingMove.bRun)
		{
			PendingCompress = 1;
		}
		// End:0x42
		if(PendingMove.bDuck)
		{
			PendingCompress += byte(2);
		}
		// End:0x56
		if(NewbPendingJumpStatus)
		{
			PendingCompress += byte(4);
		}
		// End:0x73
		if(PendingMove.bDoubleJump)
		{
			PendingCompress += byte(8);
		}
		// End:0x87
		if(NewbRun)
		{
			PendingCompress += byte(16);
		}
		// End:0x9B
		if(NewbDuck)
		{
			PendingCompress += byte(32);
		}
		// End:0xAF
		if(NewbJumpStatus)
		{
			PendingCompress += byte(64);
		}
		// End:0xC3
		if(NewbDoubleJump)
		{
			PendingCompress += byte(128);
		}
		// End:0x23B
		if((((((InAccel == vect(0.0000000, 0.0000000, 0.0000000)) && PendingMove.StartVelocity == vect(0.0000000, 0.0000000, 0.0000000)) && int(DoubleClickMove) == int(0)) && PendingMove.Acceleration == vect(0.0000000, 0.0000000, 0.0000000)) && int(PendingMove.DoubleClickMove) == int(0)) && !PendingMove.bDoubleJump)
		{
			// End:0x18A
			if(Pawn == none)
			{
				bCombine = Velocity == vect(0.0000000, 0.0000000, 0.0000000);				
			}
			else
			{
				bCombine = Pawn.Velocity == vect(0.0000000, 0.0000000, 0.0000000);
			}
			// End:0x23B
			if(bCombine)
			{
				// End:0x1F3
				if(int(OldTimeDelta) == 0)
				{
					ShortServerMove(TimeStamp, ClientLoc, NewbRun, NewbDuck, NewbJumpStatus, ClientRoll, View);					
				}
				else
				{
					ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
				}
				return;
			}
		}
		// End:0x2E9
		if(int(OldTimeDelta) == 0)
		{
			DualServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingCompress, PendingMove.DoubleClickMove, ((32767 & (PendingMove.Rotation.Pitch / 2)) * 32768) + (32767 & (PendingMove.Rotation.Yaw / 2)), TimeStamp, InAccel, ClientLoc, DoubleClickMove, ClientRoll, View);			
		}
		else
		{
			DualServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingCompress, PendingMove.DoubleClickMove, ((32767 & (PendingMove.Rotation.Pitch / 2)) * 32768) + (32767 & (PendingMove.Rotation.Yaw / 2)), TimeStamp, InAccel, ClientLoc, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);
		}		
	}
	else
	{
		// End:0x3EA
		if(int(OldTimeDelta) != 0)
		{
			ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View, OldTimeDelta, OldAccel);			
		}
		else
		{
			// End:0x44F
			if(((InAccel == vect(0.0000000, 0.0000000, 0.0000000)) && int(DoubleClickMove) == int(0)) && !NewbDoubleJump)
			{
				ShortServerMove(TimeStamp, ClientLoc, NewbRun, NewbDuck, NewbJumpStatus, ClientRoll, View);				
			}
			else
			{
				ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, View);
			}
		}
	}
	//return;	
}

function HandleWalking()
{
	// End:0x41
	if(Pawn != none)
	{
		Pawn.SetWalking((int(bRun) != 0) && !Region.Zone.IsA('WarpZoneInfo'));
	}
	//return;	
}

function ServerRestartGame()
{
	//return;	
}

function SetFOVAngle(float NewFOV)
{
	FovAngle = NewFOV;
	//return;	
}

exec function SetFlashScaling(float F)
{
	ScreenFlashScaling = FClamp(F, 0.0000000, 1.0000000);
	//return;	
}

function ClientFlash(float Scale, Vector fog)
{
	FlashScale = (Scale + ((float(1) - ScreenFlashScaling) * (float(1) - Scale))) * vect(1.0000000, 1.0000000, 1.0000000);
	FlashFog = (ScreenFlashScaling * 0.0010000) * fog;
	//return;	
}

function ClientAdjustGlow(float Scale, Vector fog)
{
	ConstantGlowScale += Scale;
	ConstantGlowFog += (0.0010000 * fog);
	//return;	
}

function DamageShake(int Damage)
{
	ClientDamageShake(Damage);
	//return;	
}

private function ClientDamageShake(int Damage)
{
	ShakeView(float(Damage) * vect(30.0000000, 0.0000000, 0.0000000), float(120000) * vect(1.0000000, 0.0000000, 0.0000000), 0.1500000 + (0.0050000 * float(Damage)), float(Damage) * vect(0.0000000, 0.0000000, 0.0300000), vect(1.0000000, 1.0000000, 1.0000000), 0.2000000);
	//return;	
}

function WeaponShakeView(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
	// End:0x49
	if(bWeaponViewShake)
	{
		ShakeView(shRotMag * (1.0000000 - ZoomLevel), shRotRate, shRotTime, shOffsetMag * (1.0000000 - ZoomLevel), shOffsetRate, shOffsetTime);
	}
	//return;	
}

function ShakeView(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
	// End:0x43
	if(VSize(shRotMag) > VSize(ShakeRotMax))
	{
		ShakeRotMax = shRotMag;
		ShakeRotRate = shRotRate;
		ShakeRotTime = shRotTime * vect(1.0000000, 1.0000000, 1.0000000);
	}
	// End:0x86
	if(VSize(shOffsetMag) > VSize(ShakeOffsetMax))
	{
		ShakeOffsetMax = shOffsetMag;
		ShakeOffsetRate = shOffsetRate;
		ShakeOffsetTime = shOffsetTime * vect(1.0000000, 1.0000000, 1.0000000);
	}
	//return;	
}

function StopViewShaking()
{
	ShakeRotMax = vect(0.0000000, 0.0000000, 0.0000000);
	ShakeRotRate = vect(0.0000000, 0.0000000, 0.0000000);
	ShakeRotTime = vect(0.0000000, 0.0000000, 0.0000000);
	ShakeOffsetMax = vect(0.0000000, 0.0000000, 0.0000000);
	ShakeOffsetRate = vect(0.0000000, 0.0000000, 0.0000000);
	ShakeOffsetTime = vect(0.0000000, 0.0000000, 0.0000000);
	//return;	
}

event SetAmbientShake(float FalloffStartTime, float FalloffTime, Vector OffsetMag, float OffsetFreq, Rotator RotMag, float RotFreq)
{
	bEnableAmbientShake = true;
	AmbientShakeFalloffStartTime = FalloffStartTime;
	AmbientShakeFalloffTime = FalloffTime;
	AmbientShakeOffsetMag = OffsetMag;
	AmbientShakeOffsetFreq = OffsetFreq;
	AmbientShakeRotMag = RotMag;
	AmbientShakeRotFreq = RotFreq;
	//return;	
}

event ShakeViewEvent(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
	ShakeView(shRotMag, shRotRate, shRotTime, shOffsetMag, shOffsetRate, shOffsetTime);
	//return;	
}

function damageAttitudeTo(Pawn Other, float Damage)
{
	// End:0x36
	if(((Other != none) && Other != Pawn) && Damage > float(0))
	{
		Enemy = Other;
	}
	//return;	
}

function Typing(bool bTyping)
{
	bIsTyping = bTyping;
	// End:0x44
	if((Pawn != none) && !Pawn.bTearOff)
	{
		Pawn.bIsTyping = bIsTyping;
	}
	//return;	
}

exec function Jump(optional float F)
{
	// End:0x22
	if(Level.Pauser == PlayerReplicationInfo)
	{
		SetPause(false);		
	}
	else
	{
		bPressedJump = true;
	}
	//return;	
}

exec function Speech(name Type, int Index, string Callsign)
{
	ServerSpeech(Type, Index, Callsign);
	//return;	
}

function ServerSpeech(name Type, int Index, string Callsign)
{
	// End:0x3C
	if(PlayerReplicationInfo.VoiceType != none)
	{
		PlayerReplicationInfo.VoiceType.static.PlayerSpeech(Type, Index, Callsign, self);
	}
	//return;	
}

exec function RestartLevel()
{
	// End:0x2C
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		ClientTravel("?restart", NM_ListenServer, false);
	}
	//return;	
}

exec function LocalTravel(string URL)
{
	// End:0x27
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		ClientTravel(URL, 2, true);
	}
	//return;	
}

exec function QuickSave()
{
	// End:0x5A
	if(((Pawn != none) && Pawn.Health > 0) && int(Level.NetMode) == int(NM_Standalone))
	{
		ClientMessage(QuickSaveString);
		ConsoleCommand("SaveGame 9");
	}
	//return;	
}

exec function QuickLoad()
{
	// End:0x2B
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		ClientTravel("?load=9", NM_Standalone, false);
	}
	//return;	
}

function bool SetPause(bool bPause)
{
	bFire = 0;
	bAltFire = 0;
	return Level.Game.SetPause(bPause, self);
	//return;	
}

exec function Pause()
{
	// End:0x47
	if(bDemoOwner)
	{
		// End:0x34
		if(Level.Pauser == none)
		{
			Level.Pauser = PlayerReplicationInfo;			
		}
		else
		{
			Level.Pauser = none;
		}		
	}
	else
	{
		ServerPause();
	}
	//return;	
}

function ServerPause()
{
	// End:0x1E
	if(Level.Pauser == none)
	{
		SetPause(true);		
	}
	else
	{
		SetPause(false);
	}
	//return;	
}

exec function ShowMenu()
{
	local bool bCloseHUDScreen;

	// End:0x86
	if(myHUD != none)
	{
		bCloseHUDScreen = myHUD.bShowScoreBoard || myHUD.bShowLocalStats;
		// End:0x58
		if(myHUD.bShowScoreBoard)
		{
			myHUD.bShowScoreBoard = false;
		}
		// End:0x7B
		if(myHUD.bShowLocalStats)
		{
			myHUD.bShowLocalStats = false;
		}
		// End:0x86
		if(bCloseHUDScreen)
		{
			return;
		}
	}
	ShowMidGameMenu(true);
	//return;	
}

function ShowMidGameMenu(bool bPause)
{
	// End:0x26
	if(bPause && Level.Pauser == none)
	{
		SetPause(true);
	}
	StopForceFeedback();
	// End:0x43
	if(bDemoOwner)
	{
		ClientOpenMenu(DemoMenuClass);		
	}
	else
	{
		ClientOpenMenu(MidGameMenuClass);
	}
	//return;	
}

exec function ActivateInventoryItem(Class InvItem)
{
	local Powerups Inv;

	// End:0x0D
	if(InvItem == none)
	{
		return;
	}
	Inv = Powerups(Pawn.FindInventoryType(InvItem));
	// End:0x46
	if(Inv != none)
	{
		Inv.Activate();
	}
	//return;	
}

exec function ThrowWeapon()
{
	// End:0x23
	if((Pawn == none) || Pawn.Weapon == none)
	{
		return;
	}
	ServerThrowWeapon();
	//return;	
}

function ServerThrowWeapon()
{
	local Vector TossVel;

	// End:0x81
	if((Pawn != none) && Pawn.CanThrowWeapon())
	{
		TossVel = Vector(GetViewRotation());
		TossVel = (TossVel * ((Pawn.Velocity Dot TossVel) + float(500))) + vect(0.0000000, 0.0000000, 250.0000000);
		Pawn.TossWeapon(TossVel);
		ClientSwitchToBestWeapon();
	}
	//return;	
}

exec function PrevWeapon()
{
	// End:0x16
	if(Level.Pauser != none)
	{
		return;
	}
	// End:0x33
	if(Pawn != none)
	{
		Pawn.PrevWeapon();		
	}
	else
	{
		// End:0x5A
		if(bBehindView)
		{
			CameraDist = FMax(CameraDistRange.Min, CameraDist - 1.0000000);
		}
	}
	//return;	
}

exec function NextWeapon()
{
	// End:0x16
	if(Level.Pauser != none)
	{
		return;
	}
	// End:0x33
	if(Pawn != none)
	{
		Pawn.NextWeapon();		
	}
	else
	{
		// End:0x5A
		if(bBehindView)
		{
			CameraDist = FMin(CameraDistRange.Max, CameraDist + 1.0000000);
		}
	}
	//return;	
}

exec function PipedSwitchWeapon(byte F)
{
	// End:0x23
	if((Pawn == none) || Pawn.PendingWeapon != none)
	{
		return;
	}
	SwitchWeapon(F);
	//return;	
}

exec function SwitchWeapon(byte F)
{
	// End:0x1F
	if(Pawn != none)
	{
		Pawn.SwitchWeapon(F);
	}
	//return;	
}

exec function GetWeapon(Class<Weapon> NewWeaponClass)
{
	local Inventory Inv;

	// End:0x30
	if(((Pawn == none) || Pawn.Inventory == none) || NewWeaponClass == none)
	{
		return;
	}
	// End:0x97
	if(((Pawn.Weapon != none) && Pawn.Weapon.Class == NewWeaponClass) && Pawn.PendingWeapon == none)
	{
		Pawn.Weapon.Reselect();
		return;
	}
	// End:0xCA
	if((Pawn.PendingWeapon != none) && Pawn.PendingWeapon.bForceSwitch)
	{
		return;
	}
	// End:0x196
	foreach Pawn.__NFUN_326__(NewWeaponClass, Inv)
	{
		// End:0x195
		if(Inv.Class == NewWeaponClass)
		{
			Pawn.PendingWeapon = Weapon(Inv);
			// End:0x17A
			if(!Pawn.PendingWeapon.HasAmmo())
			{
				ClientMessage(Pawn.PendingWeapon.ItemName $ Pawn.PendingWeapon.MessageNoAmmo);
				Pawn.PendingWeapon = none;				
				return;
			}
			Pawn.Weapon.PutDown();			
			return;
		}		
	}	
	//return;	
}

exec function PrevItem()
{
	local Powerups Inv, LastItem, First;
	local bool bFound;

	// End:0x39
	if(((Level.Pauser != none) || Pawn == none) || Pawn.Inventory == none)
	{
		return;
	}
	// End:0x76
	if(Pawn.SelectedItem == none)
	{
		Pawn.SelectedItem = Pawn.Inventory.SelectNext();
		return;
	}
	// End:0xEC
	foreach Pawn.__NFUN_326__(Class'Engine.Powerups', Inv)
	{
		// End:0xA7
		if(!Inv.bActivatable)
		{
			continue;			
		}
		LastItem = Inv;
		// End:0xD5
		if(Inv == Pawn.SelectedItem)
		{
			bFound = true;
			// End:0xEB
			continue;
		}
		// End:0xEB
		if(!bFound)
		{
			First = Inv;
		}		
	}	
	// End:0x103
	if(First == none)
	{
		First = LastItem;
	}
	Pawn.SelectedItem = First;
	//return;	
}

exec function ActivateItem()
{
	// End:0x16
	if(Level.Pauser != none)
	{
		return;
	}
	// End:0x4F
	if((Pawn != none) && Pawn.SelectedItem != none)
	{
		Pawn.SelectedItem.Activate();
	}
	//return;	
}

exec function Fire(optional float F)
{
	// End:0x3C
	if((int(Level.NetMode) == int(NM_Standalone)) && bViewingMatineeCinematic)
	{
		Level.Game.SceneAbort();
	}
	// End:0x5D
	if(Level.Pauser == PlayerReplicationInfo)
	{
		SetPause(false);
		return;
	}
	// End:0x75
	if(bDemoOwner || Pawn == none)
	{
		return;
	}
	Pawn.Fire(F);
	//return;	
}

exec function AltFire(optional float F)
{
	// End:0x21
	if(Level.Pauser == PlayerReplicationInfo)
	{
		SetPause(false);
		return;
	}
	// End:0x39
	if(bDemoOwner || Pawn == none)
	{
		return;
	}
	Pawn.AltFire(F);
	//return;	
}

exec function Use()
{
	ServerUse();
	//return;	
}

function ServerUse()
{
	local Actor A;
	local Vehicle DrivenVehicle, EntryVehicle, V;

	// End:0x37
	if((Level.TimeSeconds - SUTimeStamp) < 2.0000000)
	{
		// End:0x2D
		if(SUCalls >= 4)
		{
			return;
		}
		SUCalls++;		
	}
	else
	{
		SUTimeStamp = Level.TimeSeconds;
		SUCalls = 0;
	}
	// End:0x64
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x85
	if(Level.Pauser == PlayerReplicationInfo)
	{
		SetPause(false);
		return;
	}
	// End:0xA8
	if((Pawn == none) || !Pawn.bCanUse)
	{
		return;
	}
	DrivenVehicle = Vehicle(Pawn);
	// End:0xD5
	if(DrivenVehicle != none)
	{
		DrivenVehicle.KDriverLeave(false);
		return;
	}
	// End:0x135
	foreach Pawn.VisibleCollidingActors(Class'Engine.Vehicle', V, VehicleCheckRadius)
	{
		EntryVehicle = V.FindEntryVehicle(Pawn);
		// End:0x134
		if((EntryVehicle != none) && EntryVehicle.TryToDrive(Pawn))
		{			
			return;
		}		
	}	
	// End:0x164
	foreach Pawn.TouchingActors(Class'Engine.Actor', A)
	{
		A.UsedBy(Pawn);		
	}	
	// End:0x196
	if(Pawn.Base != none)
	{
		Pawn.Base.UsedBy(Pawn);
	}
	//return;	
}

exec function Suicide()
{
	local float MinSuicideInterval;

	// End:0x27
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		MinSuicideInterval = 1.0000000;		
	}
	else
	{
		MinSuicideInterval = 10.0000000;
	}
	// End:0x76
	if((Pawn != none) && (Level.TimeSeconds - Pawn.LastStartTime) > MinSuicideInterval)
	{
		Pawn.Suicide();
	}
	//return;	
}

exec function SetName(coerce string S)
{
	ChangeName(S);
	UpdateURL("Name", S, true);
	SaveConfig();
	//return;	
}

exec function SetVoice(coerce string S)
{
	// End:0x3B
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		// End:0x38
		if(PlayerReplicationInfo != none)
		{
			PlayerReplicationInfo.SetCharacterVoice(S);
		}		
	}
	else
	{
		ChangeVoiceType(S);
	}
	UpdateURL("Voice", S, true);
	//return;	
}

function ChangeVoiceType(string NewVoiceType)
{
	// End:0x1A
	if(VoiceChangeLimit > Level.TimeSeconds)
	{
		return;
	}
	VoiceChangeLimit = Level.TimeSeconds + 10.0000000;
	// End:0x62
	if((NewVoiceType != "") && PlayerReplicationInfo != none)
	{
		PlayerReplicationInfo.SetCharacterVoice(NewVoiceType);
	}
	//return;	
}

function ChangeName(coerce string S)
{
	// End:0x1D
	if(Len(S) > 20)
	{
		S = Left(S, 20);
	}
	ReplaceText(S, " ", "_");
	ReplaceText(S, "\"", "");
	Level.Game.ChangeName(self, S, true);
	//return;	
}

exec function SwitchTeam()
{
	// End:0x3D
	if((PlayerReplicationInfo.Team == none) || PlayerReplicationInfo.Team.TeamIndex == 1)
	{
		ServerChangeTeam(0);		
	}
	else
	{
		ServerChangeTeam(1);
	}
	//return;	
}

exec function ChangeTeam(int N)
{
	ServerChangeTeam(N);
	//return;	
}

function ServerChangeTeam(int N)
{
	local TeamInfo OldTeam;

	// End:0x37
	if((Level.TimeSeconds - SwitchTimestamp) < 60.0000000)
	{
		// End:0x2D
		if(SwitchCount > 10)
		{
			return;
		}
		SwitchCount++;		
	}
	else
	{
		SwitchCount = 0;
		SwitchTimestamp = Level.TimeSeconds;
	}
	OldTeam = PlayerReplicationInfo.Team;
	Level.Game.ChangeTeam(self, N, true);
	// End:0x12C
	if(Level.Game.bTeamGame && PlayerReplicationInfo.Team != OldTeam)
	{
		// End:0x112
		if(((OldTeam != none) && PlayerReplicationInfo.Team != none) && PlayerReplicationInfo.Team.Size > OldTeam.Size)
		{
			Adrenaline = 0.0000000;
		}
		// End:0x12C
		if(Pawn != none)
		{
			Pawn.PlayerChangedTeam();
		}
	}
	//return;	
}

exec function SwitchLevel(string URL)
{
	// End:0x49
	if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Level.ServerTravel(URL, false);
	}
	//return;	
}

event ProgressCommand(string Cmd, string Msg1, string Msg2)
{
	local string C, V;

	Log(((((((string(Name) $ ".ProgressCommand Cmd '") $ Cmd) $ "'  Msg1 '") $ Msg1) $ "'   Msg2 '") $ Msg2) $ "'");
	Divide(Cmd, ":", C, V);
	// End:0x92
	if(C ~= "menu")
	{
		ClientOpenMenu(V, false, Msg1, Msg2);
	}
	//return;	
}

exec function ClearProgressMessages()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x52 [Loop If]
	if(i < 4)
	{
		ProgressMessage[i] = "";
		ProgressColor[i] = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255));
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

exec event SetProgressMessage(int Index, string S, Color C)
{
	// End:0x2E
	if(Index < 4)
	{
		ProgressMessage[Index] = S;
		ProgressColor[Index] = C;
	}
	//return;	
}

exec event SetProgressTime(float t)
{
	ProgressTimeOut = t + Level.TimeSeconds;
	//return;	
}

function Restart()
{
	super.Restart();
	ServerTimeStamp = 0.0000000;
	ResetTimeMargin();
	EnterStartState();
	bBehindView = Pawn.PointOfView();
	ClientReStart(Pawn);
	SetViewTarget(Pawn);
	//return;	
}

function EnterStartState()
{
	local name NewState;

	// End:0x6A
	if(Pawn.PhysicsVolume.bWaterVolume)
	{
		// End:0x53
		if(Pawn.HeadVolume.bWaterVolume)
		{
			Pawn.BreathTime = Pawn.UnderWaterTime;
		}
		NewState = Pawn.WaterMovementState;		
	}
	else
	{
		NewState = Pawn.LandMovementState;
	}
	// End:0x92
	if(IsInState(NewState))
	{
		BeginState();		
	}
	else
	{
		GotoState(NewState);
	}
	//return;	
}

function ClientReStart(Pawn NewPawn)
{
	local bool bNewViewTarget;

	Pawn = NewPawn;
	// End:0x41
	if((Pawn != none) && Pawn.bTearOff)
	{
		Pawn.Controller = none;
		Pawn = none;
	}
	AcknowledgePossession(Pawn);
	// End:0x60
	if(Pawn == none)
	{
		GotoState('WaitingForPawn');
		return;
	}
	Pawn.ClientReStart();
	bNewViewTarget = ViewTarget != Pawn;
	SetViewTarget(Pawn);
	bBehindView = Pawn.PointOfView();
	BehindView(bBehindView);
	// End:0xC9
	if(bNewViewTarget)
	{
		Pawn.POVChanged(self, false);
	}
	CleanOutSavedMoves();
	EnterStartState();
	//return;	
}

exec function BehindView(bool B)
{
	// End:0xCA
	if(((((((int(Level.NetMode) == int(NM_Standalone)) || bDemoOwner) || Level.Game.bAllowBehindView) || Vehicle(Pawn) != none) || PlayerReplicationInfo.bOnlySpectator) || PlayerReplicationInfo.bAdmin) || IsA('Admin'))
	{
		// End:0xCA
		if((Vehicle(Pawn) == none) || Vehicle(Pawn).bAllowViewChange)
		{
			ClientSetBehindView(B);
			bBehindView = B;
		}
	}
	//return;	
}

exec function ToggleBehindView()
{
	ServerToggleBehindView();
	//return;	
}

function ServerToggleBehindView()
{
	local bool B;

	// End:0xCE
	if((((((int(Level.NetMode) == int(NM_Standalone)) || Level.Game.bAllowBehindView) || Vehicle(Pawn) != none) || PlayerReplicationInfo.bOnlySpectator) || PlayerReplicationInfo.bAdmin) || IsA('Admin'))
	{
		// End:0xCE
		if((Vehicle(Pawn) == none) || Vehicle(Pawn).bAllowViewChange)
		{
			B = !bBehindView;
			ClientSetBehindView(B);
			bBehindView = B;
		}
	}
	//return;	
}

function ChangedWeapon()
{
	// End:0x5B
	if((Pawn != none) && Pawn.Weapon != none)
	{
		Pawn.Weapon.SetHand(Handedness);
		LastPawnWeapon = Pawn.Weapon.Class;
	}
	//return;	
}

event TravelPostAccept()
{
	// End:0x31
	if(Pawn.Health <= 0)
	{
		Pawn.Health = Pawn.default.Health;
	}
	//return;	
}

event PlayerTick(float DeltaTime)
{
	// End:0x4C
	if(bForcePrecache)
	{
		// End:0x49
		if(Level.TimeSeconds > ForcePrecacheTime)
		{
			bForcePrecache = false;
			Level.FillPrecacheMaterialsArray(false);
			Level.FillPrecacheStaticMeshesArray(false);
		}		
	}
	else
	{
		// End:0x65
		if(!bShortConnectTimeOut)
		{
			bShortConnectTimeOut = true;
			ServerShortTimeout();
		}
	}
	// End:0xC0
	if(Pawn != AcknowledgedPawn)
	{
		// End:0xB5
		if(int(Role) < int(ROLE_Authority))
		{
			// End:0xB5
			if((AcknowledgedPawn != none) && AcknowledgedPawn.Controller == self)
			{
				AcknowledgedPawn.Controller = none;
			}
		}
		AcknowledgePossession(Pawn);
	}
	PlayerInput.PlayerInput(DeltaTime);
	// End:0xE3
	if(bUpdatePosition)
	{
		ClientUpdatePosition();
	}
	// End:0x141
	if(!IsSpectating() && Pawn != none)
	{
		Pawn.RawInput(DeltaTime, aBaseX, aBaseY, aBaseZ, aMouseX, aMouseY, aForward, aTurn, aStrafe, aUp, aLookUp);
	}
	PlayerMove(DeltaTime);
	//return;	
}

function PlayerMove(float DeltaTime)
{
	//return;	
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int aimerror)
{
	local Vector FireDir, AimSpot, HitNormal, HitLocation, OldAim, AimOffset;

	local Actor BestTarget;
	local float bestAim, BestDist, projSpeed;
	local Actor HitActor;
	local bool bNoZAdjust, bLeading;
	local Rotator AimRot;

	FireDir = Vector(Rotation);
	// End:0x4C
	if(FiredAmmunition.bInstantHit)
	{
		HitActor = Trace(HitLocation, HitNormal, projStart + (float(10000) * FireDir), projStart, true);		
	}
	else
	{
		HitActor = Trace(HitLocation, HitNormal, projStart + (float(4000) * FireDir), projStart, true);
	}
	// End:0xE0
	if((HitActor != none) && HitActor.bProjTarget)
	{
		BestTarget = HitActor;
		bNoZAdjust = true;
		OldAim = HitLocation;
		BestDist = VSize(BestTarget.Location - Pawn.Location);		
	}
	else
	{
		bestAim = 0.9000000;
		// End:0x156
		if((int(Level.NetMode) == int(NM_Standalone)) && bAimingHelp)
		{
			bestAim = 0.9300000;
			// End:0x133
			if(FiredAmmunition.bInstantHit)
			{
				bestAim = 0.9700000;
			}
			// End:0x153
			if(FovAngle < (DefaultFOV - float(8)))
			{
				bestAim = 0.9900000;
			}			
		}
		else
		{
			// End:0x16F
			if(FiredAmmunition.bInstantHit)
			{
				bestAim = 1.0000000;
			}
		}
		// End:0x1A6
		if(int(Role) == int(ROLE_Authority))
		{
			BestTarget = PickTarget(bestAim, BestDist, FireDir, projStart, FiredAmmunition.MaxRange);
		}
		// End:0x1D2
		if(BestTarget == none)
		{
			// End:0x1CC
			if(bBehindView)
			{
				return Pawn.Rotation;				
			}
			else
			{
				return Rotation;
			}
		}
		OldAim = projStart + (FireDir * BestDist);
	}
	InstantWarnTarget(BestTarget, FiredAmmunition, FireDir);
	ShotTarget = Pawn(BestTarget);
	// End:0x257
	if(!bAimingHelp || int(Level.NetMode) != int(NM_Standalone))
	{
		// End:0x251
		if(bBehindView)
		{
			return Pawn.Rotation;			
		}
		else
		{
			return Rotation;
		}
	}
	// End:0x400
	if(!FiredAmmunition.bInstantHit)
	{
		projSpeed = FiredAmmunition.ProjectileClass.default.Speed;
		BestDist = VSize((BestTarget.Location + (BestTarget.Velocity * FMin(1.0000000, 0.0200000 + (BestDist / projSpeed)))) - projStart);
		bLeading = true;
		FireDir = (BestTarget.Location + (BestTarget.Velocity * FMin(1.0000000, 0.0200000 + (BestDist / projSpeed)))) - projStart;
		AimSpot = projStart + (BestDist * Normal(FireDir));
		// End:0x3FD
		if(FiredAmmunition.bTrySplash && (BestTarget.Velocity != vect(0.0000000, 0.0000000, 0.0000000)) || BestDist > float(1500))
		{
			HitActor = Trace(HitLocation, HitNormal, AimSpot - (BestTarget.CollisionHeight * vect(0.0000000, 0.0000000, 2.0000000)), AimSpot, false);
			// End:0x3FD
			if((HitActor != none) && FastTrace(HitLocation + vect(0.0000000, 0.0000000, 4.0000000), projStart))
			{
				return Rotator((HitLocation + vect(0.0000000, 0.0000000, 6.0000000)) - projStart);
			}
		}		
	}
	else
	{
		FireDir = BestTarget.Location - projStart;
		AimSpot = projStart + (BestDist * Normal(FireDir));
	}
	AimOffset = AimSpot - OldAim;
	// End:0x495
	if(bNoZAdjust || bLeading && Abs(AimOffset.Z) < BestTarget.CollisionHeight)
	{
		AimSpot.Z = OldAim.Z;		
	}
	else
	{
		// End:0x4DF
		if(AimOffset.Z < float(0))
		{
			AimSpot.Z = BestTarget.Location.Z + (0.4000000 * BestTarget.CollisionHeight);			
		}
		else
		{
			AimSpot.Z = BestTarget.Location.Z - (0.7000000 * BestTarget.CollisionHeight);
		}
	}
	// End:0x5A6
	if(!bLeading)
	{
		// End:0x5A3
		if(!bNoZAdjust)
		{
			AimRot = Rotator(AimSpot - projStart);
			// End:0x578
			if(FovAngle < (DefaultFOV - float(8)))
			{
				AimRot.Yaw = (AimRot.Yaw + 200) - Rand(400);				
			}
			else
			{
				AimRot.Yaw = (AimRot.Yaw + 375) - Rand(750);
			}
			return AimRot;
		}		
	}
	else
	{
		// End:0x605
		if(!FastTrace(projStart + ((0.9000000 * BestDist) * Normal(FireDir)), projStart))
		{
			FireDir = BestTarget.Location - projStart;
			AimSpot = projStart + (BestDist * Normal(FireDir));
		}
	}
	return Rotator(AimSpot - projStart);
	//return;	
}

function bool NotifyLanded(Vector HitNormal)
{
	return bUpdating;
	//return;	
}

function AdjustView(float DeltaTime)
{
	// End:0x9F
	if(FovAngle != DesiredFOV)
	{
		// End:0x4F
		if(FovAngle > DesiredFOV)
		{
			FovAngle = FovAngle - FMax(7.0000000, (0.9000000 * DeltaTime) * (FovAngle - DesiredFOV));			
		}
		else
		{
			FovAngle = FovAngle - FMin(-7.0000000, (0.9000000 * DeltaTime) * (FovAngle - DesiredFOV));
		}
		// End:0x9F
		if(Abs(FovAngle - DesiredFOV) <= float(10))
		{
			FovAngle = DesiredFOV;
		}
	}
	// End:0xE6
	if(bZooming)
	{
		ZoomLevel = FMin(ZoomLevel + DeltaTime, DesiredZoomLevel);
		DesiredFOV = FClamp(90.0000000 - (ZoomLevel * 88.0000000), 1.0000000, 179.0000000);
	}
	//return;	
}

function CalcBehindView(out Vector CameraLocation, out Rotator CameraRotation, float Dist)
{
	local Vector View, HitLocation, HitNormal;
	local float ViewDist, RealDist;
	local Vector globalX, globalY, globalZ, localX, localY, localZ;

	CameraRotation = Rotation;
	CameraRotation.Roll = 0;
	CameraLocation.Z += float(12);
	CameraRotation += CameraDeltaRotation;
	View = vect(1.0000000, 0.0000000, 0.0000000) >> CameraRotation;
	RealDist = Dist;
	Dist += CameraDeltaRad;
	// End:0xC4
	if(Trace(HitLocation, HitNormal, CameraLocation - (Dist * Vector(CameraRotation)), CameraLocation, false, vect(10.0000000, 10.0000000, 10.0000000)) != none)
	{
		ViewDist = FMin((CameraLocation - HitLocation) Dot View, Dist);		
	}
	else
	{
		ViewDist = Dist;
	}
	// End:0x146
	if((!bBlockCloseCamera || !bValidBehindCamera) || ViewDist > (float(10) + FMax(ViewTarget.CollisionRadius, ViewTarget.CollisionHeight)))
	{
		bValidBehindCamera = true;
		OldCameraLoc = CameraLocation - (ViewDist * View);
		OldCameraRot = CameraRotation;		
	}
	else
	{
		SetRotation(OldCameraRot);
	}
	CameraLocation = OldCameraLoc;
	CameraRotation = OldCameraRot;
	GetAxes(CameraSwivel, globalX, globalY, globalZ);
	localX = globalX >> CameraRotation;
	localY = globalY >> CameraRotation;
	localZ = globalZ >> CameraRotation;
	CameraRotation = OrthoRotation(localX, localY, localZ);
	//return;	
}

function CalcFirstPersonView(out Vector CameraLocation, out Rotator CameraRotation)
{
	local Vector X, Y, Z, AmbShakeOffset;
	local Rotator AmbShakeRot;
	local float FalloffScaling;

	GetAxes(Rotation, X, Y, Z);
	// End:0x125
	if(bEnableAmbientShake)
	{
		// End:0x58
		if((AmbientShakeFalloffStartTime > float(0)) && (Level.TimeSeconds - AmbientShakeFalloffStartTime) > AmbientShakeFalloffTime)
		{
			bEnableAmbientShake = false;			
		}
		else
		{
			// End:0xA8
			if(AmbientShakeFalloffStartTime > float(0))
			{
				FalloffScaling = 1.0000000 - ((Level.TimeSeconds - AmbientShakeFalloffStartTime) / AmbientShakeFalloffTime);
				FalloffScaling = FClamp(FalloffScaling, 0.0000000, 1.0000000);				
			}
			else
			{
				FalloffScaling = 1.0000000;
			}
			AmbShakeOffset = (AmbientShakeOffsetMag * FalloffScaling) * Sin(((Level.TimeSeconds * AmbientShakeOffsetFreq) * float(2)) * 3.1415930);
			AmbShakeRot = (AmbientShakeRotMag * FalloffScaling) * Sin(((Level.TimeSeconds * AmbientShakeRotFreq) * float(2)) * 3.1415930);
		}
	}
	CameraRotation = Normalize((Rotation + ShakeRot) + AmbShakeRot);
	CameraLocation = (((((CameraLocation + Pawn.EyePosition()) + Pawn.WalkBob) + (ShakeOffset.X * X)) + (ShakeOffset.Y * Y)) + (ShakeOffset.Z * Z)) + AmbShakeOffset;
	//return;	
}

event AddCameraEffect(CameraEffect NewEffect, optional bool RemoveExisting)
{
	// End:0x14
	if(RemoveExisting)
	{
		RemoveCameraEffect(NewEffect);
	}
	CameraEffects.Length = CameraEffects.Length + 1;
	CameraEffects[CameraEffects.Length - 1] = NewEffect;
	//return;	
}

event RemoveCameraEffect(CameraEffect ExEffect)
{
	local int EffectIndex;

	EffectIndex = 0;
	J0x07:

	// End:0x44 [Loop If]
	if(EffectIndex < CameraEffects.Length)
	{
		// End:0x3A
		if(CameraEffects[EffectIndex] == ExEffect)
		{
			CameraEffects.Remove(EffectIndex, 1);
			return;
		}
		EffectIndex++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

exec function CreateCameraEffect(Class<CameraEffect> EffectClass)
{
	AddCameraEffect(new EffectClass);
	//return;	
}

simulated function Rotator GetViewRotation()
{
	// End:0x25
	if(bBehindView && Pawn != none)
	{
		return Pawn.Rotation;
	}
	return Rotation;
	//return;	
}

function CacheCalcView(Actor ViewActor, Vector CameraLocation, Rotator CameraRotation)
{
	CalcViewActor = ViewActor;
	// End:0x2A
	if(ViewActor != none)
	{
		CalcViewActorLocation = ViewActor.Location;
	}
	CalcViewLocation = CameraLocation;
	CalcViewRotation = CameraRotation;
	LastPlayerCalcView = Level.TimeSeconds;
	//return;	
}

event PlayerCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
	local Pawn PTarget;

	// End:0x62
	if(((LastPlayerCalcView == Level.TimeSeconds) && CalcViewActor != none) && CalcViewActor.Location == CalcViewActorLocation)
	{
		ViewActor = CalcViewActor;
		CameraLocation = CalcViewLocation;
		CameraRotation = CalcViewRotation;
		return;
	}
	// End:0xCA
	if(((Pawn != none) && Pawn.bSpecialCalcView) && ViewTarget == Pawn)
	{
		// End:0xCA
		if(Pawn.SpecialCalcView(ViewActor, CameraLocation, CameraRotation))
		{
			CacheCalcView(ViewActor, CameraLocation, CameraRotation);
			return;
		}
	}
	// End:0x160
	if((ViewTarget == none) || ViewTarget.bDeleteMe)
	{
		// End:0x111
		if(bViewBot && CheatManager != none)
		{
			CheatManager.ViewBot();			
		}
		else
		{
			// End:0x140
			if((Pawn != none) && !Pawn.bDeleteMe)
			{
				SetViewTarget(Pawn);				
			}
			else
			{
				// End:0x159
				if(RealViewTarget != none)
				{
					SetViewTarget(RealViewTarget);					
				}
				else
				{
					SetViewTarget(self);
				}
			}
		}
	}
	ViewActor = ViewTarget;
	CameraLocation = ViewTarget.Location;
	// End:0x1E6
	if(ViewTarget == Pawn)
	{
		// End:0x1BF
		if(bBehindView)
		{
			CalcBehindView(CameraLocation, CameraRotation, CameraDist * Pawn.default.CollisionRadius);			
		}
		else
		{
			CalcFirstPersonView(CameraLocation, CameraRotation);
		}
		CacheCalcView(ViewActor, CameraLocation, CameraRotation);
		return;
	}
	// End:0x233
	if(ViewTarget == self)
	{
		// End:0x211
		if(bCameraPositionLocked)
		{
			CameraRotation = CheatManager.LockedRotation;			
		}
		else
		{
			CameraRotation = Rotation;
		}
		CacheCalcView(ViewActor, CameraLocation, CameraRotation);
		return;
	}
	// End:0x2F4
	if(ViewTarget.IsA('Projectile'))
	{
		// End:0x2A3
		if(Projectile(ViewTarget).bSpecialCalcView && Projectile(ViewTarget).SpecialCalcView(ViewActor, CameraLocation, CameraRotation, bBehindView))
		{
			CacheCalcView(ViewActor, CameraLocation, CameraRotation);
			return;
		}
		// End:0x2F4
		if(!bBehindView)
		{
			CameraLocation += (ViewTarget.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000));
			CameraRotation = Rotation;
			CacheCalcView(ViewActor, CameraLocation, CameraRotation);
			return;
		}
	}
	CameraRotation = ViewTarget.Rotation;
	PTarget = Pawn(ViewTarget);
	// End:0x42D
	if(PTarget != none)
	{
		// End:0x398
		if((int(Level.NetMode) == int(NM_Client)) || bDemoOwner && int(Level.NetMode) != int(NM_Standalone))
		{
			PTarget.SetViewRotation(TargetViewRotation);
			CameraRotation = BlendedTargetViewRotation;
			PTarget.EyeHeight = TargetEyeHeight;			
		}
		else
		{
			// End:0x3BF
			if(PTarget.IsPlayerPawn())
			{
				CameraRotation = PTarget.GetViewRotation();
			}
		}
		// End:0x40C
		if(PTarget.bSpecialCalcView && PTarget.SpectatorSpecialCalcView(self, ViewActor, CameraLocation, CameraRotation))
		{
			CacheCalcView(ViewActor, CameraLocation, CameraRotation);
			return;
		}
		// End:0x42D
		if(!bBehindView)
		{
			CameraLocation += PTarget.EyePosition();
		}
	}
	// End:0x495
	if(bBehindView)
	{
		CameraLocation = CameraLocation + ((ViewTarget.default.CollisionHeight - ViewTarget.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000));
		CalcBehindView(CameraLocation, CameraRotation, CameraDist * ViewTarget.default.CollisionRadius);
	}
	CacheCalcView(ViewActor, CameraLocation, CameraRotation);
	//return;	
}

function int BlendRot(float DeltaTime, int BlendC, int NewC)
{
	// End:0x46
	if(Abs(float(BlendC - NewC)) > float(32767))
	{
		// End:0x3A
		if(BlendC > NewC)
		{
			NewC += 65536;			
		}
		else
		{
			BlendC += 65536;
		}
	}
	// End:0x70
	if(Abs(float(BlendC - NewC)) > float(4096))
	{
		BlendC = NewC;		
	}
	else
	{
		BlendC = int(float(BlendC) + (float(NewC - BlendC) * FMin(1.0000000, 24.0000000 * DeltaTime)));
	}
	return BlendC & 65535;
	//return;	
}

function CheckShake(out float MaxOffset, out float offset, out float Rate, out float Time, float dt)
{
	// End:0x15
	if(Abs(offset) < Abs(MaxOffset))
	{
		return;
	}
	offset = MaxOffset;
	// End:0x94
	if(Time > float(1))
	{
		// End:0x69
		if((Time * Abs(MaxOffset / Rate)) <= float(1))
		{
			MaxOffset = MaxOffset * ((float(1) / Time) - float(1));			
		}
		else
		{
			MaxOffset *= float(-1);
		}
		Time -= dt;
		Rate *= float(-1);		
	}
	else
	{
		MaxOffset = 0.0000000;
		offset = 0.0000000;
		Rate = 0.0000000;
	}
	//return;	
}

function UpdateShakeRotComponent(out float Max, out int Current, out float Rate, out float Time, float dt)
{
	local float fCurrent;

	Current = int(float(Current & 65535) + (Rate * dt)) & 65535;
	// End:0x46
	if(Current > 32768)
	{
		Current -= 65536;
	}
	fCurrent = float(Current);
	CheckShake(Max, fCurrent, Rate, Time, dt);
	Current = int(fCurrent);
	//return;	
}

function ViewShake(float DeltaTime)
{
	// End:0x107
	if(ShakeOffsetRate != vect(0.0000000, 0.0000000, 0.0000000))
	{
		ShakeOffset.X += (DeltaTime * ShakeOffsetRate.X);
		CheckShake(ShakeOffsetMax.X, ShakeOffset.X, ShakeOffsetRate.X, ShakeOffsetTime.X, DeltaTime);
		ShakeOffset.Y += (DeltaTime * ShakeOffsetRate.Y);
		CheckShake(ShakeOffsetMax.Y, ShakeOffset.Y, ShakeOffsetRate.Y, ShakeOffsetTime.Y, DeltaTime);
		ShakeOffset.Z += (DeltaTime * ShakeOffsetRate.Z);
		CheckShake(ShakeOffsetMax.Z, ShakeOffset.Z, ShakeOffsetRate.Z, ShakeOffsetTime.Z, DeltaTime);
	}
	// End:0x1B7
	if(ShakeRotRate != vect(0.0000000, 0.0000000, 0.0000000))
	{
		UpdateShakeRotComponent(ShakeRotMax.X, ShakeRot.Pitch, ShakeRotRate.X, ShakeRotTime.X, DeltaTime);
		UpdateShakeRotComponent(ShakeRotMax.Y, ShakeRot.Yaw, ShakeRotRate.Y, ShakeRotTime.Y, DeltaTime);
		UpdateShakeRotComponent(ShakeRotMax.Z, ShakeRot.Roll, ShakeRotRate.Z, ShakeRotTime.Z, DeltaTime);
	}
	//return;	
}

function bool TurnTowardNearestEnemy()
{
	//return;	
}

function TurnAround()
{
	// End:0x2F
	if(!bSetTurnRot)
	{
		TurnRot180 = Rotation;
		TurnRot180.Yaw += 32768;
		bSetTurnRot = true;
	}
	DesiredRotation = TurnRot180;
	bRotateToDesired = DesiredRotation.Yaw != Rotation.Yaw;
	//return;	
}

function UpdateRotation(float DeltaTime, float maxPitch)
{
	local Rotator NewRotation, ViewRotation;

	// End:0x37
	if(bInterpolating || (Pawn != none) && Pawn.bInterpolating)
	{
		ViewShake(DeltaTime);
		return;
	}
	// End:0x102
	if(bFreeCam == true)
	{
		// End:0x6C
		if(bFreeCamZoom == true)
		{
			CameraDeltaRad += ((DeltaTime * 0.2500000) * aLookUp);			
		}
		else
		{
			// End:0xBD
			if(bFreeCamSwivel == true)
			{
				CameraSwivel.Yaw += int((16.0000000 * DeltaTime) * aTurn);
				CameraSwivel.Pitch += int((16.0000000 * DeltaTime) * aLookUp);				
			}
			else
			{
				CameraDeltaRotation.Yaw += int((32.0000000 * DeltaTime) * aTurn);
				CameraDeltaRotation.Pitch += int((32.0000000 * DeltaTime) * aLookUp);
			}
		}		
	}
	else
	{
		ViewRotation = Rotation;
		// End:0x1F4
		if((Pawn != none) && int(Pawn.Physics) != int(4))
		{
			// End:0x195
			if((Pawn.DesiredRotation.Roll < 65535) && (ViewRotation.Roll < Pawn.DesiredRotation.Roll) || ViewRotation.Roll > 0)
			{
				ViewRotation.Roll = 0;				
			}
			else
			{
				// End:0x1F4
				if((Pawn.DesiredRotation.Roll > 0) && (ViewRotation.Roll > Pawn.DesiredRotation.Roll) || ViewRotation.Roll < 65535)
				{
					ViewRotation.Roll = 0;
				}
			}
		}
		DesiredRotation = ViewRotation;
		// End:0x215
		if(int(bTurnToNearest) != 0)
		{
			TurnTowardNearestEnemy();			
		}
		else
		{
			// End:0x22B
			if(int(bTurn180) != 0)
			{
				TurnAround();				
			}
			else
			{
				TurnTarget = none;
				bRotateToDesired = false;
				bSetTurnRot = false;
				ViewRotation.Yaw += int((32.0000000 * DeltaTime) * aTurn);
				ViewRotation.Pitch += int((32.0000000 * DeltaTime) * aLookUp);
			}
		}
		// End:0x2B3
		if(Pawn != none)
		{
			ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
		}
		SetRotation(ViewRotation);
		ViewShake(DeltaTime);
		ViewFlash(DeltaTime);
		NewRotation = ViewRotation;
		// End:0x327
		if((!bRotateToDesired && Pawn != none) && !bFreeCamera || !bBehindView)
		{
			Pawn.FaceRotation(NewRotation, DeltaTime);
		}
	}
	//return;	
}

function ClearDoubleClick()
{
	// End:0x1F
	if(PlayerInput != none)
	{
		PlayerInput.DoubleClickTimer = 0.0000000;
	}
	//return;	
}

simulated function bool DodgingIsEnabled()
{
	// End:0x1E
	if(PlayerInput != none)
	{
		return PlayerInput.bEnableDodging;		
	}
	else
	{
		// End:0x3C
		if(InputClass != none)
		{
			return InputClass.default.bEnableDodging;			
		}
		else
		{
			return Class'Engine.PlayerInput'.default.bEnableDodging;
		}
	}
	//return;	
}

simulated function SetDodging(bool Enabled)
{
	// End:0x21
	if(PlayerInput != none)
	{
		PlayerInput.bEnableDodging = Enabled;
	}
	InputClass.default.bEnableDodging = Enabled;
	InputClass.static.StaticSaveConfig();
	//return;	
}

function bool IsSpectating()
{
	return false;
	//return;	
}

function ServerViewNextPlayer()
{
	local Controller C, pick;
	local bool bFound, bRealSpec, bWasSpec;
	local TeamInfo RealTeam;

	// End:0x0F
	if(!IsInState('Spectating'))
	{
		return;
	}
	bTempSpec = true;
	bRealSpec = PlayerReplicationInfo.bOnlySpectator;
	bWasSpec = (!bBehindView && ViewTarget != Pawn) && ViewTarget != self;
	PlayerReplicationInfo.bOnlySpectator = true;
	RealTeam = PlayerReplicationInfo.Team;
	// End:0x150
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		// End:0xD4
		if(bRealSpec && C.PlayerReplicationInfo != none)
		{
			PlayerReplicationInfo.Team = C.PlayerReplicationInfo.Team;
		}
		// End:0x14F
		if(Level.Game.CanSpectate(self, bRealSpec, C))
		{
			// End:0x111
			if(pick == none)
			{
				pick = C;
			}
			// End:0x12B
			if(bFound)
			{
				pick = C;
				// End:0x150
				break;
				// End:0x14F
				continue;
			}
			bFound = (RealViewTarget == C) || ViewTarget == C;
		}		
	}	
	PlayerReplicationInfo.Team = RealTeam;
	SetViewTarget(pick);
	ClientSetViewTarget(pick);
	// End:0x19C
	if((ViewTarget == self) || bWasSpec)
	{
		bBehindView = false;		
	}
	else
	{
		bBehindView = true;
	}
	ClientSetBehindView(bBehindView);
	PlayerReplicationInfo.bOnlySpectator = bRealSpec;
	bTempSpec = false;
	//return;	
}

function ServerViewSelf()
{
	// End:0x0F
	if(!IsInState('Spectating'))
	{
		return;
	}
	SetLocation(ViewTarget.Location);
	ClientSetLocation(ViewTarget.Location, Rotation);
	bBehindView = false;
	SetViewTarget(self);
	ClientSetViewTarget(self);
	ClientMessage(OwnCamera, 'Event');
	//return;	
}

function LoadPlayers()
{
	local int i;

	// End:0x0D
	if(GameReplicationInfo == none)
	{
		return;
	}
	i = 0;
	J0x14:

	// End:0x55 [Loop If]
	if(i < GameReplicationInfo.PRIArray.Length)
	{
		GameReplicationInfo.PRIArray[i].UpdatePrecacheMaterials();
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	//return;	
}

function ServerSpectate()
{
	// End:0x2C
	if((PlayerReplicationInfo.Team != none) && !PlayerReplicationInfo.bOutOfLives)
	{
		return;
	}
	// End:0x70
	if((Pawn != none) && !Pawn.bDeleteMe)
	{
		Pawn.Died(self, Class'Engine.DamageType', Pawn.Location);
	}
	GotoState('Spectating');
	bBehindView = true;
	ServerViewNextPlayer();
	//return;	
}

function BecomeSpectator()
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x32
	if(!Level.Game.BecomeSpectator(self))
	{
		return;
	}
	// End:0x60
	if(Pawn != none)
	{
		Pawn.Died(self, Class'Engine.DamageType', Pawn.Location);
	}
	// End:0x8D
	if(PlayerReplicationInfo.Team != none)
	{
		PlayerReplicationInfo.Team.RemoveFromTeam(self);
	}
	PlayerReplicationInfo.Team = none;
	PlayerReplicationInfo.Score = 0.0000000;
	PlayerReplicationInfo.Deaths = 0.0000000;
	PlayerReplicationInfo.GoalsScored = 0;
	PlayerReplicationInfo.Kills = 0;
	ServerSpectate();
	BroadcastLocalizedMessage(Level.Game.GameMessageClass, 14, PlayerReplicationInfo);
	ClientBecameSpectator();
	//return;	
}

function ClientBecameSpectator()
{
	UpdateURL("SpectatorOnly", "1", true);
	//return;	
}

function BecomeActivePlayer()
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x32
	if(!Level.Game.AllowBecomeActivePlayer(self))
	{
		return;
	}
	// End:0x69
	if((Level.TimeSeconds - SwitchTimestamp) < 60.0000000)
	{
		// End:0x5F
		if(SwitchCount > 10)
		{
			return;
		}
		SwitchCount++;		
	}
	else
	{
		SwitchCount = 0;
		SwitchTimestamp = Level.TimeSeconds;
	}
	bBehindView = false;
	FixFOV();
	ServerViewSelf();
	PlayerReplicationInfo.bOnlySpectator = false;
	Level.Game.NumSpectators--;
	Level.Game.NumPlayers++;
	// End:0x11E
	if(Level.Game.GameStats != none)
	{
		Level.Game.GameStats.ConnectEvent(PlayerReplicationInfo);
	}
	PlayerReplicationInfo.Reset();
	Adrenaline = 0.0000000;
	BroadcastLocalizedMessage(Level.Game.GameMessageClass, 1, PlayerReplicationInfo);
	// End:0x1BB
	if(Level.Game.bTeamGame)
	{
		Level.Game.ChangeTeam(self, int(Level.Game.PickTeam(byte(int(GetUrlOption("Team"))), none)), false);
	}
	// End:0x27E
	if(!Level.Game.bDelayedStart)
	{
		Level.Game.bRestartLevel = false;
		// End:0x228
		if(Level.Game.bWaitingToStartMatch)
		{
			Level.Game.StartMatch();			
		}
		else
		{
			Level.Game.RestartPlayer(PlayerController(Owner));
		}
		Level.Game.bRestartLevel = Level.Game.default.bRestartLevel;		
	}
	else
	{
		GotoState('PlayerWaiting');
	}
	ClientBecameActivePlayer();
	//return;	
}

function ClientBecameActivePlayer()
{
	UpdateURL("SpectatorOnly", "", true);
	//return;	
}

function ChangeStairLook(bool B)
{
	bLookUpStairs = B;
	// End:0x1E
	if(bLookUpStairs)
	{
		bAlwaysMouseLook = false;
	}
	//return;	
}

function ChangeAlwaysMouseLook(bool B)
{
	bAlwaysMouseLook = B;
	// End:0x1E
	if(bAlwaysMouseLook)
	{
		bLookUpStairs = false;
	}
	//return;	
}

singular event UnPressButtons()
{
	bFire = 0;
	bAltFire = 0;
	bDuck = 0;
	bRun = 0;
	bVoiceTalk = 0;
	ResetInput();
	//return;	
}

event ClientOpenMenu(string Menu, optional bool bDisconnect, optional string Msg1, optional string Msg2)
{
	// End:0x32
	if(!Player.GUIController.OpenMenu(Menu, Msg1, Msg2))
	{
		UnPressButtons();
	}
	// End:0x89
	if(bDisconnect)
	{
		// End:0x76
		if(Player.Console != none)
		{
			Player.Console.DelayedConsoleCommand("DISCONNECT");			
		}
		else
		{
			ConsoleCommand("Disconnect");
		}
	}
	//return;	
}

event ClientReplaceMenu(string Menu, optional bool bDisconnect, optional string Msg1, optional string Msg2)
{
	// End:0x52
	if(!Player.GUIController.bActive)
	{
		// End:0x4F
		if(!Player.GUIController.ReplaceMenu(Menu, Msg1, Msg2))
		{
			UnPressButtons();
		}		
	}
	else
	{
		Player.GUIController.ReplaceMenu(Menu, Msg1, Msg2);
	}
	// End:0xD0
	if(bDisconnect)
	{
		// End:0xBD
		if(Player.Console != none)
		{
			Player.Console.DelayedConsoleCommand("Disconnect");			
		}
		else
		{
			ConsoleCommand("Disconnect");
		}
	}
	//return;	
}

event ClientCloseMenu(optional bool bCloseAll, optional bool bCancel)
{
	// End:0x2B
	if(bCloseAll)
	{
		Player.GUIController.CloseAll(bCancel, true);		
	}
	else
	{
		Player.GUIController.CloseMenu(bCancel);
	}
	//return;	
}

event ClientNetworkMessage(string ParamA, string ParamB)
{
	ClientOpenMenu(Player.GUIController.NetworkMsgMenu, true, ParamA, ParamB);
	//return;	
}

simulated function bool IsMouseInverted()
{
	return PlayerInput.bInvertMouse;
	//return;	
}

exec function InvertMouse(optional string Invert)
{
	PlayerInput.InvertMouse(Invert);
	//return;	
}

exec function InvertLook()
{
	local bool Result;

	Result = PlayerInput.InvertLook();
	// End:0x44
	if(IsOnConsole())
	{
		Class'Engine.XBoxPlayerInput'.default.bInvertVLook = Result;
		Class'Engine.XBoxPlayerInput'.static.StaticSaveConfig();
	}
	//return;	
}

function bool CanRestartPlayer()
{
	return !PlayerReplicationInfo.bOnlySpectator;
	//return;	
}

exec function Admin(string CommandLine)
{
	local string Result;

	// End:0xB1
	if(AdminManager != none)
	{
		// End:0x57
		if((Level.Game.AccessControl == none) || !Level.Game.AccessControl.CanPerform(self, "Xc"))
		{
			return;
		}
		Result = ConsoleCommand(CommandLine);
		// End:0x9A
		if(Level.Game.AccessControl.bReplyToGUI)
		{
			AdminReply(Result);			
		}
		else
		{
			// End:0xB1
			if(Result != "")
			{
				ClientMessage(Result);
			}
		}
	}
	//return;	
}

exec function AdminDebug(string CommandLine)
{
	// End:0x64
	if(AdminManager != none)
	{
		// End:0x57
		if((Level.Game.AccessControl == none) || !Level.Game.AccessControl.CanPerform(self, "Xc"))
		{
			return;
		}
		ConsoleCommand(CommandLine, true);
	}
	//return;	
}

exec function AdminLogin(string CmdLine)
{
	// End:0x1A
	if(Level.TimeSeconds < NextLoginTime)
	{
		return;
	}
	NextLoginTime = Level.TimeSeconds + LoginDelay;
	ServerAdminLogin(CmdLine);
	//return;	
}

function ServerAdminLogin(string CmdLine)
{
	local string uname, upass;

	// End:0x1A
	if(Level.TimeSeconds < NextLoginTime)
	{
		return;
	}
	NextLoginTime = Level.TimeSeconds + FMax(LoginDelay, 5.0000000);
	// End:0xB9
	if(AdminManager == none)
	{
		MakeAdmin();
		// End:0xB9
		if(AdminManager != none)
		{
			// End:0x7C
			if(!Divide(CmdLine, " ", uname, upass))
			{
				upass = CmdLine;
			}
			AdminManager.DoLogin(uname, upass);
			// End:0xB3
			if(!AdminManager.bAdmin)
			{
				AdminManager = none;				
			}
			else
			{
				AddCheats();
			}
		}
	}
	//return;	
}

function AdminCommand(string CommandLine)
{
	// End:0x60
	if(Left(CommandLine, 11) ~= "AdminLogin ")
	{
		AdminLogin(Mid(CommandLine, 11));
		ReportAdmin("adv=" $ string(Level.Game.AccessControl.IsA('AccessControlIni')));		
	}
	else
	{
		// End:0x8A
		if(Left(CommandLine, 11) ~= "AdminLogout")
		{
			AdminLogout();
			ReportAdmin();			
		}
		else
		{
			// End:0xF8
			if(Level.Game.AccessControl != none)
			{
				Level.Game.AccessControl.bReplyToGUI = true;
				Admin(CommandLine);
				Level.Game.AccessControl.bReplyToGUI = false;
			}
		}
	}
	//return;	
}

function ReportAdmin(optional string ReportText)
{
	local string str;

	// End:0xC3
	if((AdminManager != none) && AdminManager.bAdmin)
	{
		// End:0x8F
		if(Level.Game.AccessControl != none)
		{
			str = "name=" $ Level.Game.AccessControl.GetAdminName(self);
			// End:0x8C
			if(ReportText != "")
			{
				str $= (";" $ ReportText);
			}			
		}
		else
		{
			str = "name=Admin";
			// End:0xC0
			if(ReportText != "")
			{
				str $= (";" $ ReportText);
			}
		}		
	}
	else
	{
		str = ReportText;
	}
	AdminReply(str);
	//return;	
}

function AdminReply(string Reply)
{
	// End:0x35
	if(Player.GUIController != none)
	{
		Player.GUIController.OnAdminReply(Reply);
	}
	//return;	
}

exec function AdminLogout()
{
	// End:0x35
	if(AdminManager != none)
	{
		AdminManager.DoLogout();
		// End:0x35
		if(!AdminManager.bAdmin)
		{
			AdminManager = none;
		}
	}
	//return;	
}

exec function AdminGUI()
{
	//return;	
}

simulated event StartClientDemoRec()
{
	DemoClientSetHUD(myHUD.Class, myHUD.ScoreBoard.Class);
	bClientDemo = true;
	ServerSetClientDemo();
	//return;	
}

function ServerSetClientDemo()
{
	bClientDemo = true;
	//return;	
}

simulated function DemoClientSetHUD(Class<HUD> newHUDClass, Class<ScoreBoard> newScoringClass)
{
	// End:0x1B
	if(myHUD == none)
	{
		ClientSetHUD(newHUDClass, newScoringClass);
	}
	//return;	
}

simulated function string GetCustomStatusAnnouncerClass()
{
	return "";
	//return;	
}

simulated function string GetCustomRewardAnnouncerClass()
{
	return "";
	//return;	
}

simulated function SetCustomStatusAnnouncerClass(string NewAnnouncerClass)
{
	//return;	
}

simulated function SetCustomRewardAnnouncerClass(string NewAnnouncerClass)
{
	//return;	
}

simulated function bool NeedNetNotify()
{
	return false;
	//return;	
}

event VoiceCommand(string RecognizedString, string RawString)
{
	Log(RecognizedString);
	TeamMessage(PlayerReplicationInfo, RawString, 'TeamSayQuiet');
	// End:0x33
	if(RecognizedString != "")
	{
		ServerVoiceCommand(RecognizedString);
	}
	//return;	
}

exec function Command(string RecognizedString)
{
	Level.Game.ParseVoiceCommand(self, RecognizedString);
	//return;	
}

function ServerVoiceCommand(string RecognizedString)
{
	Level.Game.ParseVoiceCommand(self, RecognizedString);
	//return;	
}

function RegisterVoiceChat()
{
	//return;	
}

exec function Join(string ChanName, string ChanPwd)
{
	local int i, idx;
	local VoiceChatRoom VCR;

	// End:0x23
	if((VoiceReplicationInfo == none) || !VoiceReplicationInfo.bEnableVoiceChat)
	{
		return;
	}
	i = 0;
	J0x2A:

	// End:0x9F [Loop If]
	if(i < StoredChatPasswords.Length)
	{
		// End:0x95
		if(ChanName ~= StoredChatPasswords[i].ChatRoomName)
		{
			// End:0x79
			if(ChanPwd == "")
			{
				ChanPwd = StoredChatPasswords[i].ChatRoomPassword;				
			}
			else
			{
				StoredChatPasswords[i].ChatRoomPassword = ChanPwd;
				SaveConfig();
			}
			// [Explicit Break]
			goto J0x9F;
		}
		i++;
		// [Loop Continue]
		goto J0x2A;
	}
	J0x9F:

	// End:0xFB
	if((i == StoredChatPasswords.Length) && ChanPwd != "")
	{
		StoredChatPasswords.Length = i + 1;
		StoredChatPasswords[i].ChatRoomName = ChanName;
		StoredChatPasswords[i].ChatRoomPassword = ChanPwd;
		SaveConfig();
	}
	Log((((((("Join " $ ChanName) @ "Password:") $ ChanPwd) @ "PRI:") $ PlayerReplicationInfo.PlayerName) @ "Team:") $ string(PlayerReplicationInfo.Team), 'VoiceChat');
	// End:0x195
	if((PlayerReplicationInfo != none) && PlayerReplicationInfo.Team != none)
	{
		idx = PlayerReplicationInfo.Team.TeamIndex;
	}
	VCR = VoiceReplicationInfo.GetChannel(ChanName, idx);
	// End:0x1F4
	if(VCR != none)
	{
		// End:0x1F1
		if(!VCR.IsMember(PlayerReplicationInfo))
		{
			ServerJoinVoiceChannel(VCR.ChannelIndex, ChanPwd);
		}		
	}
	else
	{
		// End:0x21A
		if(ChatRoomMessageClass != none)
		{
			ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChanName));
		}
	}
	//return;	
}

exec function Leave(string ChannelTitle)
{
	local VoiceChatRoom VCR;
	local int idx;

	// End:0x23
	if((VoiceReplicationInfo == none) || !VoiceReplicationInfo.bEnableVoiceChat)
	{
		return;
	}
	// End:0x61
	if((PlayerReplicationInfo != none) && PlayerReplicationInfo.Team != none)
	{
		idx = PlayerReplicationInfo.Team.TeamIndex;
	}
	VCR = VoiceReplicationInfo.GetChannel(ChannelTitle, idx);
	// End:0xB5
	if((VCR == none) && ChatRoomMessageClass != none)
	{
		ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChannelTitle));
		return;
	}
	// End:0xCB
	if(VCR == ActiveRoom)
	{
		ActiveRoom = none;
	}
	ServerLeaveVoiceChannel(VCR.ChannelIndex);
	//return;	
}

exec function Speak(string ChannelTitle)
{
	local int idx;
	local VoiceChatRoom VCR;
	local string ChanPwd;

	// End:0x23
	if((VoiceReplicationInfo == none) || !VoiceReplicationInfo.bEnableVoiceChat)
	{
		return;
	}
	// End:0x61
	if((PlayerReplicationInfo != none) && PlayerReplicationInfo.Team != none)
	{
		idx = PlayerReplicationInfo.Team.TeamIndex;
	}
	VCR = VoiceReplicationInfo.GetChannel(ChannelTitle, idx);
	// End:0xB5
	if((VCR == none) && ChatRoomMessageClass != none)
	{
		ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChannelTitle));
		return;
	}
	// End:0xF6
	if(VCR.ChannelIndex >= 0)
	{
		ChanPwd = FindChannelPassword(ChannelTitle);
		ServerSpeak(VCR.ChannelIndex, ChanPwd);		
	}
	else
	{
		// End:0x11C
		if(ChatRoomMessageClass != none)
		{
			ClientMessage(ChatRoomMessageClass.static.AssembleMessage(0, ChannelTitle));
		}
	}
	//return;	
}

exec function SpeakDefault()
{
	local string str;

	str = GetDefaultActiveChannel();
	// End:0x4D
	if((str != "") && (ActiveRoom == none) || !ActiveRoom.GetTitle() ~= str)
	{
		Speak(str);
	}
	//return;	
}

exec function SpeakLast()
{
	// End:0x44
	if((LastActiveChannel != "") && (ActiveRoom == none) || !ActiveRoom.GetTitle() ~= LastActiveChannel)
	{
		Speak(LastActiveChannel);		
	}
	else
	{
		// End:0x64
		if(ActiveRoom != none)
		{
			Speak(ActiveRoom.GetTitle());
		}
	}
	//return;	
}

exec function SetChatPassword(string NewPassword)
{
	// End:0x28
	if(ChatPassword != NewPassword)
	{
		ChatPassword = NewPassword;
		SaveConfig();
		ServerSetChatPassword(NewPassword);
	}
	//return;	
}

exec function EnableVoiceChat()
{
	local bool bCurrent;

	bCurrent = bool(ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
	ConsoleCommand("set ini:Engine.Engine.AudioDevice UseVoIP" @ string(true));
	// End:0x7E
	if(VoiceReplicationInfo == none)
	{
		return;
	}
	// End:0x9A
	if(!VoiceReplicationInfo.bEnableVoiceChat)
	{
		ShowNoVoiceChatMsg();
		return;
	}
	ChangeVoiceChatMode(true);
	InitializeVoiceChat();
	// End:0xC8
	if(bCurrent == false)
	{
		ConsoleCommand("SOUND_REBOOT");
	}
	//return;	
}

exec function DisableVoiceChat()
{
	local bool bCurrent;

	bCurrent = bool(ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
	ConsoleCommand("set ini:Engine.Engine.AudioDevice UseVoIP" @ string(false));
	// End:0x94
	if((VoiceReplicationInfo == none) || !VoiceReplicationInfo.bEnableVoiceChat)
	{
		return;
	}
	ChangeVoiceChatMode(false);
	// End:0xBC
	if(bCurrent == true)
	{
		ConsoleCommand("SOUND_REBOOT");
	}
	//return;	
}

simulated function InitializeVoiceChat()
{
	// End:0x15
	if(bVoiceChatEnabled)
	{
		InitPrivateChatRoom();
		AutoJoinVoiceChat();
	}
	//return;	
}

simulated function bool HasVoiceChatEnabled()
{
	return (int(Level.NetMode) != int(NM_Standalone)) && (VoiceReplicationInfo == none) || VoiceReplicationInfo.bEnableVoiceChat;
	//return;	
}

function InitPrivateChatRoom()
{
	ServerChangeVoiceChatMode(true);
	// End:0x1E
	if(ChatPassword != "")
	{
		ServerSetChatPassword(ChatPassword);
	}
	//return;	
}

simulated function string GetDefaultActiveChannel()
{
	local string DefaultChannel;

	// End:0x1A
	if(DefaultActiveChannel != "")
	{
		DefaultChannel = DefaultActiveChannel;		
	}
	else
	{
		// End:0x3A
		if(VoiceReplicationInfo != none)
		{
			DefaultChannel = VoiceReplicationInfo.GetDefaultChannel();
		}
	}
	return DefaultChannel;
	//return;	
}

simulated function AutoJoinVoiceChat()
{
	//return;	
}

simulated function ChangeVoiceChatMode(bool bEnable)
{
	// End:0x0D
	if(VoiceReplicationInfo == none)
	{
		return;
	}
	bVoiceChatEnabled = bEnable;
	// End:0x5A
	if((int(Level.NetMode) == int(NM_Client)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		ServerChangeVoiceChatMode(bEnable);
	}
	//return;	
}

simulated function bool ChatBan(int PlayerID, byte Type)
{
	Log((((((("ChatBan Role:" $ string(GetEnum(Enum'Engine.Actor.ENetRole', int(Role)))) @ "ChatManager:") $ string(ChatManager)) @ "PlayerID:") $ string(PlayerID)) @ "Type:") $ string(Type), 'ChatManager');
	// End:0xA3
	if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return false;
	}
	// End:0xB0
	if(ChatManager == none)
	{
		return false;
	}
	// End:0xDE
	if(ChatManager.SetRestrictionID(PlayerID, Type))
	{
		ServerChatRestriction(PlayerID, Type);
		return true;
	}
	Log((string(Name) @ "ChatBan not successful - could not find player with ID:") @ string(PlayerID), 'ChatManager');
	return false;
	//return;	
}

simulated function SetChannelPassword(string ChannelName, string ChannelPassword)
{
	local int i;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	i = 0;
	J0x22:

	// End:0x59 [Loop If]
	if(i < StoredChatPasswords.Length)
	{
		// End:0x4F
		if(StoredChatPasswords[i].ChatRoomName ~= ChannelName)
		{
			// [Explicit Break]
			goto J0x59;
		}
		i++;
		// [Loop Continue]
		goto J0x22;
	}
	J0x59:

	// End:0x78
	if(i == StoredChatPasswords.Length)
	{
		StoredChatPasswords.Length = i + 1;
	}
	StoredChatPasswords[i].ChatRoomName = ChannelName;
	StoredChatPasswords[i].ChatRoomPassword = ChannelPassword;
	SaveConfig();
	//return;	
}

simulated function string FindChannelPassword(string ChannelName)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x4C [Loop If]
	if(i < StoredChatPasswords.Length)
	{
		// End:0x42
		if(StoredChatPasswords[i].ChatRoomName ~= ChannelName)
		{
			return StoredChatPasswords[i].ChatRoomPassword;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return "";
	//return;	
}

function VoiceChatRoom.EJoinChatResult ServerJoinVoiceChannel(int ChannelIndex, optional string ChannelPassword)
{
	local VoiceChatRoom VCR;
	local VoiceChatRoom.EJoinChatResult Result;

	VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
	// End:0x58
	if((((VoiceReplicationInfo == none) || PlayerReplicationInfo == none) || VCR == none) || !VoiceReplicationInfo.bEnableVoiceChat)
	{
		return 0;
	}
	// End:0x87
	if(VoiceReplicationInfo != none)
	{
		Result = VoiceReplicationInfo.JoinChannelAt(ChannelIndex, PlayerReplicationInfo, ChannelPassword);
	}
	switch(Result)
	{
		// End:0xB9
		case 2:
			ClientOpenMenu(ChatPasswordMenuClass, false, VCR.GetTitle(), "NEEDPW");
			// End:0x13E
			break;
		// End:0xE5
		case 3:
			ClientOpenMenu(ChatPasswordMenuClass, false, VCR.GetTitle(), "WRONGPW");
			// End:0x13E
			break;
		// End:0x111
		case 7:
			Level.Game.ChangeVoiceChannel(PlayerReplicationInfo, ChannelIndex, -1);
		// End:0xFFFF
		default:
			// End:0x13E
			if(ChannelIndex > VoiceReplicationInfo.GetPublicChannelCount(true))
			{
				ChatRoomMessage(Result, ChannelIndex);
			}
			break;
	}
	return Result;
	//return;	
}

function ServerLeaveVoiceChannel(int ChannelIndex)
{
	local VoiceChatRoom VCR;

	// End:0x1A
	if((VoiceReplicationInfo == none) || PlayerReplicationInfo == none)
	{
		return;
	}
	// End:0x36
	if(!VoiceReplicationInfo.bEnableVoiceChat)
	{
		ShowNoVoiceChatMsg();
		return;
	}
	VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
	// End:0xF7
	if((VCR != none) && VCR.LeaveChannel(PlayerReplicationInfo))
	{
		// End:0xA9
		if(VCR == ActiveRoom)
		{
			ActiveRoom = none;
			// End:0xA9
			if(PlayerReplicationInfo != none)
			{
				PlayerReplicationInfo.ActiveChannel = -1;
			}
		}
		Level.Game.ChangeVoiceChannel(PlayerReplicationInfo, -1, ChannelIndex);
		// End:0xF7
		if(ChannelIndex > VoiceReplicationInfo.GetPublicChannelCount(true))
		{
			ChatRoomMessage(8, ChannelIndex);
		}
	}
	//return;	
}

function ServerSpeak(int ChannelIndex, optional string ChannelPassword)
{
	local VoiceChatRoom VCR;
	local int Index;

	// End:0x0D
	if(VoiceReplicationInfo == none)
	{
		return;
	}
	VCR = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
	// End:0x5C
	if(VCR == none)
	{
		// End:0x54
		if(VoiceReplicationInfo.bEnableVoiceChat)
		{
			ChatRoomMessage(0, ChannelIndex);			
		}
		else
		{
			ShowNoVoiceChatMsg();
		}
		return;
	}
	// End:0x92
	if(!VCR.IsMember(PlayerReplicationInfo))
	{
		// End:0x92
		if(int(ServerJoinVoiceChannel(ChannelIndex, ChannelPassword)) != int(7))
		{
			return;
		}
	}
	Index = -1;
	// End:0x10E
	if(ActiveRoom == VCR)
	{
		ChatRoomMessage(10, ChannelIndex);
		Log((PlayerReplicationInfo.PlayerName @ "no longer speaking on ") $ VCR.GetTitle(), 'VoiceChat');
		ActiveRoom = none;
		ClientSetActiveRoom(-1);		
	}
	else
	{
		ActiveRoom = VCR;
		Log((PlayerReplicationInfo.PlayerName @ "speaking on") @ VCR.GetTitle(), 'VoiceChat');
		ChatRoomMessage(9, ChannelIndex);
		ClientSetActiveRoom(VCR.ChannelIndex);
		Index = VCR.ChannelIndex;
	}
	// End:0x1A2
	if(PlayerReplicationInfo != none)
	{
		PlayerReplicationInfo.ActiveChannel = Index;
	}
	//return;	
}

function ServerSetChatPassword(string NewPassword)
{
	ChatPassword = NewPassword;
	// End:0x2A
	if(PlayerReplicationInfo != none)
	{
		PlayerReplicationInfo.SetChatPassword(NewPassword);
	}
	//return;	
}

function ServerChangeVoiceChatMode(bool bEnable)
{
	// End:0x3E
	if((Level.TimeSeconds - VCTimeStamp) > float(0))
	{
		VCCount = 0;
		VCTimeStamp = Level.TimeSeconds + float(10);
	}
	// End:0x59
	if((VoiceReplicationInfo == none) || VCCount > 10)
	{
		return;
	}
	VCCount++;
	bVoiceChatEnabled = bEnable;
	// End:0xA8
	if(bVoiceChatEnabled)
	{
		// End:0x9F
		if(VoiceReplicationInfo.bEnableVoiceChat)
		{
			VoiceReplicationInfo.AddVoiceChatter(PlayerReplicationInfo);			
		}
		else
		{
			ShowNoVoiceChatMsg();
		}		
	}
	else
	{
		VoiceReplicationInfo.RemoveVoiceChatter(PlayerReplicationInfo);
	}
	//return;	
}

simulated function ClientSetActiveRoom(int ChannelIndex)
{
	// End:0x1A
	if((VoiceReplicationInfo == none) || !bVoiceChatEnabled)
	{
		return;
	}
	// End:0x3D
	if(ActiveRoom != none)
	{
		LastActiveChannel = ActiveRoom.GetTitle();		
	}
	else
	{
		LastActiveChannel = "";
	}
	ActiveRoom = VoiceReplicationInfo.GetChannelAt(ChannelIndex);
	//return;	
}

exec function ChatDebug()
{
	ChatManager.ChatDebug();
	ServerChatDebug();
	//return;	
}

function ServerChatDebug()
{
	//return;	
}

function ServerRequestBanInfo(int PlayerID)
{
	//return;	
}

function ServerChatRestriction(int PlayerID, byte Type)
{
	local PlayerReplicationInfo PRI;
	local int i;

	// End:0x1A
	if((ChatManager == none) || GameReplicationInfo == none)
	{
		return;
	}
	Log((("ServerChatRestriction PlayerID:" $ string(PlayerID)) @ "Type:") $ string(Type), 'ChatManager');
	i = 0;
	J0x64:

	// End:0x155 [Loop If]
	if(i < GameReplicationInfo.PRIArray.Length)
	{
		Log((("ServerChatRestriction checking GRI.PRIArray[" $ string(i)) $ "].PlayerID:") $ string(GameReplicationInfo.PRIArray[i].PlayerID), 'ChatManager');
		// End:0x14B
		if((GameReplicationInfo.PRIArray[i] != none) && GameReplicationInfo.PRIArray[i].PlayerID == PlayerID)
		{
			PRI = GameReplicationInfo.PRIArray[i];
			// [Explicit Break]
			goto J0x155;
		}
		i++;
		// [Loop Continue]
		goto J0x64;
	}
	J0x155:

	Log((("ServerChatRestriction PRI:" $ string(PRI)) @ "PRI.Owner") $ string(PRI.Owner), 'ChatManager');
	// End:0x1C8
	if((PRI == none) || PlayerController(PRI.Owner) == none)
	{
		return;
	}
	ChatManager.SetRestriction(PlayerController(GameReplicationInfo.PRIArray[i].Owner).GetPlayerIDHash(), Type);
	// End:0x28D
	if(((bool(int(Type) & 8) && PlayerReplicationInfo != none) && PlayerReplicationInfo.PrivateChatRoom != none) && PlayerReplicationInfo.PrivateChatRoom.IsMember(PRI, true))
	{
		ChatRoomMessage(13, -1, PRI);
		PlayerReplicationInfo.PrivateChatRoom.RemoveMember(PRI);
	}
	//return;	
}

simulated event GainedChild(Actor Other)
{
	super(Actor).GainedChild(Other);
	// End:0x2B
	if(VotingReplicationInfoBase(Other) != none)
	{
		VoteReplicationInfo = VotingReplicationInfoBase(Other);
	}
	//return;	
}

simulated event LostChild(Actor Other)
{
	super(Actor).LostChild(Other);
	// End:0x22
	if(VotingReplicationInfoBase(Other) != none)
	{
		VoteReplicationInfo = none;
	}
	//return;	
}

exec function ShowVoteMenu()
{
	local string CustomMapVotingMenu;

	// End:0xDC
	if(((int(Level.NetMode) != int(NM_Standalone)) && VoteReplicationInfo != none) && VoteReplicationInfo.MapVoteEnabled())
	{
		CustomMapVotingMenu = Player.GUIController.GetPropertyText("CustomMapVotingMenu");
		// End:0xDC
		if((CustomMapVotingMenu == "") || !Player.GUIController.OpenMenu(CustomMapVotingMenu))
		{
			Player.GUIController.OpenMenu(Player.GUIController.GetPropertyText("MapVotingMenu"));
		}
	}
	//return;	
}

state PlayerWalking
{
	function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
	{
		// End:0x22
		if(NewVolume.bWaterVolume)
		{
			GotoState(Pawn.WaterMovementState);
		}
		return false;
		//return;		
	}

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		local Vector OldAccel;
		local bool OldCrouch;

		// End:0x0D
		if(Pawn == none)
		{
			return;
		}
		OldAccel = Pawn.Acceleration;
		// End:0x4D
		if(Pawn.Acceleration != NewAccel)
		{
			Pawn.Acceleration = NewAccel;
		}
		// End:0x8D
		if(bDoubleJump && bUpdating || Pawn.CanDoubleJump())
		{
			Pawn.DoDoubleJump(bUpdating);			
		}
		else
		{
			// End:0xAB
			if(bPressedJump)
			{
				Pawn.DoJump(bUpdating);
			}
		}
		Pawn.SetViewPitch(Rotation.Pitch);
		// End:0x135
		if(int(Pawn.Physics) != int(2))
		{
			OldCrouch = Pawn.bWantsToCrouch;
			// End:0x113
			if(int(bDuck) == 0)
			{
				Pawn.ShouldCrouch(false);				
			}
			else
			{
				// End:0x135
				if(Pawn.bCanCrouch)
				{
					Pawn.ShouldCrouch(true);
				}
			}
		}
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Vector X, Y, Z, NewAccel;
		local Actor.EDoubleClickDir DoubleClickMove;
		local Rotator OldRotation, ViewRotation;
		local bool bSaveJump;

		// End:0x14
		if(Pawn == none)
		{
			GotoState('Dead');
			return;
		}
		GetAxes(Pawn.Rotation, X, Y, Z);
		NewAccel = (aForward * X) + (aStrafe * Y);
		NewAccel.Z = 0.0000000;
		// End:0x87
		if(VSize(NewAccel) < 1.0000000)
		{
			NewAccel = vect(0.0000000, 0.0000000, 0.0000000);
		}
		DoubleClickMove = PlayerInput.CheckForDoubleClickMove((1.1000000 * DeltaTime) / Level.TimeDilation);
		GroundPitch = 0;
		ViewRotation = Rotation;
		// End:0x218
		if(int(Pawn.Physics) == int(1))
		{
			// End:0x215
			if((int(bLook) == 0) && ((Pawn.Acceleration != vect(0.0000000, 0.0000000, 0.0000000)) && bSnapToLevel) || !bKeyboardLook)
			{
				// End:0x15F
				if(bLookUpStairs || bSnapToLevel)
				{
					GroundPitch = FindStairRotation(DeltaTime);
					ViewRotation.Pitch = GroundPitch;					
				}
				else
				{
					// End:0x215
					if(bCenterView)
					{
						ViewRotation.Pitch = ViewRotation.Pitch & 65535;
						// End:0x1A9
						if(ViewRotation.Pitch > 32768)
						{
							ViewRotation.Pitch -= 65536;
						}
						ViewRotation.Pitch = int(float(ViewRotation.Pitch) * (float(1) - (float(12) * FMin(0.0833000, DeltaTime))));
						// End:0x215
						if((Abs(float(ViewRotation.Pitch)) < float(250)) && ViewRotation.Pitch < 100)
						{
							ViewRotation.Pitch = -249;
						}
					}
				}
			}			
		}
		else
		{
			// End:0x2EA
			if((!bKeyboardLook && int(bLook) == 0) && bCenterView)
			{
				ViewRotation.Pitch = ViewRotation.Pitch & 65535;
				// End:0x27E
				if(ViewRotation.Pitch > 32768)
				{
					ViewRotation.Pitch -= 65536;
				}
				ViewRotation.Pitch = int(float(ViewRotation.Pitch) * (float(1) - (float(12) * FMin(0.0833000, DeltaTime))));
				// End:0x2EA
				if((Abs(float(ViewRotation.Pitch)) < float(250)) && ViewRotation.Pitch < 100)
				{
					ViewRotation.Pitch = -249;
				}
			}
		}
		Pawn.CheckBob(DeltaTime, Y);
		SetRotation(ViewRotation);
		OldRotation = Rotation;
		UpdateRotation(DeltaTime, 1.0000000);
		bDoubleJump = false;
		// End:0x35E
		if(bPressedJump && Pawn.CannotJumpNow())
		{
			bSaveJump = true;
			bPressedJump = false;			
		}
		else
		{
			bSaveJump = false;
		}
		// End:0x39B
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);			
		}
		else
		{
			ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
		}
		bPressedJump = bSaveJump;
		//return;		
	}

	function BeginState()
	{
		DoubleClickDir = 0;
		bPressedJump = false;
		GroundPitch = 0;
		// End:0x97
		if(Pawn != none)
		{
			// End:0x45
			if(Pawn.Mesh == none)
			{
				Pawn.SetMesh();
			}
			Pawn.ShouldCrouch(false);
			// End:0x97
			if((int(Pawn.Physics) != int(2)) && int(Pawn.Physics) != int(13))
			{
				Pawn.SetPhysics(1);
			}
		}
		//return;		
	}

	function EndState()
	{
		GroundPitch = 0;
		// End:0x31
		if((Pawn != none) && int(bDuck) == 0)
		{
			Pawn.ShouldCrouch(false);
		}
		//return;		
	}
Begin:

	stop;				
}

state PlayerClimbing
{
	function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
	{
		// End:0x25
		if(NewVolume.bWaterVolume)
		{
			GotoState(Pawn.WaterMovementState);			
		}
		else
		{
			GotoState(Pawn.LandMovementState);
		}
		return false;
		//return;		
	}

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		local Vector OldAccel;

		OldAccel = Pawn.Acceleration;
		// End:0x40
		if(Pawn.Acceleration != NewAccel)
		{
			Pawn.Acceleration = NewAccel;
		}
		// End:0x7E
		if(bPressedJump)
		{
			Pawn.DoJump(bUpdating);
			// End:0x7E
			if(int(Pawn.Physics) == int(2))
			{
				GotoState('PlayerWalking');
			}
		}
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Vector X, Y, Z, NewAccel;
		local Actor.EDoubleClickDir DoubleClickMove;
		local Rotator OldRotation, ViewRotation;
		local bool bSaveJump;

		GetAxes(Rotation, X, Y, Z);
		// End:0x7F
		if(Pawn.OnLadder != none)
		{
			NewAccel = aForward * Pawn.OnLadder.ClimbDir;
			// End:0x7C
			if(Pawn.OnLadder.bAllowLadderStrafing)
			{
				NewAccel += (aStrafe * Y);
			}			
		}
		else
		{
			NewAccel = (aForward * X) + (aStrafe * Y);
		}
		// End:0xC3
		if(VSize(NewAccel) < 1.0000000)
		{
			NewAccel = vect(0.0000000, 0.0000000, 0.0000000);
		}
		ViewRotation = Rotation;
		SetRotation(ViewRotation);
		OldRotation = Rotation;
		UpdateRotation(DeltaTime, 1.0000000);
		// End:0x126
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);			
		}
		else
		{
			ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
		}
		bPressedJump = bSaveJump;
		//return;		
	}

	function BeginState()
	{
		Pawn.ShouldCrouch(false);
		bPressedJump = false;
		//return;		
	}

	function EndState()
	{
		// End:0x1B
		if(Pawn != none)
		{
			Pawn.ShouldCrouch(false);
		}
		//return;		
	}
	stop;	
}

state PlayerDriving
{
	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		//return;		
	}

	function ProcessDrive(float InForward, float InStrafe, float InUp, bool InJump)
	{
		local Vehicle CurrentVehicle;

		CurrentVehicle = Vehicle(Pawn);
		// End:0x1D
		if(CurrentVehicle == none)
		{
			return;
		}
		CurrentVehicle.Throttle = FClamp(InForward / 5000.0000000, -1.0000000, 1.0000000);
		CurrentVehicle.Steering = FClamp(-InStrafe / 5000.0000000, -1.0000000, 1.0000000);
		CurrentVehicle.Rise = FClamp(InUp / 5000.0000000, -1.0000000, 1.0000000);
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Vehicle CurrentVehicle;
		local float NewPing;

		CurrentVehicle = Vehicle(Pawn);
		UpdateRotation(DeltaTime, 2.0000000);
		// End:0x2FD
		if(int(Role) < int(ROLE_Authority))
		{
			// End:0x132
			if((((Level.TimeSeconds - LastPingUpdate) > float(4)) && PlayerReplicationInfo != none) && !bDemoOwner)
			{
				LastPingUpdate = Level.TimeSeconds;
				NewPing = float(ConsoleCommand("GETPING"));
				// End:0xBE
				if(ExactPing < 0.0060000)
				{
					ExactPing = FMin(0.1000000, 0.0010000 * NewPing);					
				}
				else
				{
					ExactPing = (0.9900000 * ExactPing) + (0.0001000 * NewPing);
				}
				PlayerReplicationInfo.Ping = byte(Min(int(float(250) * ExactPing), 255));
				PlayerReplicationInfo.bReceivedPing = true;
				OldPing = ExactPing;
				ServerUpdatePing(int(float(1000) * ExactPing));
			}
			// End:0x1E0
			if((((((!bSkippedLastUpdate && Player.CurrentNetSpeed < 10000) && (Level.TimeSeconds - ClientUpdateTime) < 0.0222000) && bPressedJump == bLastPressedJump) && (aUp - aLastUp) < 0.0100000) && (aForward - aLastForward) < 0.0100000) && (aStrafe - aLastStrafe) < 0.0100000)
			{
				bSkippedLastUpdate = true;
				return;				
			}
			else
			{
				bSkippedLastUpdate = false;
				ClientUpdateTime = Level.TimeSeconds;
				bLastPressedJump = bPressedJump;
				aLastUp = aUp;
				aLastForward = aForward;
				aLastStrafe = aStrafe;
				// End:0x2AC
				if(CurrentVehicle != none)
				{
					CurrentVehicle.Throttle = FClamp(aForward / 5000.0000000, -1.0000000, 1.0000000);
					CurrentVehicle.Steering = FClamp(-aStrafe / 5000.0000000, -1.0000000, 1.0000000);
					CurrentVehicle.Rise = FClamp(aUp / 5000.0000000, -1.0000000, 1.0000000);
				}
				ServerDrive(aForward, aStrafe, aUp, bPressedJump, ((32767 & (Rotation.Pitch / 2)) * 32768) + (32767 & (Rotation.Yaw / 2)));
			}			
		}
		else
		{
			ProcessDrive(aForward, aStrafe, aUp, bPressedJump);
		}
		// End:0x385
		if(CurrentVehicle != none)
		{
			// End:0x354
			if((int(bFire) == 0) && CurrentVehicle.bWeaponisFiring)
			{
				CurrentVehicle.ClientVehicleCeaseFire(false);
			}
			// End:0x385
			if((int(bAltFire) == 0) && CurrentVehicle.bWeaponisAltFiring)
			{
				CurrentVehicle.ClientVehicleCeaseFire(true);
			}
		}
		//return;		
	}

	function BeginState()
	{
		PlayerReplicationInfo.bReceivedPing = false;
		CleanOutSavedMoves();
		//return;		
	}

	function EndState()
	{
		CleanOutSavedMoves();
		//return;		
	}
	stop;	
}

state PlayerSpidering
{
	event bool NotifyHitWall(Vector HitNormal, Actor HitActor)
	{
		Pawn.SetPhysics(9);
		Pawn.SetBase(HitActor, HitNormal);
		return true;
		//return;		
	}

	function UpdateRotation(float DeltaTime, float maxPitch)
	{
		local Rotator ViewRotation;
		local Vector MyFloor, CrossDir, FwdDir, OldFwdDir, OldX, RealFloor;

		// End:0x2A
		if(bInterpolating || Pawn.bInterpolating)
		{
			ViewShake(DeltaTime);
			return;
		}
		TurnTarget = none;
		bRotateToDesired = false;
		bSetTurnRot = false;
		// End:0x8D
		if((Pawn.Base == none) || Pawn.Floor == vect(0.0000000, 0.0000000, 0.0000000))
		{
			MyFloor = vect(0.0000000, 0.0000000, 1.0000000);			
		}
		else
		{
			MyFloor = Pawn.Floor;
		}
		// End:0x209
		if(MyFloor != OldFloor)
		{
			RealFloor = MyFloor;
			MyFloor = Normal(((float(6) * DeltaTime) * MyFloor) + ((float(1) - (float(6) * DeltaTime)) * OldFloor));
			// End:0x112
			if((RealFloor Dot MyFloor) > 0.9990000)
			{
				MyFloor = RealFloor;				
			}
			else
			{
				CrossDir = Normal(RealFloor Cross OldFloor);
				FwdDir = CrossDir Cross MyFloor;
				OldFwdDir = CrossDir Cross OldFloor;
				ViewX = ((MyFloor * (OldFloor Dot ViewX)) + (CrossDir * (CrossDir Dot ViewX))) + (FwdDir * (OldFwdDir Dot ViewX));
				ViewX = Normal(ViewX);
				ViewZ = ((MyFloor * (OldFloor Dot ViewZ)) + (CrossDir * (CrossDir Dot ViewZ))) + (FwdDir * (OldFwdDir Dot ViewZ));
				ViewZ = Normal(ViewZ);
				OldFloor = MyFloor;
				ViewY = Normal(MyFloor Cross ViewX);
			}
		}
		// End:0x35F
		if((aTurn != float(0)) || aLookUp != float(0))
		{
			// End:0x263
			if(aTurn != float(0))
			{
				ViewX = Normal(ViewX + ((float(2) * ViewY) * Sin((0.0005000 * DeltaTime) * aTurn)));
			}
			// End:0x34B
			if(aLookUp != float(0))
			{
				OldX = ViewX;
				ViewX = Normal(ViewX + ((float(2) * ViewZ) * Sin((0.0005000 * DeltaTime) * aLookUp)));
				ViewZ = Normal(ViewX Cross ViewY);
				// End:0x34B
				if((ViewZ Dot MyFloor) < 0.7070000)
				{
					OldX = Normal(OldX - (MyFloor * (MyFloor Dot OldX)));
					// End:0x323
					if((ViewX Dot MyFloor) > float(0))
					{
						ViewX = Normal(OldX + MyFloor);						
					}
					else
					{
						ViewX = Normal(OldX - MyFloor);
					}
					ViewZ = Normal(ViewX Cross ViewY);
				}
			}
			ViewY = Normal(MyFloor Cross ViewX);
		}
		ViewRotation = OrthoRotation(ViewX, ViewY, ViewZ);
		SetRotation(ViewRotation);
		ViewShake(DeltaTime);
		ViewFlash(DeltaTime);
		Pawn.FaceRotation(ViewRotation, DeltaTime);
		//return;		
	}

	function bool NotifyLanded(Vector HitNormal)
	{
		Pawn.SetPhysics(9);
		return bUpdating;
		//return;		
	}

	function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
	{
		// End:0x22
		if(NewVolume.bWaterVolume)
		{
			GotoState(Pawn.WaterMovementState);
		}
		return false;
		//return;		
	}

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		local Vector OldAccel;

		OldAccel = Pawn.Acceleration;
		// End:0x40
		if(Pawn.Acceleration != NewAccel)
		{
			Pawn.Acceleration = NewAccel;
		}
		// End:0x5E
		if(bPressedJump)
		{
			Pawn.DoJump(bUpdating);
		}
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Vector NewAccel;
		local Actor.EDoubleClickDir DoubleClickMove;
		local Rotator OldRotation, ViewRotation;
		local bool bSaveJump;

		GroundPitch = 0;
		ViewRotation = Rotation;
		Pawn.CheckBob(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000));
		SetRotation(ViewRotation);
		OldRotation = Rotation;
		UpdateRotation(DeltaTime, 1.0000000);
		NewAccel = (aForward * Normal(ViewX - (OldFloor * (OldFloor Dot ViewX)))) + (aStrafe * ViewY);
		// End:0xB1
		if(VSize(NewAccel) < 1.0000000)
		{
			NewAccel = vect(0.0000000, 0.0000000, 0.0000000);
		}
		// End:0xE1
		if(bPressedJump && Pawn.CannotJumpNow())
		{
			bSaveJump = true;
			bPressedJump = false;			
		}
		else
		{
			bSaveJump = false;
		}
		// End:0x11E
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);			
		}
		else
		{
			ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
		}
		bPressedJump = bSaveJump;
		//return;		
	}

	function BeginState()
	{
		// End:0x23
		if(Pawn.Mesh == none)
		{
			Pawn.SetMesh();
		}
		OldFloor = vect(0.0000000, 0.0000000, 1.0000000);
		GetAxes(Rotation, ViewX, ViewY, ViewZ);
		DoubleClickDir = 0;
		Pawn.ShouldCrouch(false);
		bPressedJump = false;
		// End:0x93
		if(int(Pawn.Physics) != int(2))
		{
			Pawn.SetPhysics(9);
		}
		GroundPitch = 0;
		Pawn.bCrawler = true;
		Pawn.SetCollisionSize(Pawn.default.CollisionHeight, Pawn.default.CollisionHeight);
		//return;		
	}

	function EndState()
	{
		GroundPitch = 0;
		// End:0x69
		if(Pawn != none)
		{
			Pawn.SetCollisionSize(Pawn.default.CollisionRadius, Pawn.default.CollisionHeight);
			Pawn.ShouldCrouch(false);
			Pawn.bCrawler = Pawn.default.bCrawler;
		}
		//return;		
	}
	stop;	
}

state PlayerSwimming
{
	function bool WantsSmoothedView()
	{
		return !Pawn.bJustLanded;
		//return;		
	}

	function bool NotifyLanded(Vector HitNormal)
	{
		// End:0x2C
		if(Pawn.PhysicsVolume.bWaterVolume)
		{
			Pawn.SetPhysics(3);			
		}
		else
		{
			GotoState(Pawn.LandMovementState);
		}
		return bUpdating;
		//return;		
	}

	function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
	{
		local Actor HitActor;
		local Vector HitLocation, HitNormal, checkpoint;

		// End:0x1A0
		if(!NewVolume.bWaterVolume)
		{
			Pawn.SetPhysics(2);
			// End:0x19D
			if((Pawn.Velocity.Z > float(0)) || Pawn.bWaterStepup)
			{
				// End:0xCE
				if(Pawn.bUpAndOut && Pawn.CheckWaterJump(HitNormal))
				{
					Pawn.Velocity.Z = FMax(Pawn.JumpZ, 420.0000000) + (float(2) * Pawn.CollisionRadius);
					GotoState(Pawn.LandMovementState);					
				}
				else
				{
					// End:0x113
					if((Pawn.Velocity.Z > float(160)) || !Pawn.TouchingWaterVolume())
					{
						GotoState(Pawn.LandMovementState);						
					}
					else
					{
						checkpoint = Pawn.Location;
						checkpoint.Z -= (Pawn.CollisionHeight + 6.0000000);
						HitActor = Trace(HitLocation, HitNormal, checkpoint, Pawn.Location, false);
						// End:0x18D
						if(HitActor != none)
						{
							GotoState(Pawn.LandMovementState);							
						}
						else
						{
							Enable('Timer');
							SetTimer(0.7000000, false);
						}
					}
				}
			}			
		}
		else
		{
			Disable('Timer');
			Pawn.SetPhysics(3);
		}
		return false;
		//return;		
	}

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		local Vector X, Y, Z, OldAccel;
		local bool bUpAndOut;

		GetAxes(Rotation, X, Y, Z);
		OldAccel = Pawn.Acceleration;
		// End:0x56
		if(Pawn.Acceleration != NewAccel)
		{
			Pawn.Acceleration = NewAccel;
		}
		bUpAndOut = ((X Dot Pawn.Acceleration) > float(0)) && (Pawn.Acceleration.Z > float(0)) || Rotation.Pitch > 2048;
		// End:0xDA
		if(Pawn.bUpAndOut != bUpAndOut)
		{
			Pawn.bUpAndOut = bUpAndOut;
		}
		// End:0x10B
		if(!Pawn.PhysicsVolume.bWaterVolume)
		{
			NotifyPhysicsVolumeChange(Pawn.PhysicsVolume);
		}
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Rotator OldRotation;
		local Vector X, Y, Z, NewAccel;

		GetAxes(Rotation, X, Y, Z);
		NewAccel = ((aForward * X) + (aStrafe * Y)) + (aUp * vect(0.0000000, 0.0000000, 1.0000000));
		// End:0x70
		if(VSize(NewAccel) < 1.0000000)
		{
			NewAccel = vect(0.0000000, 0.0000000, 0.0000000);
		}
		Pawn.CheckBob(DeltaTime, Y);
		OldRotation = Rotation;
		UpdateRotation(DeltaTime, 2.0000000);
		// End:0xD6
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, NewAccel, 0, OldRotation - Rotation);			
		}
		else
		{
			ProcessMove(DeltaTime, NewAccel, 0, OldRotation - Rotation);
		}
		bPressedJump = false;
		//return;		
	}

	function Timer()
	{
		// End:0x3F
		if(!Pawn.PhysicsVolume.bWaterVolume && int(Role) == int(ROLE_Authority))
		{
			GotoState(Pawn.LandMovementState);
		}
		Disable('Timer');
		//return;		
	}

	function BeginState()
	{
		Disable('Timer');
		Pawn.SetPhysics(3);
		//return;		
	}
	stop;	
}

state PlayerFlying
{
	function PlayerMove(float DeltaTime)
	{
		local Vector X, Y, Z;

		GetAxes(Rotation, X, Y, Z);
		Pawn.Acceleration = (aForward * X) + (aStrafe * Y);
		// End:0x75
		if(VSize(Pawn.Acceleration) < 1.0000000)
		{
			Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
		}
		// End:0xBC
		if(bCheatFlying && Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000))
		{
			Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		}
		UpdateRotation(DeltaTime, 2.0000000);
		// End:0x107
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));			
		}
		else
		{
			ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
		}
		//return;		
	}

	function BeginState()
	{
		Pawn.SetPhysics(4);
		//return;		
	}
	stop;	
}

state PlayerSpaceFlying
{
	function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbPendingJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
	{
		local Rotator ViewRot;

		// End:0x19
		if(Pawn == none)
		{
			ViewRot = Rotation;			
		}
		else
		{
			ViewRot = Pawn.Rotation;
		}
		// End:0xDE
		if(PendingMove != none)
		{
			DualSpaceFighterServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingMove.bDuck, PendingMove.Rotation.Pitch, PendingMove.Rotation.Yaw, PendingMove.Rotation.Roll, TimeStamp, InAccel, ClientLoc, NewbDuck, ViewRot.Pitch, ViewRot.Yaw, ViewRot.Roll);			
		}
		else
		{
			SpaceFighterServerMove(TimeStamp, InAccel, ClientLoc, NewbDuck, ViewRot.Pitch, ViewRot.Yaw, ViewRot.Roll);
		}
		//return;		
	}

	function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
	{
		// End:0x11
		if(CurrentTimeStamp >= TimeStamp)
		{
			return;
		}
		// End:0x3E
		if(AcknowledgedPawn != Pawn)
		{
			OldTimeDelta = 0;
			InAccel = vect(0.0000000, 0.0000000, 0.0000000);			
		}
		else
		{
			Pawn.AutonomousPhysics(TimeStamp - CurrentTimeStamp);
		}
		CurrentTimeStamp = TimeStamp;
		ServerTimeStamp = Level.TimeSeconds;
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		// End:0x14
		if(Pawn == none)
		{
			GotoState('Dead');
			return;
		}
		Pawn.UpdateRocketAcceleration(DeltaTime, aTurn, aLookUp);
		SetRotation(Pawn.Rotation);
		ViewShake(DeltaTime);
		ViewFlash(DeltaTime);
		// End:0x95
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, Pawn.Acceleration, 0, Pawn.Rotation);			
		}
		else
		{
			ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
		}
		//return;		
	}

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		// End:0x0D
		if(Pawn == none)
		{
			return;
		}
		// End:0x39
		if(Pawn.Acceleration != NewAccel)
		{
			Pawn.Acceleration = NewAccel;
		}
		// End:0x90
		if(DeltaRot != rot(0, 0, 0))
		{
			// End:0x79
			if(Pawn.Rotation != DeltaRot)
			{
				Pawn.SetRotation(DeltaRot);
			}
			// End:0x90
			if(Rotation != DeltaRot)
			{
				SetRotation(DeltaRot);
			}
		}
		Pawn.Velocity = (Pawn.Acceleration * Pawn.AirSpeed) * 0.0010000;
		Pawn.ProcessMove(DeltaTime, NewAccel, DoubleClickMove, DeltaRot);
		//return;		
	}

	function BeginState()
	{
		// End:0x19
		if(Pawn != none)
		{
			Pawn.SetPhysics(4);
		}
		RotationRate.Pitch = 8192;
		bIsSpaceFighter = true;
		//return;		
	}

	function EndState()
	{
		RotationRate.Pitch = default.RotationRate.Pitch;
		bIsSpaceFighter = false;
		//return;		
	}
	stop;	
}

state PlayerRocketing
{
	function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbPendingJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
	{
		// End:0xCA
		if(PendingMove != none)
		{
			DualRocketServerMove(PendingMove.TimeStamp, PendingMove.Acceleration * float(10), PendingMove.bDuck, byte(int(byte(PendingMove.Rotation.Roll >> 8)) & 255), ((32767 & (PendingMove.Rotation.Pitch / 2)) * 32768) + (32767 & (PendingMove.Rotation.Yaw / 2)), TimeStamp, InAccel, ClientLoc, NewbDuck, ClientRoll, View);			
		}
		else
		{
			RocketServerMove(TimeStamp, InAccel, ClientLoc, NewbDuck, ClientRoll, View);
		}
		//return;		
	}

	function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
	{
		// End:0x11
		if(CurrentTimeStamp >= TimeStamp)
		{
			return;
		}
		// End:0xBF
		if(!CheckSpeedHack(TimeStamp - CurrentTimeStamp))
		{
			// End:0xB4
			if(!bWasSpeedHack)
			{
				// End:0x90
				if((Level.TimeSeconds - LastSpeedHackLog) > float(20))
				{
					Log("Possible speed hack by " $ PlayerReplicationInfo.PlayerName);
					LastSpeedHackLog = Level.TimeSeconds;
				}
				ClientMessage("Speed Hack Detected!", 'CriticalEvent');				
			}
			else
			{
				bWasSpeedHack = true;
			}			
		}
		else
		{
			// End:0xEC
			if(AcknowledgedPawn != Pawn)
			{
				OldTimeDelta = 0;
				InAccel = vect(0.0000000, 0.0000000, 0.0000000);				
			}
			else
			{
				Pawn.AutonomousPhysics(TimeStamp - CurrentTimeStamp);
			}
		}
		CurrentTimeStamp = TimeStamp;
		ServerTimeStamp = Level.TimeSeconds;
		//return;		
	}

	function RocketServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, byte ClientRoll, int View)
	{
		global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, false, false, 0, ClientRoll, View);
		//return;		
	}

	function DualRocketServerMove(float TimeStamp0, Vector InAccel0, bool NewbDuck0, byte ClientRoll0, int View0, float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbDuck, byte ClientRoll, int View)
	{
		global.ServerMove(TimeStamp0, InAccel0, vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, false, false, 0, ClientRoll0, View0);
		global.ServerMove(TimeStamp, InAccel, ClientLoc, false, NewbDuck, false, false, 0, ClientRoll, View);
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		Pawn.UpdateRocketAcceleration(DeltaTime, aTurn, aLookUp);
		SetRotation(Pawn.Rotation);
		// End:0x6A
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));			
		}
		else
		{
			ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
		}
		//return;		
	}

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		// End:0x0D
		if(Pawn == none)
		{
			return;
		}
		// End:0x39
		if(Pawn.Acceleration != NewAccel)
		{
			Pawn.Acceleration = NewAccel;
		}
		//return;		
	}

	function BeginState()
	{
		// End:0x19
		if(Pawn != none)
		{
			Pawn.SetPhysics(4);
		}
		RotationRate.Pitch = 8192;
		//return;		
	}

	function EndState()
	{
		RotationRate.Pitch = default.RotationRate.Pitch;
		//return;		
	}
	stop;	
}

state PlayerTurreting
{
	function CallServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbPendingJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
	{
		// End:0xB1
		if(PendingMove != none)
		{
			DualTurretServerMove(PendingMove.TimeStamp, PendingMove.bDuck, byte(int(byte(PendingMove.Rotation.Roll >> 8)) & 255), ((32767 & (PendingMove.Rotation.Pitch / 2)) * 32768) + (32767 & (PendingMove.Rotation.Yaw / 2)), TimeStamp, ClientLoc, NewbDuck, ClientRoll, View);			
		}
		else
		{
			TurretServerMove(TimeStamp, ClientLoc, NewbDuck, ClientRoll, View);
		}
		//return;		
	}

	function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
	{
		// End:0x11
		if(CurrentTimeStamp >= TimeStamp)
		{
			return;
		}
		// End:0x3B
		if(AcknowledgedPawn != Pawn)
		{
			OldTimeDelta = 0;
			InAccel = vect(0.0000000, 0.0000000, 0.0000000);
		}
		// End:0x73
		if((AcknowledgedPawn == Pawn) && CurrentTimeStamp < TimeStamp)
		{
			Pawn.AutonomousPhysics(TimeStamp - CurrentTimeStamp);
		}
		CurrentTimeStamp = TimeStamp;
		ServerTimeStamp = Level.TimeSeconds;
		//return;		
	}

	function TurretServerMove(float TimeStamp, Vector ClientLoc, bool NewbDuck, byte ClientRoll, int View)
	{
		global.ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, false, NewbDuck, false, false, 0, ClientRoll, View);
		//return;		
	}

	function DualTurretServerMove(float TimeStamp0, bool NewbDuck0, byte ClientRoll0, int View0, float TimeStamp, Vector ClientLoc, bool NewbDuck, byte ClientRoll, int View)
	{
		global.ServerMove(TimeStamp0, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), false, NewbDuck0, false, false, 0, ClientRoll0, View0);
		global.ServerMove(TimeStamp, vect(0.0000000, 0.0000000, 0.0000000), ClientLoc, false, NewbDuck, false, false, 0, ClientRoll, View);
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Vehicle CurrentVehicle;

		// End:0x14
		if(Pawn == none)
		{
			GotoState('Dead');
			return;
		}
		Pawn.UpdateRocketAcceleration(DeltaTime, aTurn, aLookUp);
		// End:0x4E
		if(!bFreeCamera)
		{
			SetRotation(Pawn.Rotation);
		}
		ViewShake(DeltaTime);
		ViewFlash(DeltaTime);
		// End:0x9F
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));			
		}
		else
		{
			ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
		}
		CurrentVehicle = Vehicle(Pawn);
		// End:0x144
		if(CurrentVehicle != none)
		{
			// End:0x113
			if((int(bFire) == 0) && CurrentVehicle.bWeaponisFiring)
			{
				CurrentVehicle.ClientVehicleCeaseFire(false);
			}
			// End:0x144
			if((int(bAltFire) == 0) && CurrentVehicle.bWeaponisAltFiring)
			{
				CurrentVehicle.ClientVehicleCeaseFire(true);
			}
		}
		//return;		
	}

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		// End:0x0D
		if(Pawn == none)
		{
			return;
		}
		Pawn.Acceleration = NewAccel;
		//return;		
	}

	function BeginState()
	{
		// End:0x19
		if(Pawn != none)
		{
			Pawn.SetPhysics(4);
		}
		RotationRate.Pitch = 16384;
		//return;		
	}

	function EndState()
	{
		RotationRate.Pitch = default.RotationRate.Pitch;
		//return;		
	}
Begin:

	stop;				
}

state BaseSpectating
{
	function bool IsSpectating()
	{
		return true;
		//return;		
	}

	function ProcessMove(float DeltaTime, Vector NewAccel, Actor.EDoubleClickDir DoubleClickMove, Rotator DeltaRot)
	{
		Acceleration = NewAccel;
		MoveSmooth((SpectateSpeed * Normal(Acceleration)) * DeltaTime);
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Vector X, Y, Z;

		// End:0xE1
		if((Pawn(ViewTarget) != none) && int(Level.NetMode) == int(NM_Client))
		{
			// End:0x4E
			if(Pawn(ViewTarget).bSimulateGravity)
			{
				TargetViewRotation.Roll = 0;
			}
			BlendedTargetViewRotation.Pitch = BlendRot(DeltaTime, BlendedTargetViewRotation.Pitch, TargetViewRotation.Pitch & 65535);
			BlendedTargetViewRotation.Yaw = BlendRot(DeltaTime, BlendedTargetViewRotation.Yaw, TargetViewRotation.Yaw & 65535);
			BlendedTargetViewRotation.Roll = BlendRot(DeltaTime, BlendedTargetViewRotation.Roll, TargetViewRotation.Roll & 65535);
		}
		GetAxes(Rotation, X, Y, Z);
		Acceleration = 0.0200000 * (((aForward * X) + (aStrafe * Y)) + (aUp * vect(0.0000000, 0.0000000, 1.0000000)));
		UpdateRotation(DeltaTime, 1.0000000);
		// End:0x176
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));			
		}
		else
		{
			ProcessMove(DeltaTime, Acceleration, 0, rot(0, 0, 0));
		}
		//return;		
	}
	stop;	
}

state Scripting
{
	exec function Fire(optional float F)
	{
		//return;		
	}

	exec function AltFire(optional float F)
	{
		Fire(F);
		//return;		
	}
	stop;	
}

state Spectating extends BaseSpectating
{
	ignores ThrowWeapon, Suicide, ClientReStart, RestartLevel, SwitchWeapon;

	exec function Fire(optional float F)
	{
		// End:0x33
		if(bFrozen)
		{
			// End:0x31
			if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
			{
				bFrozen = false;
			}
			return;
		}
		ServerViewNextPlayer();
		//return;		
	}

	exec function AltFire(optional float F)
	{
		bBehindView = false;
		ServerViewSelf();
		//return;		
	}

	function Timer()
	{
		bFrozen = false;
		//return;		
	}

	function BeginState()
	{
		// End:0x22
		if(Pawn != none)
		{
			SetLocation(Pawn.Location);
			UnPossess();
		}
		bCollideWorld = true;
		CameraDist = default.CameraDist;
		//return;		
	}

	function EndState()
	{
		PlayerReplicationInfo.bIsSpectator = false;
		bCollideWorld = false;
		//return;		
	}
Begin:

	stop;				
}

state AttractMode extends Spectating
{	stop;	
}

auto state PlayerWaiting extends BaseSpectating
{
	ignores SwitchToBestWeapon, PrevWeapon, NextWeapon, TakeDamage;

	exec function Jump(optional float F)
	{
		//return;		
	}

	exec function Suicide()
	{
		//return;		
	}

	function ServerReStartPlayer()
	{
		// End:0x1A
		if(Level.TimeSeconds < WaitDelay)
		{
			return;
		}
		// End:0x35
		if(int(Level.NetMode) == int(NM_Client))
		{
			return;
		}
		// End:0x64
		if(Level.Game.bWaitingToStartMatch)
		{
			PlayerReplicationInfo.bReadyToPlay = true;			
		}
		else
		{
			Level.Game.RestartPlayer(self);
		}
		//return;		
	}

	exec function Fire(optional float F)
	{
		LoadPlayers();
		// End:0x31
		if(!bForcePrecache && Level.TimeSeconds > 0.2000000)
		{
			ServerReStartPlayer();
		}
		//return;		
	}

	exec function AltFire(optional float F)
	{
		Fire(F);
		//return;		
	}

	function EndState()
	{
		// End:0x1A
		if(Pawn != none)
		{
			Pawn.SetMesh();
		}
		// End:0x35
		if(PlayerReplicationInfo != none)
		{
			PlayerReplicationInfo.SetWaitingPlayer(false);
		}
		bCollideWorld = false;
		//return;		
	}

	function BeginState()
	{
		CameraDist = default.CameraDist;
		// End:0x26
		if(PlayerReplicationInfo != none)
		{
			PlayerReplicationInfo.SetWaitingPlayer(true);
		}
		bCollideWorld = true;
		//return;		
	}
	stop;	
}

state WaitingForPawn extends BaseSpectating
{
	ignores SwitchWeapon, KilledBy;

	exec function Fire(optional float F)
	{
		AskForPawn();
		//return;		
	}

	exec function AltFire(optional float F)
	{
		//return;		
	}

	function LongClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase, float NewFloorX, float NewFloorY, float NewFloorZ)
	{
		// End:0x27
		if((NewState == 'GameEnded') || NewState == 'RoundEnded')
		{
			GotoState(NewState);
		}
		//return;		
	}

	function PlayerTick(float DeltaTime)
	{
		global.PlayerTick(DeltaTime);
		// End:0x45
		if(Pawn != none)
		{
			Pawn.Controller = self;
			Pawn.bUpdateEyeheight = true;
			ClientReStart(Pawn);			
		}
		else
		{
			// End:0x74
			if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
			{
				SetTimer(0.2000000, true);
				AskForPawn();
			}
		}
		//return;		
	}

	function Timer()
	{
		AskForPawn();
		//return;		
	}

	function BeginState()
	{
		SetTimer(0.2000000, true);
		AskForPawn();
		//return;		
	}

	function EndState()
	{
		bBehindView = false;
		SetTimer(0.0000000, false);
		//return;		
	}
	stop;	
}

state GameEnded
{
	ignores Suicide, TakeDamage, KilledBy;

	function ServerReStartPlayer()
	{
		//return;		
	}

	function bool IsSpectating()
	{
		return true;
		//return;		
	}

	exec function Use()
	{
		//return;		
	}

	exec function SwitchWeapon(byte t)
	{
		//return;		
	}

	exec function ThrowWeapon()
	{
		//return;		
	}

	function Possess(Pawn aPawn)
	{
		global.Possess(aPawn);
		// End:0x25
		if(Pawn != none)
		{
			Pawn.TurnOff();
		}
		//return;		
	}

	function ServerRestartGame()
	{
		// End:0x34
		if(Level.Game.PlayerCanRestartGame(self))
		{
			Level.Game.RestartGame();
		}
		//return;		
	}

	exec function Fire(optional float F)
	{
		// End:0x12
		if(int(Role) < int(ROLE_Authority))
		{
			return;
		}
		// End:0x26
		if(!bFrozen)
		{
			ServerRestartGame();			
		}
		else
		{
			// End:0x3C
			if(TimerRate <= float(0))
			{
				SetTimer(1.5000000, false);
			}
		}
		//return;		
	}

	exec function AltFire(optional float F)
	{
		Fire(F);
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Vector X, Y, Z;
		local Rotator ViewRotation;

		GetAxes(Rotation, X, Y, Z);
		// End:0xA8
		if(!bFixedCamera)
		{
			ViewRotation = Rotation;
			ViewRotation.Yaw += int((32.0000000 * DeltaTime) * aTurn);
			ViewRotation.Pitch += int((32.0000000 * DeltaTime) * aLookUp);
			// End:0x9D
			if(Pawn != none)
			{
				ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
			}
			SetRotation(ViewRotation);			
		}
		else
		{
			// End:0xC4
			if(ViewTarget != none)
			{
				SetRotation(ViewTarget.Rotation);
			}
		}
		ViewShake(DeltaTime);
		ViewFlash(DeltaTime);
		// End:0x114
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));			
		}
		else
		{
			ProcessMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));
		}
		bPressedJump = false;
		//return;		
	}

	function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
	{
		global.ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, ((32767 & (Rotation.Pitch / 2)) * 32768) + (32767 & (Rotation.Yaw / 2)));
		//return;		
	}

	function FindGoodView()
	{
		local Vector cameraLoc;
		local Rotator cameraRot, ViewRotation;
		local int tries, besttry;
		local float BestDist, newdist;
		local int startYaw;
		local Actor ViewActor;

		ViewRotation = Rotation;
		ViewRotation.Pitch = 56000;
		tries = 0;
		besttry = 0;
		BestDist = 0.0000000;
		startYaw = ViewRotation.Yaw;
		tries = 0;
		J0x4B:

		// End:0xE5 [Loop If]
		if(tries < 16)
		{
			cameraLoc = ViewTarget.Location;
			SetRotation(ViewRotation);
			PlayerCalcView(ViewActor, cameraLoc, cameraRot);
			newdist = VSize(cameraLoc - ViewTarget.Location);
			// End:0xCA
			if(newdist > BestDist)
			{
				BestDist = newdist;
				besttry = tries;
			}
			ViewRotation.Yaw += 4096;
			tries++;
			// [Loop Continue]
			goto J0x4B;
		}
		ViewRotation.Yaw = startYaw + (besttry * 4096);
		SetRotation(ViewRotation);
		//return;		
	}

	function Timer()
	{
		bFrozen = false;
		//return;		
	}

	function LongClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase, float NewFloorX, float NewFloorY, float NewFloorZ)
	{
		//return;		
	}

	function BeginState()
	{
		local Pawn P;

		EndZoom();
		StopForceFeedback();
		CameraDist = default.CameraDist;
		FovAngle = DesiredFOV;
		bFire = 0;
		bAltFire = 0;
		// End:0xF2
		if(Pawn != none)
		{
			// End:0x5C
			if(Vehicle(Pawn) != none)
			{
				Pawn.StopWeaponFiring();
			}
			Pawn.TurnOff();
			Pawn.bSpecialHUD = false;
			Pawn.SimAnim.AnimRate = 0;
			// End:0xF2
			if(Pawn.Weapon != none)
			{
				Pawn.Weapon.StopFire(0);
				Pawn.Weapon.StopFire(1);
				Pawn.Weapon.bEndOfRound = true;
			}
		}
		bFrozen = true;
		// End:0x113
		if(!bFixedCamera)
		{
			FindGoodView();
			bBehindView = true;
		}
		SetTimer(5.0000000, false);
		// End:0x166
		foreach DynamicActors(Class'Engine.Pawn', P)
		{
			// End:0x156
			if(int(P.Role) == int(ROLE_Authority))
			{
				P.RemoteRole = ROLE_DumbProxy;
			}
			P.TurnOff();			
		}		
		//return;		
	}
Begin:

	stop;				
}

state RoundEnded
{
	ignores Suicide, TakeDamage, KilledBy;

	function ServerReStartPlayer()
	{
		//return;		
	}

	function bool IsSpectating()
	{
		return true;
		//return;		
	}

	exec function Use()
	{
		//return;		
	}

	exec function SwitchWeapon(byte t)
	{
		//return;		
	}

	exec function ThrowWeapon()
	{
		//return;		
	}

	exec function Fire(optional float F)
	{
		//return;		
	}

	exec function AltFire(optional float F)
	{
		//return;		
	}

	function Possess(Pawn aPawn)
	{
		global.Possess(aPawn);
		// End:0x25
		if(Pawn != none)
		{
			Pawn.TurnOff();
		}
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Vector X, Y, Z;
		local Rotator ViewRotation;

		GetAxes(Rotation, X, Y, Z);
		// End:0xA8
		if(!bFixedCamera)
		{
			ViewRotation = Rotation;
			ViewRotation.Yaw += int((32.0000000 * DeltaTime) * aTurn);
			ViewRotation.Pitch += int((32.0000000 * DeltaTime) * aLookUp);
			// End:0x9D
			if(Pawn != none)
			{
				ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
			}
			SetRotation(ViewRotation);			
		}
		else
		{
			// End:0xC4
			if(ViewTarget != none)
			{
				SetRotation(ViewTarget.Rotation);
			}
		}
		ViewShake(DeltaTime);
		ViewFlash(DeltaTime);
		// End:0x114
		if(int(Role) < int(ROLE_Authority))
		{
			ReplicateMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));			
		}
		else
		{
			ProcessMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));
		}
		bPressedJump = false;
		//return;		
	}

	function ServerMove(float TimeStamp, Vector InAccel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
	{
		global.ServerMove(TimeStamp, InAccel, ClientLoc, NewbRun, NewbDuck, NewbJumpStatus, NewbDoubleJump, DoubleClickMove, ClientRoll, ((32767 & (Rotation.Pitch / 2)) * 32768) + (32767 & (Rotation.Yaw / 2)));
		//return;		
	}

	function FindGoodView()
	{
		local Vector cameraLoc;
		local Rotator cameraRot, ViewRotation;
		local int tries, besttry;
		local float BestDist, newdist;
		local int startYaw;
		local Actor ViewActor;

		ViewRotation = Rotation;
		ViewRotation.Pitch = 56000;
		tries = 0;
		besttry = 0;
		BestDist = 0.0000000;
		startYaw = ViewRotation.Yaw;
		tries = 0;
		J0x4B:

		// End:0xE5 [Loop If]
		if(tries < 16)
		{
			cameraLoc = ViewTarget.Location;
			SetRotation(ViewRotation);
			PlayerCalcView(ViewActor, cameraLoc, cameraRot);
			newdist = VSize(cameraLoc - ViewTarget.Location);
			// End:0xCA
			if(newdist > BestDist)
			{
				BestDist = newdist;
				besttry = tries;
			}
			ViewRotation.Yaw += 4096;
			tries++;
			// [Loop Continue]
			goto J0x4B;
		}
		ViewRotation.Yaw = startYaw + (besttry * 4096);
		SetRotation(ViewRotation);
		//return;		
	}

	function Timer()
	{
		bFrozen = false;
		//return;		
	}

	function LongClientAdjustPosition(float TimeStamp, name NewState, Actor.EPhysics newPhysics, float NewLocX, float NewLocY, float NewLocZ, float NewVelX, float NewVelY, float NewVelZ, Actor NewBase, float NewFloorX, float NewFloorY, float NewFloorZ)
	{
		// End:0x16
		if(NewState == 'PlayerWaiting')
		{
			GotoState(NewState);
		}
		//return;		
	}

	function BeginState()
	{
		local Pawn P;

		EndZoom();
		CameraDist = default.CameraDist;
		FovAngle = DesiredFOV;
		bFire = 0;
		bAltFire = 0;
		// End:0xEC
		if(Pawn != none)
		{
			// End:0x56
			if(Vehicle(Pawn) != none)
			{
				Pawn.StopWeaponFiring();
			}
			Pawn.TurnOff();
			Pawn.bSpecialHUD = false;
			Pawn.SimAnim.AnimRate = 0;
			// End:0xEC
			if(Pawn.Weapon != none)
			{
				Pawn.Weapon.StopFire(0);
				Pawn.Weapon.StopFire(1);
				Pawn.Weapon.bEndOfRound = true;
			}
		}
		bFrozen = true;
		bBehindView = true;
		// End:0x10D
		if(!bFixedCamera)
		{
			FindGoodView();
		}
		SetTimer(5.0000000, false);
		// End:0x160
		foreach DynamicActors(Class'Engine.Pawn', P)
		{
			// End:0x150
			if(int(P.Role) == int(ROLE_Authority))
			{
				P.RemoteRole = ROLE_DumbProxy;
			}
			P.TurnOff();			
		}		
		StopForceFeedback();
		//return;		
	}

	function CalcBehindView(out Vector CameraLocation, out Rotator CameraRotation, float Dist)
	{
		local Vector View;
		local float ViewDist, RealDist;
		local Vector globalX, globalY, globalZ, localX, localY, localZ,
			HitLocation, HitNormal;

		local Actor HitActor;

		CameraRotation = Rotation;
		CameraRotation.Roll = 0;
		CameraLocation.Z += float(12);
		CameraRotation += CameraDeltaRotation;
		View = vect(1.0000000, 0.0000000, 0.0000000) >> CameraRotation;
		RealDist = Dist;
		Dist += CameraDeltaRad;
		HitActor = Trace(HitLocation, HitNormal, CameraLocation - (Dist * Vector(CameraRotation)), CameraLocation, false, vect(10.0000000, 10.0000000, 10.0000000));
		// End:0xE7
		if((HitActor != none) && !HitActor.IsA('BlockingVolume'))
		{
			ViewDist = FMin((CameraLocation - HitLocation) Dot View, Dist);			
		}
		else
		{
			ViewDist = Dist;
		}
		// End:0x169
		if((!bBlockCloseCamera || !bValidBehindCamera) || ViewDist > (float(10) + FMax(ViewTarget.CollisionRadius, ViewTarget.CollisionHeight)))
		{
			bValidBehindCamera = true;
			OldCameraLoc = CameraLocation - (ViewDist * View);
			OldCameraRot = CameraRotation;			
		}
		else
		{
			SetRotation(OldCameraRot);
		}
		CameraLocation = OldCameraLoc;
		CameraRotation = OldCameraRot;
		GetAxes(CameraSwivel, globalX, globalY, globalZ);
		localX = globalX >> CameraRotation;
		localY = globalY >> CameraRotation;
		localZ = globalZ >> CameraRotation;
		CameraRotation = OrthoRotation(localX, localY, localZ);
		//return;		
	}
Begin:

	stop;				
}

state Dead
{
	ignores PrevWeapon, NextWeapon, SwitchWeapon, KilledBy;

	exec function ThrowWeapon()
	{
		//return;		
	}

	function bool IsDead()
	{
		return true;
		//return;		
	}

	function ServerReStartPlayer()
	{
		// End:0x20
		if(!Level.Game.PlayerCanRestart(self))
		{
			return;
		}
		super.ServerReStartPlayer();
		//return;		
	}

	exec function Fire(optional float F)
	{
		// End:0x33
		if(bFrozen)
		{
			// End:0x31
			if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
			{
				bFrozen = false;
			}
			return;
		}
		LoadPlayers();
		// End:0x54
		if(bMenuBeforeRespawn)
		{
			bMenuBeforeRespawn = false;
			ShowMidGameMenu(false);			
		}
		else
		{
			ServerReStartPlayer();
		}
		//return;		
	}

	exec function AltFire(optional float F)
	{
		Fire(F);
		//return;		
	}

	exec function Use()
	{
		// End:0x33
		if(bFrozen)
		{
			// End:0x31
			if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
			{
				bFrozen = false;
			}
			return;
		}
		// End:0x60
		if(Level.Game != none)
		{
			Level.Game.DeadUse(self);
		}
		//return;		
	}

	function ServerMove(float TimeStamp, Vector Accel, Vector ClientLoc, bool NewbRun, bool NewbDuck, bool NewbJumpStatus, bool NewbDoubleJump, Actor.EDoubleClickDir DoubleClickMove, byte ClientRoll, int View, optional byte OldTimeDelta, optional int OldAccel)
	{
		global.ServerMove(TimeStamp, Accel, ClientLoc, false, false, false, false, DoubleClickMove, ClientRoll, View);
		//return;		
	}

	function PlayerMove(float DeltaTime)
	{
		local Vector X, Y, Z;
		local Rotator ViewRotation;

		// End:0xFB
		if(!bFrozen)
		{
			// End:0x27
			if(bPressedJump)
			{
				Fire(0.0000000);
				bPressedJump = false;
			}
			GetAxes(Rotation, X, Y, Z);
			ViewRotation = Rotation;
			ViewRotation.Yaw += int((32.0000000 * DeltaTime) * aTurn);
			ViewRotation.Pitch += int((32.0000000 * DeltaTime) * aLookUp);
			// End:0xB9
			if(Pawn != none)
			{
				ViewRotation.Pitch = Pawn.LimitPitch(ViewRotation.Pitch);
			}
			SetRotation(ViewRotation);
			// End:0xF8
			if(int(Role) < int(ROLE_Authority))
			{
				ReplicateMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));
			}			
		}
		else
		{
			// End:0x123
			if((TimerRate <= 0.0000000) || TimerRate > 1.0000000)
			{
				bFrozen = false;
			}
		}
		ViewShake(DeltaTime);
		ViewFlash(DeltaTime);
		//return;		
	}

	function FindGoodView()
	{
		local Vector cameraLoc;
		local Rotator cameraRot, ViewRotation;
		local int tries, besttry;
		local float BestDist, newdist;
		local int startYaw;
		local Actor ViewActor;

		ViewRotation = Rotation;
		ViewRotation.Pitch = 56000;
		tries = 0;
		besttry = 0;
		BestDist = 0.0000000;
		startYaw = ViewRotation.Yaw;
		tries = 0;
		J0x4B:

		// End:0xE5 [Loop If]
		if(tries < 16)
		{
			cameraLoc = ViewTarget.Location;
			SetRotation(ViewRotation);
			PlayerCalcView(ViewActor, cameraLoc, cameraRot);
			newdist = VSize(cameraLoc - ViewTarget.Location);
			// End:0xCA
			if(newdist > BestDist)
			{
				BestDist = newdist;
				besttry = tries;
			}
			ViewRotation.Yaw += 4096;
			tries++;
			// [Loop Continue]
			goto J0x4B;
		}
		ViewRotation.Yaw = startYaw + (besttry * 4096);
		SetRotation(ViewRotation);
		//return;		
	}

	function Timer()
	{
		// End:0x0D
		if(!bFrozen)
		{
			return;
		}
		bFrozen = false;
		bPressedJump = false;
		//return;		
	}

	function BeginState()
	{
		local Actor A;

		// End:0x47
		if((Pawn != none) && (Pawn.Controller == self) || Pawn.Controller == none)
		{
			Pawn.Controller = none;
		}
		EndZoom();
		CameraDist = default.CameraDist;
		FovAngle = DesiredFOV;
		Pawn = none;
		Enemy = none;
		bBehindView = true;
		bFrozen = true;
		bJumpStatus = false;
		bPressedJump = false;
		bBlockCloseCamera = true;
		bValidBehindCamera = false;
		bFreeCamera = false;
		// End:0xDB
		if(Viewport(Player) != none)
		{
			// End:0xDA
			foreach DynamicActors(Class'Engine.Actor', A)
			{
				A.NotifyLocalPlayerDead(self);				
			}			
		}
		FindGoodView();
		SetTimer(1.0000000, false);
		StopForceFeedback();
		ClientPlayForceFeedback("Damage");
		CleanOutSavedMoves();
		//return;		
	}

	function EndState()
	{
		StopForceFeedback();
		bBlockCloseCamera = false;
		CleanOutSavedMoves();
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
		// End:0x56
		if(!PlayerReplicationInfo.bOutOfLives)
		{
			bBehindView = false;
		}
		bPressedJump = false;
		// End:0x7A
		if(myHUD != none)
		{
			myHUD.bShowScoreBoard = false;
		}
		StopViewShaking();
		//return;		
	}
Begin:

	Sleep(3.0000000);
	// End:0x24
	if(myHUD != none)
	{
		myHUD.bShowScoreBoard = true;
	}
	stop;				
}

defaultproperties
{
	bAlwaysMouseLook=true
	bZeroRoll=true
	bNoTextToSpeechVoiceMessages=true
	bDynamicNetSpeed=true
	bSmallWeapons=true
	bWeaponViewShake=true
	bLandingShake=true
	bEnablePickupForceFeedback=true
	bEnableWeaponForceFeedback=true
	bEnableDamageForceFeedback=true
	bEnableGUIForceFeedback=true
	bForceFeedbackSupported=true
	bVoiceChatEnabled=true
	bEnableInitialChatRoom=true
	FOVBias=1.0000000
	AutoJoinMask=5
	AnnouncerLevel=2
	AnnouncerVolume=4
	TextToSpeechVoiceVolume=1.0000000
	MaxResponseTime=0.1250000
	VehicleCheckRadius=700.0000000
	OrthoZoom=40000.0000000
	CameraDist=9.0000000
	CameraDistRange=(Min=3.0000000,Max=40.0000000)
	DesiredFOV=90.0000000
	DefaultFOV=90.0000000
	FlashScale=(X=1.0000000,Y=1.0000000,Z=1.0000000)
	ScreenFlashScaling=1.0000000
	ProgressTimeOut=8.0000000
	QuickSaveString="Quick Saving"
	NoPauseMessage="Game is not pauseable"
	ViewingFrom="Now viewing from"
	OwnCamera="Now viewing from own camera"
	LocalMessageClass=Class'Engine.LocalMessage'
	ChatRoomMessageClass=Class'Engine.ChatRoomMessage'
	EnemyTurnSpeed=45000
	CheatClass=Class'Engine.CheatManager'
	InputClass=Class'Engine.PlayerInput'
	PlayerChatType="Engine.PlayerChatManager"
	TeamBeaconMaxDist=6000.0000000
	TeamBeaconPlayerInfoMaxDist=1800.0000000
	TeamBeaconTeamColors[0]=(R=180,G=0,B=0,A=255)
	TeamBeaconTeamColors[1]=(R=80,G=80,B=200,A=255)
	TeamBeaconCustomColor=(R=255,G=255,B=0,A=255)
	SpectateSpeed=600.0000000
	DynamicPingThreshold=400.0000000
	MidGameMenuClass="GUI2K4.UT2K4DisconnectOptionPage"
	AdminMenuClass="GUI2K4.RemoteAdmin"
	ChatPasswordMenuClass="GUI2K4.UT2K4ChatPassword"
	VoiceChatCodec="CODEC_48NB"
	VoiceChatLANCodec="CODEC_96WB"
	LastSpeedHackLog=-100.0000000
	Handedness=1.0000000
	bIsPlayer=true
	bCanOpenDoors=true
	bCanDoSpecial=true
	NetPriority=3.0000000
	bTravel=true
}
