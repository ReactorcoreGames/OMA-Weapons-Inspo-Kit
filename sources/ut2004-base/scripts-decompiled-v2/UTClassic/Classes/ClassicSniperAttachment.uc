class ClassicSniperAttachment extends xWeaponAttachment;

var xEmitter mMuzFlash3rd;
var float SmokeOffsetZ;

simulated function Destroyed()
{
	// End:0x17
	if(mMuzFlash3rd != none)
	{
		mMuzFlash3rd.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated event ThirdPersonEffects()
{
	local Vector SmokeLoc, SmokeOffset;
	local Coords C;

	// End:0x205
	if((int(FlashCount) != 0) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x3B
		if(int(FiringMode) == 0)
		{
			WeaponLight();
		}
		// End:0xCE
		if(Instigator.IsFirstPerson())
		{
			SmokeLoc = (Instigator.Location + (Instigator.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000))) + (Instigator.CollisionRadius * Vector(Instigator.Controller.Rotation));
			SmokeLoc.Z += SmokeOffsetZ;
			Spawn(Class'UTClassic.ClassicSniperSmoke',,, SmokeLoc);			
		}
		else
		{
			// End:0x205
			if((Level.TimeSeconds - Instigator.LastRenderTime) < 0.2000000)
			{
				// End:0x10F
				if(mMuzFlash3rd == none)
				{
					mMuzFlash3rd = Spawn(Class'XEffects.AssaultMuzFlash3rd');
				}
				C = Instigator.GetBoneCoords('righthand');
				SmokeOffset = (float(-1) * C.ZAxis) * (Instigator.CollisionRadius + float(35));
				mMuzFlash3rd.SetLocation(((C.Origin + SmokeOffset) + (C.ZAxis * float(23))) + (C.YAxis * 4.5000000));
				mMuzFlash3rd.SetDrawScale(1.0000000);
				mMuzFlash3rd.SetRotation(Rotator(float(-1) * C.ZAxis));
				mMuzFlash3rd.mStartParticles++;
				SmokeLoc = C.Origin + SmokeOffset;
				Spawn(Class'UTClassic.ClassicSniperSmoke',,, SmokeLoc);
			}
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

simulated function Vector GetTipLocation()
{
	return Location - (Vector(Rotation) * float(100));
	//return;	
}

defaultproperties
{
	SmokeOffsetZ=10.0000000
	LightType=1
	LightEffect=13
	LightHue=30
	LightSaturation=170
	LightBrightness=255.0000000
	LightRadius=5.0000000
	LightPeriod=3
	Mesh=SkeletalMesh'NewWeapons2004.Sniper3rd'
	RelativeLocation=(X=-30.0000000,Y=0.0000000,Z=4.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.1600000
}
