class Brass_Longhorn extends BWBrass_Default
	config(BallisticProV55);

var() float HitSoundPitch;

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local float Speed;
	local Rotator R;
	local Vector HitLoc, HitNorm, V, v2;
	local Material HitMat;
	local int Surf;

	Velocity = DampenFactor * ((((Velocity Dot HitNormal) * HitNormal) * -2.0000000) + Velocity);
	Speed = VSize(Velocity);
	RandSpin(float(Spin));
	// End:0x1D7
	if((Speed < float(20)) || (Wall != none) && Mover(Wall) != none)
	{
		bBounce = false;
		SetPhysics(0);
		R = Normalize(Rotation);
		// End:0xF1
		if(HitNormal.Z == float(1))
		{
			// End:0xE2
			if((R.Pitch > 16384) || R.Pitch < -16384)
			{
				R.Pitch = 32768;				
			}
			else
			{
				R.Pitch = 0;
			}			
		}
		else
		{
			V = Vector(Rotator(HitNormal) - rot(16384, 0, 0));
			V.Z = 0.0000000;
			v2 = Vector(R);
			v2.Z = 0.0000000;
			R.Pitch += int(float((Rotator(HitNormal).Pitch - 16384) - R.Pitch) * Abs(Normal(V) Dot Normal(v2)));
		}
		SetRotation(R);
		bCollideWorld = false;
		SetCollision(false, false);
		// End:0x1B0
		if(Wall != none)
		{
			bHardAttach = true;
			SetBase(Wall);
		}
		// End:0x1D4
		if(LifeTimeScale != float(0))
		{
			SetTimer(FMax(0.2000000, LifeSpan - 2.0000000), false);
		}		
	}
	else
	{
		// End:0x2B3
		if(Speed > float(100))
		{
			// End:0x21F
			if((Wall != none) && !Wall.bWorldGeometry)
			{
				Surf = int(Wall.SurfaceType);				
			}
			else
			{
				Trace(HitLoc, HitNorm, Location - (HitNormal * float(10)), Location + (HitNormal * float(10)), false,, HitMat);
				// End:0x278
				if(HitMat != none)
				{
					Surf = int(HitMat.SurfaceType);
				}
			}
			// End:0x2B3
			if(bHitSounds && HitSounds.Length > Surf)
			{
				PlaySound(HitSounds[Surf],, HitSoundVolume,, HitSoundRadius, HitSoundPitch, true);
			}
		}
	}
	//return;	
}

defaultproperties
{
	HitSoundPitch=0.5000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Longhorn.LonghornBrass'
	DrawScale=0.2000000
	RotationRate=(Pitch=40000,Yaw=20000,Roll=30000)
}
