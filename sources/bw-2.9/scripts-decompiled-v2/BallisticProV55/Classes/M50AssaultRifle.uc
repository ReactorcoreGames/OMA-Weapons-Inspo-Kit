class M50AssaultRifle extends BallisticWeapon
	config(BallisticProV55);

var() name GrenadeLoadAnim;
var M50Camera Camera;
var() ScriptedTexture CamTex;
var() Sound CamGrabSound;
var() Material LCDCamOnTex;
var() FullSound CamInSound;
var() FullSound CamOutSound;
var() name CamUpAnim;
var() name CamDownAnim;
var() float CamUpdateRate;
var() bool bHasGrenadeLauncher;
var() bool bHasCamera;
var Actor GLIndicator;
var() Sound GrenOpenSound;
var() Sound GrenLoadSound;
var() Sound GrenCloseSound;
var() Sound BoltReleaseSound;
var() bool bHasSilencer;
var() bool bHasLAM;
var byte GearStatus;
var bool bLaserOn;
var bool bOldLaserOn;
var LaserActor Laser;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var Projector FlashLightProj;
var Emitter FlashLightEmitter;
var bool bLightsOn;
var bool bFirstDraw;
var Vector TorchOffset;
var() Sound TorchOnSound;
var() Sound TorchOffSound;

replication
{
	// Pos:0x000
	unreliable if(int(Role) == int(ROLE_Authority))
		ClientGrenadePickedUp;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerFlashLight, ServerSwitchLaser;

	// Pos:0x01A
	reliable if(int(Role) == int(ROLE_Authority))
		ClientCamStart, bLaserOn;

	// Pos:0x027
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		Camera;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasGrenadeLauncher = true;
	bHasCamera = true;
	bHasLAM = false;
	bHasSilencer = false;
	// End:0x7D
	if(InStr(WeaponParams.LayoutTags, "no_grenade") != -1)
	{
		bHasGrenadeLauncher = false;
		bHasCamera = false;
		bCockOnEmpty = false;
		MeleeFireClass = none;
		SightFXClass = none;
	}
	// End:0xA4
	if(InStr(WeaponParams.LayoutTags, "lam") != -1)
	{
		bHasLAM = true;
	}
	// End:0xD2
	if(InStr(WeaponParams.LayoutTags, "suppressed") != -1)
	{
		bHasSilencer = true;
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x45
	if(bLaserOn != bOldLaserOn)
	{
		OnLaserSwitched();
		bOldLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

simulated function OnAimParamsChanged()
{
	super.OnAimParamsChanged();
	// End:0x15
	if(bHasSilencer)
	{
		ApplySuppressorAim();
	}
	// End:0x24
	if(bLaserOn)
	{
		ApplyLaserAim();
	}
	//return;	
}

simulated function ApplySuppressorAim()
{
	AimComponent.AimSpread.Min *= 1.2000000;
	AimComponent.AimSpread.Max *= 1.2000000;
	//return;	
}

simulated function UpdateGLIndicator()
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x6C
	if(M50SecondaryFire(FireMode[1]).bLoaded)
	{
		// End:0x69
		if((GLIndicator == none) && bHasGrenadeLauncher)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GLIndicator, Class'BallisticProV55.M50GLIndicator', DrawScale, self, 'tip');
		}		
	}
	else
	{
		// End:0x8A
		if(GLIndicator != none)
		{
			GLIndicator.Destroy();
			GLIndicator = none;
		}
	}
	//return;	
}

simulated function Notify_M50GrenadeSlideUp()
{
	PlaySound(GrenOpenSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_M50GrenadeIn()
{
	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_M50GrenadeSlideDown()
{
	PlaySound(GrenCloseSound, 1, 0.5000000,, 64.0000000);
	M50SecondaryFire(FireMode[1]).bLoaded = true;
	FireMode[1].PreFireTime = FireMode[1].default.PreFireTime;
	UpdateGLIndicator();
	//return;	
}

simulated function Notify_BoltRelease()
{
	// End:0x1F
	if((int(ReloadState) == int(0)) && !bNeedCock)
	{
		return;
	}
	ReloadState = 8;
	PlaySound(BoltReleaseSound, 1, 1.0000000,, 16.0000000);
	//return;	
}

function GrenadePickedUp()
{
	// End:0x5A
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x42
		if(Instigator.Weapon == self)
		{
			LoadGrenade();			
		}
		else
		{
			M50SecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	// End:0x74
	if(!Instigator.IsLocallyControlled())
	{
		ClientGrenadePickedUp();
	}
	//return;	
}

simulated function ClientGrenadePickedUp()
{
	// End:0x56
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x3E
		if(int(ClientState) == int(4))
		{
			LoadGrenade();			
		}
		else
		{
			M50SecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	//return;	
}

simulated function bool IsGrenadeLoaded()
{
	return M50SecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super.GiveAmmo(M, WP, bJustSpawned);
	// End:0x4E
	if((Ammo[1] != none) && Ammo_M900Grenades(Ammo[1]) != none)
	{
		Ammo_M900Grenades(Ammo[1]).DaM50 = self;
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x41
	if(Anim == GrenadeLoadAnim)
	{
		ReloadState = 0;
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		IdleTweenTime = default.IdleTweenTime;
	}
	// End:0x71
	if((Anim == CamUpAnim) && Camera != none)
	{
		CameraView();		
	}
	else
	{
		super.AnimEnd(Channel);
	}
	//return;	
}

simulated function LoadGrenade()
{
	// End:0x33
	if((Ammo[1].AmmoAmount < 1) || M50SecondaryFire(FireMode[1]).bLoaded)
	{
		return;
	}
	// End:0x61
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.1000000,, 0);
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x0B
	if(bPreventReload)
	{
		return;
	}
	// End:0x1D
	if(int(ReloadState) != int(0))
	{
		return;
	}
	GetAnimParams(Channel, seq, frame, Rate);
	// End:0x48
	if(seq == GrenadeLoadAnim)
	{
		return;
	}
	// End:0xA8
	if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xA6
		if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
		{
			LoadGrenade();
			ClientStartReload(1);
		}
		return;
	}
	super.ServerStartReload();
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x7D
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x72
		if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
		{
			// End:0x6F
			if(((AmmoAmount(1)) > 0) && !IsReloadingGrenade())
			{
				LoadGrenade();
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x14
	if(Mode == 1)
	{
		return FireCount < 1;
	}
	return super.CheckWeaponMode(Mode);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x53
	if(bHasCamera)
	{
		// End:0x45
		if((Camera != none) && PlayerController(Instigator.Controller).ViewTarget == Camera)
		{
			SwitchView();			
		}
		else
		{
			ServerWeaponSpecial(i);
		}		
	}
	else
	{
		// End:0x14A
		if(bHasLAM)
		{
			GearStatus++;
			// End:0x79
			if(int(GearStatus) > 4)
			{
				GearStatus = 1;
			}
			// End:0x136
			if(bool(int(GearStatus) & 1))
			{
				bLightsOn = !bLightsOn;
				ServerFlashLight(bLightsOn);
				// End:0x102
				if(bLightsOn)
				{
					PlaySound(TorchOnSound,, 0.7000000,, 32.0000000);
					// End:0xE0
					if(FlashLightEmitter == none)
					{
						FlashLightEmitter = Spawn(Class'BallisticProV55.MRS138TorchEffect', self,, Location);
					}
					Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(FlashLightEmitter, DrawScale);
					StartProjector();					
				}
				else
				{
					PlaySound(TorchOffSound,, 0.7000000,, 32.0000000);
					// End:0x12D
					if(FlashLightEmitter != none)
					{
						FlashLightEmitter.Destroy();
					}
					KillProjector();
				}				
			}
			else
			{
				ServerSwitchLaser(!bLaserOn);
				PlayIdle();
			}
		}
	}
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x19
	if(Camera != none)
	{
		ClientWeaponSpecial(i);		
	}
	else
	{
		PlaceCamera();
	}
	//return;	
}

simulated function ClientWeaponSpecial(optional byte i)
{
	SwitchView();
	//return;	
}

function bool GrabCamera()
{
	// End:0x8B
	if((VSize(Camera.Location - Instigator.Location) < float(120)) && (Vector(Instigator.GetViewRotation()) Dot Normal(Camera.Location - Instigator.Location)) > 0.7000000)
	{
		PlaySound(CamGrabSound, 1, 0.5000000,, 32.0000000);
		Camera.Destroy();
		return true;
	}
	return false;
	//return;	
}

function TryUse(Pawn User)
{
	// End:0x4F
	if((Camera != none) && User.Controller == Instigator.Controller)
	{
		PlaySound(CamGrabSound, 1, 0.5000000,, 32.0000000);
		Camera.Destroy();
	}
	//return;	
}

function PlaceCamera()
{
	local Actor t;
	local Vector HitLocation, HitNormal, Start, End;

	Start = Instigator.Location + Instigator.EyePosition();
	End = Start + (Vector(Instigator.GetViewRotation()) * float(120));
	t = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x98
	if((t == none) || (Pawn(t) != none) && Vehicle(t) == none)
	{
		return;
	}
	Camera = Spawn(Class'BallisticProV55.M50Camera',,, HitLocation + (HitNormal * float(7)), Rotator(HitNormal));
	Camera.Weapon = self;
	Camera.InstigatorController = Instigator.Controller;
	CamStart(Camera);
	// End:0x106
	if(Camera == none)
	{
		return;
	}
	Camera.CamBase = Spawn(Class'BallisticProV55.M50CameraBase', self,, HitLocation, Rotator(HitNormal));
	// End:0x17E
	if(!t.bWorldGeometry)
	{
		// End:0x16D
		if(Camera.CamBase != none)
		{
			Camera.CamBase.SetBase(t);
		}
		Camera.SetBase(t);
	}
	//return;	
}

simulated event Timer()
{
	// End:0x2A
	if((int(ClientState) == int(2)) && CamUpdateRate > 0.0000000)
	{
		SetTimer(CamUpdateRate, true);
	}
	// End:0x42
	if(int(ClientState) != int(4))
	{
		super.Timer();
		return;
	}
	Level.TimeSeconds < FMin(LastRenderTime + CamUpdateRate, 0.0500000);
	// End:0x109
	if(((((Instigator.IsLocallyControlled() && bHasCamera) && Camera != none) && CamUpdateRate > 0.0000000) && !Camera.bBusted) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		CamTex.Client = self;
		// End:0x109
		if(Camera != none)
		{
			CamTex.Revision++;
		}
	}
	//return;	
}

simulated function ClientCamStart(M50Camera cam)
{
	CamStart(cam);
	//return;	
}

simulated function CamStart(M50Camera cam)
{
	// End:0x22
	if(Instigator.IsLocallyControlled())
	{
		CamTex.Client = self;
	}
	Camera = cam;
	Camera.__OnCameraDie__Delegate = CamDie;
	// End:0xA5
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x8F
		if(Camera.MyUseTrigger == none)
		{
			Camera.MyUseTrigger = Spawn(Class'BallisticProV55.M50CamTrigger', self,, Camera.Location);			
		}
		else
		{
			Camera.MyUseTrigger.SetOwner(self);
		}
	}
	// End:0x113
	if(!Camera.bBusted)
	{
		Skins[3] = LCDCamOnTex;
		// End:0xE9
		if(Instigator.IsLocallyControlled())
		{
			CamTex.Revision++;
		}
		// End:0x113
		if((CamUpdateRate > 0.0000000) && int(ClientState) == int(4))
		{
			SetTimer(CamUpdateRate, true);
		}
	}
	//return;	
}

simulated function CamDie()
{
	Skins[3] = default.Skins[3];
	//return;	
}

simulated function SwitchView()
{
	// End:0x2F
	if(PlayerController(Instigator.Controller).ViewTarget == Camera)
	{
		PlayerView();		
	}
	else
	{
		// End:0x63
		if(int(ReloadState) == int(0))
		{
			// End:0x51
			if(bScopeView)
			{
				CameraView();				
			}
			else
			{
				PlayAnim(CamUpAnim, 1.0000000, 0.1000000);
			}
		}
	}
	//return;	
}

simulated function PlayerView()
{
	PlayerController(Instigator.Controller).SetViewTarget(Instigator);
	CamTex.Client = self;
	CamTex.Revision++;
	Camera.bOwnerNoSee = false;
	Camera.LastFOV = int(PlayerController(Instigator.Controller).DesiredFOV);
	PlayerController(Instigator.Controller).DesiredFOV = PlayerController(Instigator.Controller).DefaultFOV;
	// End:0xE5
	if((int(ReloadState) == int(0)) && !bScopeView)
	{
		PlayAnim(CamDownAnim, 1.0000000,, 0);
	}
	//return;	
}

simulated function CameraView()
{
	Camera.OldRotation = Camera.Rotation;
	Camera.SwitchViewRot = PlayerController(Instigator.Controller).Rotation;
	PlayerController(Instigator.Controller).SetViewTarget(Camera);
	PlayerController(Instigator.Controller).DesiredFOV = float(Camera.LastFOV);
	Camera.bOwnerNoSee = true;
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local Rotator R, VR, OR;
	local Vector TazLoc;
	local Rotator TazRot;

	// End:0x2AF
	if((Camera != none) && PlayerController(Instigator.Controller).ViewTarget == Camera)
	{
		OR = Camera.Rotation;
		VR = Normalize(((Camera.OldRotation - Camera.StartRotation) + PlayerController(Instigator.Controller).Rotation) - Camera.SwitchViewRot);
		VR.Yaw = Clamp(VR.Yaw, -12288, 12288);
		VR.Pitch = Clamp(VR.Pitch, -12288, 12288);
		R = Camera.StartRotation + VR;
		Camera.SetRotation(R);
		// End:0x138
		if(Camera.Rotation != OR)
		{
			Camera.PlayTracking();
		}
		Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
		Canvas.Style = 5;
		Canvas.SetPos(0.0000000, 0.0000000);
		// End:0x1DB
		if(Camera.bBusted)
		{
			Canvas.DrawTile(Combiner'BW_Core_WeaponTex.M50.NoiseComb', float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 256.0000000, 256.0000000);			
		}
		else
		{
			Canvas.DrawColor.A = 48;
			Canvas.DrawTile(Texture'BW_Core_WeaponTex.M50.Noise1', float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 256.0000000, 256.0000000);
		}
		Canvas.DrawColor.A = byte(255);
		Canvas.SetPos(0.0000000, 0.0000000);
		Canvas.DrawTile(Texture'BW_Core_WeaponTex.M50.M50CamView', float(Canvas.SizeX), float(Canvas.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);		
	}
	else
	{
		super.RenderOverlays(Canvas);
		// End:0x2D2
		if(!IsInState('Lowered'))
		{
			DrawLaserSight(Canvas);
		}
		// End:0x347
		if(bLightsOn)
		{
			TazLoc = GetBoneCoords('Laser').Origin;
			TazRot = GetBoneRotation('Laser');
			// End:0x347
			if(FlashLightEmitter != none)
			{
				FlashLightEmitter.SetLocation(TazLoc);
				FlashLightEmitter.SetRotation(TazRot);
				Canvas.DrawActor(FlashLightEmitter, false, false, DisplayFOV);
			}
		}
	}
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	// End:0x89
	if(Camera != none)
	{
		Camera.bOwnerNoSee = true;
		Tex.DrawPortal(0, 0, Tex.USize, Tex.VSize, Camera, Camera.Location, Camera.Rotation, Camera.LastFOV);
		Camera.bOwnerNoSee = false;
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local M50Camera C;

	super.BringUp(PrevWeapon);
	// End:0x4C
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor');
	}
	// End:0x85
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xD4
	if(((Instigator != none) && AIController(Instigator.Controller) != none) && bHasLAM)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
		ServerFlashLight(FRand() > 0.5000000);
	}
	switch(Class'BallisticProV55.Mut_Ballistic'.default.CamUpdateRate)
	{
		// End:0xF8
		case "1":
			CamUpdateRate = 0.5000000;
			// End:0x145
			break;
		// End:0x10C
		case "2":
			CamUpdateRate = 0.2000000;
			// End:0x145
			break;
		// End:0x120
		case "3":
			CamUpdateRate = 0.1000000;
			// End:0x145
			break;
		// End:0x134
		case "4":
			CamUpdateRate = 0.0666000;
			// End:0x145
			break;
		// End:0xFFFF
		default:
			CamUpdateRate = 0.0000000;
			// End:0x145
			break;
			break;
	}
	// End:0x188
	if(Instigator.IsLocallyControlled())
	{
		UpdateGLIndicator();
		CamTex.Client = self;
		// End:0x188
		if(Camera != none)
		{
			CamTex.Revision++;
		}
	}
	// End:0x220
	if((bHasCamera && Camera == none) && int(Role) == int(ROLE_Authority))
	{
		// End:0x21F
		foreach DynamicActors(Class'BallisticProV55.M50Camera', C)
		{
			// End:0x21E
			if(C.InstigatorController == Instigator.Controller)
			{
				C.Weapon = self;
				CamStart(C);
				// End:0x21B
				if(!Instigator.IsLocallyControlled())
				{
					ClientCamStart(C);
				}				
				return;
			}			
		}		
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0xA6
	if(super.PutDown())
	{
		// End:0x27
		if(GLIndicator != none)
		{
			GLIndicator.Destroy();
			GLIndicator = none;
		}
		// End:0x60
		if((Camera != none) && PlayerController(Instigator.Controller).ViewTarget == Camera)
		{
			PlayerView();
		}
		KillLaserDot();
		// End:0x87
		if(ThirdPersonActor != none)
		{
			M50Attachment(ThirdPersonActor).bLaserOn = false;
		}
		KillProjector();
		// End:0xA4
		if(FlashLightEmitter != none)
		{
			FlashLightEmitter.Destroy();
		}
		return true;
	}
	return false;
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GLIndicator != none)
	{
		GLIndicator.Destroy();
	}
	CamTex.Client = none;
	default.bLaserOn = false;
	// End:0x46
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x5D
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	// End:0x74
	if(FlashLightEmitter != none)
	{
		FlashLightEmitter.Destroy();
	}
	KillProjector();
	super.Destroyed();
	//return;	
}

simulated function bool AllowWeapPrevUI()
{
	// End:0x35
	if((Camera != none) && PlayerController(Instigator.Controller).ViewTarget == Camera)
	{
		return false;
	}
	return super.AllowWeapPrevUI();
	//return;	
}

simulated function bool AllowWeapNextUI()
{
	// End:0x35
	if((Camera != none) && PlayerController(Instigator.Controller).ViewTarget == Camera)
	{
		return false;
	}
	return super.AllowWeapNextUI();
	//return;	
}

simulated function Weapon PrevWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x65
	if(((CurrentWeapon == self) && Camera != none) && PlayerController(Instigator.Controller).ViewTarget == Camera)
	{
		ChangeZoom(0.2000000);
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, CamOutSound);
		return none;		
	}
	else
	{
		return super.PrevWeapon(CurrentChoice, CurrentWeapon);
	}
	//return;	
}

simulated function Weapon NextWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x65
	if(((CurrentWeapon == self) && Camera != none) && PlayerController(Instigator.Controller).ViewTarget == Camera)
	{
		ChangeZoom(-0.2000000);
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, CamInSound);
		return none;		
	}
	else
	{
		return super.NextWeapon(CurrentChoice, CurrentWeapon);
	}
	//return;	
}

simulated function ChangeZoom(float Value)
{
	local PlayerController PC;

	// End:0x40
	if((Camera == none) || PlayerController(Instigator.Controller).ViewTarget != Camera)
	{
		super.ChangeZoom(Value);
		return;
	}
	PC = PlayerController(Instigator.Controller);
	// End:0x66
	if(PC == none)
	{
		return;
	}
	PC.ZoomLevel += Value;
	PC.ZoomLevel = FClamp(PC.ZoomLevel, 0.0000000, 0.9000000);
	PC.DesiredFOV = FClamp(90.0000000 - (PC.ZoomLevel * 88.0000000), 1.0000000, 170.0000000);
	//return;	
}

function ServerFlashLight(bool bNew)
{
	bLightsOn = bNew;
	M50Attachment(ThirdPersonActor).bLightsOn = bLightsOn;
	//return;	
}

simulated function StartProjector()
{
	// End:0x20
	if(FlashLightProj == none)
	{
		FlashLightProj = Spawn(Class'BallisticProV55.MRS138TorchProjector', self,, Location);
	}
	AttachToBone(FlashLightProj, 'Laser');
	FlashLightProj.SetRelativeLocation(TorchOffset);
	//return;	
}

simulated function KillProjector()
{
	// End:0x17
	if(FlashLightProj != none)
	{
		FlashLightProj.Destroy();
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x2A
	if(!bLightsOn || int(ClientState) != int(4))
	{
		return;
	}
	// End:0x47
	if(!Instigator.IsFirstPerson())
	{
		KillProjector();		
	}
	else
	{
		// End:0x58
		if(FlashLightProj == none)
		{
			StartProjector();
		}
	}
	//return;	
}

simulated function OnLaserSwitched()
{
	// End:0x12
	if(bLaserOn)
	{
		ApplyLaserAim();		
	}
	else
	{
		AimComponent.Recalculate();
	}
	//return;	
}

simulated function ApplyLaserAim()
{
	AimComponent.AimAdjustTime *= 0.7500000;
	AimComponent.AimSpread.Max *= 0.7500000;
	AimComponent.AimSpread.Min *= 0.7500000;
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		M50Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	OnLaserSwitched();
	// End:0x51
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	OnLaserSwitched();
	// End:0x2C
	if(bLaserOn)
	{
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);		
	}
	else
	{
		KillLaserDot();
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
	}
	PlayIdle();
	//return;	
}

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.MD24LaserDot',,, loc);
	}
	//return;	
}

simulated function KillLaserDot()
{
	// End:0x21
	if(LaserDot != none)
	{
		LaserDot.Kill();
		LaserDot = none;
	}
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal, Scale3D, loc;

	local Rotator AimDir;
	local Actor Other;

	// End:0x4F
	if(((((int(ClientState) == int(1)) || !bLaserOn) || Instigator == none) || Instigator.Controller == none) || Laser == none)
	{
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	loc = GetBoneCoords('Laser').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x143
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x165
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = Class'BCoreProV55.BUtil'.static.ConvertFOVs(Instigator.Location + Instigator.EyePosition(), Instigator.GetViewRotation(), End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x2CE
	if(((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && (FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > -0.0500000) || !FireMode[0].IsFiring() && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('Laser');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

function bool BotShouldReloadGrenade()
{
	// End:0x2A
	if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
	{
		return true;
	}
	return false;
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x5E
	if(((((AIController(Instigator.Controller) != none) && !IsGrenadeLoaded()) && (AmmoAmount(1)) > 0) && BotShouldReloadGrenade()) && !IsReloadingGrenade())
	{
		LoadGrenade();
	}
	//return;	
}

simulated function float RateSelf()
{
	// End:0x19
	if(!HasAmmo())
	{
		CurrentRating = 0.0000000;		
	}
	else
	{
		// End:0x65
		if((Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
		{
			CurrentRating = Instigator.Controller.RateWeapon(self) * 0.3000000;			
		}
		else
		{
			return super.RateSelf();
		}
	}
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result, Height, dist, VDot;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x6A
	if((((AmmoAmount(1)) < 1) || !IsGrenadeLoaded()) || !bHasGrenadeLauncher)
	{
		return 0;		
	}
	else
	{
		// End:0x78
		if(MagAmmo < 1)
		{
			return 1;
		}
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x166
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x1A6
	if((dist < float(500)) && VDot > 0.3000000)
	{
		Result -= ((float(500) - dist) / float(1000));
	}
	// End:0x20D
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x1E5
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x201
		if(VDot < float(0))
		{
			Result -= 0.2000000;			
		}
		else
		{
			Result += 0.2000000;
		}
	}
	dist = VSize((B.Enemy.Location * vect(1.0000000, 1.0000000, 0.0000000)) - (Instigator.Location * vect(1.0000000, 1.0000000, 0.0000000)));
	// End:0x288
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x29A
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

simulated function bool IsReloadingGrenade()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == GrenadeLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x61
	if(!IsGrenadeLoaded())
	{
		// End:0x41
		if(IsReloadingGrenade())
		{
			// End:0x3E
			if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
			{
				return false;
			}			
		}
		else
		{
			// End:0x61
			if(((AmmoAmount(1)) > 0) && BotShouldReloadGrenade())
			{
				LoadGrenade();
				return false;
			}
		}
	}
	return super.CanAttack(Other);
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super.GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.7500000, dist, BallisticInstantFire(bFireMode[0]).DecayRange.Min, BallisticInstantFire(bFireMode[0]).DecayRange.Max);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.0000000;
	//return;	
}

defaultproperties
{
	GrenadeLoadAnim="GrenadeReload"
	CamTex=ScriptedTexture'BW_Core_WeaponTex.M50.M50LCDTex'
	CamGrabSound=Sound'BW_Core_WeaponSound.M50.M50CamPlace'
	LCDCamOnTex=Shader'BW_Core_WeaponTex.M50.M50LCDTex_SD'
	CamInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	CamOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	CamUpAnim="CamUp"
	CamDownAnim="CamDown"
	CamUpdateRate=0.5000000
	GrenOpenSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	GrenCloseSound=Sound'BW_Core_WeaponSound.M50.M50GrenClose'
	BoltReleaseSound=Sound'BWBP_SKC_Sounds.M1911.RS04-SlideLock'
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	TorchOffset=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	TorchOnSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	TorchOffSound=Sound'BW_Core_WeaponSound.MRS38.RSS-FlashClick'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.9;80.0;0.7;0.7;0.4")
	AIReloadTime=1.0000000
	SightAnimScale=0.7500000
	ParamsClasses[0]=Class'BallisticProV55.M50WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.M50WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.M50WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.M50WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_M50'
	BigIconCoords=(X1=0,Y1=40,X2=511,Y2=235)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	SightFXClass=Class'BallisticProV55.M50SightLEDs'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=158),Color2=(R=255,G=255,B=0,A=255),StartSize1=84,StartSize2=82)
	MeleeFireClass=Class'BallisticProV55.M50MeleeFire'
	bWT_Bullet=true
	bWT_Splash=true
	bWT_Machinegun=true
	bWT_Projectile=true
	ManualLines[0]="Automatic 5.56 bullet fire. Low damage per shot with medium range, low penetration and low recoil."
	ManualLines[1]="Launches a grenade from the underslung launcher. This grenade has an arming delay and will ricochet from targets hit during this arming period, dealing minor damage. The arming delay can be used to shoot around corners."
	ManualLines[2]="A TX409-Tactical Video camera system is also included with this weapon. It allows the user to deploy a tactical camera to any surface using the Weapon Function key. To survey an area from a safe distance using the gun-mounted LCD, press Weapon Function again. Care should always be taken to deploy TX409-TV cameras in a hidden location to prevent them from being destroyed by enemies.||The M50 is effective at medium to long range."
	SightPivot=(Pitch=200,Yaw=0,Roll=0)
	SightOffset=(X=-8.0000000,Y=0.0800000,Z=2.7000000)
	CockingBringUpTime=1.2000000
	FireModeClass[0]=Class'BallisticProV55.M50PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.M50SecondaryFire'
	PutDownAnimRate=1.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="Enravion's crowning achievement, the M50 is the most extensively used weapon in the UTC military corps. The M50 is renowned for its accuracy, damage and reliability in the field. The sturdy M50 was extensively used in both wars and has helped annihilate countless Skrith, Krao and Cryon warriors. The weapon also has the advantage of launching a grenade from the attached M900, for flushing out enemies."
	EffectOffset=(X=100.0000000,Y=0.0000000,Z=7.0000000)
	Priority=41
	HudColor=(R=210,G=170,B=170,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	GroupOffset=3
	PickupClass=Class'BallisticProV55.M50Pickup'
	PlayerViewOffset=(X=6.0000000,Y=4.5000000,Z=-4.5000000)
	AttachmentClass=Class'BallisticProV55.M50Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_M50'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M50 Assault Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M50_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BW_Core_WeaponTex.M50.M50Skin1Shiney'
	Skins[2]=Shader'BW_Core_WeaponTex.M50.M50Skin2Shiney'
	Skins[3]=Combiner'BW_Core_WeaponTex.M50.NoiseComb'
	Skins[4]=Texture'BW_Core_WeaponTex.M50.M50Laser'
	Skins[5]=Texture'BW_Core_WeaponTex.M50.M50Gren'
}
