class AD_Knife extends AD_ImpactDecal
	config(BallisticProV55);

simulated event PostBeginPlay()
{
	local int SliceAnim;
	local Rotator R;

	R = Rotation;
	R.Roll = (-8192 - R.Yaw) + Rotator(Owner.Location - Location).Yaw;
	// End:0x162
	if(((((Owner != none) && Pawn(Owner) != none) && Pawn(Owner).Weapon != none) && Pawn(Owner).Weapon.GetFireMode(0) != none) && X3PrimaryFire(Pawn(Owner).Weapon.GetFireMode(0)) != none)
	{
		SliceAnim = X3PrimaryFire(Pawn(Owner).Weapon.GetFireMode(0)).SliceAnim;
		// End:0x122
		if(SliceAnim == 0)
		{
			R.Roll -= 24768;			
		}
		else
		{
			// End:0x142
			if(SliceAnim == 2)
			{
				R.Roll += 32768;				
			}
			else
			{
				// End:0x15F
				if(SliceAnim == 3)
				{
					R.Roll -= 8192;
				}
			}
		}		
	}
	else
	{
		R.Roll = Rand(65536);
	}
	SetRotation(R);
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	bRandomRotate=false
	DrawScaleVariance=0.0500000
	ProjTexture=Texture'BW_Core_WeaponTex.Decals.KnifeCut'
	DrawScale=0.2000000
}
