class bloodsplatterpurple extends xScorch;

var Texture Splats[3];

simulated function PostBeginPlay()
{
	ProjTexture = Splats[Rand(3)];
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	Splats[0]=Texture'XEffects.BloodSplat1P'
	Splats[1]=Texture'XEffects.BloodSplat2P'
	Splats[2]=Texture'XEffects.BloodSplat3P'
	ProjTexture=Texture'XEffects.BloodSplat1P'
	FOV=6
	bClipStaticMesh=true
	CullDistance=7000.0000000
	LifeSpan=5.0000000
}
