class ShellSpewer extends xEmitter;

var() Sound ShellImpactSnd;

function CollisionSound()
{
	PlaySound(ShellImpactSnd);
	//return;	
}

defaultproperties
{
	ShellImpactSnd=ProceduralSound'WeaponSounds.PShell1.P1Shell1'
	mParticleType=4
	mStartParticles=0
	mMaxParticles=150
	mLifeRange[0]=0.5000000
	mLifeRange[1]=1.0000000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mDirDev=(X=0.5000000,Y=0.2000000,Z=0.6000000)
	mSpeedRange[0]=200.0000000
	mSpeedRange[1]=250.0000000
	mMassRange[0]=2.0000000
	mMassRange[1]=2.0000000
	mSpinRange[0]=-100.0000000
	mSpinRange[1]=100.0000000
	mAttenFunc=5
	mMeshNodes=StaticMesh'XEffects.ShellCasing'
	mColMakeSound=true
	bHighDetail=true
	bNetTemporary=false
	DrawScale=0.0500000
	Skins[0]=Texture'XEffects.ShellCasingTex'
}
