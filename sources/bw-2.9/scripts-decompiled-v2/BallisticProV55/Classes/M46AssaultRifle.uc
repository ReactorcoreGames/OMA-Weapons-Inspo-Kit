class M46AssaultRifle extends BallisticWeapon
	config(BallisticProV55);

var() name GrenadeLoadAnim;
var() Sound GrenOpenSound;
var() Sound GrenLoadSound;
var() Sound GrenCloseSound;
var float LastDetonationTime;
var array<M46Mine> Mines;

replication
{
	// Pos:0x000
	unreliable if(int(Role) == int(ROLE_Authority))
		ClientGrenadePickedUp;
}

simulated function Notify_OAARGrenadeOpen()
{
	PlaySound(GrenOpenSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_OAARGrenadeIn()
{
	PlaySound(GrenLoadSound, 1, 0.5000000,, 64.0000000);
	//return;	
}

simulated function Notify_OAARGrenadeClose()
{
	PlaySound(GrenCloseSound, 1, 0.5000000,, 64.0000000);
	M46SecondaryFire(FireMode[1]).bLoaded = true;
	FireMode[1].PreFireTime = FireMode[1].default.PreFireTime;
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
			M46SecondaryFire(FireMode[1]).bLoaded = true;
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
			M46SecondaryFire(FireMode[1]).bLoaded = true;
		}
	}
	//return;	
}

simulated function bool IsGrenadeLoaded()
{
	return M46SecondaryFire(FireMode[1]).bLoaded;
	//return;	
}

function GainedChild(Actor proj)
{
	// End:0x27
	if(M46Mine(proj) != none)
	{
		Mines[Mines.Length] = M46Mine(proj);
	}
	//return;	
}

function LostChild(Actor proj)
{
	local int i;

	// End:0x12
	if(M46Mine(proj) == none)
	{
		return;
	}
	i = 0;
	J0x19:

	// End:0x56 [Loop If]
	if(i < Mines.Length)
	{
		// End:0x4C
		if(Mines[i] == proj)
		{
			Mines.Remove(i, 1);
			return;
		}
		++i;
		// [Loop Continue]
		goto J0x19;
	}
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super.GiveAmmo(M, WP, bJustSpawned);
	// End:0x4E
	if((Ammo[1] != none) && Ammo_M46Grenades(Ammo[1]) != none)
	{
		Ammo_M46Grenades(Ammo[1]).DaM46 = self;
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
	super.AnimEnd(Channel);
	//return;	
}

simulated function LoadGrenade()
{
	// End:0x54
	if((Ammo[1].AmmoAmount < 1) || M46SecondaryFire(FireMode[1]).bLoaded)
	{
		// End:0x52
		if(!M46SecondaryFire(FireMode[1]).bLoaded)
		{
			PlayIdle();
		}
		return;
	}
	// End:0x82
	if(int(ReloadState) == int(0))
	{
		ReloadState = 8;
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.1000000,, 0);
	}
	//return;	
}

simulated function bool HasNonMagAmmo(byte Mode)
{
	// End:0x64
	if(((((int(Mode) == 255) || int(Mode) == 0) && Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0xC8
	if(((((int(Mode) == 255) || int(Mode) == 1) && Ammo[1] != none) && FireMode[1] != none) && Ammo[1].AmmoAmount >= FireMode[1].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	local int i;

	// End:0x21
	if((LastDetonationTime + 0.3000000) > Level.TimeSeconds)
	{
		return;
	}
	super.ServerSwitchWeaponMode(newmode);
	i = 0;
	J0x33:

	// End:0x8C [Loop If]
	if(i < Mines.Length)
	{
		// End:0x63
		if(Mines[i] == none)
		{
			Mines.Remove(i, 1);
			// [Explicit Continue]
			goto J0x82;
		}
		Mines[i].SetManualMode(int(CurrentWeaponMode) == 1);
		J0x82:

		i++;
		// [Loop Continue]
		goto J0x33;
	}
	LastDetonationTime = Level.TimeSeconds;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x44
	if((Instigator.bNoWeaponFiring || int(CurrentWeaponMode) != 1) || (LastDetonationTime + 0.7500000) > Level.TimeSeconds)
	{
		return;
	}
	ServerWeaponSpecial();
	LastDetonationTime = Level.TimeSeconds;
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	local int j;

	// End:0x44
	if((Instigator.bNoWeaponFiring || int(CurrentWeaponMode) != 1) || (LastDetonationTime + 0.7500000) > Level.TimeSeconds)
	{
		return;
	}
	j = Mines.Length - 1;
	J0x53:

	// End:0x123 [Loop If]
	if(j >= 0)
	{
		// End:0x7E
		if(Mines[j] == none)
		{
			Mines.Remove(j, 1);
			// [Explicit Continue]
			goto J0x119;
		}
		// End:0xCB
		if((Level.TimeSeconds < (Mines[j].TriggerStartTime - float(1))) || Mines[j].TriggerStartTime == float(0))
		{
			// [Explicit Break]
			goto J0x123;
		}
		Mines[j].Explode(Mines[j].Location, Vector(Mines[j].Rotation));
		Mines.Remove(j, 1);
		// [Explicit Break]
		goto J0x123;
		J0x119:

		j--;
		// [Loop Continue]
		goto J0x53;
	}
	J0x123:

	LastDetonationTime = Level.TimeSeconds;
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
	return CurrentRating;
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
	if(((AmmoAmount(1)) < 1) || !IsGrenadeLoaded())
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
	GrenOpenSound=Sound'BW_Core_WeaponSound.M50.M50GrenOpen'
	GrenLoadSound=Sound'BW_Core_WeaponSound.M50.M50GrenLoad'
	GrenCloseSound=Sound'BW_Core_WeaponSound.M50.M50GrenClose'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;25.0;0.9;70.0;0.9;0.2;0.7")
	AIReloadTime=1.0000000
	ParamsClasses[0]=Class'BallisticProV55.M46WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.M46WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.M46WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.M46WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.OA-AR.BigIcon_OAAR'
	BigIconCoords=(X1=0,Y1=40,X2=511,Y2=235)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Pullout',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Putaway',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Proximity Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Manual Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	ScopeXScale=1.2500000
	ZoomInAnim="ZoomIn"
	ZoomOutAnim="ZoomOut"
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=4.0000000
	ZoomStages=1
	FullZoomFOV=60.0000000
	ScopeViewTex=Texture'BW_Core_WeaponTex.SRS900.SRS900ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_Cock',Volume=1.1000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_ClipHit',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_ClipOut',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_ClipIn',Volume=1.0000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc9',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.A73OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=129,G=255,B=0,A=140),Color2=(R=255,G=255,B=0,A=255),StartSize1=84,StartSize2=26)
	bWT_Bullet=true
	bWT_Splash=true
	bWT_Machinegun=true
	bWT_Projectile=true
	ManualLines[0]="Automatic battle rifle fire. Moderate damage per shot with greater range and penetration than assault rifles. Recoil is moderate."
	ManualLines[1]="Deploys a mine. These mines can be detonated with the Weapon Function key shortly after being placed for severe damage. Mines can be picked up with the Use key."
	ManualLines[2]="Effective at medium to long range."
	SightOffset=(X=-1.0000000,Y=0.0400000,Z=3.9000000)
	FireModeClass[0]=Class'BallisticProV55.M46PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.M46SecondaryFire'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	AmmoClass[0]=Class'BallisticProV55.Ammo_M46Clip'
	AmmoClass[1]=Class'BallisticProV55.Ammo_M46Clip'
	Description="The M46 was one of Black & Wood's first forays into high powered assault weaponry, specifically rifles. As with all of Black & Wood's weapons, the 'Jackal' is incredibly reliable and tough. Used by certain Terran units, the M46 is typically equipped with a short-range optical scope and often various Grenade Launcher attachments. While not quite yet a widely used weapon, its reputation has grown in recent times as heroic stories of Armoured Squadron 190's use of it has spread amongst the bulk of the UTC troops."
	Priority=41
	HudColor=(R=255,G=175,B=0,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	GroupOffset=1
	PickupClass=Class'BallisticProV55.M46Pickup'
	PlayerViewOffset=(X=5.0000000,Y=3.5000000,Z=-5.0000000)
	AttachmentClass=Class'BallisticProV55.M46Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.OA-AR.SmallIcon_OAAR'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M46A1 Combat Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M46A1_FPm'
	DrawScale=0.3000000
}
