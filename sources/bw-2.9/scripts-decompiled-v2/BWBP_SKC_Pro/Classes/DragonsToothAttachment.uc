class DragonsToothAttachment extends BallisticMeleeAttachment;

var bool bRedTeam;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bRedTeam;
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0xEF
	if(Instigator != none)
	{
		// End:0xCB
		if(((Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.Team != none) || bRedTeam)
		{
			// End:0x98
			if((Instigator.PlayerReplicationInfo.Team.TeamIndex == 0) || bRedTeam)
			{
				Skins[0] = Shader'BWBP_SKC_Tex.DragonToothSword.DTS-Red3rd';
				LightHue = 5;				
			}
			else
			{
				// End:0xCB
				if(Instigator.PlayerReplicationInfo.Team.TeamIndex == 1)
				{
					Skins[0] = Shader'BWBP_SKC_Tex.DragonToothSword.DTS-Shine3rd';
				}
			}
		}
		// End:0xEF
		if((Owner == none) || Instigator == Owner)
		{
			LightType = 0;
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.DragonsToothSword'
	ImpactManager=Class'BWBP_SKC_Pro.IM_DTS'
	BrassMode=3
	InstantMode=2
	FlashMode=3
	LightMode=3
	TrackAnimMode=2
	bHeavy=true
	LightType=1
	LightEffect=21
	LightHue=160
	LightSaturation=64
	LightBrightness=150.0000000
	LightRadius=64.0000000
	bDynamicLight=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.DTS_TPm'
	RelativeLocation=(X=0.0000000,Y=-3.0000000,Z=6.0000000)
	DrawScale=0.1200000
}
