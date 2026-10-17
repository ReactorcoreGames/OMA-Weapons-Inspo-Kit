class AssaultRifle extends Weapon
	config(User);

var float DualPickupTime;
var AssaultAttachment OffhandActor;
var bool bDualMode;
var bool bWasDualMode;
var bool bFireLeft;
var int DrawWeaponInfoVersion;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bDualMode;
}

simulated function Loaded()
{
	bDualMode = true;
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	// End:0x7D
	if(((((int(Role) < int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none) && Instigator.Weapon != self) && Instigator.PendingWeapon != self)
	{
		Instigator.Controller.ClientSwitchToBestWeapon();
	}
	//return;	
}

simulated function bool WeaponCentered()
{
	return !bDualMode && super.WeaponCentered();
	//return;	
}

simulated event RenderOverlays(Canvas Canvas)
{
	local bool bRealHidden;
	local int RealHand;

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
	RealHand = int(hand);
	// End:0xAD
	if(bDualMode && hand == float(0))
	{
		Instigator.Controller.Handedness = -1.0000000;
		hand = -1.0000000;
	}
	// End:0x143
	if(bDualMode && FireMode[1].FlashEmitter != none)
	{
		bRealHidden = FireMode[1].FlashEmitter.bHidden;
		// End:0x114
		if(bFireLeft)
		{
			FireMode[1].FlashEmitter.bHidden = true;
		}
		super.RenderOverlays(Canvas);
		FireMode[1].FlashEmitter.bHidden = bRealHidden;		
	}
	else
	{
		super.RenderOverlays(Canvas);
	}
	// End:0x162
	if(bDualMode)
	{
		RenderDualOverlay(Canvas);
	}
	// End:0x195
	if(Instigator.Controller != none)
	{
		Instigator.Controller.Handedness = float(RealHand);
	}
	//return;	
}

simulated function RenderDualOverlay(Canvas Canvas)
{
	local Vector NewScale3D;
	local Rotator WeaponRotation;
	local bool bRealHidden;

	hand *= float(-1);
	NewScale3D = default.DrawScale3D;
	NewScale3D.Y *= hand;
	SetDrawScale3D(NewScale3D);
	PlayerViewPivot.Roll = int(float(default.PlayerViewPivot.Roll) * hand);
	PlayerViewPivot.Yaw = int(float(default.PlayerViewPivot.Yaw) * hand);
	RenderedHand = hand;
	// End:0xA0
	if(Class'Engine.PlayerController'.default.bSmallWeapons)
	{
		PlayerViewOffset = SmallViewOffset;		
	}
	else
	{
		PlayerViewOffset = default.PlayerViewOffset;
	}
	PlayerViewOffset.Y *= hand;
	SetLocation(Instigator.Location + Instigator.CalcDrawOffset(self));
	WeaponRotation = Instigator.GetViewRotation();
	// End:0x121
	if(bDualMode != bWasDualMode)
	{
		bWasDualMode = true;
		DualPickupTime = Level.TimeSeconds;
	}
	// End:0x180
	if(DualPickupTime > (Level.TimeSeconds - 0.5000000))
	{
		WeaponRotation.Pitch = int(float(WeaponRotation.Pitch - 16384) - (float(32768) * (DualPickupTime - Level.TimeSeconds)));
	}
	SetRotation(WeaponRotation);
	bDrawingFirstPerson = true;
	// End:0x231
	if(bDualMode && FireMode[1].FlashEmitter != none)
	{
		bRealHidden = FireMode[1].FlashEmitter.bHidden;
		// End:0x1F9
		if(!bFireLeft)
		{
			FireMode[1].FlashEmitter.bHidden = true;
		}
		Canvas.DrawActor(self, false, false, DisplayFOV);
		FireMode[1].FlashEmitter.bHidden = bRealHidden;		
	}
	else
	{
		Canvas.DrawActor(self, false, false, DisplayFOV);
	}
	bDrawingFirstPerson = false;
	hand *= float(-1);
	//return;	
}

simulated function DetachFromPawn(Pawn P)
{
	bFireLeft = false;
	// End:0x30
	if(AssaultGrenade(FireMode[1]) != none)
	{
		AssaultGrenade(FireMode[1]).ReturnToIdle();
	}
	super.DetachFromPawn(P);
	// End:0x59
	if(OffhandActor != none)
	{
		OffhandActor.Destroy();
		OffhandActor = none;
	}
	//return;	
}

function AttachToPawn(Pawn P)
{
	local name BoneName;

	// End:0x33
	if(ThirdPersonActor == none)
	{
		ThirdPersonActor = Spawn(AttachmentClass, Owner);
		InventoryAttachment(ThirdPersonActor).InitFor(self);
	}
	BoneName = P.GetWeaponBoneFor(self);
	// End:0x86
	if(BoneName == 'None')
	{
		ThirdPersonActor.SetLocation(P.Location);
		ThirdPersonActor.SetBase(P);		
	}
	else
	{
		P.AttachToBone(ThirdPersonActor, BoneName);
	}
	// End:0x22F
	if(bDualMode)
	{
		BoneName = P.GetOffhandBoneFor(self);
		// End:0xCF
		if(BoneName == 'None')
		{
			return;
		}
		// End:0x102
		if(OffhandActor == none)
		{
			OffhandActor = AssaultAttachment(Spawn(AttachmentClass, Owner));
			OffhandActor.InitFor(self);
		}
		P.AttachToBone(OffhandActor, BoneName);
		// End:0x142
		if(OffhandActor.AttachmentBone == 'None')
		{
			OffhandActor.Destroy();			
		}
		else
		{
			ThirdPersonActor.SetDrawScale(0.3000000);
			OffhandActor.SetDrawScale(0.3000000);
			OffhandActor.bDualGun = true;
			OffhandActor.TwinGun = AssaultAttachment(ThirdPersonActor);
			// End:0x1DE
			if(Mesh == OldMesh)
			{
				OffhandActor.SetRelativeRotation(rot(0, 32768, 0));
				OffhandActor.SetRelativeLocation(vect(20.0000000, -10.0000000, -5.0000000));				
			}
			else
			{
				OffhandActor.SetRelativeRotation(rot(0, 0, 32768));
				OffhandActor.SetRelativeLocation(vect(40.0000000, -3.0000000, -7.0000000));
			}
			AssaultAttachment(ThirdPersonActor).TwinGun = OffhandActor;
		}
	}
	//return;	
}

simulated function DrawWeaponInfo(Canvas Canvas)
{
	NewDrawWeaponInfo(Canvas, 0.7050000 * Canvas.ClipY);
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas Canvas, float YPos)
{
	local int i, Count;
	local float ScaleFactor;

	// End:0x1B
	if((DrawWeaponInfoVersion > 0) && DrawWeaponInfoVersion != 2)
	{
		return;
	}
	DrawWeaponInfoVersion = 2;
	ScaleFactor = (99.0000000 * Canvas.ClipX) / float(3200);
	Canvas.Style = 5;
	Canvas.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Count = Min(8, AmmoAmount(1));
	i = 0;
	J0x8D:

	// End:0x113 [Loop If]
	if(i < Count)
	{
		Canvas.SetPos(Canvas.ClipX - (((0.5000000 * float(i)) + float(1)) * ScaleFactor), YPos);
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 174.0000000, 259.0000000, 46.0000000, 45.0000000);
		i++;
		// [Loop Continue]
		goto J0x8D;
	}
	// End:0x1CB
	if((AmmoAmount(1)) > 8)
	{
		Count = Min(16, AmmoAmount(1));
		i = 8;
		J0x13A:

		// End:0x1CB [Loop If]
		if(i < Count)
		{
			Canvas.SetPos(Canvas.ClipX - (((0.5000000 * float(i - 8)) + float(1)) * ScaleFactor), YPos - ScaleFactor);
			Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 174.0000000, 259.0000000, 46.0000000, 45.0000000);
			i++;
			// [Loop Continue]
			goto J0x13A;
		}
	}
	//return;	
}

simulated function DrawWeaponInfo3(Canvas Canvas, float XPos, float YPos)
{
	local int i, Count;
	local float ScaleFactor;

	// End:0x1B
	if((DrawWeaponInfoVersion > 0) && DrawWeaponInfoVersion != 3)
	{
		return;
	}
	DrawWeaponInfoVersion = 3;
	ScaleFactor = 99.0000000 * FMin(Canvas.ClipX / 3200.0000000, Canvas.ClipY / 2400.0000000);
	Canvas.Style = 5;
	Canvas.DrawColor = Class'Engine.HUD'.default.WhiteColor;
	Count = Min(8, AmmoAmount(1));
	i = 0;
	J0xA2:

	// End:0x126 [Loop If]
	if(i < Count)
	{
		Canvas.SetPos(XPos - (((0.5000000 * float(i)) + float(1)) * ScaleFactor), YPos - ScaleFactor);
		Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 174.0000000, 259.0000000, 46.0000000, 45.0000000);
		i++;
		// [Loop Continue]
		goto J0xA2;
	}
	// End:0x1DB
	if((AmmoAmount(1)) > 8)
	{
		Count = Min(16, AmmoAmount(1));
		i = 8;
		J0x14D:

		// End:0x1DB [Loop If]
		if(i < Count)
		{
			Canvas.SetPos(XPos - (((0.5000000 * float(i - 8)) + float(1)) * ScaleFactor), YPos - (float(2) * ScaleFactor));
			Canvas.DrawTile(Texture'HudContent.Generic.HUD', ScaleFactor, ScaleFactor, 174.0000000, 259.0000000, 46.0000000, 45.0000000);
			i++;
			// [Loop Continue]
			goto J0x14D;
		}
	}
	//return;	
}

function byte BestMode()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x7D
	if((B != none) && B.Enemy != none)
	{
		// End:0x7D
		if(((FRand() < 0.1000000) || !B.EnemyVisible()) && (AmmoAmount(1)) >= FireMode[1].AmmoPerFire)
		{
			return 1;
		}
	}
	// End:0x9C
	if((AmmoAmount(0)) >= FireMode[0].AmmoPerFire)
	{
		return 0;
	}
	return 1;
	//return;	
}

simulated function float ChargeBar()
{
	return FMin(1.0000000, FireMode[1].HoldTime / AssaultGrenade(FireMode[1]).mHoldClampMax);
	//return;	
}

function bool HandlePickupQuery(Pickup Item)
{
	// End:0x111
	if(Class == Item.InventoryType)
	{
		// End:0x2D
		if(bDualMode)
		{
			return super.HandlePickupQuery(Item);
		}
		bDualMode = true;
		// End:0x66
		if(Instigator.Weapon == self)
		{
			PlayOwnedSound(SelectSound, 3,,,,, false);
			AttachToPawn(Instigator);
		}
		// End:0x90
		if(Level.GRI.WeaponBerserk > 1.0000000)
		{
			CheckSuperBerserk();			
		}
		else
		{
			FireMode[0].FireRate = FireMode[0].default.FireRate * 0.5500000;
		}
		FireMode[0].Spread = FireMode[0].default.Spread * 1.5000000;
		// End:0x10F
		if((xPawn(Instigator) != none) && xPawn(Instigator).bBerserk)
		{
			StartBerserk();
		}
		return false;
	}
	// End:0x1A2
	if(Item.InventoryType == AmmoClass[1])
	{
		// End:0x155
		if((AmmoCharge[1] >= (MaxAmmo(1))) && AmmoCharge[0] >= (MaxAmmo(0)))
		{
			return true;
		}
		Item.AnnouncePickup(Pawn(Owner));
		AddAmmo(50, 0);
		AddAmmo(Ammo(Item).AmmoAmount, 1);
		Item.SetRespawn();
		return true;
	}
	// End:0x1AF
	if(Inventory == none)
	{
		return false;
	}
	return Inventory.HandlePickupQuery(Item);
	//return;	
}

simulated function int MaxAmmo(int Mode)
{
	// End:0x2E
	if(bDualMode)
	{
		return 2 * FireMode[Mode].AmmoClass.default.MaxAmmo;		
	}
	else
	{
		return FireMode[Mode].AmmoClass.default.MaxAmmo;
	}
	//return;	
}

function float GetAIRating()
{
	local Bot B;

	// End:0x11
	if(!bDualMode)
	{
		return AIRating;
	}
	B = Bot(Instigator.Controller);
	// End:0x3B
	if(B == none)
	{
		return AIRating;
	}
	// End:0xAF
	if(B.Enemy == none)
	{
		// End:0xA9
		if((B.Target != none) && VSize(B.Target.Location - B.Pawn.Location) > float(8000))
		{
			return 0.7800000;
		}
		return AIRating;
	}
	return AIRating + (0.0003000 * FClamp(1500.0000000 - VSize(B.Enemy.Location - Instigator.Location), 0.0000000, 1000.0000000));
	//return;	
}

defaultproperties
{
	FireModeClass[0]=Class'XWeapons.AssaultFire'
	FireModeClass[1]=Class'XWeapons.AssaultGrenade'
	PutDownAnim="PutDown"
	SelectSound=Sound'WeaponSounds.AssaultRifle.SwitchToAssaultRifle'
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	bShowChargingBar=true
	OldMesh=SkeletalMesh'Weapons.AssaultRifle_1st'
	OldPickup="WeaponStaticMesh.AssaultRiflePickup"
	OldCenteredOffsetY=0.0000000
	OldPlayerViewOffset=(X=-8.0000000,Y=5.0000000,Z=-6.0000000)
	OldSmallViewOffset=(X=4.0000000,Y=11.0000000,Z=-12.0000000)
	OldPlayerViewPivot=(Pitch=400,Yaw=0,Roll=0)
	OldCenteredRoll=3000
	Description="Inexpensive and easily produced, the AR770 provides a lightweight 5.56mm combat solution that is most effective against unarmored foes. With low-to-moderate armor penetration capabilities, this rifle is best suited to a role as a light support weapon.|The optional M355 Grenade Launcher provides the punch that makes this weapon effective against heavily armored enemies.  Pick up a second assault rifle to double your fire power."
	EffectOffset=(X=100.0000000,Y=25.0000000,Z=-10.0000000)
	DisplayFOV=70.0000000
	Priority=3
	HudColor=(R=255,G=128,B=192,A=255)
	SmallViewOffset=(X=13.0000000,Y=12.0000000,Z=-10.0000000)
	CenteredOffsetY=-5.0000000
	CenteredRoll=3000
	CenteredYaw=-1500
	CustomCrosshair=4
	CustomCrossHairScale=0.6667000
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Cross5"
	InventoryGroup=2
	PickupClass=Class'XWeapons.AssaultRiflePickup'
	PlayerViewOffset=(X=4.0000000,Y=5.5000000,Z=-6.0000000)
	PlayerViewPivot=(Pitch=400,Yaw=0,Roll=0)
	BobDamping=1.7000000
	AttachmentClass=Class'XWeapons.AssaultAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=245,Y1=39,X2=329,Y2=79)
	ItemName="Assault Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=255.0000000
	LightRadius=4.0000000
	LightPeriod=3
	Mesh=SkeletalMesh'NewWeapons2004.AssaultRifle'
	DrawScale=0.8000000
	HighDetailOverlay=Combiner'UT2004Weapons.WeaponSpecMap2'
}
