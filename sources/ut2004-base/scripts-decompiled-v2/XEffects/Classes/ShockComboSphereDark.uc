class ShockComboSphereDark extends MeshEffect
	placeable;

event PostBeginPlay()
{
	super.PostBeginPlay();
	SetRotation(RotRand());
	//return;	
}

defaultproperties
{
	FadeInterp=(Start=0.0000000,Mid=1.0000000,End=0.0000000,InTime=0.1500000,OutTime=0.7500000,InStyle=1,OutStyle=1)
	ScaleInterp=(Start=0.1000000,Mid=0.8000000,End=0.0000000,InTime=0.3000000,OutTime=0.3000000,InStyle=3,OutStyle=3)
	DrawType=8
	StaticMesh=StaticMesh'Editor.TexPropSphere'
	Skins[0]=Shader'WarEffectsTextures.Particles.N_energy01_S_JM'
	bUnlit=true
}
