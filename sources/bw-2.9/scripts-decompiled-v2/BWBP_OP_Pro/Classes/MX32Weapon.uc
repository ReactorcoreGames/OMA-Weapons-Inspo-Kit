class MX32Weapon extends BallisticWeapon
	config(BallisticProV55);

var() name RocketsLoadAnim;
var() Sound GrenOpenSound;
var() Sound GrenLoadSound;
var() Sound GrenCloseSound;
var bool bLaserOn;
var() Sound LaserOnSound;
var() Sound LaserOffSound;
var Emitter LaserDot;
var LaserActor_G5Painter Laser;

replication
{
	// Pos:0x00D
	unreliable if(int(Role) == int(ROLE_Authority))
		ClientRocketsPickedUp;

	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLaserOn;
}

simulated event PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x3F
	if(bLaserOn != default.bLaserOn)
	{
		default.bLaserOn = bLaserOn;
		ClientSwitchLaser();
	}
	super(Weapon).PostNetReceive();
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x0B
	if(bServerReloading)
	{
		return;
	}
	ServerSwitchLaser(!bLaserOn);
	//return;	
}

function ServerSwitchLaser(bool bNewLaserOn)
{
	bLaserOn = bNewLaserOn;
	// End:0x33
	if(ThirdPersonActor != none)
	{
		MX32Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
	}
	MX32SecondaryFire(FireMode[1]).AdjustLaserParams(bLaserOn);
	// End:0x89
	if(bLaserOn)
	{
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = false;
		CurrentWeaponMode = 1;
		ServerSwitchWeaponMode(1);		
	}
	else
	{
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		CurrentWeaponMode = 0;
		ServerSwitchWeaponMode(0);
	}
	// End:0xCF
	if(Instigator.IsLocallyControlled())
	{
		ClientSwitchLaser();
	}
	//return;	
}

simulated function ClientSwitchLaser()
{
	// End:0x44
	if(bLaserOn)
	{
		WeaponModes[0].bUnavailable = true;
		WeaponModes[1].bUnavailable = false;
		SpawnLaserDot();
		PlaySound(LaserOnSound,, 0.7000000,, 32.0000000);		
	}
	else
	{
		WeaponModes[0].bUnavailable = false;
		WeaponModes[1].bUnavailable = true;
		KillLaserDot();
		PlaySound(LaserOffSound,, 0.7000000,, 32.0000000);
	}
	MX32SecondaryFire(FireMode[1]).AdjustLaserParams(bLaserOn);
	PlayIdle();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x4C
	if(((Instigator != none) && Laser == none) && PlayerController(Instigator.Controller) != none)
	{
		Laser = Spawn(Class'BallisticProV55.LaserActor_G5Painter');
	}
	// End:0x85
	if(((Instigator != none) && LaserDot == none) && PlayerController(Instigator.Controller) != none)
	{
		SpawnLaserDot();
	}
	// End:0xBA
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		ServerSwitchLaser(FRand() > 0.5000000);
	}
	// End:0xE0
	if(ThirdPersonActor != none)
	{
		MX32Attachment(ThirdPersonActor).bLaserOn = bLaserOn;
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

simulated function SpawnLaserDot(optional Vector loc)
{
	// End:0x20
	if(LaserDot == none)
	{
		LaserDot = Spawn(Class'BallisticProV55.G5LaserDot',,, loc);
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x32
	if(super.PutDown())
	{
		KillLaserDot();
		// End:0x30
		if(ThirdPersonActor != none)
		{
			MX32Attachment(ThirdPersonActor).bLaserOn = false;
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	default.bLaserOn = false;
	// End:0x1F
	if(Laser != none)
	{
		Laser.Destroy();
	}
	// End:0x36
	if(LaserDot != none)
	{
		LaserDot.Destroy();
	}
	super.Destroyed();
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
	loc = GetBoneCoords('tip2').Origin;
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xE7
	if(Other == none)
	{
		HitLocation = End;
	}
	// End:0x152
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		SpawnLaserDot(HitLocation);		
	}
	else
	{
		KillLaserDot();
	}
	// End:0x174
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
	Laser.SetLocation(loc);
	HitLocation = Class'BCoreProV55.BUtil'.static.ConvertFOVs(Instigator.Location + Instigator.EyePosition(), Instigator.GetViewRotation(), End, Instigator.Controller.FovAngle, DisplayFOV, 400.0000000);
	// End:0x292
	if((((int(ReloadState) == int(0)) && int(ClientState) == int(4)) && !IsInState('DualAction')) && (Level.TimeSeconds - FireMode[0].NextFireTime) > 0.2000000)
	{
		Laser.SetRotation(Rotator(HitLocation - loc));		
	}
	else
	{
		AimDir = GetBoneRotation('tip2');
		Laser.SetRotation(AimDir);
	}
	Scale3D.X = VSize(HitLocation - loc) / float(128);
	Scale3D.Y = 1.0000000;
	Scale3D.Z = 1.0000000;
	Laser.SetDrawScale3D(Scale3D);
	Canvas.DrawActor(Laser, false, false, DisplayFOV);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	super.RenderOverlays(Canvas);
	// End:0x23
	if(!IsInState('Lowered'))
	{
		DrawLaserSight(Canvas);
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
	// End:0x68
	if(Ammo[1].AmmoAmount < MX32SecondaryFire(FireMode[1]).default.Rockets)
	{
		MX32SecondaryFire(FireMode[1]).Rockets = Ammo[1].AmmoAmount;		
	}
	else
	{
		MX32SecondaryFire(FireMode[1]).Rockets = MX32SecondaryFire(FireMode[1]).default.Rockets;
	}
	//return;	
}

function RocketsPickedUp()
{
	// End:0xC0
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x42
		if(Instigator.Weapon == self)
		{
			LoadRockets();			
		}
		else
		{
			// End:0x95
			if(Ammo[1].AmmoAmount < MX32SecondaryFire(FireMode[1]).default.Rockets)
			{
				MX32SecondaryFire(FireMode[1]).Rockets = Ammo[1].AmmoAmount;				
			}
			else
			{
				MX32SecondaryFire(FireMode[1]).Rockets = MX32SecondaryFire(FireMode[1]).default.Rockets;
			}
		}
	}
	// End:0xDA
	if(!Instigator.IsLocallyControlled())
	{
		ClientRocketsPickedUp();
	}
	//return;	
}

simulated function ClientRocketsPickedUp()
{
	// End:0xBC
	if(Ammo[1].AmmoAmount < Ammo[1].MaxAmmo)
	{
		// End:0x3E
		if(int(ClientState) == int(4))
		{
			LoadRockets();			
		}
		else
		{
			// End:0x91
			if(Ammo[1].AmmoAmount < MX32SecondaryFire(FireMode[1]).default.Rockets)
			{
				MX32SecondaryFire(FireMode[1]).Rockets = Ammo[1].AmmoAmount;				
			}
			else
			{
				MX32SecondaryFire(FireMode[1]).Rockets = MX32SecondaryFire(FireMode[1]).default.Rockets;
			}
		}
	}
	//return;	
}

simulated function bool AreRocketsLoaded()
{
	// End:0x20
	if(MX32SecondaryFire(FireMode[1]).Rockets > 0)
	{
		return true;		
	}
	else
	{
		return false;
	}
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super.GiveAmmo(M, WP, bJustSpawned);
	// End:0x4E
	if((Ammo[1] != none) && Ammo_MX32Rockets(Ammo[1]) != none)
	{
		Ammo_MX32Rockets(Ammo[1]).Gun = self;
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x41
	if(Anim == RocketsLoadAnim)
	{
		ReloadState = 0;
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		IdleTweenTime = default.IdleTweenTime;
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function LoadRockets()
{
	// End:0x5D
	if((Ammo[1].AmmoAmount > MX32SecondaryFire(FireMode[1]).default.Rockets) && MX32SecondaryFire(FireMode[1]).Rockets >= MX32SecondaryFire(FireMode[1]).default.Rockets)
	{
		return;
	}
	// End:0xB5
	if((Ammo[1].AmmoAmount <= MX32SecondaryFire(FireMode[1]).default.Rockets) && MX32SecondaryFire(FireMode[1]).Rockets >= Ammo[1].AmmoAmount)
	{
		return;
	}
	// End:0xDC
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		PlayAnim(RocketsLoadAnim, 0.7500000,, 0);
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
	if(seq == RocketsLoadAnim)
	{
		return;
	}
	// End:0xA8
	if((int(i) == 1) || (MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1)
	{
		// End:0xA6
		if(((AmmoAmount(1)) > 0) && !IsReloadingRockets())
		{
			LoadRockets();
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
			if(((AmmoAmount(1)) > 0) && !IsReloadingRockets())
			{
				LoadRockets();
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
	// End:0x15
	if(Mode == 1)
	{
		return FireCount < 18;
	}
	return super.CheckWeaponMode(Mode);
	//return;	
}

function bool BotShouldReloadRockets()
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
	if(((((AIController(Instigator.Controller) != none) && !AreRocketsLoaded()) && (AmmoAmount(1)) > 0) && BotShouldReloadRockets()) && !IsReloadingRockets())
	{
		LoadRockets();
	}
	//return;	
}

function Vector GetRocketDir()
{
	local Vector Start, End, HitLocation, HitNormal, AimDir;

	local Actor Other;

	AimDir = BallisticFire(FireMode[0]).GetFireDir(Start);
	End = Start + (Normal(AimDir) * float(10000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	HitLocation = End;
	return HitLocation;
	//return;	
}

simulated function DrawWeaponInfo(Canvas C)
{
	NewDrawWeaponInfo(C, 0.7050000 * C.ClipY);
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local int i, Count;
	local float ScaleFactor2, ScaleFactor, XL, YL, YL2, SprintFactor;

	local string Temp;

	super.NewDrawWeaponInfo(C, YPos);
	DrawCrosshairs(C);
	// End:0x26
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	// End:0x15E
	if(!bNoMag)
	{
		Temp = GetHUDAmmoText(0);
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(20) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x23C
	if((Ammo[1] != none) && Ammo[1] != Ammo[0])
	{
		Temp = GetHUDAmmoText(1);
		C.TextSize(Temp, XL, YL);
		C.CurX = (C.ClipX - ((float(160) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = (C.ClipY - ((float(120) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL;
		C.DrawText(Temp, false);
	}
	// End:0x38A
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.TextSize(WeaponModes[int(CurrentWeaponMode)].ModeName, XL, YL2);
		C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
		C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
		C.DrawText(WeaponModes[int(CurrentWeaponMode)].ModeName, false);
	}
	// End:0x520
	if((SprintControl != none) && SprintControl.Stamina < SprintControl.MaxStamina)
	{
		SprintFactor = SprintControl.Stamina / SprintControl.MaxStamina;
		C.CurX = C.OrgX + ((float(5) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.CurY = C.ClipY - ((float(330) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		// End:0x47C
		if(SprintFactor < 0.2000000)
		{
			C.SetDrawColor(byte(255), 0, 0);			
		}
		else
		{
			// End:0x4A5
			if(SprintFactor < 0.5000000)
			{
				C.SetDrawColor(64, 128, byte(255));				
			}
			else
			{
				C.SetDrawColor(0, 0, byte(255));
			}
		}
		C.DrawTile(Texture'Engine.MenuWhite', ((200.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale) * SprintFactor, (30.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale, 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	}
	ScaleFactor2 = (85.0000000 * C.ClipX) / float(3200);
	C.Style = 5;
	C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Count = Min(18, MX32SecondaryFire(FireMode[1]).Rockets);
	i = 0;
	J0x598:

	// End:0x644 [Loop If]
	if(i < Count)
	{
		C.SetPos(C.ClipX - (((0.2200000 * float(i)) + float(1)) * ScaleFactor2), C.ClipY - ((float(100) * ScaleFactor) * Class'Engine.HUD'.default.HudScale));
		C.DrawTile(Texture'BWBP_SKC_Tex.LS14.LS14-RocketIcon', ScaleFactor2, ScaleFactor2, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
		i++;
		// [Loop Continue]
		goto J0x598;
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
	// End:0x5D
	if(((AmmoAmount(1)) < 1) || !AreRocketsLoaded())
	{
		return 0;		
	}
	else
	{
		// End:0x6B
		if(MagAmmo < 1)
		{
			return 1;
		}
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	VDot = Normal(B.Enemy.Velocity) Dot Normal(Instigator.Location - B.Enemy.Location);
	Result = FRand() - 0.3000000;
	// End:0x159
	if(dist > float(800))
	{
		Result -= ((dist - float(800)) / float(2000));
	}
	// End:0x199
	if((dist < float(500)) && VDot > 0.3000000)
	{
		Result -= ((float(500) - dist) / float(1000));
	}
	// End:0x200
	if(VSize(B.Enemy.Velocity) > float(50))
	{
		// End:0x1D8
		if(Abs(VDot) > 0.8000000)
		{
			Result += 0.1000000;
		}
		// End:0x1F4
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
	// End:0x27B
	if(Height < float(-100))
	{
		Result += Abs((Height / float(2)) / dist);
	}
	// End:0x28D
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

simulated function bool IsReloadingRockets()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == RocketsLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x61
	if(!AreRocketsLoaded())
	{
		// End:0x41
		if(IsReloadingRockets())
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
			if(((AmmoAmount(1)) > 0) && BotShouldReloadRockets())
			{
				LoadRockets();
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
	RocketsLoadAnim="RocketReload"
	GrenOpenSound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOff'
	GrenLoadSound=Sound'BW_Core_WeaponSound.BX5.BX5-SecOn'
	GrenCloseSound=Sound'BW_Core_WeaponSound.A73.A73-PipeIn'
	LaserOnSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	LaserOffSound=Sound'BW_Core_WeaponSound.M806.M806LSight'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.9;80.0;0.7;0.7;2.0")
	AIReloadTime=1.0000000
	SightAnimScale=0.5000000
	ParamsClasses[0]=Class'BWBP_OP_Pro.MX32WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.MX32WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.MX32WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.MX32WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.MX32.BigIcon_MX32'
	BigIconCoords=(X1=0,Y1=40,X2=511,Y2=235)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Auto Rockets",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Guided Rockets",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	SightBobScale=0.3000000
	CockSound=(Sound=Sound'BWBP_OP_Sounds.MX32.MX32-Cock',Volume=1.3500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BWBP_OP_Sounds.MX32.MX32-MagHit',Volume=1.3500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_OP_Sounds.MX32.MX32-MagOut',Volume=1.3500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_OP_Sounds.MX32.MX32-MagIn',Volume=1.3500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.G5OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=255,B=255,A=255),Color2=(R=255,G=0,B=0,A=255),StartSize1=110,StartSize2=30)
	bWT_Bullet=true
	bWT_Splash=true
	bWT_Machinegun=true
	bWT_Projectile=true
	ManualLines[0]="Automatic 5.56 bullet fire. Low damage per shot with medium range, low penetration and medium recoil."
	ManualLines[1]="Fires a gas-powered rocket barrage, with heavy inaccuracy and recoil with repeated shots."
	ManualLines[2]="Activates a guiding laser, which stabilises secondary fire and directs rockets. Suitable for further distances."
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.7200000)
	MagAmmo=50
	FireModeClass[0]=Class'BWBP_OP_Pro.MX32PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.MX32SecondaryFire'
	PutDownAnimRate=1.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="In the ongoing efforts of the Anti-Krao Buster Movement, several weapons have entered the foray but nothing quite like the MX32 Rocket Machinegun.  Originally designed for geneboosted soldiers and light mech units, the MX32 is a behemoth of a weapon, able to decimate hordes of Krao with itâ€™s signature rocket barrage especially when paired with its guiding laser. Due to weight issues and lack of options when in close quarters, newer models have lighter materials and the ability to shoot low caliber bullets when things are danger close."
	Priority=41
	HudColor=(R=210,G=170,B=170,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=6
	GroupOffset=7
	PickupClass=Class'BWBP_OP_Pro.MX32Pickup'
	PlayerViewOffset=(X=10.0000000,Y=4.5000000,Z=-3.5000000)
	AttachmentClass=Class'BWBP_OP_Pro.MX32Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.MX32.SmallIcon_MX32'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=28)
	ItemName="MX-32 Rocket Machine Gun"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.MX32_FPm'
	DrawScale=0.3000000
}
