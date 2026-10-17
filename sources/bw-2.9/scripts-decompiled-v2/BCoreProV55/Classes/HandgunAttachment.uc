class HandgunAttachment extends BallisticAttachment;

var BallisticHandgun HandGun;
var() bool bIsSlave;
var() Vector SlaveOffset;
var() Rotator SlavePivot;
var float SlaveAlpha;
var HandgunAttachment OtherGun;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		OtherGun, bIsSlave;
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x61
	if(((OtherGun != none) && !bIsSlave) && OtherGun.bIsSlave)
	{
		OtherGun.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	// End:0x39
	if((OtherGun != none) && !bIsSlave)
	{
		OtherGun.Hide(NewbHidden);
	}
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	// End:0x7E
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		// End:0x65
		if(HandGun != none)
		{
			return HandGun.GetEffectStart();			
		}
		else
		{
			return Instigator.Weapon.GetEffectStart();
		}
	}
	return GetBoneCoords('tip').Origin;
	//return;	
}

simulated function Destroyed()
{
	// End:0x56
	if(bIsSlave && Instigator != none)
	{
		Instigator.SetBoneDirection(AttachmentBone, Rotation,, 0.0000000, 0);
		Instigator.SetBoneDirection('lfarm', Rotation,, 0.0000000, 0);
	}
	super.Destroyed();
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	super.FlashMuzzleFlash(Mode);
	// End:0x1F
	if(bIsSlave)
	{
		SlaveAlpha = 1.0000000;
	}
	//return;	
}

simulated function FlashWeaponLight(byte Mode)
{
	// End:0x54
	if(((int(LightMode) == int(3)) || (int(LightMode) == int(1)) && int(Mode) == 0) || (int(LightMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0xB1
	if(((Instigator == none) || Level.bDropDetail) || ((Level.TimeSeconds - LastRenderTime) > 0.2000000) && PlayerController(Instigator.Controller) == none)
	{
		return;
	}
	// End:0xCA
	if(HandGun != none)
	{
		LightWeapon = HandGun;		
	}
	else
	{
		LightWeapon = self;
	}
	LightWeapon.bDynamicLight = true;
	SetTimer(WeaponLightTime, false);
	//return;	
}

simulated function Tick(float dt)
{
	local Rotator newRot;

	// End:0xFD
	if((Instigator != none) && bIsSlave)
	{
		newRot = Instigator.Rotation;
		// End:0xAC
		if(SlaveAlpha > float(0))
		{
			// End:0x70
			if(SlaveAlpha >= 0.7500000)
			{
				newRot.Pitch += int((float(7000) * (float(1) - SlaveAlpha)) * float(4));				
			}
			else
			{
				newRot.Pitch += int((float(7000) * SlaveAlpha) * 1.3330000);
			}
			SlaveAlpha = FMax(0.0000000, SlaveAlpha - dt);
		}
		Instigator.SetBoneDirection('lfarm', newRot,, 1.0000000, 1);
		newRot.Roll += 32768;
		Instigator.SetBoneDirection(AttachmentBone, newRot,, 1.0000000, 1);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0xB9
	if((int(Role) < int(ROLE_Authority)) && bIsSlave)
	{
		// End:0xA3
		if((((Instigator != none) && Instigator.Weapon != none) && BallisticHandgun(Instigator.Weapon) != none) && BallisticHandgun(Instigator.Weapon).OtherGun != none)
		{
			HandGun = BallisticHandgun(Instigator.Weapon).OtherGun;
		}
		SetRelativeRotation(SlavePivot);
		SetRelativeLocation(SlaveOffset);
	}
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x7C
	if(BallisticHandgun(i) != none)
	{
		HandGun = BallisticHandgun(i);
		// End:0x5E
		if(HandGun.IsSlave())
		{
			bIsSlave = true;
			SetRelativeRotation(SlavePivot);
			SetRelativeLocation(SlaveOffset);			
		}
		else
		{
			bIsSlave = false;
			SetRelativeRotation(default.RelativeRotation);
			SetRelativeLocation(default.RelativeLocation);
		}
	}
	//return;	
}

defaultproperties
{
	SlaveOffset=(X=17.0000000,Y=-7.0000000,Z=-7.0000000)
	SlavePivot=(Pitch=0,Yaw=32768,Roll=0)
	IdleHeavyAnim="PistolHip_Idle"
	IdleRifleAnim="PistolAimed_Idle"
	SingleFireAnim="PistolHip_Fire"
	SingleAimedFireAnim="PistolAimed_Fire"
	RapidFireAnim="PistolHip_Burst"
	RapidAimedFireAnim="PistolAimed_Burst"
}
