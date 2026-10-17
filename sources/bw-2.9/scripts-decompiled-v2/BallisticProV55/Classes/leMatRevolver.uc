class leMatRevolver extends BallisticHandgun
	config(BallisticProV55);

const NumShells = 9;

struct RevInfo
{
	var() name ShellName;
	var() name BulletName;
};

var() Sound ShellOutSound;
var() Sound ShellInSound;
var() Rotator CylinderRotation;
var bool bRevCocked;
var() bool bSecLoaded;
var() name SGLoadAnim;
var byte ShellIndex;
var bool bDryHeld;
var() RevInfo Shells[10];
var() byte LoadedChambers;
var Emitter LaserDot;
var bool bLaserOn;
var() bool bHasSlug;
var() bool bHasDecoy;

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasSlug = false;
	bHasDecoy = false;
	// End:0x49
	if(InStr(WeaponParams.LayoutTags, "slug") != -1)
	{
		bHasSlug = true;
	}
	// End:0x72
	if(InStr(WeaponParams.LayoutTags, "decoy") != -1)
	{
		bHasDecoy = true;
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	// End:0x28
	if(Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading)
	{
		FireMode[1].FireRate = 2.0000000;
	}
	super.PostNetBeginPlay();
	//return;	
}

simulated function bool IsReloadingShotgun()
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x27
	if(Anim == SGLoadAnim)
	{
		return true;
	}
	return false;
	//return;	
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x23
	if(Anim == SGLoadAnim)
	{
		IdleTweenTime = 0.0000000;
		PlayIdle();		
	}
	else
	{
		// End:0x66
		if(Anim == CockAnim)
		{
			bRevCocked = true;
			IdleTweenTime = 0.0000000;
			SetBoneRotation('Hammer', rot(-7472, 0, 0));
			PlayIdle();			
		}
		else
		{
			// End:0xA9
			if(Anim == 'UnCock')
			{
				bRevCocked = false;
				IdleTweenTime = 0.0000000;
				SetBoneRotation('Hammer', rot(0, 0, 0));
				PlayIdle();				
			}
			else
			{
				// End:0xFF
				if((Anim == FireMode[0].FireAnim) || Anim == FireMode[1].FireAnim)
				{
					SafePlayAnim(CockAnim, 1.0000000, 0.2000000);
					bPreventReload = false;					
				}
				else
				{
					IdleTweenTime = default.IdleTweenTime;
					super(BallisticWeapon).AnimEnded(Channel, Anim, frame, Rate);
				}
			}
		}
	}
	//return;	
}

simulated function Notify_leMatShotgunShellOut()
{
	PlaySound(ShellOutSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_leMatShotgunShellIn()
{
	PlaySound(ShellInSound, 1, 0.5000000,, 64.0000000);
	bSecLoaded = true;
	//return;	
}

simulated function Notify_leMatShellDown()
{
	local Vector Start;

	// End:0x33
	if((int(Role) == int(ROLE_Authority)) && ThirdPersonActor != none)
	{
		leMatAttachment(ThirdPersonActor).RevolverEjectBrass(64);
	}
	// End:0xCC
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Start = (Instigator.Location + Instigator.EyePosition()) + Class'BCoreProV55.BUtil'.static.AlignedOffset(Instigator.GetViewRotation(), vect(5.0000000, 10.0000000, -5.0000000));
		Spawn(Class'BallisticProV55.Brass_leMatSG', self,, Start, Instigator.GetViewRotation() + rot(8192, 0, 0));
	}
	//return;	
}

simulated function LoadShotgun()
{
	// End:0x23
	if((Ammo[1].AmmoAmount < 1) || bSecLoaded)
	{
		return;
	}
	// End:0x42
	if(int(ReloadState) == int(0))
	{
		PlayAnim(SGLoadAnim, 1.6000000,, 0);
	}
	//return;	
}

simulated function bool CanReload()
{
	// End:0x9E
	if((((bPreventReload || int(ReloadState) != int(0)) || IsInState('DualAction')) || (OtherGun != none) && int(OtherGun.ReloadState) != int(0)) || ((MagAmmo >= default.MagAmmo) || Ammo[0].AmmoAmount < 1) && bSecLoaded || Ammo[1].AmmoAmount < 1)
	{
		return false;
	}
	return true;
	//return;	
}

function ServerStartReload(optional byte i)
{
	local int Channel;
	local name seq;
	local float frame, Rate;
	local byte Loadings[2];

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
	// End:0x35
	if(bIsPendingHandGun || PendingHandgun != none)
	{
		return;
	}
	// End:0x4D
	if(OtherGun != none)
	{
		// End:0x4D
		if(IsInState('DualAction'))
		{
			return;
		}
	}
	GetAnimParams(Channel, seq, frame, Rate);
	// End:0x78
	if(seq == SGLoadAnim)
	{
		return;
	}
	// End:0xA9
	if((MagAmmo < default.MagAmmo) && Ammo[0].AmmoAmount > 0)
	{
		Loadings[0] = 1;
	}
	// End:0xD6
	if(!bSecLoaded && Ammo[1].AmmoAmount > 0)
	{
		Loadings[1] = 1;
	}
	// End:0xF8
	if((int(Loadings[0]) == 0) && int(Loadings[1]) == 0)
	{
		return;
	}
	// End:0x15F
	if(int(i) == 0)
	{
		// End:0x11D
		if(int(Loadings[0]) == 1)
		{
			super.ServerStartReload();			
		}
		else
		{
			// End:0x15A
			if(((AmmoAmount(1)) > 0) && !IsReloadingShotgun())
			{
				// End:0x14C
				if(OtherGun != none)
				{
					GotoState('PendingSGReload');					
				}
				else
				{
					LoadShotgun();
				}
				ClientStartReload(1);
			}
			return;
		}		
	}
	else
	{
		// End:0x1B0
		if(int(Loadings[1]) == 1)
		{
			// End:0x1AB
			if(((AmmoAmount(1)) > 0) && !IsReloadingShotgun())
			{
				// End:0x19D
				if(OtherGun != none)
				{
					GotoState('PendingSGReload');					
				}
				else
				{
					LoadShotgun();
				}
				ClientStartReload(1);
			}
			return;			
		}
		else
		{
			super.ServerStartReload();
		}
	}
	//return;	
}

simulated function bool HasMagAmmo(byte Mode)
{
	// End:0x95
	if(!bNoMag)
	{
		// End:0x6B
		if(((((int(Mode) == 255) || int(Mode) == 0) && bFireMode[0] != none) && bFireMode[0].bUseWeaponMag) && MagAmmo >= FireMode[0].AmmoPerFire)
		{
			return true;
		}
		// End:0x95
		if(((int(Mode) == 255) || int(Mode) == 1) && bSecLoaded)
		{
			return true;
		}
	}
	return false;
	//return;	
}

simulated function ClientStartReload(optional byte i)
{
	// End:0x69
	if(int(Level.NetMode) == int(NM_Client))
	{
		// End:0x5E
		if(int(i) == 1)
		{
			// End:0x5B
			if(((AmmoAmount(1)) > 0) && !IsReloadingShotgun())
			{
				// End:0x55
				if(OtherGun != none)
				{
					GotoState('PendingSGReload');					
				}
				else
				{
					LoadShotgun();
				}
			}			
		}
		else
		{
			CommonStartReload(i);
		}
	}
	//return;	
}

simulated function EmptyFire(byte Mode)
{
	// End:0x19
	if(OtherGun == none)
	{
		super.EmptyFire(Mode);		
	}
	else
	{
		// End:0xB7
		if((((((bNeedReload || !HasAmmoLoaded(Mode)) && int(ClientState) == int(4)) && FireCount < 1) && OtherGun.FireCount < 1) && Instigator.IsLocallyControlled()) && OtherGun.bNeedReload || !OtherGun.HasAmmoLoaded(Mode))
		{
			ServerStartReload(Mode);
		}
	}
	//return;	
}

simulated function bool CheckWeaponMode(int Mode)
{
	// End:0x0B
	if(bDryHeld)
	{
		return false;
	}
	// End:0x25
	if(IsInState('DualAction') || IsInState('PendingDualAction'))
	{
		return false;
	}
	// End:0x41
	if(CanSynch(byte(Mode)))
	{
		return super(BallisticWeapon).CheckWeaponMode(Mode);
	}
	// End:0xD2
	if((FireCount >= 1) && ((!IsSlave() || OtherGun.WeaponModes[int(OtherGun.CurrentWeaponMode)].ModeID != "WM_SemiAuto") || int(OtherGun.HandgunGroup) == int(HandgunGroup)) || LastFireTime > (Level.TimeSeconds - SingleHeldRate))
	{
		return false;
	}
	// End:0x171
	if((OtherGun != none) && CanAlternate(Mode))
	{
		// End:0x16F
		if(((((!OtherGun.HasAmmoLoaded(byte(Mode)) || OtherGun.bNeedCock) || OtherGun.bNeedReload) || LastFireTime <= OtherGun.LastFireTime) && FireCount < 1) && OtherGun.FireCount < 1)
		{
			return true;
		}
		return false;
	}
	return true;
	//return;	
}

simulated function TickFireCounter(float dt)
{
	// End:0x7F
	if(!IsFiring() && ((Instigator == none) || Instigator.Controller == none) || (int(Instigator.Controller.bFire) == 0) && int(Instigator.Controller.bAltFire) == 0)
	{
		bDryHeld = false;
		FireCount = 0;
	}
	//return;	
}

simulated function ShotgunFired()
{
	// End:0x1C
	if(!Class'BCoreProV55.BallisticReplicationInfo'.default.bNoReloading)
	{
		bSecLoaded = false;
	}
	bRevCocked = false;
	SetBoneRotation('Hammer', rot(0, 0, 0));
	//return;	
}

simulated function RevolverFired()
{
	SetBoneScale(int(ShellIndex), 0.0000000, Shells[int(ShellIndex)].BulletName);
	ShellIndex++;
	CylinderRotation.Roll += 7282;
	SetBoneRotation('Revolver', CylinderRotation, 0, 1.0000000);
	bRevCocked = false;
	SetBoneRotation('Hammer', rot(0, 0, 0));
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	local int i, Empties;
	local Vector Start;

	Empties = int(LoadedChambers) - MagAmmo;
	ShellIndex = 0;
	i = 0;
	J0x23:

	// End:0x94 [Loop If]
	if(i < 9)
	{
		// End:0x6A
		if(((AmmoAmount(0)) + MagAmmo) <= i)
		{
			SetBoneScale(i, 0.0000000, Shells[i].ShellName);
			// [Explicit Continue]
			goto J0x8A;
		}
		SetBoneScale(i, 1.0000000, Shells[i].ShellName);
		J0x8A:

		i++;
		// [Loop Continue]
		goto J0x23;
	}
	LoadedChambers = byte(Min(9, (AmmoAmount(0)) + MagAmmo));
	// End:0x1D3
	if((Instigator.IsLocallyControlled() && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0x1D3
		if(Class'BCoreProV55.BallisticMod'.default.bEjectBrass && int(Level.DetailMode) > int(0))
		{
			Start = (Instigator.Location + Instigator.EyePosition()) + Class'BCoreProV55.BUtil'.static.AlignedOffset(Instigator.GetViewRotation(), vect(5.0000000, 1.0000000, -5.0000000));
			i = 0;
			J0x182:

			// End:0x1D3 [Loop If]
			if(i < Empties)
			{
				Spawn(Class'BallisticProV55.Brass_Magnum', self,, Start + (VRand() * float(2)), Instigator.GetViewRotation() + rot(8192, 0, 0));
				i++;
				// [Loop Continue]
				goto J0x182;
			}
		}
	}
	// End:0x20B
	if((int(Role) == int(ROLE_Authority)) && ThirdPersonActor != none)
	{
		leMatAttachment(ThirdPersonActor).RevolverEjectBrass(byte(Empties));
	}
	//return;	
}

simulated function Notify_CockStart()
{
	bRevCocked = true;
	bFireMode[0].bPlayedDryFire = false;
	bFireMode[1].bPlayedDryFire = false;
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

simulated function Notify_leMatUncock()
{
	bRevCocked = false;
	//return;	
}

simulated function Notify_leMatOpen()
{
	CylinderRotation.Roll = 0;
	SetBoneRotation('Revolver', CylinderRotation);
	//return;	
}

simulated function Notify_ClipOut()
{
	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 2;
	PlayOwnedSound(ClipOutSound.Sound, ClipOutSound.Slot, ClipOutSound.Volume, ClipOutSound.bNoOverride, ClipOutSound.Radius, ClipOutSound.Pitch, ClipOutSound.bAtten);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	SetBoneRotation('Hammer', rot(0, 0, 0));
	super.BringUp(PrevWeapon);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x4B
	if(super.PutDown())
	{
		bLaserOn = false;
		KillLaserDot();
		// End:0x49
		if(Instigator.IsLocallyControlled())
		{
			bRevCocked = false;
			SetBoneRotation('Hammer', rot(0, 0, 0));
		}
		return true;
	}
	return false;
	//return;	
}

simulated function CommonCockGun(optional byte Type)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = false;
	}
	ReloadState = 0;
	bNeedCock = false;
	// End:0x48
	if(!bRevCocked)
	{
		SafePlayAnim(CockAnim, 1.0000000, 0.2000000);
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
		LaserDot = Spawn(Class'BallisticProV55.M806LaserDot',,, loc);
	}
	//return;	
}

simulated function DrawLaserSight(Canvas Canvas)
{
	local Vector HitLocation, Start, End, HitNormal;
	local Rotator AimDir;
	local Actor Other;

	// End:0x70
	if(((((int(ClientState) != int(4)) || !bLaserOn) || int(ReloadState) != int(0)) || IsInState('DualAction')) || (Level.TimeSeconds - FireMode[0].NextFireTime) < 0.2000000)
	{
		KillLaserDot();
		return;
	}
	AimDir = BallisticFire(FireMode[0]).GetFireAim(Start);
	End = Start + (Normal(Vector(AimDir)) * float(5000));
	Other = FireMode[0].Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xF2
	if(Other == none)
	{
		HitLocation = End;
	}
	SpawnLaserDot(HitLocation);
	// End:0x119
	if(LaserDot != none)
	{
		LaserDot.SetLocation(HitLocation);
	}
	Canvas.DrawActor(LaserDot, false, false, Instigator.Controller.FovAngle);
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

simulated exec function WeaponSpecial(optional byte i)
{
	bLaserOn = !bLaserOn;
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x5E
	if(((((AIController(Instigator.Controller) != none) && !bSecLoaded) && (AmmoAmount(1)) > 0) && BotShouldReloadShotgun()) && !IsReloadingShotgun())
	{
		LoadShotgun();
	}
	//return;	
}

function bool BotShouldReloadShotgun()
{
	// End:0x2A
	if((Level.TimeSeconds - Instigator.LastPainTime) > 1.0000000)
	{
		return true;
	}
	return false;
	//return;	
}

function bool CanAttack(Actor Other)
{
	// End:0x61
	if(!bSecLoaded)
	{
		// End:0x41
		if(IsReloadingShotgun())
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
			if(((AmmoAmount(1)) > 0) && BotShouldReloadShotgun())
			{
				LoadShotgun();
				return false;
			}
		}
	}
	return super.CanAttack(Other);
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist, Result;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x4B
	if(!bSecLoaded)
	{
		return 0;
	}
	// End:0x59
	if(MagAmmo < 1)
	{
		return 1;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	// End:0x9C
	if(dist > float(1700))
	{
		return 0;
	}
	Result = FRand() * 0.5000000;
	Result += (float(1) - (dist / float(1700)));
	// End:0xD7
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
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
	return Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.3500000, dist, 1536.0000000, 3072.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.8000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.8000000;
	//return;	
}

simulated state PendingSGReload extends PendingDualAction
{
	simulated function BeginState()
	{
		OtherGun.LowerHandGun();
		//return;		
	}

	simulated function HandgunLowered(BallisticHandgun Other)
	{
		global.HandgunLowered(Other);
		// End:0x20
		if(Other == OtherGun)
		{
			LoadShotgun();
		}
		//return;		
	}

	simulated event AnimEnd(int Channel)
	{
		OtherGun.RaiseHandGun();
		global.AnimEnd(Channel);
		//return;		
	}
	stop;	
}

simulated state Raising
{Begin:

	OtherGun.SetBoneScale(8, 0.0000000, OtherGun.SupportHandBone);
	SafePlayAnim(SelectAnim, 1.5000000, 0.1000000);
	SetBoneRotation('Hammer', rot(0, 0, 0));
	FinishAnim();
	OtherGun.HandgunRaised(self);
	HandgunRaised(self);
	// End:0x81
	if(int(ClientState) == int(4))
	{
		PlayIdle();
	}
	GotoState('None');
	stop;				
}

simulated state Lowering
{Begin:

	SetBoneRotation('Hammer', rot(0, 0, 0));
	SafePlayAnim(PutDownAnim, 1.5000000, 0.1000000);
	FinishAnim();
	GotoState('Lowered');
	stop;					
}

defaultproperties
{
	ShellOutSound=Sound'BW_Core_WeaponSound.leMat.LM-ShellOut'
	ShellInSound=Sound'BW_Core_WeaponSound.leMat.LM-ShellIn'
	bSecLoaded=true
	SGLoadAnim="Reload2"
	Shells[0]=(ShellName="Bullet1",BulletName="Slug1")
	Shells[1]=(ShellName="Bullet2",BulletName="Slug2")
	Shells[2]=(ShellName="Bullet3",BulletName="Slug3")
	Shells[3]=(ShellName="Bullet4",BulletName="Slug4")
	Shells[4]=(ShellName="Bullet5",BulletName="Slug5")
	Shells[5]=(ShellName="Bullet6",BulletName="Slug6")
	Shells[6]=(ShellName="Bullet7",BulletName="Slug7")
	Shells[7]=(ShellName="Bullet8",BulletName="Slug8")
	Shells[8]=(ShellName="Bullet9",BulletName="Slug9")
	Shells[9]=(ShellName="shell",BulletName="shell")
	LoadedChambers=9
	bShouldDualInLoadout=false
	DualReloadEmptyAnim="DualReload"
	HandgunGroup=1
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;15.0;0.6;50.0;0.9;0.5;-999.0")
	AIReloadTime=1.5000000
	SightAnimScale=0.6500000
	ParamsClasses[0]=Class'BallisticProV55.leMatWeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.leMatWeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.leMatWeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.leMatWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.leMat.BigIcon_Wilson41DB'
	BigIconCoords=(X1=48,Y1=40,X2=459,Y2=212)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.1550000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightDisplayFOV=60.0000000
	bNoCrosshairInScope=true
	SightBobScale=1.0000000
	CockSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-BulletsOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-BulletsIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bAltTriggerReload=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc6',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=93,G=91,B=43,A=142),Color2=(R=255,G=255,B=0,A=255),StartSize1=144,StartSize2=15)
	NDCrosshairInfo=(SpreadRatios=(X1=0.7500000,Y1=0.7500000,X2=0.3000000,Y2=0.3000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=4.0000000,CurrentScale=0.0000000)
	bWT_Bullet=true
	ManualLines[0]="High damage bullet fire. Good range for a handgun and high ammo capacity."
	ManualLines[1]="Fires the single 16-gauge shotgun shell. Strong at very close range."
	ManualLines[2]="Effective at close range."
	SightingTime=0.2000000
	SightPivot=(Pitch=512,Yaw=0,Roll=-50)
	SightOffset=(X=-18.0000000,Y=-1.5000000,Z=15.3000000)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=2500,Yaw=-350,Roll=0)
	FireModeClass[0]=Class'BallisticProV55.leMatPrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.leMatSecondaryFire'
	PutDownTime=0.7000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="An expensive remake of an exceptionally old weapon, the Wilson 41-DB was designed for collectors and procurers of rare items from the early days of human firearms. Manufactured by the Edwinson & Sons arms co, this firearm is of high quality, sparse quantity and very high price. Never used in any military or law enforcement organisation, the Wilson 'DiamondBack', is still capable of causing damage. With a 9 cylinder revolver and single 16 gauge shotgun chamber for desperate moments, this weapon can still stop many opponents."
	Priority=22
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=2
	GroupOffset=4
	PickupClass=Class'BallisticProV55.leMatPickup'
	PlayerViewOffset=(X=12.0000000,Y=7.0000000,Z=-13.0000000)
	AttachmentClass=Class'BallisticProV55.leMatAttachment'
	IconMaterial=Texture'BW_Core_WeaponTex.leMat.SmallIcon_Wilson41DB'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Wilson 41"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.Wilson_FPm'
	DrawScale=0.3000000
}
