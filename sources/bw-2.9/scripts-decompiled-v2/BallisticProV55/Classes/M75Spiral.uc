class M75Spiral extends Actor
	notplaceable;

var ColorModifier SpiralColorMod;
var TexScaler SpiralScaler;
var FinalBlend SpiralFinal;
var byte RailPower;

simulated function InitSpiral(float dist, byte RP)
{
	local Vector Size3D;

	Size3D = DrawScale3D;
	Size3D.X = dist / float(128);
	SetDrawScale3D(Size3D);
	RailPower = RP;
	SpiralColorMod = ColorModifier(Level.ObjectPool.AllocateObject(Class'Engine.ColorModifier'));
	// End:0xF3
	if(SpiralColorMod != none)
	{
		SpiralColorMod.Material = Skins[0];
		SpiralColorMod.Color.R = RP;
		SpiralColorMod.Color.G = RP;
		SpiralColorMod.Color.B = RP;
		SpiralScaler = TexScaler(Level.ObjectPool.AllocateObject(Class'Engine.TexScaler'));
	}
	// End:0x155
	if(SpiralScaler != none)
	{
		SpiralScaler.Material = SpiralColorMod;
		SpiralScaler.UScale = 128.0000000 / dist;
		SpiralFinal = FinalBlend(Level.ObjectPool.AllocateObject(Class'Engine.FinalBlend'));
	}
	// End:0x1B4
	if(SpiralFinal != none)
	{
		SpiralFinal.Material = SpiralScaler;
		SpiralFinal.FrameBufferBlending = 4;
		SpiralFinal.TwoSided = true;
		SpiralFinal.ZWrite = false;
		Skins[0] = SpiralFinal;
	}
	//return;	
}

simulated function DestroySpiralTex()
{
	// End:0x2F
	if(SpiralColorMod != none)
	{
		Level.ObjectPool.FreeObject(SpiralColorMod);
		SpiralColorMod = none;
	}
	// End:0x5E
	if(SpiralScaler != none)
	{
		Level.ObjectPool.FreeObject(SpiralScaler);
		SpiralScaler = none;
	}
	// End:0x8D
	if(SpiralFinal != none)
	{
		Level.ObjectPool.FreeObject(SpiralFinal);
		SpiralFinal = none;
	}
	//return;	
}

event Destroyed()
{
	DestroySpiralTex();
	super.Destroyed();
	//return;	
}

event Tick(float dt)
{
	local float F;
	local Vector Size3D;

	super.Tick(dt);
	// End:0x18
	if(SpiralColorMod == none)
	{
		return;
	}
	F = (LifeSpan / default.LifeSpan) * float(RailPower);
	SpiralColorMod.Color.R = byte(F);
	SpiralColorMod.Color.G = byte(F);
	SpiralColorMod.Color.B = byte(F);
	Size3D = DrawScale3D;
	F = 3.0000000 - (2.0000000 * (LifeSpan / default.LifeSpan));
	Size3D.Y = F;
	Size3D.Z = F;
	SetDrawScale3D(Size3D);
	//return;	
}

defaultproperties
{
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.RailCylinder2'
	Physics=5
	RemoteRole=0
	LifeSpan=0.9000000
	Skins[0]=Texture'BW_Core_WeaponTex.GunFire.RailSpiralSmoke'
	bUnlit=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
