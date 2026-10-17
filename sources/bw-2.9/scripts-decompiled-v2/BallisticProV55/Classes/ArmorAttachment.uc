class ArmorAttachment extends InventoryAttachment;

var byte HitCount;
var byte OldHitCount;
var byte AHitType;
var Vector AHitLocation;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		AHitLocation, AHitType, 
		HitCount;
}

simulated function PostNetReceive()
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Client))
	{
		return;
	}
	// End:0x3F
	if(int(HitCount) != int(OldHitCount))
	{
		ThirdPersonEffects();
		OldHitCount = HitCount;
	}
	//return;	
}

simulated function ThirdPersonEffects()
{
	local Rotator R;

	// End:0xB4
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Instigator != none)
	{
		// End:0xB4
		if(int(AHitType) < 2)
		{
			R = Rotator(AHitLocation - Instigator.Location);
			R.Pitch *= 0.5000000;
			Spawn(Class'BallisticProV55.IE_Armor', Instigator,, AHitLocation, R);
			// End:0x9F
			if(int(AHitType) == 1)
			{
				PlaySound(SoundGroup'BW_Core_WeaponSound.BulletImpacts.ArmorMisc',, 0.7000000,, 64.0000000);				
			}
			else
			{
				PlaySound(SoundGroup'BW_Core_WeaponSound.BulletImpacts.BulletArmor',, 1.0000000,, 64.0000000);
			}
		}
	}
	//return;	
}

function UpdateHit(Vector HitLoc, byte HitType)
{
	AHitLocation = HitLoc;
	AHitType = HitType;
	HitCount++;
	ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	bHidden=true
	bReplicateInstigator=true
	bNetNotify=true
}
