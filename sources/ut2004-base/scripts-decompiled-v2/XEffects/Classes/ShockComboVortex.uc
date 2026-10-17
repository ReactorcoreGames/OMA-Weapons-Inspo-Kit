class ShockComboVortex extends MeshEffect
	placeable;

var() Rotator InitialRot;

event PostBeginPlay()
{
	super.PostBeginPlay();
	SetRotation(InitialRot);
	//return;	
}

defaultproperties
{
	InitialRot=(Pitch=0,Yaw=0,Roll=16384)
	FadeInterp=(Start=0.0000000,Mid=1.0000000,End=0.0000000,InTime=0.0000000,OutTime=0.9000000,InStyle=1,OutStyle=1)
	ScaleInterp=(Start=0.4000000,Mid=1.6000000,End=0.2000000,InTime=0.4000000,OutTime=0.4000000,InStyle=3,OutStyle=3)
	DrawType=2
	Mesh=VertMesh'XEffects.ShockVortexMesh'
	Skins[0]=FinalBlend'XEffectMat.Shock.ShockElecRingFB'
	bUnlit=true
	bAlwaysFaceCamera=true
}
