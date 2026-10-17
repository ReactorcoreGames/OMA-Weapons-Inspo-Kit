class AD_A73Stab extends AD_ImpactDecal
	config(BallisticProV55);

simulated event PostBeginPlay()
{
	local Rotator R;

	R = Rotation;
	R.Roll = (8192 - R.Yaw) + Rotator(Owner.Location - Location).Yaw;
	SetRotation(R);
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	bRandomRotate=false
	DrawScaleVariance=0.0500000
	ProjTexture=Texture'BW_Core_WeaponTex.Decals.A73BladeCut'
	DrawScale=0.2000000
}
