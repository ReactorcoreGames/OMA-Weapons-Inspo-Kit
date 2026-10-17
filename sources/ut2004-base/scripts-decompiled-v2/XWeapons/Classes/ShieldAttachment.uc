class ShieldAttachment extends xWeaponAttachment;

var ForceRing ForceRing3rd;
var ShieldEffect3rd ShieldEffect3rd;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		ShieldEffect3rd;
}

simulated function Destroyed()
{
	// End:0x17
	if(ShieldEffect3rd != none)
	{
		ShieldEffect3rd.Destroy();
	}
	// End:0x2E
	if(ForceRing3rd != none)
	{
		ForceRing3rd.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x85
	if(((Instigator.PlayerReplicationInfo == none) || Instigator.PlayerReplicationInfo.Team == none) || Instigator.PlayerReplicationInfo.Team.TeamIndex > 1)
	{
		ShieldEffect3rd = Spawn(Class'XWeapons.ShieldEffect3rd', i.Instigator);		
	}
	else
	{
		// End:0xCA
		if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
		{
			ShieldEffect3rd = Spawn(Class'XWeapons.ShieldEffect3rdRed', i.Instigator);			
		}
		else
		{
			ShieldEffect3rd = Spawn(Class'XWeapons.ShieldEffect3rdBLUE', i.Instigator);
		}
	}
	ShieldEffect3rd.SetBase(i.Instigator);
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x6D
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(FlashCount) > 0)
	{
		// End:0x6D
		if(int(FiringMode) == 0)
		{
			// End:0x5E
			if(ForceRing3rd == none)
			{
				ForceRing3rd = Spawn(Class'XEffects.ForceRing');
				AttachToBone(ForceRing3rd, 'tip');
			}
			ForceRing3rd.Fire();
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

function SetBrightness(int B, bool Hit)
{
	// End:0x25
	if(ShieldEffect3rd != none)
	{
		ShieldEffect3rd.SetBrightness(B, Hit);
	}
	//return;	
}

defaultproperties
{
	bHeavy=true
	Mesh=SkeletalMesh'Weapons.ShieldGun_3rd'
}
