class BloodSplatter extends xScorch;

var Texture Splats[3];

simulated function PostBeginPlay()
{
	ProjTexture = Splats[Rand(3)];
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	Splats[0]=Texture'XEffects.BloodSplat1'
	Splats[1]=Texture'XEffects.BloodSplat2'
	Splats[2]=Texture'XEffects.BloodSplat3'
	ProjTexture=Texture'XEffects.BloodSplat1'
	FOV=6
	bClipStaticMesh=true
	CullDistance=7000.0000000
	LifeSpan=5.0000000
}
