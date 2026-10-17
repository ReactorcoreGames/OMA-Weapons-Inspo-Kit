class RSNovaAttachment extends BallisticAttachment;

var Emitter FreeZap;
var RSNova_TrackingZap TargetZap;
var Actor ZapTarget;
var Actor ZapTargetOld;
var byte TargZapCount;
var byte TargZapCountOld;
var byte FreeZapCount;
var byte FreeZapCountOld;
var byte KillZapCount;
var byte KillZapCountOld;
var RSNovaStaff NovaStaff;
var Actor FastMuzzleFlash;
var byte FastFireCount;
var byte FastFireCountOld;
var bool bHealing;
var byte ChainVicNum;
var Actor ChainVics[6];
var array<RSNovaChainLink> ChainLinks;
var byte KillChainZapsCount;
var byte KillChainZapsCountOld;
var byte FreeChainZapCount;
var byte FreeChainZapCountOld;
var byte ChainZapCount;
var byte ChainZapCountOld;
var byte BigZapCount;
var byte BigZapCountOld;
var Emitter FreeChainZap;
var bool bRampage;
var RSNovaWings Wings;
var float WingPhase;
var bool bWingDown;
var() Sound WingSound;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		BigZapCount, ChainVicNum, 
		ChainVics, ChainZapCount, 
		FastFireCount, FreeChainZapCount, 
		FreeZapCount, KillChainZapsCount, 
		KillZapCount, TargZapCount, 
		ZapTarget, bHealing, 
		bRampage;

	// Pos:0x018
	reliable if(((int(Role) == int(ROLE_Authority)) && bNetOwner) && bNetInitial)
		NovaStaff;
}

simulated event PostNetReceive()
{
	// End:0x9D
	if(!Instigator.IsLocallyControlled())
	{
		// End:0x79
		if(bRampage && Wings == none)
		{
			Wings = Spawn(Class'BallisticProV55.RSNovaWings', Instigator,, Instigator.Location, Instigator.Rotation);
			// End:0x76
			if(Wings != none)
			{
				Wings.SetBase(Instigator);
			}			
		}
		else
		{
			// End:0x9D
			if(!bRampage && Wings != none)
			{
				Wings.Destroy();
			}
		}
	}
	// End:0xCC
	if(int(TargZapCount) != int(TargZapCountOld))
	{
		TargZapCountOld = TargZapCount;
		SetTargetZap(ZapTarget, bHealing);
	}
	// End:0xF0
	if(int(FreeZapCount) != int(FreeZapCountOld))
	{
		FreeZapCountOld = FreeZapCount;
		SetFreeZap();
	}
	// End:0x114
	if(int(KillZapCount) != int(KillZapCountOld))
	{
		KillZapCountOld = KillZapCount;
		KillZap();
	}
	// End:0x138
	if(int(ChainZapCount) != int(ChainZapCountOld))
	{
		ChainZapCountOld = ChainZapCount;
		ClientDoChainZap();
	}
	// End:0x15C
	if(int(FreeChainZapCount) != int(FreeChainZapCountOld))
	{
		FreeChainZapCountOld = FreeChainZapCount;
		SetFreeChainZap();
	}
	// End:0x180
	if(int(KillChainZapsCount) != int(KillChainZapsCountOld))
	{
		KillChainZapsCountOld = KillChainZapsCount;
		KillChainZaps();
	}
	// End:0x1AC
	if(int(FastFireCount) != int(FastFireCountOld))
	{
		FiringMode = 2;
		ThirdPersonEffects();
		FastFireCountOld = FastFireCount;
	}
	// End:0x1D8
	if(int(BigZapCount) != int(BigZapCountOld))
	{
		FiringMode = 3;
		ThirdPersonEffects();
		BigZapCountOld = BigZapCount;
	}
	super.PostNetReceive();
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0xBC
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		// End:0x4C
		if(int(FiringMode) == 1)
		{
			InstantFireEffects(FiringMode);
			PlayPawnTrackAnim(FiringMode);			
		}
		else
		{
			// End:0x7E
			if(int(FiringMode) == 2)
			{
				FlashMuzzleFlash(FiringMode);
				FlashWeaponLight(FiringMode);
				PlayPawnFiring(FiringMode);				
			}
			else
			{
				// End:0xB6
				if(int(FiringMode) == 3)
				{
					BigZapInstantFireEffects();
					FlashMuzzleFlash(FiringMode);
					FlashWeaponLight(FiringMode);
					PlayPawnFiring(FiringMode);					
				}
				else
				{
					super.ThirdPersonEffects();
				}
			}
		}
	}
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x49
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xB1
	if((int(Mode) == 0) && AltMuzzleFlashClass != none)
	{
		// End:0x99
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
		}
		AltMuzzleFlash.Trigger(self, Instigator);		
	}
	else
	{
		// End:0x10A
		if(int(Mode) == 2)
		{
			// End:0xF5
			if(FastMuzzleFlash == none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(FastMuzzleFlash, Class'BallisticProV55.RSNovaFastMuzzleFlash', DrawScale * FlashScale, self, FlashBone);
			}
			FastMuzzleFlash.Trigger(self, Instigator);
		}
	}
	//return;	
}

function NovaUpdateHit(byte WeaponMode)
{
	// End:0x3E
	if(int(WeaponMode) == 0)
	{
		FiringMode = 0;
		FireCount++;
		NetUpdateTime = Level.TimeSeconds - float(1);
		ThirdPersonEffects();		
	}
	else
	{
		// End:0x79
		if(int(WeaponMode) == 1)
		{
			FiringMode = 2;
			FastFireCount++;
			NetUpdateTime = Level.TimeSeconds - float(1);
			ThirdPersonEffects();
		}
	}
	//return;	
}

function BigZapUpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal, int HitSurf)
{
	mHitSurf = HitSurf;
	mHitNormal = HitNormal;
	mHitActor = HitActor;
	mHitLocation = HitLocation;
	FiringMode = 3;
	BigZapCount++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	ThirdPersonEffects();
	//return;	
}

simulated function BigZapInstantFireEffects()
{
	local Vector HitLocation, Dir, Start;
	local RSNova_OneShotZap Zap;

	// End:0x19
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x26
	if(Instigator == none)
	{
		return;
	}
	// End:0xBA
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), true);		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	Zap = Spawn(Class'BallisticProV55.RSNova_OneShotZap', Instigator,, GetModeTipLocation());
	// End:0x102
	if(mHitActor == none)
	{
		Zap.SetTarget(HitLocation, false);		
	}
	else
	{
		Zap.SetTarget(HitLocation, true);
	}
	//return;	
}

simulated function UpdateChainZap()
{
	local int i;
	local Vector Prev;

	Prev = GetModeTipLocation();
	i = 0;
	J0x13:

	// End:0xF5 [Loop If]
	if(i < int(ChainVicNum))
	{
		// End:0xB8
		if(ChainVics[i] != none)
		{
			// End:0x6D
			if((ChainLinks.Length <= i) || ChainLinks[i] == none)
			{
				ChainLinks[i] = Spawn(Class'BallisticProV55.RSNovaChainLink', self);
			}
			ChainLinks[i].SetPoints(Prev, ChainVics[i].Location);
			Prev = ChainVics[i].Location;
			// [Explicit Continue]
			goto J0xEB;
		}
		// End:0xEB
		if(ChainLinks[i] != none)
		{
			ChainLinks[i].Kill();
			ChainLinks[i] = none;
		}
		J0xEB:

		i++;
		// [Loop Continue]
		goto J0x13;
	}
	//return;	
}

simulated function ClientDoChainZap()
{
	xPawn(Instigator).StartFiring(bHeavy, true);
	StartMuzzleZap();
	KillFreeChainZap();
	UpdateChainZap();
	//return;	
}

function SetChainZap(RSNovaPrimaryFire FM)
{
	local bool bDoChange;
	local int i, j;

	i = 0;
	J0x07:

	// End:0xA5 [Loop If]
	if((i < FM.ChainVics.Length) && i < 6)
	{
		// End:0x9B
		if(FM.ChainVics[i].ZapVic != none)
		{
			// End:0x94
			if((j >= int(ChainVicNum)) || FM.ChainVics[i].ZapVic != ChainVics[j])
			{
				bDoChange = true;
				// [Explicit Break]
				goto J0xA5;
			}
			j++;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	J0xA5:

	// End:0x13B
	if(bDoChange)
	{
		ChainVicNum = 0;
		i = 0;
		J0xBD:

		// End:0x13B [Loop If]
		if((i < FM.ChainVics.Length) && i < 6)
		{
			// End:0x131
			if(FM.ChainVics[i].ZapVic != none)
			{
				ChainVics[int(ChainVicNum)] = FM.ChainVics[i].ZapVic;
				ChainVicNum++;
			}
			i++;
			// [Loop Continue]
			goto J0xBD;
		}
	}
	ChainZapCount++;
	// End:0x161
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		ClientDoChainZap();
	}
	//return;	
}

simulated function SetFreeChainZap()
{
	// End:0x3B
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		FreeChainZapCount++;
	}
	// End:0x56
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	xPawn(Instigator).StartFiring(bHeavy, true);
	StartMuzzleZap();
	KillChainZap();
	// End:0xA7
	if(FreeChainZap == none)
	{
		FreeChainZap = Spawn(Class'BallisticProV55.RSNova_FreeChainZap', self);
		AttachToBone(FreeChainZap, 'tip');
	}
	// End:0xDC
	if((int(Level.NetMode) == int(NM_Client)) && NovaStaff != none)
	{
		NovaStaff.SetFreeChainZap();
	}
	//return;	
}

simulated function KillChainZaps()
{
	// End:0x17
	if(int(Role) == int(ROLE_Authority))
	{
		KillChainZapsCount++;
	}
	// End:0x32
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	xPawn(Instigator).StopFiring();
	StopMuzzleZap();
	KillChainZap();
	KillFreeChainZap();
	// End:0x8D
	if((int(Level.NetMode) == int(NM_Client)) && NovaStaff != none)
	{
		NovaStaff.KillChainZaps();
	}
	//return;	
}

simulated function KillChainZap()
{
	local int i;

	ChainVicNum = 0;
	i = 0;
	J0x0F:

	// End:0x4F [Loop If]
	if(i < ChainLinks.Length)
	{
		// End:0x45
		if(ChainLinks[i] != none)
		{
			ChainLinks[i].Kill();
		}
		i++;
		// [Loop Continue]
		goto J0x0F;
	}
	ChainLinks.Length = 0;
	//return;	
}

simulated function KillFreeChainZap()
{
	// End:0x56
	if(FreeChainZap != none)
	{
		FreeChainZap.Kill();
		FreeChainZap = none;
		// End:0x56
		if((int(Level.NetMode) == int(NM_Client)) && NovaStaff != none)
		{
			NovaStaff.KillFreeChainZap();
		}
	}
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x38
	if((i != none) && RSNovaStaff(i) != none)
	{
		NovaStaff = RSNovaStaff(i);
	}
	//return;	
}

simulated function SetTargetZap(Actor targ, bool bHeal)
{
	// End:0x53
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		bHealing = bHeal;
		ZapTarget = targ;
		TargZapCount++;
	}
	// End:0x6E
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	xPawn(Instigator).StartFiring(bHeavy, true);
	StartMuzzleZap();
	KillFreeZap();
	// End:0xEB
	if(TargetZap == none)
	{
		TargetZap = Spawn(Class'BallisticProV55.RSNova_TrackingZap', self);
		AttachToBone(TargetZap, 'tip');
		TargetZap.SetTarget(targ, bHeal);
		TargetZap.UpdateTargets();		
	}
	else
	{
		TargetZap.SetTarget(targ, bHeal);
	}
	//return;	
}

simulated function SetFreeZap()
{
	// End:0x3B
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		FreeZapCount++;
	}
	// End:0x56
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	xPawn(Instigator).StartFiring(bHeavy, true);
	StartMuzzleZap();
	KillTargetZap();
	// End:0xAD
	if(FreeZap == none)
	{
		FreeZap = Spawn(Class'BallisticProV55.RSNova_FreeZap', self);
		UpdateFreeZap();
		AttachToBone(FreeZap, 'tip');
	}
	// End:0xE2
	if((int(Level.NetMode) == int(NM_Client)) && NovaStaff != none)
	{
		NovaStaff.SetFreeZap();
	}
	//return;	
}

simulated function KillZap()
{
	// End:0x17
	if(int(Role) == int(ROLE_Authority))
	{
		KillZapCount++;
	}
	// End:0x32
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	xPawn(Instigator).StopFiring();
	StopMuzzleZap();
	KillTargetZap();
	KillFreeZap();
	// End:0x8D
	if((int(Level.NetMode) == int(NM_Client)) && NovaStaff != none)
	{
		NovaStaff.KillZap();
	}
	//return;	
}

simulated function KillTargetZap()
{
	// End:0x30
	if(TargetZap != none)
	{
		TargetZap.KillFlashes();
		TargetZap.Kill();
		TargetZap = none;
	}
	//return;	
}

simulated function KillFreeZap()
{
	// End:0x56
	if(FreeZap != none)
	{
		FreeZap.Kill();
		FreeZap = none;
		// End:0x56
		if((int(Level.NetMode) == int(NM_Client)) && NovaStaff != none)
		{
			NovaStaff.KillFreeZap();
		}
	}
	//return;	
}

simulated function StartMuzzleZap()
{
	// End:0x36
	if(MuzzleFlash == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, Class'BallisticProV55.RSNovaLightMuzzleFlash', DrawScale * FlashScale, self, 'tip');
	}
	//return;	
}

simulated function StopMuzzleZap()
{
	// End:0x26
	if(MuzzleFlash != none)
	{
		Emitter(MuzzleFlash).Kill();
		MuzzleFlash = none;
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x2C
	if((Instigator != none) && Instigator.IsFirstPerson())
	{
		return;
	}
	// End:0xE4
	if(bRampage && Wings != none)
	{
		// End:0x91
		if(bWingDown)
		{
			WingPhase += (dt * float(2));
			// End:0x8E
			if(WingPhase >= 1.0000000)
			{
				WingPhase = 1.0000000;
				bWingDown = false;
				PlaySound(WingSound, 0, 1.0000000);
			}			
		}
		else
		{
			WingPhase -= (dt * float(4));
			// End:0xC5
			if(WingPhase <= -1.0000000)
			{
				WingPhase = -1.0000000;
				bWingDown = true;
			}
		}
		// End:0xE4
		if(Wings != none)
		{
			Wings.UpdateWings(WingPhase);
		}
	}
	// End:0x133
	if(TargetZap != none)
	{
		// End:0x124
		if(TargetZap.Base != self)
		{
			AttachToBone(TargetZap, 'tip');
			TargetZap.bHidden = false;
		}
		TargetZap.UpdateTargets();
	}
	UpdateFreeZap();
	UpdateChainZap();
	//return;	
}

simulated function UpdateFreeZap()
{
	local Vector End, X, Y, Z;

	// End:0x278
	if(FreeZap != none)
	{
		GetAxes(Instigator.GetViewRotation(), X, Y, Z);
		End = X * float(1000);
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(End, End);
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.X.Min -= (float(500) * Abs(X.Z));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.X.Max += (float(500) * Abs(X.Z));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Y.Min -= (float(500) * Abs(X.X));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Y.Max += (float(500) * Abs(X.X));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Z.Min -= (float(500) * (float(1) - Abs(X.Z)));
		BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset.Z.Max += (float(500) * (float(1) - Abs(X.Z)));
		BeamEmitter(FreeZap.Emitters[2]).BeamEndPoints[0].offset = BeamEmitter(FreeZap.Emitters[0]).BeamEndPoints[0].offset;
	}
	//return;	
}

simulated function Destroyed()
{
	local int i;

	// End:0x1A
	if(FreeZap != none)
	{
		FreeZap.Kill();
	}
	// End:0x43
	if(TargetZap != none)
	{
		TargetZap.KillFlashes();
		TargetZap.Kill();
	}
	// End:0x5A
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	// End:0x71
	if(FastMuzzleFlash != none)
	{
		FastMuzzleFlash.Destroy();
	}
	// End:0x88
	if(Wings != none)
	{
		Wings.Destroy();
	}
	// End:0xA2
	if(FreeChainZap != none)
	{
		FreeChainZap.Kill();
	}
	i = 0;
	J0xA9:

	// End:0xE9 [Loop If]
	if(i < ChainLinks.Length)
	{
		// End:0xDF
		if(ChainLinks[i] != none)
		{
			ChainLinks[i].Kill();
		}
		i++;
		// [Loop Continue]
		goto J0xA9;
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	WingSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Flying'
	WeaponClass=Class'BallisticProV55.RSNovaStaff'
	MuzzleFlashClass=Class'BallisticProV55.RSNovaLightMuzzleFlash'
	AltMuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	ImpactManager=Class'BallisticProV55.IM_NovaStaffBlades'
	FlashScale=0.4500000
	BrassMode=3
	InstantMode=1
	LightMode=2
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.8000000
	TrackNum[1]=0
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.NovaStaff_TPm'
	DrawScale=0.6500000
}
