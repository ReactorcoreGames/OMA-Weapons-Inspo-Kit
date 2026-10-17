class M75XRayFlare extends BallisticEmitter;

function Initialize(Actor A)
{
	// End:0x10
	if(A == none)
	{
		Destroy();
		return;
	}
	Emitters[0].SkeletalMeshActor = A;
	SetLocation(A.Location - (vect(0.0000000, 0.0000000, 1.0000000) * A.CollisionHeight));
	SetRotation(A.Rotation + rot(0, -16384, 0));
	SetBase(A);
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.M75XRayFlare.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		ZTest=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=160,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=192,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.6000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.3400000
		FadeInEndTime=0.1550000
		CoordinateSystem=1
		MaxParticles=30
		StartSizeRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=2.0000000,Max=20.0000000),Z=(Min=2.0000000,Max=20.0000000))
		UseSkeletalLocationAs=2
		SkeletalScale=(X=0.3900000,Y=0.3900000,Z=0.3900000)
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=-1.0000000))
		GetVelocityDirectionFrom=2
	end object
	Emitters[0]=SpriteEmitter0
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.M75XRayFlare.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	ZTest=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=160,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=192,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.6000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.3400000
	FadeInEndTime=0.1550000
	CoordinateSystem=1
	MaxParticles=30
	StartSizeRange=(X=(Min=2.0000000,Max=20.0000000),Y=(Min=2.0000000,Max=20.0000000),Z=(Min=2.0000000,Max=20.0000000))
	UseSkeletalLocationAs=2
	SkeletalScale=(X=0.3900000,Y=0.3900000,Z=0.3900000)
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=-1.0000000))
	GetVelocityDirectionFrom=2
end object
