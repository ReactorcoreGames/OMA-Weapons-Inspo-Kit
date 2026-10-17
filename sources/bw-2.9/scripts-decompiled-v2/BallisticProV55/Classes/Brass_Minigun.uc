class Brass_Minigun extends BWBrass_Default
	config(BallisticProV55);

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local float Speed;
	local Rotator R;
	local Vector V, v2;

	// End:0x24
	if((Level.TimeSeconds - LastRenderTime) > 0.0500000)
	{
		Destroy();
		return;
	}
	Velocity = DampenFactor * ((((Velocity Dot HitNormal) * HitNormal) * -2.0000000) + Velocity);
	Speed = VSize(Velocity);
	RandSpin(float(Spin));
	// End:0x1EE
	if((Speed < float(20)) || (Wall != none) && Mover(Wall) != none)
	{
		bBounce = false;
		SetPhysics(0);
		R = Normalize(Rotation);
		// End:0x115
		if(HitNormal.Z == float(1))
		{
			// End:0x106
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
		// End:0x1D4
		if(Wall != none)
		{
			bHardAttach = true;
			SetBase(Wall);
		}
		SetTimer(FMax(0.2000000, LifeSpan - 2.0000000), false);		
	}
	else
	{
		// End:0x22B
		if(Speed > float(100))
		{
			// End:0x22B
			if(bHitSounds && HitSounds.Length > 0)
			{
				PlaySound(HitSounds[0],, HitSoundVolume,, HitSoundRadius,, true);
			}
		}
	}
	//return;	
}

defaultproperties
{
	StartVelocity=(X=0.0000000,Y=20.0000000,Z=150.0000000)
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Brass.EmptyRifleRound'
	LifeSpan=4.0000000
	DrawScale=0.0900000
}
