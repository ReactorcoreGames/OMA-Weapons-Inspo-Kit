class Weapon extends Inventory
	abstract
	native
	nativereplication
	config
	notplaceable
	hidedropdown
	cacheexempt;

const NUM_FIRE_MODES = 2;

enum EWeaponClientState
{
	WS_None,                        // 0
	WS_Hidden,                      // 1
	WS_BringUp,                     // 2
	WS_PutDown,                     // 3
	WS_ReadyToFire                  // 4
};

var() Class<WeaponFire> FireModeClass[2];
var() protected WeaponFire FireMode[2];
var() protected Ammunition Ammo[2];
var() name IdleAnim;
var() name RestAnim;
var() name AimAnim;
var() name RunAnim;
var() name SelectAnim;
var() name PutDownAnim;
var() float IdleAnimRate;
var() float RestAnimRate;
var() float AimAnimRate;
var() float RunAnimRate;
var() float SelectAnimRate;
var() float PutDownAnimRate;
var float PutDownTime;
var float BringUpTime;
var() Sound SelectSound;
var() string SelectForce;
var() int BotMode;
var() float AIRating;
var float CurrentRating;
var() bool bMeleeWeapon;
var() bool bSniping;
var bool bShowChargingBar;
var bool bMatchWeapons;
var() bool bCanThrow;
var() bool bForceSwitch;
var() deprecated bool bNotInPriorityList;
var bool bNotInDemo;
var bool bNoVoluntarySwitch;
var bool bSpectated;
var bool bDebugging;
var bool bNoInstagibReplace;
var bool bInitOldMesh;
var config bool bUseOldWeaponMesh;
var bool bEndOfRound;
var bool bNoAmmoInstances;
var bool bBerserk;
var int AmmoCharge[2];
var Class<Ammunition> AmmoClass[2];
var Mesh OldMesh;
var string OldPickup;
var(OldFirstPerson) float OldDrawScale;
var(OldFirstPerson) float OldCenteredOffsetY;
var(OldFirstPerson) Vector OldPlayerViewOffset;
var(OldFirstPerson) Vector OldSmallViewOffset;
var(OldFirstPerson) Rotator OldPlayerViewPivot;
var(OldFirstPerson) int OldCenteredRoll;
var(OldFirstPerson) int OldCenteredYaw;
var() localized cache string Description;
var Class<Weapon> DemoReplacement;
var transient bool bPendingSwitch;
var(FirstPerson) Vector EffectOffset;
var() localized string MessageNoAmmo;
var(FirstPerson) float DisplayFOV;
var() Weapon.EWeaponClientState ClientState;
var() config byte ExchangeFireModes;
var() config byte Priority;
var() deprecated byte DefaultPriority;
var float hand;
var float RenderedHand;
var Color HudColor;
var Weapon OldWeapon;
var(FirstPerson) Vector SmallViewOffset;
var(FirstPerson) Vector SmallEffectOffset;
var(FirstPerson) float CenteredOffsetY;
var(FirstPerson) int CenteredRoll;
var(FirstPerson) int CenteredYaw;
var config int CustomCrosshair;
var config Color CustomCrossHairColor;
var config float CustomCrossHairScale;
var config string CustomCrossHairTextureName;
var Texture CustomCrossHairTexture;
var float DownDelay;
var float MinReloadPct;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Ammo, AmmoCharge;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientForceAmmoUpdate, ClientWeaponSet, 
		ClientWeaponThrown, ClientWriteFire, 
		ClientWriteStats;

	// Pos:0x01A
	reliable if(int(Role) < int(ROLE_Authority))
		ServerStartFire, ServerStopFire;
}

// Export UWeapon::execInitWeaponFires(FFrame&, void* const)
native final function InitWeaponFires();

simulated function float ChargeBar()
{
	//return;	
}

simulated function Class<Ammunition> GetAmmoClass(int Mode)
{
	return AmmoClass[Mode];
	//return;	
}

simulated function MaxOutAmmo()
{
	// End:0x58
	if(bNoAmmoInstances)
	{
		// End:0x25
		if(AmmoClass[0] != none)
		{
			AmmoCharge[0] = MaxAmmo(0);
		}
		// End:0x56
		if((AmmoClass[1] != none) && AmmoClass[0] != AmmoClass[1])
		{
			AmmoCharge[1] = MaxAmmo(1);
		}
		return;
	}
	// End:0x86
	if(Ammo[0] != none)
	{
		Ammo[0].AmmoAmount = Ammo[0].MaxAmmo;
	}
	// End:0xB4
	if(Ammo[1] != none)
	{
		Ammo[1].AmmoAmount = Ammo[1].MaxAmmo;
	}
	//return;	
}

simulated function SuperMaxOutAmmo()
{
	// End:0x54
	if(bNoAmmoInstances)
	{
		// End:0x23
		if(AmmoClass[0] != none)
		{
			AmmoCharge[0] = 999;
		}
		// End:0x52
		if((AmmoClass[1] != none) && AmmoClass[0] != AmmoClass[1])
		{
			AmmoCharge[1] = 999;
		}
		return;
	}
	// End:0x77
	if(Ammo[0] != none)
	{
		Ammo[0].AmmoAmount = 999;
	}
	// End:0x9A
	if(Ammo[1] != none)
	{
		Ammo[1].AmmoAmount = 999;
	}
	//return;	
}

simulated function int MaxAmmo(int Mode)
{
	// End:0x26
	if(AmmoClass[Mode] != none)
	{
		return AmmoClass[Mode].default.MaxAmmo;
	}
	return 0;
	//return;	
}

simulated function FillToInitialAmmo()
{
	// End:0x7C
	if(bNoAmmoInstances)
	{
		// End:0x37
		if(AmmoClass[0] != none)
		{
			AmmoCharge[0] = Max(AmmoCharge[0], AmmoClass[0].default.InitialAmount);
		}
		// End:0x7A
		if((AmmoClass[1] != none) && AmmoClass[0] != AmmoClass[1])
		{
			AmmoCharge[1] = Max(AmmoCharge[1], AmmoClass[1].default.InitialAmount);
		}
		return;
	}
	// End:0xBC
	if(Ammo[0] != none)
	{
		Ammo[0].AmmoAmount = Max(Ammo[0].AmmoAmount, Ammo[0].InitialAmount);
	}
	// End:0xFC
	if(Ammo[1] != none)
	{
		Ammo[1].AmmoAmount = Max(Ammo[1].AmmoAmount, Ammo[1].InitialAmount);
	}
	//return;	
}

simulated function int AmmoAmount(int Mode)
{
	// End:0x34
	if(bNoAmmoInstances)
	{
		// End:0x28
		if(AmmoClass[0] == AmmoClass[Mode])
		{
			return AmmoCharge[0];
		}
		return AmmoCharge[Mode];
	}
	// End:0x5A
	if(Ammo[Mode] != none)
	{
		return Ammo[Mode].AmmoAmount;
	}
	return 0;
	//return;	
}

simulated function Class<Pickup> AmmoPickupClass(int Mode)
{
	// End:0x2F
	if(AmmoClass[Mode] != none)
	{
		return FireMode[Mode].AmmoClass.default.PickupClass;
	}
	return none;
	//return;	
}

simulated function bool AmmoMaxed(int Mode)
{
	// End:0x13
	if(AmmoClass[Mode] == none)
	{
		return false;
	}
	// End:0x53
	if(bNoAmmoInstances)
	{
		// End:0x3A
		if(AmmoClass[0] == AmmoClass[Mode])
		{
			Mode = 0;
		}
		return AmmoCharge[Mode] >= (MaxAmmo(Mode));
	}
	// End:0x66
	if(Ammo[Mode] == none)
	{
		return false;
	}
	return Ammo[Mode].AmmoAmount >= (MaxAmmo(Mode));
	//return;	
}

simulated function GetAmmoCount(out float MaxAmmoPrimary, out float CurAmmoPrimary)
{
	// End:0x0F
	if(AmmoClass[0] == none)
	{
		return;
	}
	// End:0x38
	if(bNoAmmoInstances)
	{
		MaxAmmoPrimary = float(MaxAmmo(0));
		CurAmmoPrimary = float(AmmoCharge[0]);
		return;
	}
	// End:0x47
	if(Ammo[0] == none)
	{
		return;
	}
	MaxAmmoPrimary = float(Ammo[0].MaxAmmo);
	CurAmmoPrimary = float(Ammo[0].AmmoAmount);
	//return;	
}

simulated function float AmmoStatus(optional int Mode)
{
	// End:0x5B
	if(bNoAmmoInstances)
	{
		// End:0x20
		if(AmmoClass[Mode] == none)
		{
			return 0.0000000;
		}
		// End:0x3E
		if(AmmoClass[0] == AmmoClass[Mode])
		{
			Mode = 0;
		}
		return float(AmmoCharge[Mode]) / float(MaxAmmo(Mode));
	}
	// End:0x75
	if(Ammo[Mode] == none)
	{
		return 0.0000000;		
	}
	else
	{
		return float(Ammo[Mode].AmmoAmount) / float(Ammo[Mode].MaxAmmo);
	}
	//return;	
}

simulated function bool ConsumeAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	local int AmountNeeded;

	// End:0xE9
	if(bNoAmmoInstances)
	{
		// End:0x27
		if(AmmoClass[0] == AmmoClass[Mode])
		{
			Mode = 0;
		}
		AmountNeeded = int(load);
		// End:0x65
		if(bAmountNeededIsMax && AmmoCharge[Mode] < AmountNeeded)
		{
			AmountNeeded = AmmoCharge[Mode];
		}
		// End:0x82
		if(AmmoCharge[Mode] < AmountNeeded)
		{
			CheckOutOfAmmo();
			return false;
		}
		AmmoCharge[Mode] -= AmountNeeded;
		NetUpdateTime = Level.TimeSeconds - float(1);
		// End:0xE7
		if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_ListenServer))
		{
			CheckOutOfAmmo();
		}
		return true;
	}
	// End:0x11D
	if(Ammo[Mode] != none)
	{
		return Ammo[Mode].UseAmmo(int(load), bAmountNeededIsMax);
	}
	return true;
	//return;	
}

function bool AddAmmo(int AmmoToAdd, int Mode)
{
	// End:0xC3
	if(bNoAmmoInstances)
	{
		// End:0x27
		if(AmmoClass[0] == AmmoClass[Mode])
		{
			Mode = 0;
		}
		// End:0x62
		if(Level.GRI.WeaponBerserk > 1.0000000)
		{
			AmmoCharge[Mode] = MaxAmmo(Mode);			
		}
		else
		{
			// End:0xA8
			if(AmmoCharge[Mode] < (MaxAmmo(Mode)))
			{
				AmmoCharge[Mode] = Min(MaxAmmo(Mode), AmmoCharge[Mode] + AmmoToAdd);
			}
		}
		NetUpdateTime = Level.TimeSeconds - float(1);
		return true;
	}
	// End:0xEF
	if(Ammo[Mode] != none)
	{
		return Ammo[Mode].AddAmmo(AmmoToAdd);
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0xC8
	if(bNoAmmoInstances)
	{
		// End:0x54
		if(AmmoClass[0] == AmmoClass[1])
		{
			return ((AmmoClass[0] != none) && FireMode[0] != none) && AmmoCharge[0] >= FireMode[0].AmmoPerFire;
		}
		return (((AmmoClass[0] != none) && FireMode[0] != none) && AmmoCharge[0] >= FireMode[0].AmmoPerFire) || ((AmmoClass[1] != none) && FireMode[1] != none) && AmmoCharge[1] >= FireMode[1].AmmoPerFire;
	}
	return (((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire) || ((Ammo[1] != none) && FireMode[1] != none) && Ammo[1].AmmoAmount >= FireMode[1].AmmoPerFire;
	//return;	
}

simulated function bool NeedAmmo(int Mode)
{
	// End:0x5C
	if(bNoAmmoInstances)
	{
		// End:0x27
		if(AmmoClass[0] == AmmoClass[Mode])
		{
			Mode = 0;
		}
		// End:0x3A
		if(AmmoClass[Mode] == none)
		{
			return false;
		}
		return AmmoCharge[Mode] < AmmoClass[Mode].default.InitialAmount;
	}
	// End:0x98
	if(Ammo[Mode] != none)
	{
		return Ammo[Mode].AmmoAmount < Ammo[Mode].InitialAmount;
	}
	return false;
	//return;	
}

simulated function float DesireAmmo(Class<Inventory> NewAmmoClass, bool bDetour)
{
	local int i;
	local float curr, Max;

	i = 0;
	J0x07:

	// End:0x9A [Loop If]
	if(i < 2)
	{
		// End:0x90
		if(NewAmmoClass == AmmoClass[i])
		{
			// End:0x3C
			if(AmmoMaxed(i))
			{
				return -100.0000000;
			}
			curr = float(AmmoAmount(i));
			// End:0x62
			if(curr == float(0))
			{
				return 1.0000000;
			}
			Max = float(MaxAmmo(i));
			return (2.0000000 * (Max - curr)) / Max;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return 0.0000000;
	//return;	
}

simulated function CheckOutOfAmmo()
{
	// End:0x8A
	if((Instigator != none) && Instigator.Weapon == self)
	{
		// End:0x4E
		if(bNoAmmoInstances)
		{
			// End:0x4C
			if((AmmoCharge[0] <= 0) && AmmoCharge[1] <= 0)
			{
				OutOfAmmo();
			}
			return;
		}
		// End:0x6C
		if(Ammo[0] != none)
		{
			Ammo[0].CheckOutOfAmmo();
		}
		// End:0x8A
		if(Ammo[1] != none)
		{
			Ammo[1].CheckOutOfAmmo();
		}
	}
	//return;	
}

simulated function PostNetReceive()
{
	CheckOutOfAmmo();
	//return;	
}

simulated function DrawWeaponInfo(Canvas C)
{
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	//return;	
}

simulated function DrawWeaponInfo3(Canvas C, float XPos, float YPos)
{
	//return;	
}

function StartDebugging()
{
	//return;	
}

simulated function ClientWriteStats(byte Mode, bool bMatch, bool bAllowFire, bool bDelay, bool bAlt, float Wait)
{
	Log((((((((((((string(self) $ " Same weapon ") $ string(bMatch)) $ " Mode ") $ string(Mode)) $ " Allow fire ") $ string(bAllowFire)) $ " delay start fire ") $ string(bDelay)) $ " alt firing ") $ string(bAlt)) $ " next fire wait ") $ string(Wait));
	//return;	
}

function Class<DamageType> GetDamageType()
{
	//return;	
}

function HackPlayFireSound()
{
	// End:0x3F
	if((FireMode[0] != none) && FireMode[0].FireSound != none)
	{
		PlaySound(FireMode[0].FireSound, 0, 1.0000000);
	}
	//return;	
}

function float RangedAttackTime()
{
	return 0.0000000;
	//return;	
}

function bool RecommendRangedAttack()
{
	return false;
	//return;	
}

function bool RecommendLongRangedAttack()
{
	return false;
	//return;	
}

function bool FocusOnLeader(bool bLeaderFiring)
{
	return false;
	//return;	
}

function FireHack(byte Mode)
{
	//return;	
}

function bool SplashDamage()
{
	return FireMode[BotMode].bSplashDamage;
	//return;	
}

function bool RecommendSplashDamage()
{
	return FireMode[BotMode].bRecommendSplashDamage;
	//return;	
}

function float GetDamageRadius()
{
	// End:0x23
	if(FireMode[BotMode].ProjectileClass == none)
	{
		return 0.0000000;		
	}
	else
	{
		return FireMode[BotMode].ProjectileClass.default.DamageRadius;
	}
	//return;	
}

function float RefireRate()
{
	return FireMode[BotMode].BotRefireRate;
	//return;	
}

function bool FireOnRelease()
{
	return FireMode[BotMode].bFireOnRelease;
	//return;	
}

simulated function Loaded()
{
	//return;	
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	local int i;
	local string t;
	local name Anim;
	local float frame, Rate;

	Canvas.SetDrawColor(0, byte(255), 0);
	// End:0x8E
	if((Pawn(Owner) != none) && Pawn(Owner).PlayerReplicationInfo != none)
	{
		Canvas.DrawText((("WEAPON " $ (GetItemName(string(self)))) $ " Owner ") $ Pawn(Owner).PlayerReplicationInfo.PlayerName);		
	}
	else
	{
		Canvas.DrawText((("WEAPON " $ (GetItemName(string(self)))) $ " Owner ") $ string(Owner));
	}
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	t = ((("     STATE: " $ string(GetStateName())) $ " Timer: ") $ string(TimerCounter)) $ " Client State ";
	switch(ClientState)
	{
		// End:0x14B
		case 0:
			t = t $ "None";
			// End:0x1C9
			break;
		// End:0x168
		case 1:
			t = t $ "Hidden";
			// End:0x1C9
			break;
		// End:0x186
		case 2:
			t = t $ "BringUp";
			// End:0x1C9
			break;
		// End:0x1A4
		case 3:
			t = t $ "PutDown";
			// End:0x1C9
			break;
		// End:0x1C6
		case 4:
			t = t $ "ReadyToFire";
			// End:0x1C9
			break;
		// End:0xFFFF
		default:
			break;
	}
	Canvas.DrawText(t, false);
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	// End:0x25C
	if(int(DrawType) == int(8))
	{
		Canvas.DrawText((("     StaticMesh " $ (GetItemName(string(StaticMesh)))) $ " AmbientSound ") $ string(AmbientSound), false);		
	}
	else
	{
		Canvas.DrawText((("     Mesh " $ (GetItemName(string(Mesh)))) $ " AmbientSound ") $ string(AmbientSound), false);
	}
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	// End:0x46B
	if(Mesh != none)
	{
		GetAnimParams(0, Anim, frame, Rate);
		t = (((("     AnimSequence " $ string(Anim)) $ " Frame ") $ string(frame)) $ " Rate ") $ string(Rate);
		// End:0x355
		if(bAnimByOwner)
		{
			t = t $ " Anim by Owner";
		}
		Canvas.DrawText(t, false);
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);
		t = (((((((("Eyeheight " $ string(Instigator.EyeHeight)) $ " base ") $ string(Instigator.BaseEyeHeight)) $ " landbob ") $ string(Instigator.LandBob)) $ " just landed ") $ string(Instigator.bJustLanded)) $ " land recover ") $ string(Instigator.bLandRecovery);
		Canvas.DrawText(t, false);
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);
	}
	i = 0;
	J0x472:

	// End:0x56A [Loop If]
	if(i < 2)
	{
		// End:0x4DA
		if(FireMode[i] == none)
		{
			Canvas.DrawText("NO FIREMODE " $ string(i));
			YPos += YL;
			Canvas.SetPos(4.0000000, YPos);			
		}
		else
		{
			FireMode[i].DisplayDebug(Canvas, YL, YPos);
		}
		Canvas.DrawText((("Ammunition " $ string(i)) $ " amount ") $ string(AmmoAmount(i)));
		YPos += YL;
		Canvas.SetPos(4.0000000, YPos);
		i++;
		// [Loop Continue]
		goto J0x472;
	}
	//return;	
}

simulated function Weapon RecommendWeapon(out float rating)
{
	local Weapon Recommended;
	local float oldRating;

	// End:0x2F
	if((Instigator == none) || Instigator.Controller == none)
	{
		rating = -2.0000000;		
	}
	else
	{
		rating = (RateSelf()) + Instigator.Controller.WeaponPreference(self);
	}
	// End:0xA8
	if(Inventory != none)
	{
		Recommended = Inventory.RecommendWeapon(oldRating);
		// End:0xA8
		if((Recommended != none) && oldRating > rating)
		{
			rating = oldRating;
			return Recommended;
		}
	}
	return self;
	//return;	
}

function SetAITarget(Actor t)
{
	//return;	
}

function byte BestMode()
{
	// End:0x25
	if(int(Instigator.Controller.bFire) != 0)
	{
		return 0;		
	}
	else
	{
		// End:0x47
		if(int(Instigator.Controller.bAltFire) != 0)
		{
			return 1;
		}
	}
	// End:0x56
	if(FRand() < 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

function bool BotFire(bool bFinished, optional name FiringMode)
{
	local int newmode;
	local Controller C;

	C = Instigator.Controller;
	newmode = int(BestMode());
	// End:0x52
	if(newmode == 0)
	{
		C.bFire = 1;
		C.bAltFire = 0;		
	}
	else
	{
		C.bFire = 0;
		C.bAltFire = 1;
	}
	// End:0x7F
	if(bFinished)
	{
		return true;
	}
	// End:0xB6
	if(FireMode[BotMode].IsFiring())
	{
		// End:0xAB
		if(BotMode == newmode)
		{
			return true;			
		}
		else
		{
			StopFire(BotMode);
		}
	}
	// End:0xDA
	if(!ReadyToFire(newmode) || int(ClientState) != int(4))
	{
		return false;
	}
	BotMode = newmode;
	StartFire(newmode);
	return true;
	//return;	
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
	return FireMode[BotMode].GetFireStart(X, Y, Z);
	//return;	
}

simulated function float RateSelf()
{
	// End:0x19
	if(!HasAmmo())
	{
		CurrentRating = -2.0000000;		
	}
	else
	{
		// End:0x36
		if(Instigator.Controller == none)
		{
			return 0.0000000;			
		}
		else
		{
			CurrentRating = Instigator.Controller.RateWeapon(self);
		}
	}
	return CurrentRating;
	//return;	
}

function float GetAIRating()
{
	return AIRating;
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

function bool SplashJump()
{
	return FireMode[BotMode].bSplashJump;
	//return;	
}

function bool CanAttack(Actor Other)
{
	local float Dist, CheckDist;
	local Vector HitLocation, HitNormal, X, Y, Z, projStart;

	local Actor HitActor;
	local int M;
	local bool bInstantHit;

	// End:0x30
	if(((Instigator == none) || Instigator.Controller == none) || Other == none)
	{
		return false;
	}
	Dist = VSize(Instigator.Location - Other.Location);
	// End:0x90
	if((Dist > FireMode[0].MaxRange()) && Dist > FireMode[1].MaxRange())
	{
		return false;
	}
	// End:0xB1
	if(!Instigator.Controller.LineOfSightTo(Other))
	{
		return false;
	}
	M = 0;
	J0xB8:

	// End:0x158 [Loop If]
	if(M < 2)
	{
		// End:0xE7
		if(FireMode[M].bInstantHit)
		{
			bInstantHit = true;
			// [Explicit Continue]
			goto J0x14E;
		}
		CheckDist = FMax(CheckDist, 0.5000000 * FireMode[M].ProjectileClass.default.Speed);
		CheckDist = FMax(CheckDist, 300.0000000);
		CheckDist = FMin(CheckDist, VSize(Other.Location - Location));
		J0x14E:

		M++;
		// [Loop Continue]
		goto J0xB8;
	}
	GetAxes(Instigator.Controller.Rotation, X, Y, Z);
	projStart = GetFireStart(X, Y, Z);
	// End:0x1ED
	if(bInstantHit)
	{
		HitActor = Trace(HitLocation, HitNormal, Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000)), projStart, true);		
	}
	else
	{
		HitActor = Trace(HitLocation, HitNormal, projStart + (CheckDist * Normal((Other.Location + (Other.CollisionHeight * vect(0.0000000, 0.0000000, 0.8000000))) - Location)), projStart, true);
	}
	// End:0x268
	if((HitActor == none) || HitActor == Other)
	{
		return true;
	}
	// End:0x28F
	if(Pawn(HitActor) == none)
	{
		return !HitActor.BlocksShotAt(Other);
	}
	// End:0x2DC
	if((Pawn(HitActor).Controller == none) || !Instigator.Controller.SameTeamAs(Pawn(HitActor).Controller))
	{
		return true;
	}
	return false;
	//return;	
}

simulated function PostBeginPlay()
{
	local int M;

	super(Actor).PostBeginPlay();
	M = 0;
	J0x0D:

	// End:0x80 [Loop If]
	if(M < 2)
	{
		// End:0x76
		if(FireModeClass[M] != none)
		{
			FireMode[M] = new (self) FireModeClass[M];
			// End:0x76
			if(FireMode[M] != none)
			{
				AmmoClass[M] = FireMode[M].AmmoClass;
			}
		}
		M++;
		// [Loop Continue]
		goto J0x0D;
	}
	InitWeaponFires();
	M = 0;
	J0x8D:

	// End:0x197 [Loop If]
	if(M < 2)
	{
		// End:0x18D
		if(FireMode[M] != none)
		{
			FireMode[M].ThisModeNum = M;
			FireMode[M].Weapon = self;
			FireMode[M].Instigator = Instigator;
			FireMode[M].Level = Level;
			FireMode[M].Owner = self;
			FireMode[M].PreBeginPlay();
			FireMode[M].BeginPlay();
			FireMode[M].PostBeginPlay();
			FireMode[M].SetInitialState();
			FireMode[M].PostNetBeginPlay();
		}
		M++;
		// [Loop Continue]
		goto J0x8D;
	}
	// End:0x1D7
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		MaxLights = byte(Min(4, int(MaxLights)));
	}
	// End:0x1F9
	if(SmallViewOffset == vect(0.0000000, 0.0000000, 0.0000000))
	{
		SmallViewOffset = default.PlayerViewOffset;
	}
	// End:0x229
	if(SmallEffectOffset == vect(0.0000000, 0.0000000, 0.0000000))
	{
		SmallEffectOffset = (EffectOffset + default.PlayerViewOffset) - SmallViewOffset;
	}
	// End:0x252
	if(bUseOldWeaponMesh && OldMesh != none)
	{
		bInitOldMesh = true;
		LinkMesh(OldMesh);
	}
	// End:0x26C
	if(Level.GRI != none)
	{
		CheckSuperBerserk();
	}
	//return;	
}

simulated function SetGRI(GameReplicationInfo G)
{
	CheckSuperBerserk();
	//return;	
}

simulated function Destroyed()
{
	local int M;

	AmbientSound = none;
	M = 0;
	J0x0E:

	// End:0x7A [Loop If]
	if(M < 2)
	{
		// End:0x40
		if(FireMode[M] != none)
		{
			FireMode[M].DestroyEffects();
		}
		// End:0x70
		if(Ammo[M] != none)
		{
			Ammo[M].Destroy();
			Ammo[M] = none;
		}
		M++;
		// [Loop Continue]
		goto J0x0E;
	}
	super.Destroyed();
	//return;	
}

simulated function Reselect()
{
	//return;	
}

simulated function bool WeaponCentered()
{
	return bSpectated || hand > float(1);
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local int M;
	local Vector NewScale3D;
	local Rotator CenteredRotation;
	local name AnimSeq;
	local float frame, Rate;

	// End:0x0D
	if(Instigator == none)
	{
		return;
	}
	// End:0x3E
	if(Instigator.Controller != none)
	{
		hand = Instigator.Controller.Handedness;
	}
	// End:0x60
	if((hand < -1.0000000) || hand > 1.0000000)
	{
		return;
	}
	M = 0;
	J0x67:

	// End:0xA8 [Loop If]
	if(M < 2)
	{
		// End:0x9E
		if(FireMode[M] != none)
		{
			FireMode[M].DrawMuzzleFlash(Canvas);
		}
		M++;
		// [Loop Continue]
		goto J0x67;
	}
	// End:0x11E
	if((OldMesh != none) && bUseOldWeaponMesh != (OldMesh == Mesh))
	{
		GetAnimParams(0, AnimSeq, frame, Rate);
		bInitOldMesh = true;
		// End:0x101
		if(bUseOldWeaponMesh)
		{
			LinkMesh(OldMesh);			
		}
		else
		{
			LinkMesh(default.Mesh);
		}
		PlayAnim(AnimSeq, Rate, 0.0000000);
	}
	// End:0x337
	if((hand != RenderedHand) || bInitOldMesh)
	{
		NewScale3D = default.DrawScale3D;
		// End:0x161
		if(hand != float(0))
		{
			NewScale3D.Y *= hand;
		}
		SetDrawScale3D(NewScale3D);
		SetDrawScale(default.DrawScale);
		CenteredRoll = default.CenteredRoll;
		CenteredYaw = default.CenteredYaw;
		CenteredOffsetY = default.CenteredOffsetY;
		PlayerViewPivot = default.PlayerViewPivot;
		SmallViewOffset = default.SmallViewOffset;
		// End:0x1D0
		if(SmallViewOffset == vect(0.0000000, 0.0000000, 0.0000000))
		{
			SmallViewOffset = default.PlayerViewOffset;
		}
		bInitOldMesh = false;
		// End:0x20B
		if(default.SmallEffectOffset == vect(0.0000000, 0.0000000, 0.0000000))
		{
			SmallEffectOffset = (EffectOffset + default.PlayerViewOffset) - SmallViewOffset;			
		}
		else
		{
			SmallEffectOffset = default.SmallEffectOffset;
		}
		// End:0x2B2
		if(Mesh == OldMesh)
		{
			SmallEffectOffset = (EffectOffset + OldPlayerViewOffset) - OldSmallViewOffset;
			PlayerViewPivot = OldPlayerViewPivot;
			SmallViewOffset = OldSmallViewOffset;
			// End:0x283
			if(hand != float(0))
			{
				PlayerViewPivot.Roll *= hand;
				PlayerViewPivot.Yaw *= hand;
			}
			CenteredRoll = OldCenteredRoll;
			CenteredYaw = OldCenteredYaw;
			CenteredOffsetY = OldCenteredOffsetY;
			SetDrawScale(OldDrawScale);			
		}
		else
		{
			// End:0x2EC
			if(hand == float(0))
			{
				PlayerViewPivot.Roll = default.PlayerViewPivot.Roll;
				PlayerViewPivot.Yaw = default.PlayerViewPivot.Yaw;				
			}
			else
			{
				PlayerViewPivot.Roll = int(float(default.PlayerViewPivot.Roll) * hand);
				PlayerViewPivot.Yaw = int(float(default.PlayerViewPivot.Yaw) * hand);
			}
		}
		RenderedHand = hand;
	}
	// End:0x357
	if(Class'Engine.PlayerController'.default.bSmallWeapons)
	{
		PlayerViewOffset = SmallViewOffset;		
	}
	else
	{
		// End:0x374
		if(Mesh == OldMesh)
		{
			PlayerViewOffset = OldPlayerViewOffset;			
		}
		else
		{
			PlayerViewOffset = default.PlayerViewOffset;
		}
	}
	// End:0x39F
	if(hand == float(0))
	{
		PlayerViewOffset.Y = CenteredOffsetY;		
	}
	else
	{
		PlayerViewOffset.Y *= hand;
	}
	SetLocation(Instigator.Location + Instigator.CalcDrawOffset(self));
	// End:0x421
	if(hand == float(0))
	{
		CenteredRotation = Instigator.GetViewRotation();
		CenteredRotation.Yaw += CenteredYaw;
		CenteredRotation.Roll = CenteredRoll;
		SetRotation(CenteredRotation);		
	}
	else
	{
		SetRotation(Instigator.GetViewRotation());
	}
	PreDrawFPWeapon();
	bDrawingFirstPerson = true;
	Canvas.DrawActor(self, false, false, DisplayFOV);
	bDrawingFirstPerson = false;
	// End:0x47A
	if(hand == float(0))
	{
		PlayerViewOffset.Y = 0.0000000;
	}
	//return;	
}

simulated function PreDrawFPWeapon()
{
	//return;	
}

simulated function SetHand(float InHand)
{
	hand = InHand;
	//return;	
}

simulated function GetViewAxes(out Vector XAxis, out Vector YAxis, out Vector ZAxis)
{
	// End:0x36
	if(Instigator.Controller == none)
	{
		GetAxes(Instigator.Rotation, XAxis, YAxis, ZAxis);		
	}
	else
	{
		GetAxes(Instigator.Controller.Rotation, XAxis, YAxis, ZAxis);
	}
	//return;	
}

simulated function Vector CenteredEffectStart()
{
	return Instigator.Location;
	//return;	
}

simulated function Vector GetEffectStart()
{
	local Vector X, Y, Z;

	// End:0x111
	if(Instigator.IsFirstPerson())
	{
		// End:0x22
		if(WeaponCentered())
		{
			return CenteredEffectStart();
		}
		GetViewAxes(X, Y, Z);
		// End:0xAD
		if(Class'Engine.PlayerController'.default.bSmallWeapons)
		{
			return (((Instigator.Location + Instigator.CalcDrawOffset(self)) + (SmallEffectOffset.X * X)) + ((SmallEffectOffset.Y * Y) * hand)) + (SmallEffectOffset.Z * Z);			
		}
		else
		{
			return (((Instigator.Location + Instigator.CalcDrawOffset(self)) + (EffectOffset.X * X)) + ((EffectOffset.Y * Y) * hand)) + (EffectOffset.Z * Z);
		}		
	}
	else
	{
		return (Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 0.5000000))) + (Vector(Instigator.Rotation) * 40.0000000);
	}
	//return;	
}

simulated function IncrementFlashCount(int Mode)
{
	// End:0x95
	if(WeaponAttachment(ThirdPersonActor) != none)
	{
		// End:0x34
		if(Mode == 0)
		{
			WeaponAttachment(ThirdPersonActor).FiringMode = 0;			
		}
		else
		{
			WeaponAttachment(ThirdPersonActor).FiringMode = 1;
		}
		ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
		WeaponAttachment(ThirdPersonActor).FlashCount++;
		WeaponAttachment(ThirdPersonActor).ThirdPersonEffects();
	}
	//return;	
}

simulated function ZeroFlashCount(int Mode)
{
	// End:0x96
	if(WeaponAttachment(ThirdPersonActor) != none)
	{
		// End:0x34
		if(Mode == 0)
		{
			WeaponAttachment(ThirdPersonActor).FiringMode = 0;			
		}
		else
		{
			WeaponAttachment(ThirdPersonActor).FiringMode = 1;
		}
		ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
		WeaponAttachment(ThirdPersonActor).FlashCount = 0;
		WeaponAttachment(ThirdPersonActor).ThirdPersonEffects();
	}
	//return;	
}

simulated function Weapon WeaponChange(byte F, bool bSilent)
{
	local Weapon newWeapon;

	// End:0xA8
	if(int(InventoryGroup) == int(F))
	{
		// End:0xA3
		if(!HasAmmo())
		{
			// End:0x33
			if(Inventory == none)
			{
				newWeapon = none;				
			}
			else
			{
				newWeapon = Inventory.WeaponChange(F, bSilent);
			}
			// End:0x9A
			if((!bSilent && newWeapon == none) && Instigator.IsHumanControlled())
			{
				Instigator.ClientMessage(ItemName $ MessageNoAmmo);
			}
			return newWeapon;			
		}
		else
		{
			return self;
		}		
	}
	else
	{
		// End:0xB8
		if(Inventory == none)
		{
			return none;			
		}
		else
		{
			return Inventory.WeaponChange(F, bSilent);
		}
	}
	//return;	
}

simulated function Weapon PrevWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x19C
	if(HasAmmo())
	{
		// End:0x29
		if(CurrentChoice == none)
		{
			// End:0x26
			if(CurrentWeapon != self)
			{
				CurrentChoice = self;
			}			
		}
		else
		{
			// End:0xA7
			if(int(InventoryGroup) == int(CurrentWeapon.InventoryGroup))
			{
				// End:0xA4
				if((int(GroupOffset) < int(CurrentWeapon.GroupOffset)) && (int(CurrentChoice.InventoryGroup) != int(InventoryGroup)) || int(GroupOffset) > int(CurrentChoice.GroupOffset))
				{
					CurrentChoice = self;
				}				
			}
			else
			{
				// End:0xE9
				if(int(InventoryGroup) == int(CurrentChoice.InventoryGroup))
				{
					// End:0xE6
					if(int(GroupOffset) > int(CurrentChoice.GroupOffset))
					{
						CurrentChoice = self;
					}					
				}
				else
				{
					// End:0x152
					if(int(InventoryGroup) > int(CurrentChoice.InventoryGroup))
					{
						// End:0x14F
						if((int(InventoryGroup) < int(CurrentWeapon.InventoryGroup)) || int(CurrentChoice.InventoryGroup) > int(CurrentWeapon.InventoryGroup))
						{
							CurrentChoice = self;
						}						
					}
					else
					{
						// End:0x19C
						if((int(CurrentChoice.InventoryGroup) > int(CurrentWeapon.InventoryGroup)) && int(InventoryGroup) < int(CurrentWeapon.InventoryGroup))
						{
							CurrentChoice = self;
						}
					}
				}
			}
		}
	}
	// End:0x1B0
	if(Inventory == none)
	{
		return CurrentChoice;		
	}
	else
	{
		return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
	}
	//return;	
}

simulated function Weapon NextWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x19C
	if(HasAmmo())
	{
		// End:0x29
		if(CurrentChoice == none)
		{
			// End:0x26
			if(CurrentWeapon != self)
			{
				CurrentChoice = self;
			}			
		}
		else
		{
			// End:0xA7
			if(int(InventoryGroup) == int(CurrentWeapon.InventoryGroup))
			{
				// End:0xA4
				if((int(GroupOffset) > int(CurrentWeapon.GroupOffset)) && (int(CurrentChoice.InventoryGroup) != int(InventoryGroup)) || int(GroupOffset) < int(CurrentChoice.GroupOffset))
				{
					CurrentChoice = self;
				}				
			}
			else
			{
				// End:0xE9
				if(int(InventoryGroup) == int(CurrentChoice.InventoryGroup))
				{
					// End:0xE6
					if(int(GroupOffset) < int(CurrentChoice.GroupOffset))
					{
						CurrentChoice = self;
					}					
				}
				else
				{
					// End:0x152
					if(int(InventoryGroup) < int(CurrentChoice.InventoryGroup))
					{
						// End:0x14F
						if((int(InventoryGroup) > int(CurrentWeapon.InventoryGroup)) || int(CurrentChoice.InventoryGroup) < int(CurrentWeapon.InventoryGroup))
						{
							CurrentChoice = self;
						}						
					}
					else
					{
						// End:0x19C
						if((int(CurrentChoice.InventoryGroup) < int(CurrentWeapon.InventoryGroup)) && int(InventoryGroup) > int(CurrentWeapon.InventoryGroup))
						{
							CurrentChoice = self;
						}
					}
				}
			}
		}
	}
	// End:0x1B0
	if(Inventory == none)
	{
		return CurrentChoice;		
	}
	else
	{
		return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
	}
	//return;	
}

function HolderDied()
{
	local int M;

	M = 0;
	J0x07:

	// End:0x6D [Loop If]
	if(M < 2)
	{
		// End:0x63
		if(FireMode[M].bIsFiring)
		{
			StopFire(M);
			// End:0x63
			if(FireMode[M].bFireOnRelease)
			{
				FireMode[M].ModeDoFire();
			}
		}
		M++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function bool CanThrow()
{
	local int Mode;

	Mode = 0;
	J0x07:

	// End:0x7A [Loop If]
	if(Mode < 2)
	{
		// End:0x47
		if(FireMode[Mode].bFireOnRelease && FireMode[Mode].bIsFiring)
		{
			return false;
		}
		// End:0x70
		if(FireMode[Mode].NextFireTime > Level.TimeSeconds)
		{
			return false;
		}
		Mode++;
		// [Loop Continue]
		goto J0x07;
	}
	return (bCanThrow && ((int(ClientState) == int(4)) || int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer)) && HasAmmo();
	//return;	
}

function DropFrom(Vector StartLocation)
{
	local int M;
	local Pickup Pickup;

	// End:0x1A
	if(!bCanThrow || !HasAmmo())
	{
		return;
	}
	ClientWeaponThrown();
	M = 0;
	J0x27:

	// End:0x60 [Loop If]
	if(M < 2)
	{
		// End:0x56
		if(FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x27;
	}
	// End:0x76
	if(Instigator != none)
	{
		DetachFromPawn(Instigator);
	}
	Pickup = Spawn(PickupClass,,, StartLocation);
	// End:0xE4
	if(Pickup != none)
	{
		Pickup.InitDroppedPickupFor(self);
		Pickup.Velocity = Velocity;
		// End:0xE4
		if(Instigator.Health > 0)
		{
			WeaponPickup(Pickup).bThrown = true;
		}
	}
	Destroy();
	//return;	
}

simulated function DetachFromPawn(Pawn P)
{
	super.DetachFromPawn(P);
	P.AmbientSound = none;
	//return;	
}

simulated function ClientWeaponThrown()
{
	local int M;

	AmbientSound = none;
	// End:0x14
	if(Instigator == none)
	{
		return;
	}
	Instigator.AmbientSound = none;
	// End:0x3F
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	Instigator.DeleteInventory(self);
	M = 0;
	J0x56:

	// End:0x97 [Loop If]
	if(M < 2)
	{
		// End:0x8D
		if(Ammo[M] != none)
		{
			Instigator.DeleteInventory(Ammo[M]);
		}
		M++;
		// [Loop Continue]
		goto J0x56;
	}
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Instigator.FindInventoryType(Class));
	// End:0x74
	if((W == none) || W.Class != Class)
	{
		bJustSpawned = true;
		super.GiveTo(Other);
		bPossiblySwitch = true;
		W = self;		
	}
	else
	{
		// End:0x90
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0xA3
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0xAA:

	// End:0x10F [Loop If]
	if(M < 2)
	{
		// End:0x105
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			W.GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0xAA;
	}
	// End:0x13C
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	// End:0x174
	if(!bJustSpawned)
	{
		M = 0;
		J0x14E:

		// End:0x171 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x14E;
		}
		Destroy();
	}
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	local bool bJustSpawnedAmmo;
	local int addAmount, InitialAmount;

	// End:0x32E
	if((FireMode[M] != none) && FireMode[M].AmmoClass != none)
	{
		Ammo[M] = Ammunition(Instigator.FindInventoryType(FireMode[M].AmmoClass));
		bJustSpawnedAmmo = false;
		// End:0x1A3
		if(bNoAmmoInstances)
		{
			// End:0xC6
			if((FireMode[M].AmmoClass == none) || (M != 0) && FireMode[M].AmmoClass == FireMode[0].AmmoClass)
			{
				return;
			}
			InitialAmount = FireMode[M].AmmoClass.default.InitialAmount;
			// End:0x13E
			if((WP != none) && (WP.AmmoAmount[0] > 0) || WP.AmmoAmount[1] > 0)
			{
				InitialAmount = WP.AmmoAmount[M];
			}
			// End:0x185
			if(Ammo[M] != none)
			{
				addAmount = InitialAmount + Ammo[M].AmmoAmount;
				Ammo[M].Destroy();				
			}
			else
			{
				addAmount = InitialAmount;
			}
			AddAmmo(addAmount, M);			
		}
		else
		{
			// End:0x21D
			if((Ammo[M] == none) && FireMode[M].AmmoClass != none)
			{
				Ammo[M] = Spawn(FireMode[M].AmmoClass, Instigator);
				Instigator.AddInventory(Ammo[M]);
				bJustSpawnedAmmo = true;				
			}
			else
			{
				// End:0x283
				if((M == 0) || FireMode[M].AmmoClass != FireMode[0].AmmoClass)
				{
					bJustSpawnedAmmo = bJustSpawned || (WP != none) && !WP.bWeaponStay;
				}
			}
			// End:0x2DB
			if((WP != none) && (WP.AmmoAmount[0] > 0) || WP.AmmoAmount[1] > 0)
			{
				addAmount = WP.AmmoAmount[M];				
			}
			else
			{
				// End:0x2FE
				if(bJustSpawnedAmmo)
				{
					addAmount = Ammo[M].InitialAmount;
				}
			}
			Ammo[M].AddAmmo(addAmount);
			Ammo[M].GotoState('None');
		}
	}
	//return;	
}

simulated function ClientWeaponSet(bool bPossiblySwitch)
{
	local int Mode;

	Instigator = Pawn(Owner);
	bPendingSwitch = bPossiblySwitch;
	// End:0x31
	if(Instigator == none)
	{
		GotoState('PendingClientWeaponSet');
		return;
	}
	Mode = 0;
	J0x38:

	// End:0x105 [Loop If]
	if(Mode < 2)
	{
		// End:0xC7
		if(FireModeClass[Mode] != none)
		{
			// End:0xC7
			if((FireMode[Mode] == none) || (((FireMode[Mode].AmmoClass != none) && !bNoAmmoInstances) && Ammo[Mode] == none) && FireMode[Mode].AmmoPerFire > 0)
			{
				GotoState('PendingClientWeaponSet');
				return;
			}
		}
		FireMode[Mode].Instigator = Instigator;
		FireMode[Mode].Level = Level;
		Mode++;
		// [Loop Continue]
		goto J0x38;
	}
	ClientState = 1;
	GotoState('Hidden');
	// End:0x145
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || !Instigator.IsHumanControlled())
	{
		return;
	}
	// End:0x19D
	if((Instigator.Weapon == self) || Instigator.PendingWeapon == self)
	{
		// End:0x195
		if(Instigator.PendingWeapon != none)
		{
			Instigator.ChangedWeapon();			
		}
		else
		{
			BringUp();
		}
		return;
	}
	// End:0x1D0
	if((Instigator.PendingWeapon != none) && Instigator.PendingWeapon.bForceSwitch)
	{
		return;
	}
	// End:0x206
	if(Instigator.Weapon == none)
	{
		Instigator.PendingWeapon = self;
		Instigator.ChangedWeapon();		
	}
	else
	{
		// End:0x318
		if(bPossiblySwitch && !Instigator.Weapon.IsFiring())
		{
			// End:0x26B
			if((PlayerController(Instigator.Controller) != none) && PlayerController(Instigator.Controller).bNeverSwitchOnPickup)
			{
				return;
			}
			// End:0x2CD
			if(Instigator.PendingWeapon != none)
			{
				// End:0x2CA
				if((RateSelf()) > Instigator.PendingWeapon.RateSelf())
				{
					Instigator.PendingWeapon = self;
					Instigator.Weapon.PutDown();
				}				
			}
			else
			{
				// End:0x318
				if((RateSelf()) > Instigator.Weapon.RateSelf())
				{
					Instigator.PendingWeapon = self;
					Instigator.Weapon.PutDown();
				}
			}
		}
	}
	//return;	
}

simulated function ClientPlayForceFeedback(string EffectName)
{
	local PlayerController PC;

	PC = PlayerController(Instigator.Controller);
	// End:0x4C
	if((PC != none) && PC.bEnableWeaponForceFeedback)
	{
		PC.ClientPlayForceFeedback(EffectName);
	}
	//return;	
}

simulated function StopForceFeedback(string EffectName)
{
	local PlayerController PC;

	PC = PlayerController(Instigator.Controller);
	// End:0x4C
	if((PC != none) && PC.bEnableWeaponForceFeedback)
	{
		PC.StopForceFeedback(EffectName);
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local int Mode;

	// End:0x7A
	if(int(ClientState) == int(1))
	{
		PlayOwnedSound(SelectSound, 3,,,,, false);
		ClientPlayForceFeedback(SelectForce);
		// End:0x69
		if(Instigator.IsLocallyControlled())
		{
			// End:0x69
			if((Mesh != none) && HasAnim(SelectAnim))
			{
				PlayAnim(SelectAnim, SelectAnimRate, 0.0000000);
			}
		}
		ClientState = 2;
		SetTimer(BringUpTime, false);
	}
	Mode = 0;
	J0x81:

	// End:0x10D [Loop If]
	if(Mode < 2)
	{
		FireMode[Mode].bIsFiring = false;
		FireMode[Mode].HoldTime = 0.0000000;
		FireMode[Mode].bServerDelayStartFire = false;
		FireMode[Mode].bServerDelayStopFire = false;
		FireMode[Mode].bInstantStop = false;
		Mode++;
		// [Loop Continue]
		goto J0x81;
	}
	// End:0x150
	if(((PrevWeapon != none) && PrevWeapon.HasAmmo()) && !PrevWeapon.bNoVoluntarySwitch)
	{
		OldWeapon = PrevWeapon;		
	}
	else
	{
		OldWeapon = none;
	}
	//return;	
}

simulated function bool PutDown()
{
	local int Mode;

	// End:0x0D
	if(Instigator == none)
	{
		return true;
	}
	// End:0x23F
	if((int(ClientState) == int(2)) || int(ClientState) == int(4))
	{
		// End:0x153
		if((Instigator.PendingWeapon != none) && !Instigator.PendingWeapon.bForceSwitch)
		{
			Mode = 0;
			J0x69:

			// End:0x153 [Loop If]
			if(Mode < 2)
			{
				// End:0xA9
				if(FireMode[Mode].bFireOnRelease && FireMode[Mode].bIsFiring)
				{
					return false;
				}
				// End:0x149
				if(FireMode[Mode].NextFireTime > (Level.TimeSeconds + (FireMode[Mode].FireRate * (1.0000000 - MinReloadPct))))
				{
					DownDelay = FMax(DownDelay, (FireMode[Mode].NextFireTime - Level.TimeSeconds) - (FireMode[Mode].FireRate * (1.0000000 - MinReloadPct)));
				}
				Mode++;
				// [Loop Continue]
				goto J0x69;
			}
		}
		// End:0x1EF
		if(Instigator.IsLocallyControlled())
		{
			Mode = 0;
			J0x16C:

			// End:0x1A5 [Loop If]
			if(Mode < 2)
			{
				// End:0x19B
				if(FireMode[Mode].bIsFiring)
				{
					ClientStopFire(Mode);
				}
				Mode++;
				// [Loop Continue]
				goto J0x16C;
			}
			// End:0x1EF
			if(DownDelay <= float(0))
			{
				// End:0x1D2
				if(int(ClientState) == int(2))
				{
					TweenAnim(SelectAnim, PutDownTime);					
				}
				else
				{
					// End:0x1EF
					if(HasAnim(PutDownAnim))
					{
						PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
					}
				}
			}
		}
		ClientState = 3;
		// End:0x21D
		if(Level.GRI.bFastWeaponSwitching)
		{
			DownDelay = 0.0000000;
		}
		// End:0x236
		if(DownDelay > float(0))
		{
			SetTimer(DownDelay, false);			
		}
		else
		{
			SetTimer(PutDownTime, false);
		}
	}
	Mode = 0;
	J0x246:

	// End:0x28A [Loop If]
	if(Mode < 2)
	{
		FireMode[Mode].bServerDelayStartFire = false;
		FireMode[Mode].bServerDelayStopFire = false;
		Mode++;
		// [Loop Continue]
		goto J0x246;
	}
	Instigator.AmbientSound = none;
	OldWeapon = none;
	return true;
	//return;	
}

simulated function Fire(float F)
{
	//return;	
}

simulated function AltFire(float F)
{
	//return;	
}

simulated event WeaponTick(float dt)
{
	//return;	
}

simulated function OutOfAmmo()
{
	// End:0x2E
	if(((Instigator == none) || !Instigator.IsLocallyControlled()) || HasAmmo())
	{
		return;
	}
	DoAutoSwitch();
	//return;	
}

simulated function DoAutoSwitch()
{
	Instigator.Controller.SwitchToBestWeapon();
	//return;	
}

simulated event ClientStartFire(int Mode)
{
	// End:0x48
	if(Pawn(Owner).Controller.IsInState('GameEnded') || Pawn(Owner).Controller.IsInState('RoundEnded'))
	{
		return;
	}
	// End:0x76
	if(int(Role) < int(ROLE_Authority))
	{
		// End:0x73
		if(StartFire(Mode))
		{
			ServerStartFire(byte(Mode));
		}		
	}
	else
	{
		StartFire(Mode);
	}
	//return;	
}

simulated event ClientStopFire(int Mode)
{
	// End:0x1B
	if(int(Role) < int(ROLE_Authority))
	{
		StopFire(Mode);
	}
	ServerStopFire(byte(Mode));
	//return;	
}

simulated function ClientWriteFire(string Result)
{
	Log((string(self) $ " ServerStartFire! ") $ Result);
	//return;	
}

event ServerStartFire(byte Mode)
{
	// End:0x64
	if((Instigator != none) && Instigator.Weapon != self)
	{
		// End:0x49
		if(Instigator.Weapon == none)
		{
			Instigator.ServerChangedWeapon(none, self);			
		}
		else
		{
			Instigator.Weapon.SynchronizeWeapon(self);
		}
		return;
	}
	// End:0xF8
	if((FireMode[int(Mode)].NextFireTime <= (Level.TimeSeconds + FireMode[int(Mode)].PreFireTime)) && StartFire(int(Mode)))
	{
		FireMode[int(Mode)].ServerStartFireTime = Level.TimeSeconds;
		FireMode[int(Mode)].bServerDelayStartFire = false;		
	}
	else
	{
		// End:0x12E
		if(FireMode[int(Mode)].AllowFire())
		{
			FireMode[int(Mode)].bServerDelayStartFire = true;			
		}
		else
		{
			ClientForceAmmoUpdate(int(Mode), AmmoAmount(int(Mode)));
		}
	}
	//return;	
}

simulated function ClientForceAmmoUpdate(int Mode, int NewAmount)
{
	Log((((string(self) $ " ClientForceAmmoUpdate mode ") $ string(Mode)) $ " newamount ") $ string(NewAmount));
	// End:0x63
	if(bNoAmmoInstances)
	{
		AmmoCharge[Mode] = NewAmount;		
	}
	else
	{
		// End:0x8E
		if(Ammo[Mode] != none)
		{
			Ammo[Mode].AmmoAmount = NewAmount;
		}
	}
	//return;	
}

function SynchronizeWeapon(Weapon ClientWeapon)
{
	Instigator.ServerChangedWeapon(self, ClientWeapon);
	//return;	
}

function ServerStopFire(byte Mode)
{
	// End:0x61
	if(FireMode[int(Mode)].bServerDelayStartFire || FireMode[int(Mode)].ServerStartFireTime == Level.TimeSeconds)
	{
		FireMode[int(Mode)].bServerDelayStopFire = true;		
	}
	else
	{
		StopFire(int(Mode));
	}
	//return;	
}

simulated function bool ReadyToFire(int Mode)
{
	local int alt;

	// End:0x15
	if(Mode == 0)
	{
		alt = 1;		
	}
	else
	{
		alt = 0;
	}
	// End:0xC8
	if(((((FireMode[alt] != FireMode[Mode]) && FireMode[alt].bModeExclusive) && FireMode[alt].bIsFiring) || !FireMode[Mode].AllowFire()) || FireMode[Mode].NextFireTime > (Level.TimeSeconds + FireMode[Mode].PreFireTime))
	{
		return false;
	}
	return true;
	//return;	
}

simulated function bool StartFire(int Mode)
{
	local int alt;

	// End:0x12
	if(!ReadyToFire(Mode))
	{
		return false;
	}
	// End:0x27
	if(Mode == 0)
	{
		alt = 1;		
	}
	else
	{
		alt = 0;
	}
	FireMode[Mode].bIsFiring = true;
	FireMode[Mode].NextFireTime = Level.TimeSeconds + FireMode[Mode].PreFireTime;
	// End:0xD5
	if(FireMode[alt].bModeExclusive)
	{
		FireMode[Mode].NextFireTime = FMax(FireMode[Mode].NextFireTime, FireMode[alt].NextFireTime);
	}
	// End:0x14A
	if(Instigator.IsLocallyControlled())
	{
		// End:0x134
		if((FireMode[Mode].PreFireTime > 0.0000000) || FireMode[Mode].bFireOnRelease)
		{
			FireMode[Mode].PlayPreFire();
		}
		FireMode[Mode].FireCount = 0;
	}
	return true;
	//return;	
}

simulated event StopFire(int Mode)
{
	// End:0x2F
	if(FireMode[Mode].bIsFiring)
	{
		FireMode[Mode].bInstantStop = true;
	}
	// End:0x72
	if(Instigator.IsLocallyControlled() && !FireMode[Mode].bFireOnRelease)
	{
		FireMode[Mode].PlayFireEnd();
	}
	FireMode[Mode].bIsFiring = false;
	FireMode[Mode].StopFiring();
	// End:0xC3
	if(!FireMode[Mode].bFireOnRelease)
	{
		ZeroFlashCount(Mode);
	}
	//return;	
}

simulated function ImmediateStopFire()
{
	local int i;

	i = 0;
	J0x07:

	// End:0xE1 [Loop If]
	if(i < 2)
	{
		ClientStopFire(i);
		// End:0xD7
		if(FireMode[i].bFireOnRelease)
		{
			// End:0xA8
			if((Level.TimeSeconds > FireMode[i].NextFireTime) && FireMode[i].bInstantStop || !FireMode[i].bNowWaiting)
			{
				FireMode[i].ModeDoFire();
			}
			// End:0xD7
			if(FireMode[i].bWaitForRelease)
			{
				FireMode[i].bNowWaiting = true;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function Timer()
{
	local int Mode;
	local float OldDownDelay;

	OldDownDelay = DownDelay;
	DownDelay = 0.0000000;
	// End:0x69
	if(int(ClientState) == int(2))
	{
		Mode = 0;
		J0x2D:

		// End:0x58 [Loop If]
		if(Mode < 2)
		{
			FireMode[Mode].InitEffects();
			Mode++;
			// [Loop Continue]
			goto J0x2D;
		}
		PlayIdle();
		ClientState = 4;		
	}
	else
	{
		// End:0x141
		if(int(ClientState) == int(3))
		{
			// End:0xAE
			if(OldDownDelay > float(0))
			{
				// End:0xA3
				if(HasAnim(PutDownAnim))
				{
					PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
				}
				SetTimer(PutDownTime, false);
				return;
			}
			// End:0xD3
			if(Instigator.PendingWeapon == none)
			{
				PlayIdle();
				ClientState = 4;				
			}
			else
			{
				ClientState = 1;
				Instigator.ChangedWeapon();
				// End:0x10F
				if(Instigator.Weapon == self)
				{
					PlayIdle();
					ClientState = 4;					
				}
				else
				{
					Mode = 0;
					J0x116:

					// End:0x141 [Loop If]
					if(Mode < 2)
					{
						FireMode[Mode].DestroyEffects();
						Mode++;
						// [Loop Continue]
						goto J0x116;
					}
				}
			}
		}
	}
	//return;	
}

simulated function bool IsFiring()
{
	// End:0x5C
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		return FireMode[0].IsFiring() || FireMode[1].IsFiring();
	}
	return (int(ClientState) == int(4)) && FireMode[0].IsFiring() || FireMode[1].IsFiring();
	//return;	
}

function bool IsRapidFire()
{
	// End:0x38
	if((FireMode[1] != none) && FireMode[1].bIsFiring)
	{
		return FireMode[1].bPawnRapidFireAnim;		
	}
	else
	{
		// End:0x5A
		if(FireMode[0] != none)
		{
			return FireMode[0].bPawnRapidFireAnim;			
		}
		else
		{
			return false;
		}
	}
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	//return;	
}

simulated function CheckSuperBerserk()
{
	// End:0x5D
	if(Level.GRI.WeaponBerserk > 1.0000000)
	{
		// End:0x3F
		if(FireMode[0] != none)
		{
			FireMode[0].StartSuperBerserk();
		}
		// End:0x5D
		if(FireMode[1] != none)
		{
			FireMode[1].StartSuperBerserk();
		}
	}
	//return;	
}

simulated function StartBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	bBerserk = true;
	// End:0x5F
	if(FireMode[0] != none)
	{
		FireMode[0].StartBerserk();
	}
	// End:0x7D
	if(FireMode[1] != none)
	{
		FireMode[1].StartBerserk();
	}
	//return;	
}

simulated function StopBerserk()
{
	bBerserk = false;
	// End:0x41
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	// End:0x5F
	if(FireMode[0] != none)
	{
		FireMode[0].StopBerserk();
	}
	// End:0x7D
	if(FireMode[1] != none)
	{
		FireMode[1].StopBerserk();
	}
	//return;	
}

simulated function AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x132
	if(int(ClientState) == int(4))
	{
		// End:0x83
		if((Anim == FireMode[0].FireAnim) && HasAnim(FireMode[0].FireEndAnim))
		{
			PlayAnim(FireMode[0].FireEndAnim, FireMode[0].FireEndAnimRate, 0.0000000);			
		}
		else
		{
			// End:0xE0
			if((Anim == FireMode[1].FireAnim) && HasAnim(FireMode[1].FireEndAnim))
			{
				PlayAnim(FireMode[1].FireEndAnim, FireMode[1].FireEndAnimRate, 0.0000000);				
			}
			else
			{
				// End:0x132
				if(((FireMode[0] == none) || !FireMode[0].bIsFiring) && (FireMode[1] == none) || !FireMode[1].bIsFiring)
				{
					PlayIdle();
				}
			}
		}
	}
	//return;	
}

simulated function PlayIdle()
{
	LoopAnim(IdleAnim, IdleAnimRate, 0.2000000);
	//return;	
}

function bool CheckReflect(Vector HitLocation, out Vector RefNormal, int AmmoDrain)
{
	return false;
	//return;	
}

function DoReflectEffect(int Drain)
{
	//return;	
}

function bool HandlePickupQuery(Pickup Item)
{
	local WeaponPickup wpu;
	local int i;

	// End:0xBC
	if(bNoAmmoInstances)
	{
		i = 0;
		J0x10:

		// End:0xBC [Loop If]
		if(i < 2)
		{
			// End:0xB2
			if((Item.InventoryType == AmmoClass[i]) && AmmoClass[i] != none)
			{
				// End:0x6A
				if(AmmoCharge[i] >= (MaxAmmo(i)))
				{
					return true;
				}
				Item.AnnouncePickup(Pawn(Owner));
				AddAmmo(Ammo(Item).AmmoAmount, i);
				Item.SetRespawn();
				return true;
			}
			i++;
			// [Loop Continue]
			goto J0x10;
		}
	}
	// End:0x106
	if(Class == Item.InventoryType)
	{
		wpu = WeaponPickup(Item);
		// End:0x104
		if(wpu != none)
		{
			return !wpu.AllowRepeatPickup();			
		}
		else
		{
			return false;
		}
	}
	// End:0x113
	if(Inventory == none)
	{
		return false;
	}
	return Inventory.HandlePickupQuery(Item);
	//return;	
}

simulated function bool WantsZoomFade()
{
	return false;
	//return;	
}

function bool CanHeal(Actor Other)
{
	return false;
	//return;	
}

function bool ShouldFireWithoutTarget()
{
	return false;
	//return;	
}

function bool ShootHoop(Controller B, Vector ShootLoc)
{
	return false;
	//return;	
}

simulated function PawnUnpossessed()
{
	//return;	
}

simulated function WeaponFire GetFireMode(byte Mode)
{
	// End:0x1C
	if(int(Mode) < 2)
	{
		return FireMode[int(Mode)];
	}
	return none;
	//return;	
}

state PendingClientWeaponSet
{
	simulated function Timer()
	{
		// End:0x1C
		if(Pawn(Owner) != none)
		{
			ClientWeaponSet(bPendingSwitch);
		}
		// End:0x30
		if(IsInState('PendingClientWeaponSet'))
		{
			SetTimer(0.0500000, false);
		}
		//return;		
	}

	simulated function BeginState()
	{
		SetTimer(0.0500000, false);
		//return;		
	}

	simulated function EndState()
	{
		//return;		
	}
	stop;	
}

state Hidden
{	stop;	
}

defaultproperties
{
	IdleAnim="Idle"
	RestAnim="rest"
	AimAnim="Aim"
	RunAnim="Run"
	SelectAnim="Select"
	PutDownAnim="Down"
	IdleAnimRate=1.0000000
	RestAnimRate=1.0000000
	AimAnimRate=1.0000000
	RunAnimRate=1.0000000
	SelectAnimRate=1.3636000
	PutDownAnimRate=1.3636000
	PutDownTime=0.3300000
	BringUpTime=0.3300000
	AIRating=0.5000000
	CurrentRating=0.5000000
	bCanThrow=true
	bNoAmmoInstances=true
	OldDrawScale=1.0000000
	OldCenteredOffsetY=-10.0000000
	OldCenteredRoll=2000
	MessageNoAmmo=" has no ammo"
	DisplayFOV=90.0000000
	HudColor=(R=255,G=255,B=0,A=255)
	CenteredOffsetY=-10.0000000
	CenteredRoll=2000
	CustomCrossHairColor=(R=255,G=255,B=255,A=255)
	CustomCrossHairScale=1.0000000
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Cross1"
	MinReloadPct=0.5000000
	InventoryGroup=1
	AttachmentClass=Class'Engine.WeaponAttachment'
	DrawType=2
	NetUpdateFrequency=2.0000000
	NetPriority=3.0000000
	AmbientGlow=20
	MaxLights=6
	ScaleGlow=1.5000000
	SoundVolume=255
	bNetNotify=true
}
