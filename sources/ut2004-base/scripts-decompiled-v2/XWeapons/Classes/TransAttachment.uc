class TransAttachment extends xWeaponAttachment;

function InitFor(Inventory i)
{
	super.InitFor(i);
	//return;	
}

simulated event ThirdPersonEffects()
{
	super.ThirdPersonEffects();
	//return;	
}

simulated event BaseChange()
{
	// End:0x97
	if(((Pawn(Base) != none) && Pawn(Base).PlayerReplicationInfo != none) && Pawn(Base).PlayerReplicationInfo.Team != none)
	{
		// End:0x8A
		if(Pawn(Base).PlayerReplicationInfo.Team.TeamIndex == 1)
		{
			Skins[1] = Texture'WeaponSkins.Skins.NEWTranslocatorBLUE';			
		}
		else
		{
			Skins[1] = Texture'WeaponSkins.Skins.NEWTranslocatorTEX';
		}
	}
	//return;	
}

defaultproperties
{
	bHeavy=true
	Mesh=SkeletalMesh'NewWeapons2004.NEWTranslauncher_3rd'
	Skins[0]=FinalBlend'EpicParticles.JumpPad.NewTransLaunBoltFB'
	Skins[1]=Texture'WeaponSkins.Skins.NEWTranslocatorTEX'
	Skins[2]=Texture'WeaponSkins.AmmoPickups.NEWTranslocatorPUCK'
	Skins[3]=FinalBlend'WeaponSkins.AmmoPickups.NewTransGlassFB'
}
