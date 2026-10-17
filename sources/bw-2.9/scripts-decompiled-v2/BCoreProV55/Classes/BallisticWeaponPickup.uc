class BallisticWeaponPickup extends UTWeaponPickup;

var() int MagAmmo;
var() bool bOnSide;
var() StaticMesh LowPolyStaticMesh;
var() float LowPolyDist;
var() float PickupDrawScale;
var() float ChangeTime;
var() float PassedRespawnTime;
var() int ReplacementsIndex;
var() Rotator LandedRot;
var() Actor FadeOutEffect;
var() Pawn LastPickedUpBy;
var() bool bAlternativePickups;
var() BallisticPickupTrigger puTrigger;
var() float LastBlockNotificationTime;
var() int DetectedInventorySize;
var() byte LayoutIndex;
var() byte OldLayoutIndex;
var() byte CamoIndex;
var() byte OldCamoIndex;
var() bool bNewMesh;
var() StaticMesh NewStaticMesh;
var() StaticMesh NewLowPolyStaticMesh;
//var delegate<OnItemChange> __OnItemChange__Delegate;
//var delegate<OnItemPickedUp> __OnItemPickedUp__Delegate;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		LandedRot;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		CamoIndex, LayoutIndex;
}

simulated function PreBeginPlay()
{
	// End:0x18
	if(PickupDrawScale != float(0))
	{
		SetDrawScale(PickupDrawScale);
	}
	bAlternativePickups = Class'BCoreProV55.BallisticReplicationInfo'.default.bAlternativePickups;
	// End:0x83
	if(bAlternativePickups)
	{
		puTrigger = Spawn(Class'BCoreProV55.BallisticPickupTrigger', self,, Location);
		puTrigger.bwPickUp = self;
		puTrigger.SetBase(self);
		puTrigger.SetCollisionSize(CollisionRadius, CollisionHeight);
		SetCollision(false);
	}
	super(Actor).PreBeginPlay();
	//return;	
}

delegate OnItemChange(Pickup Pickup)
{
	//return;	
}

delegate OnItemPickedUp(Pickup Pickup)
{
	//return;	
}

function SetWeaponStay()
{
	// End:0x34
	if((Class<BallisticWeapon>(InventoryType) != none) && Class<BallisticWeapon>(InventoryType).default.bWT_Super)
	{
		bWeaponStay = false;		
	}
	else
	{
		bWeaponStay = bWeaponStay && Level.Game.bWeaponStay;
	}
	//return;	
}

simulated event Tick(float dt)
{
	local PlayerController PC;

	// End:0x49
	if(((ChangeTime > float(0)) && Level.TimeSeconds > ChangeTime) && IsInState('Sleeping') || !PlayerCanSeeMe())
	{
		OnItemChange(self);
	}
	super(Actor).Tick(dt);
	// End:0x6F
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	PC = Level.GetLocalPlayerController();
	// End:0x91
	if(PC == none)
	{
		return;
	}
	// End:0x12A
	if((PC.ViewTarget != none) && VSize(Location - PC.ViewTarget.Location) > (LowPolyDist * (float(90) / PC.FovAngle)))
	{
		// End:0x10D
		if(bNewMesh)
		{
			// End:0x10A
			if(StaticMesh != NewLowPolyStaticMesh)
			{
				SetStaticMesh(NewLowPolyStaticMesh);
			}			
		}
		else
		{
			// End:0x127
			if(StaticMesh != LowPolyStaticMesh)
			{
				SetStaticMesh(LowPolyStaticMesh);
			}
		}		
	}
	else
	{
		// End:0x152
		if(bNewMesh && StaticMesh != NewStaticMesh)
		{
			SetStaticMesh(NewStaticMesh);			
		}
		else
		{
			// End:0x179
			if(!bNewMesh && StaticMesh != default.StaticMesh)
			{
				SetStaticMesh(default.StaticMesh);
			}
		}
	}
	//return;	
}

function float BotDesireability(Pawn Bot)
{
	local Weapon AlreadyHas;
	local Class<Pickup> AmmoPickupClass;
	local float desire;

	desire = MaxDesireability + Bot.Controller.AdjustDesireFor(self);
	AlreadyHas = Weapon(Bot.FindInventoryType(InventoryType));
	// End:0x172
	if(AlreadyHas != none)
	{
		// End:0x71
		if(Bot.Controller.bHuntPlayer)
		{
			return 0.0000000;
		}
		// End:0x82
		if(!AllowRepeatPickup())
		{
			return 0.0000000;
		}
		// End:0xB6
		if((RespawnTime < float(10)) && bHidden || AlreadyHas.AmmoMaxed(0))
		{
			return 0.0000000;
		}
		// End:0xD6
		if(AlreadyHas.AmmoMaxed(0))
		{
			return 0.2500000 * desire;
		}
		// End:0x16C
		if(AlreadyHas.AmmoAmount(0) > 0)
		{
			AmmoPickupClass = AlreadyHas.AmmoPickupClass(0);
			// End:0x116
			if(AmmoPickupClass == none)
			{
				return 0.0500000;				
			}
			else
			{
				return FMax(0.2500000 * desire, AmmoPickupClass.default.MaxDesireability * FMin(1.0000000, (0.1500000 * float(AlreadyHas.MaxAmmo(0))) / float(AlreadyHas.AmmoAmount(0))));
			}			
		}
		else
		{
			return 0.0500000;
		}
	}
	// End:0x1C4
	if(Bot.Controller.bHuntPlayer && (MaxDesireability * 0.8330000) < (Bot.Weapon.AIRating - 0.1000000))
	{
		return 0.0000000;
	}
	// End:0x208
	if((Bot.Weapon == none) || Bot.Weapon.AIRating < 0.5000000)
	{
		return 2.0000000 * desire;
	}
	return desire;
	//return;	
}

function bool SlotCapacityReached(Pawn P, int InvGroup, int Max)
{
	local Inventory Inv;
	local int Count;

	Inv = P.Inventory;
	J0x14:

	// End:0x9F [Loop If]
	if(Inv != none)
	{
		// End:0x88
		if((Weapon(Inv) != none) && int(Weapon(Inv).InventoryGroup) == InvGroup)
		{
			// End:0x6F
			if(Weapon(Inv).Class == InventoryType)
			{
				return false;
			}
			Count++;
			// End:0x88
			if(Count >= Max)
			{
				// [Explicit Break]
				goto J0x9F;
			}
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x14;
	}
	J0x9F:

	// End:0xB0
	if(Count >= Max)
	{
		return true;
	}
	return false;
	//return;	
}

function GiveWeaponAmmo(Weapon W, Pawn Other)
{
	local BallisticWeapon BW;

	// End:0x7F
	if(bDropped)
	{
		BW = BallisticWeapon(W);
		// End:0x4F
		if((BW != none) && !BW.bNoMag)
		{
			BW.AddAmmo(MagAmmo, 0);
		}
		W.AddAmmo(AmmoAmount[0], 0);
		W.AddAmmo(AmmoAmount[1], 1);
		return;
	}
	// End:0xD6
	if((Class<BallisticWeapon>(InventoryType) != none) && Class<BallisticWeapon>(InventoryType).default.bNoMag == false)
	{
		W.AddAmmo(Class<BallisticWeapon>(InventoryType).static.GetPickupMagAmmo() * 2, 0);		
	}
	else
	{
		W.AddAmmo(W.static.GetAmmoClass(0).default.InitialAmount, 0);
	}
	// End:0x165
	if((W.GetAmmoClass(1) != none) && W.GetAmmoClass(1) != W.GetAmmoClass(0))
	{
		W.AddAmmo(W.static.GetAmmoClass(1).default.InitialAmount, 1);
	}
	//return;	
}

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy;
	local Weapon W;

	LastPickedUpBy = Other;
	W = Weapon(Other.FindInventoryType(InventoryType));
	// End:0x47
	if(W != none)
	{
		GiveWeaponAmmo(W, Other);
		return none;
	}
	// End:0x67
	if(Inventory != none)
	{
		Copy = Inventory;
		Inventory = none;		
	}
	else
	{
		Copy = Spawn(InventoryType, Other,,, rot(0, 0, 0));
	}
	Copy.GiveTo(Other, self);
	return Copy;
	//return;	
}

simulated function GetAmmoAmount(int M, Weapon W)
{
	// End:0xB0
	if(bThrown)
	{
		// End:0x6E
		if((BallisticWeapon(W) != none) && BallisticWeapon(W).bNoMag == false)
		{
			AmmoAmount[M] = Min(W.AmmoAmount(M), BallisticWeapon(W).GetPickupMagAmmo());			
		}
		else
		{
			AmmoAmount[M] = Min(W.AmmoAmount(M), W.static.GetAmmoClass(M).default.InitialAmount);
		}		
	}
	else
	{
		AmmoAmount[M] = W.AmmoAmount(M);
	}
	W.ConsumeAmmo(M, float(AmmoAmount[M]));
	//return;	
}

function InitDroppedPickupFor(Inventory Inv)
{
	local Weapon W;

	W = Weapon(Inv);
	// End:0x205
	if(W != none)
	{
		// End:0x5D
		if(BallisticWeapon(W) != none)
		{
			LayoutIndex = BallisticWeapon(W).LayoutIndex;
			CamoIndex = BallisticWeapon(W).CamoIndex;
		}
		// End:0xD3
		if((BallisticWeapon(W) == none) || BallisticWeapon(W).bNoMag)
		{
			GetAmmoAmount(0, W);
			// End:0xD0
			if((W != none) && W.GetAmmoClass(1) != W.GetAmmoClass(0))
			{
				GetAmmoAmount(1, W);
			}			
		}
		else
		{
			// End:0x205
			if((BallisticWeapon(W) != none) && !BallisticWeapon(W).bNoMag)
			{
				MagAmmo = BallisticWeapon(W).MagAmmo;
				// End:0x174
				if((!bThrown || BallisticFire(W.GetFireMode(0)) == none) || BallisticFire(W.GetFireMode(0)).bUseWeaponMag == false)
				{
					GetAmmoAmount(0, W);
				}
				// End:0x205
				if(((W != none) && W.GetAmmoClass(1) != W.GetAmmoClass(0)) && (!bThrown || BallisticFire(W.GetFireMode(1)) == none) || BallisticFire(W.GetFireMode(1)).bUseWeaponMag == false)
				{
					GetAmmoAmount(1, W);
				}
			}
		}
	}
	// End:0x226
	if(bOnSide)
	{
		SetRotation(Rotation + rot(0, 0, 16384));
	}
	super(Pickup).InitDroppedPickupFor(none);
	LifeSpan = 24.0000000;
	//return;	
}

event Landed(Vector HitNormal)
{
	local Rotator R, Dir;
	local Vector X, Y, Z;

	Dir = Rotator(HitNormal);
	Dir.Pitch -= 16384;
	R.Yaw = Rotation.Yaw;
	GetAxes(R, X, Y, Z);
	X = X >> Dir;
	Y = Y >> Dir;
	Z = Z >> Dir;
	Dir = OrthoRotation(X, Y, Z);
	Dir.Yaw = Rotation.Yaw;
	// End:0xCC
	if(bOnSide)
	{
		Dir.Roll += 16384;
	}
	SetRotation(Dir);
	LandedRot = Rotation;
	GotoState('Pickup', 'Begin');
	//return;	
}

simulated function PostNetReceive()
{
	// End:0x29
	if(int(LayoutIndex) != int(OldLayoutIndex))
	{
		OldLayoutIndex = LayoutIndex;
		UpdateMesh(LayoutIndex);
	}
	// End:0x52
	if(int(CamoIndex) != int(OldCamoIndex))
	{
		OldCamoIndex = CamoIndex;
		UpdateSkins(CamoIndex);
	}
	// End:0x6D
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x8C
	if(LandedRot != rot(0, 0, 0))
	{
		SetRotation(LandedRot);
	}
	//return;	
}

simulated function UpdateMesh(byte PassedIndex)
{
	local WeaponParams WP;

	WP = Class<BallisticWeapon>(InventoryType).default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].default.Layouts[int(PassedIndex)];
	// End:0xC8
	if(WP != none)
	{
		// End:0xC8
		if(WP.PickupMesh != none)
		{
			SetStaticMesh(WP.PickupMesh);
			NewStaticMesh = WP.PickupMesh;
			NewLowPolyStaticMesh = WP.PickupMesh;
			bNewMesh = true;
			// End:0xC8
			if(WP.PickupDrawScale != float(0))
			{
				SetDrawScale(WP.PickupDrawScale);
			}
		}
	}
	//return;	
}

simulated function UpdateSkins(byte PassedIndex)
{
	local WeaponCamo WC;
	local Material M;
	local int i;

	WC = Class<BallisticWeapon>(InventoryType).default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].default.Camos[int(PassedIndex)];
	// End:0x16A
	if(WC != none)
	{
		i = 0;
		J0x4D:

		// End:0x16A [Loop If]
		if(i < WC.WeaponMaterialSwaps.Length)
		{
			// End:0x160
			if(WC.WeaponMaterialSwaps[i].pIndex != -1)
			{
				// End:0xE1
				if(WC.WeaponMaterialSwaps[i].Material != none)
				{
					Skins[WC.WeaponMaterialSwaps[i].pIndex] = WC.WeaponMaterialSwaps[i].Material;
				}
				// End:0x160
				if(WC.WeaponMaterialSwaps[i].MaterialName != "")
				{
					M = Material(DynamicLoadObject(WC.WeaponMaterialSwaps[i].MaterialName, Class'Engine.Material'));
					// End:0x160
					if(M != none)
					{
						Skins[WC.WeaponMaterialSwaps[i].pIndex] = M;
					}
				}
			}
			++i;
			// [Loop Continue]
			goto J0x4D;
		}
	}
	//return;	
}

event Destroyed()
{
	// End:0x17
	if(FadeOutEffect != none)
	{
		FadeOutEffect.Destroy();
	}
	// End:0x37
	if(bAlternativePickups)
	{
		// End:0x37
		if(puTrigger != none)
		{
			puTrigger.Destroy();
		}
	}
	super(Pickup).Destroyed();
	//return;	
}

function AnnouncePickup(Pawn Receiver)
{
	Receiver.HandlePickup(self);
	PlaySound(PickupSound, 3, TransientSoundVolume,, TransientSoundRadius);
	//return;	
}

simulated event ClientTrigger()
{
	bHidden = true;
	// End:0x31
	if(EffectIsRelevant(Location, false))
	{
		FadeOutEffect = Spawn(Class'BCoreProV55.BCPickupFadeEffect', self,, Location, Rotation);
	}
	//return;	
}

function float GetRespawnTime()
{
	// End:0x13
	if(PassedRespawnTime != float(0))
	{
		return PassedRespawnTime;
	}
	return super(WeaponPickup).GetRespawnTime();
	//return;	
}

auto state Pickup
{
	function BeginState()
	{
		// End:0x37
		if(!bDropped && Class<BallisticWeapon>(InventoryType) != none)
		{
			MagAmmo = Class<BallisticWeapon>(InventoryType).static.GetPickupMagAmmo();
		}
		// End:0x5A
		if(bAlternativePickups)
		{
			// End:0x5A
			if(puTrigger != none)
			{
				puTrigger.InitTrigger();
			}
		}
		super.BeginState();
		//return;		
	}

	function bool ValidTouch(Actor Other)
	{
		// End:0x63
		if(((Pawn(Other) == none) || !Pawn(Other).bCanPickupInventory) || (Pawn(Other).DrivenVehicle == none) && Pawn(Other).Controller == none)
		{
			return false;
		}
		// End:0x80
		if(!FastTrace(Other.Location, Location))
		{
			return false;
		}
		DetectedInventorySize = Class<BallisticWeapon>(InventoryType).static.GetInventorySize();
		// End:0xEF
		if(Level.Game.PickupQuery(Pawn(Other), self))
		{
			DetectedInventorySize = 0;
			LastPickedUpBy = Pawn(Other);
			TriggerEvent(Event, self, Pawn(Other));
			return true;
		}
		// End:0x14E
		if((PlayerController(Pawn(Other).Controller) != none) && LastPickedUpBy != Pawn(Other))
		{
			PlayerController(Pawn(Other).Controller).ReceiveLocalizedMessage(Class'BCoreProV55.BallisticWeaponPickupMessage',,,, self);
		}
		return false;
		//return;		
	}
	stop;	
}

state FallingPickup
{
	function BeginState()
	{
		SetTimer(20.0000000, false);
		//return;		
	}

	function bool ValidTouch(Actor Other)
	{
		// End:0x63
		if(((Pawn(Other) == none) || !Pawn(Other).bCanPickupInventory) || (Pawn(Other).DrivenVehicle == none) && Pawn(Other).Controller == none)
		{
			return false;
		}
		// End:0x80
		if(!FastTrace(Other.Location, Location))
		{
			return false;
		}
		DetectedInventorySize = Class<BallisticWeapon>(InventoryType).static.GetInventorySize();
		// End:0xEF
		if(Level.Game.PickupQuery(Pawn(Other), self))
		{
			DetectedInventorySize = 0;
			LastPickedUpBy = Pawn(Other);
			TriggerEvent(Event, self, Pawn(Other));
			return true;
		}
		// End:0x14E
		if((PlayerController(Pawn(Other).Controller) != none) && LastPickedUpBy != Pawn(Other))
		{
			PlayerController(Pawn(Other).Controller).ReceiveLocalizedMessage(Class'BCoreProV55.BallisticWeaponPickupMessage',,,, self);
		}
		return false;
		//return;		
	}
	stop;	
}

state FadeOut
{
	function BeginState()
	{
		SetPhysics(0);
		LifeSpan = 4.0000000;
		bClientTrigger = !bClientTrigger;
		// End:0x3E
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			ClientTrigger();
		}
		//return;		
	}

	function bool ValidTouch(Actor Other)
	{
		// End:0x63
		if(((Pawn(Other) == none) || !Pawn(Other).bCanPickupInventory) || (Pawn(Other).DrivenVehicle == none) && Pawn(Other).Controller == none)
		{
			return false;
		}
		// End:0x80
		if(!FastTrace(Other.Location, Location))
		{
			return false;
		}
		DetectedInventorySize = Class<BallisticWeapon>(InventoryType).static.GetInventorySize();
		// End:0xEF
		if(Level.Game.PickupQuery(Pawn(Other), self))
		{
			DetectedInventorySize = 0;
			LastPickedUpBy = Pawn(Other);
			TriggerEvent(Event, self, Pawn(Other));
			return true;
		}
		// End:0x14E
		if((PlayerController(Pawn(Other).Controller) != none) && LastPickedUpBy != Pawn(Other))
		{
			PlayerController(Pawn(Other).Controller).ReceiveLocalizedMessage(Class'BCoreProV55.BallisticWeaponPickupMessage',,,, self);
		}
		return false;
		//return;		
	}
	stop;	
}

state Sleeping
{
	function bool ReadyToPickup(float MaxWait)
	{
		return bPredictRespawns && LatentFloat < MaxWait;
		//return;		
	}

	function StartSleeping()
	{
		//return;		
	}

	function BeginState()
	{
		local int i;

		NetUpdateTime = Level.TimeSeconds - float(1);
		bHidden = true;
		i = 0;
		J0x28:

		// End:0x4B [Loop If]
		if(i < 4)
		{
			TeamOwner[i] = none;
			i++;
			// [Loop Continue]
			goto J0x28;
		}
		//return;		
	}

	function EndState()
	{
		NetUpdateTime = Level.TimeSeconds - float(1);
		bHidden = false;
		//return;		
	}
DelayedSpawn:

	// End:0x43
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		Sleep(FMin(30.0000000, Level.Game.GameDifficulty * float(8)));		
	}
	else
	{
		Sleep(30.0000000);
	}
	goto 'Respawn';
Begin:


	Sleep((GetRespawnTime()) - RespawnEffectTime);
Respawn:


	RespawnEffect();
	Sleep(RespawnEffectTime);
	// End:0x89
	if(PickUpBase != none)
	{
		PickUpBase.TurnOn();
	}
	PassedRespawnTime = 0.0000000;
	GotoState('Pickup');
	stop;					
}

defaultproperties
{
	bOnSide=true
	LowPolyDist=500.0000000
	ReplacementsIndex=-1
	LayoutIndex=255
	OldLayoutIndex=255
	CamoIndex=255
	OldCamoIndex=255
	StandUp=(X=0.0000000,Y=0.2500000,Z=0.0000000)
	bAmbientGlow=false
	DrawType=8
	bOrientOnSlope=false
	bNetInitialRotation=true
	AmbientGlow=0
	TransientSoundVolume=1.0000000
	TransientSoundRadius=64.0000000
	CollisionRadius=26.0000000
	bNetNotify=true
	MessageClass=Class'BCoreProV55.BallisticPickupMessage'
}
