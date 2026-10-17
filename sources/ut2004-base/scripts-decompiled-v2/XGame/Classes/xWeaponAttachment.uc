class xWeaponAttachment extends WeaponAttachment;

var() bool bHeavy;
var() bool bRapidFire;
var() bool bAltRapidFire;
var Vector mHitNormal;
var Actor mHitActor;
var Weapon LitWeapon;

simulated function GetHitInfo()
{
	local Vector HitLocation, offset;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_Standalone))
	{
		return;
	}
	offset = float(20) * Normal(Instigator.Location - mHitLocation);
	mHitActor = Trace(HitLocation, mHitNormal, mHitLocation - offset, mHitLocation + offset, false);
	NetUpdateTime = Level.TimeSeconds - float(1);
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	bHidden = NewbHidden;
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x9F
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x2B
		if(xPawn(Instigator) == none)
		{
			return;
		}
		// End:0x4F
		if(int(FlashCount) == 0)
		{
			xPawn(Instigator).StopFiring();			
		}
		else
		{
			// End:0x7F
			if(int(FiringMode) == 0)
			{
				xPawn(Instigator).StartFiring(bHeavy, bRapidFire);				
			}
			else
			{
				xPawn(Instigator).StartFiring(bHeavy, bAltRapidFire);
			}
		}
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x32
	if((Instigator != none) && xPawn(Instigator) != none)
	{
		xPawn(Instigator).SetWeaponAttachment(self);
	}
	//return;	
}

simulated function Vector GetTipLocation()
{
	local Coords C;

	C = GetBoneCoords('tip');
	return C.Origin;
	//return;	
}

simulated function WeaponLight()
{
	// End:0xBA
	if((((int(FlashCount) > 0) && !Level.bDropDetail) && Instigator != none) && ((Level.TimeSeconds - LastRenderTime) < 0.2000000) || PlayerController(Instigator.Controller) != none)
	{
		// End:0xA6
		if(Instigator.IsFirstPerson())
		{
			LitWeapon = Instigator.Weapon;
			LitWeapon.bDynamicLight = true;			
		}
		else
		{
			bDynamicLight = true;
		}
		SetTimer(0.1500000, false);		
	}
	else
	{
		Timer();
	}
	//return;	
}

function InitFor(Inventory i)
{
	super(InventoryAttachment).InitFor(i);
	// End:0x26
	if(xPawn(i.Instigator) == none)
	{
		return;
	}
	// End:0x59
	if(xPawn(i.Instigator).bClearWeaponOffsets)
	{
		SetRelativeLocation(vect(0.0000000, 0.0000000, 0.0000000));
	}
	//return;	
}

simulated function Timer()
{
	// End:0x23
	if(LitWeapon != none)
	{
		LitWeapon.bDynamicLight = false;
		LitWeapon = none;
	}
	bDynamicLight = false;
	//return;	
}

defaultproperties
{
	DrawScale=0.4000000
}
