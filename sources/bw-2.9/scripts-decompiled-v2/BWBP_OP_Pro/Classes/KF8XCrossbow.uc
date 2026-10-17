class KF8XCrossbow extends BallisticWeapon
	config(BallisticProV55);

struct RevInfo
{
	var() name BoneName;
};

var() FullSound ThermalOnSound;
var() FullSound ThermalOffSound;
var() FullSound NVOnSound;
var() FullSound NVOffSound;
var array<Pawn> PawnList;
var() Material WallVisionSkin;
var bool bThermal;
var bool bUpdatePawns;
var Pawn UpdatedPawns[128];
var() Material Flaretex;
var() float ThermalRange;
var bool bMeatVision;
var Pawn Target;
var float targettime;
var float LastSendTargetTime;
var float NextTargetFindTime;
var float TargetFindInterval;
var Vector TargetLocation;
var Actor NVLight;
var() array<name> ReleaseStateAnim;
var() name ReloadAnim2;
var() name MagBone;
var() Rotator MagBoneRotation;
var bool bNeedRotate;
var() RevInfo ArrowBones[7];
var() name GunArrowBone;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Target, bMeatVision;

	// Pos:0x00D
	reliable if(int(Role) < int(ROLE_Authority))
		ServerAdjustThermal;
}

simulated function AnimEnded(int Channel, name Anim, float frame, float Rate)
{
	// End:0x15
	if(Anim == 'FireCycle')
	{
		RemoveGunArrow();
	}
	// End:0x2A
	if(Anim == 'FireCycleRotate')
	{
		RotateClip();
	}
	// End:0x5F
	if(int(ReloadState) == int(1))
	{
		// End:0x5F
		if(HasAnim(ReloadAnim))
		{
			SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
		}
	}
	super.AnimEnded(Channel, Anim, frame, Rate);
	//return;	
}

simulated function PlayReload()
{
	MagBoneRotation.Roll = 0;
	SetBoneRotation(MagBone, MagBoneRotation, 0, 1.0000000);
	// End:0x57
	if((MagAmmo == 1) && HasAnim(ReloadAnim2))
	{
		SafePlayAnim(ReloadAnim2, ReloadAnimRate,, 0, "RELOAD");		
	}
	else
	{
		// End:0x8C
		if((MagAmmo == 0) && HasAnim(ReloadEmptyAnim))
		{
			SafePlayAnim(ReloadEmptyAnim, ReloadAnimRate,, 0, "RELOAD");			
		}
		else
		{
			// End:0xC9
			if((MagAmmo > 1) && MagAmmo < 8)
			{
				SafePlayAnim(ReleaseStateAnim[MagAmmo - 2], ReloadAnimRate,, 0, "RELOAD");
			}
		}
	}
	//return;	
}

simulated function RotateClip()
{
	// End:0x16
	if(MagAmmo > 7)
	{
		bNeedRotate = false;
		return;
	}
	MagBoneRotation.Roll = (-4 * (8 - MagAmmo)) * (65536 / 360);
	SetBoneRotation(MagBone, MagBoneRotation, 0, 1.0000000);
	SetBoneScale(MagAmmo - 1, 0.0000000, ArrowBones[MagAmmo - 1].BoneName);
	bNeedRotate = false;
	//return;	
}

simulated function RemoveGunArrow()
{
	SetBoneScale(9, 0.0000000, GunArrowBone);
	//return;	
}

simulated function ReturnArrow(int ArrowIndex)
{
	SetBoneScale(ArrowIndex, 1.0000000, ArrowBones[ArrowIndex].BoneName);
	//return;	
}

simulated function Notify_ReturnAllArrows()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x28 [Loop If]
	if(i <= 6)
	{
		ReturnArrow(i);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function Notify_ReturnFirstArrow()
{
	SetBoneScale(9, 1.0000000, GunArrowBone);
	//return;	
}

simulated function Notify_CockStart()
{
	PlayOwnedSound(CockSound.Sound, CockSound.Slot, CockSound.Volume, CockSound.bNoOverride, CockSound.Radius, CockSound.Pitch, CockSound.bAtten);
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	bMeatVision = !bMeatVision;
	// End:0x30
	if(bMeatVision)
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOnSound);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Actor t;
	local float bestAim, BestDist;
	local Pawn targ;
	local Vector HitLoc, HitNorm, Start, End;

	super.WeaponTick(dt);
	// End:0x117
	if(bThermal && bScopeView)
	{
		SetNVLight(true);
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(1500));
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(16.0000000, 16.0000000, 16.0000000));
		// End:0xB3
		if(t == none)
		{
			HitLoc = End;
		}
		// End:0xF6
		if(VSize(HitLoc - Start) > float(400))
		{
			NVLight.SetLocation(Start + ((HitLoc - Start) * 0.5000000));			
		}
		else
		{
			NVLight.SetLocation(HitLoc + (HitNorm * float(30)));
		}		
	}
	else
	{
		SetNVLight(false);
	}
	// End:0x157
	if((!bScopeView || int(Role) < int(ROLE_Authority)) || Level.TimeSeconds < NextTargetFindTime)
	{
		return;
	}
	NextTargetFindTime = Level.TimeSeconds + TargetFindInterval;
	Start = Instigator.Location + Instigator.EyePosition();
	bestAim = 0.9950000;
	targ = Instigator.Controller.PickTarget(bestAim, BestDist, Vector(Instigator.GetViewRotation()), Start, 20000.0000000);
	// End:0x21A
	if((targ != none) && !FastTrace(targ.Location, Instigator.Location))
	{
		targ = none;
	}
	// End:0x24C
	if((targ != none) && targ != Target)
	{
		Target = targ;
		targettime = 0.0000000;
	}
	// End:0x27C
	if(targ == none)
	{
		targettime = FMax(0.0000000, targettime - (dt * 0.5000000));
		return;		
	}
	else
	{
		// End:0x2B6
		if(Vehicle(targ) != none)
		{
			targettime += (((1.2000000 * dt) * (bestAim - 0.9500000)) * float(20));			
		}
		else
		{
			targettime += ((dt * (bestAim - 0.9500000)) * float(20));
		}
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	Target = none;
	targettime = 0.0000000;
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated event DrawScopeOverlays(Canvas C)
{
	// End:0x14
	if(bThermal)
	{
		DrawThermalMode(C);
	}
	// End:0x28
	if(bMeatVision)
	{
		DrawMeatVisionMode(C);
	}
	super.DrawScopeOverlays(C);
	//return;	
}

simulated event Timer()
{
	// End:0x12
	if(bUpdatePawns)
	{
		UpdatePawnList();		
	}
	else
	{
		super.Timer();
	}
	//return;	
}

simulated function UpdatePawnList()
{
	local Pawn P;
	local int i;
	local float dist;

	PawnList.Length = 0;
	// End:0x21E
	foreach DynamicActors(Class'Engine.Pawn', P)
	{
		// End:0x96
		if(((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none) && P.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
		{
			continue;			
		}
		PawnList[PawnList.Length] = P;
		dist = VSize(P.Location - Instigator.Location);
		// End:0x21D
		if(((dist <= ThermalRange) && (Normal(P.Location - (Instigator.Location + Instigator.EyePosition())) Dot Vector(Instigator.GetViewRotation())) > (float(1) - ((Instigator.Controller.FovAngle * 0.9000000) / float(180)))) && Instigator.LineOfSightTo(P) || (Normal(P.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation())) > (0.9850000 + (0.0150000 * (dist / ThermalRange))))
		{
			// End:0x205
			if(!Instigator.IsLocallyControlled())
			{
				P.NetUpdateTime = Level.TimeSeconds - float(1);
				P.bAlwaysRelevant = true;
			}
			UpdatedPawns[i] = P;
			i++;
		}		
	}	
	//return;	
}

simulated function OnScopeViewChanged()
{
	super.OnScopeViewChanged();
	// End:0x43
	if(!bScopeView)
	{
		// End:0x31
		if(Target != none)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
		}
		Target = none;
		targettime = 0.0000000;
	}
	//return;	
}

simulated event DrawMeatVisionMode(Canvas C)
{
	local Vector V, v2, V3, X, Y, Z;

	local float ScaleFactor;

	C.Style = 4;
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.MARS.F2000TargetFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	C.SetPos(C.OrgX, C.OrgY);
	C.Style = 5;
	// End:0x101
	if(Target == none)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	GetViewAxes(X, Y, Z);
	V = C.WorldToScreen((Target.Location - (Y * Target.CollisionRadius)) + (Z * Target.CollisionHeight));
	V.X -= (float(32) * ScaleFactor);
	V.Y -= (float(32) * ScaleFactor);
	C.SetPos(V.X, V.Y);
	v2 = C.WorldToScreen((Target.Location + (Y * Target.CollisionRadius)) - (Z * Target.CollisionHeight));
	C.SetDrawColor(160, 185, 200, byte(255));
	C.DrawTileStretched(Texture'BWBP_SKC_Tex.X82.X82TargetBox', (v2.X - V.X) + (float(32) * ScaleFactor), (v2.Y - V.Y) + (float(32) * ScaleFactor));
	V3 = C.WorldToScreen(Target.Location - (Z * Target.CollisionHeight));
	//return;	
}

simulated event DrawThermalMode(Canvas C)
{
	C.Style = 4;
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.MARS.F2000IRNVFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	//return;	
}

simulated function AdjustThermalView(bool bNewValue)
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x31
	if(!bNewValue)
	{
		bUpdatePawns = false;		
	}
	else
	{
		bUpdatePawns = true;
		UpdatePawnList();
		SetTimer(1.0000000, true);
	}
	ServerAdjustThermal(bNewValue);
	//return;	
}

function ServerAdjustThermal(bool bNewValue)
{
	local int i;

	// End:0x23
	if(bNewValue)
	{
		bUpdatePawns = true;
		UpdatePawnList();
		SetTimer(1.0000000, true);		
	}
	else
	{
		bUpdatePawns = false;
		i = 0;
		J0x32:

		// End:0x84 [Loop If]
		if(i < 128)
		{
			// End:0x7A
			if(UpdatedPawns[i] != none)
			{
				UpdatedPawns[i].bAlwaysRelevant = UpdatedPawns[i].default.bAlwaysRelevant;
			}
			i++;
			// [Loop Continue]
			goto J0x32;
		}
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0xA8
	if(!bThermal && !bMeatVision)
	{
		bThermal = !bThermal;
		// End:0x48
		if(bThermal)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOnSound);			
		}
		else
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOffSound);
		}
		AdjustThermalView(bThermal);
		// End:0xA6
		if(!bScopeView)
		{
			PlayerController(InstigatorController).ClientMessage("Activated nightvision scope.");
		}
		return;
	}
	// End:0x19A
	if(bThermal && !bMeatVision)
	{
		bThermal = !bThermal;
		// End:0xEE
		if(bThermal)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOnSound);			
		}
		else
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOffSound);
		}
		AdjustThermalView(bThermal);
		// End:0x153
		if(!bScopeView)
		{
			PlayerController(InstigatorController).ClientMessage("Activated infrared targeting scope.");
		}
		bMeatVision = !bMeatVision;
		// End:0x183
		if(bMeatVision)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOnSound);			
		}
		else
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
		}
		return;
	}
	// End:0x231
	if(!bThermal && bMeatVision)
	{
		bMeatVision = !bMeatVision;
		// End:0x1E0
		if(bMeatVision)
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOnSound);			
		}
		else
		{
			Class'BCoreProV55.BUtil'.static.PlayFullSound(self, NVOffSound);
		}
		// End:0x22F
		if(!bScopeView)
		{
			PlayerController(InstigatorController).ClientMessage("Activated standard scope.");
		}
		return;
	}
	//return;	
}

simulated event Destroyed()
{
	AdjustThermalView(false);
	// End:0x1E
	if(NVLight != none)
	{
		NVLight.Destroy();
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = false;
	super.Destroyed();
	//return;	
}

simulated function bool PutDown()
{
	// End:0x12
	if(super.PutDown())
	{
		AdjustThermalView(false);
		return true;
	}
	Instigator.AmbientSound = UsedAmbientSound;
	Instigator.SoundVolume = default.SoundVolume;
	Instigator.SoundPitch = default.SoundPitch;
	Instigator.SoundRadius = default.SoundRadius;
	Instigator.bFullVolume = false;
	return false;
	//return;	
}

simulated function SetNVLight(bool bOn)
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x6D
	if(bOn)
	{
		// End:0x59
		if(NVLight == none)
		{
			NVLight = Spawn(Class'BWBP_OP_Pro.KF8XNVLight',,, Instigator.Location);
			NVLight.SetBase(Instigator);
		}
		NVLight.bDynamicLight = true;		
	}
	else
	{
		// End:0x89
		if(NVLight != none)
		{
			NVLight.bDynamicLight = false;
		}
	}
	//return;	
}

simulated function float ChargeBar()
{
	return float(KF8XAttachment(ThirdPersonActor).CurAlpha) / 128.0000000;
	//return;	
}

function byte BestMode()
{
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
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 2048.0000000, 3072.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.7000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.7000000;
	//return;	
}

defaultproperties
{
	ThermalOnSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ThermalOffSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	NVOnSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOn',Volume=1.6000000,Radius=0.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=false)
	NVOffSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-SightOff',Volume=1.6000000,Radius=0.0000000,Slot=0,Pitch=0.9000000,bAtten=false,bNoOverride=false)
	WallVisionSkin=FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal'
	Flaretex=FinalBlend'BW_Core_WeaponTex.M75.OrangeFlareFinal'
	ThermalRange=2500.0000000
	ReleaseStateAnim[0]="ReloadMagReleaseState6"
	ReleaseStateAnim[1]="ReloadMagReleaseState5"
	ReleaseStateAnim[2]="ReloadMagReleaseState4"
	ReleaseStateAnim[3]="ReloadMagReleaseState3"
	ReleaseStateAnim[4]="ReloadMagReleaseState2"
	ReleaseStateAnim[5]="ReloadMagReleaseState1"
	ReloadAnim2="ReloadMagEmpty"
	MagBone="Magazine"
	ArrowBones[0]=(BoneName="2")
	ArrowBones[1]=(BoneName="3")
	ArrowBones[2]=(BoneName="4")
	ArrowBones[3]=(BoneName="5")
	ArrowBones[4]=(BoneName="6")
	ArrowBones[5]=(BoneName="7")
	ArrowBones[6]=(BoneName="8")
	GunArrowBone="1"
	SpecialInfo[0]=(Id="EvoDefs",Info="120.0;15.0;0.8;50.0;0.0;0.5;-999.0")
	AIReloadTime=1.5000000
	ParamsClasses[0]=Class'BWBP_OP_Pro.KF8XWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.KF8XWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.KF8XWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.KF8XWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.XBow.BigIcon_Crossbow'
	IdleTweenTime=0.0000000
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M806.M806Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Lever-Action",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	MinZoom=2.0000000
	MaxZoom=16.0000000
	ZoomStages=3
	FullZoomFOV=50.0000000
	ScopeViewTex=Texture'BWBP_OP_Tex.R9A1.R9_scope_UI_DO1'
	bNoCrosshairInScope=true
	CockAnim="'"
	CockSound=(Sound=Sound'BWBP_OP_Sounds.XBow.CockFast',Volume=1.2000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	bNonCocking=true
	ReloadAnim="ReloadStateFinish"
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57InA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=42,G=50,B=43,A=171),Color2=(R=104,G=27,B=16,A=151),StartSize1=96,StartSize2=76)
	bWT_Bullet=true
	ManualLines[0]="Launches a toxic crossbow bolt. This attack has a long fire interval and moderate damage, but is almost invisible and makes no sound. As such, it is very difficult to detect."
	ManualLines[1]="Raises the scope."
	ManualLines[2]="Effective at long range. Excels at stealth."
	SightOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	FireModeClass[0]=Class'BWBP_OP_Pro.KF8XPrimaryFire'
	FireModeClass[1]=Class'BCoreProV55.BallisticScopeFire'
	PutDownTime=0.6000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="Crossbows have long since been phased out in the battlefield; they're reserved only for hunters or specialist groups across the several galaxies. It wasn't until the exploits of one Billy â€œHamboâ€ Hale that they began to pick up popularity again. He claimed he managed to take down a group of Skrith when they weren't looking during an expedition of the reclaimed Amazon.  Using only his wits, some tranquilizer bolts and his crossbow, Hambo's tale had created a surge in the crossbow market, with Enravion taking the lead with their KF-8X Crossbow model. A magazine fed crossbow that's pump action, it comes with a modular scope and poison bolts.  Originally it was supposed to have a built-in stealth generator courtesy of XWI, but it was soon removed after reports of several users becoming violently unhinged after prolonged exposure."
	Priority=24
	HudColor=(R=150,G=150,B=150,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	PickupClass=Class'BWBP_OP_Pro.KF8XPickup'
	PlayerViewOffset=(X=9.0000000,Y=6.0000000,Z=-6.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.KF8XAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.XBow.Icon_Crossbow'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="KF-8X Stealth Crossbow"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.KF8X_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_OP_Tex.XBow.XBow_SH1'
}
