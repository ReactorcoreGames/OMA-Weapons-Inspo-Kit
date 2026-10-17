class BW_HitGoreEmitter extends DGVEmitter;

struct GibInfo
{
	var() StaticMesh Mesh;
	var() Vector offset;
	var() RangeVector Velocity;
	var() Rotator Pivot;
	var() float DrawScale;
};

var() array<GibInfo> Gibs;

simulated function AlignVelocity()
{
	local int i;
	local Vector X, Y, Z, VMax, vmin;

	GetAxes(Rotation, X, Y, Z);
	i = 0;
	J0x1D:

	// End:0x1ED [Loop If]
	if(i < Emitters.Length)
	{
		// End:0x53
		if((DisableDGV.Length > i) && DisableDGV[i] != 0)
		{
			// [Explicit Continue]
			goto J0x1E3;
		}
		VMax = ((X * default.Emitters[i].StartLocationRange.X.Max) + (Y * default.Emitters[i].StartLocationRange.Y.Max)) + (Z * default.Emitters[i].StartLocationRange.Z.Max);
		vmin = ((X * default.Emitters[i].StartLocationRange.X.Min) + (Y * default.Emitters[i].StartLocationRange.Y.Min)) + (Z * default.Emitters[i].StartLocationRange.Z.Min);
		Emitters[i].StartLocationRange = VtoRV(VMax, vmin);
		Emitters[i].StartLocationOffset = ((X * default.Emitters[i].StartLocationOffset.X) + (Y * default.Emitters[i].StartLocationOffset.Y)) + (Z * default.Emitters[i].StartLocationOffset.Z);
		J0x1E3:

		i++;
		// [Loop Continue]
		goto J0x1D;
	}
	//return;	
}

simulated function InitHitForce(Vector hitRay, float GibPerterbation)
{
	local BallisticGib Gib;
	local Vector X, Y, Z, VMax, vmin, GibRay;

	local int i;

	GetAxes(Rotation, X, Y, Z);
	i = 0;
	J0x1D:

	// End:0x22F [Loop If]
	if(i < Gibs.Length)
	{
		// End:0x225
		if(Gibs[i].Mesh != none)
		{
			GibRay = Class'BCoreProV55.BUtil'.static.VLerp(GibPerterbation - 0.2000000, hitRay, VRand(), true);
			Gib = Spawn(Class'BCoreProV55.BallisticGib', Owner,, ((Location + (X * Gibs[i].offset.X)) + (Y * Gibs[i].offset.Y)) + (Z * Gibs[i].offset.Z), Rotation + Gibs[i].Pivot);
			Gib.Velocity = ((GibRay * Lerp(FRand(), Gibs[i].Velocity.X.Min, Gibs[i].Velocity.X.Max)) + (Y * Lerp(FRand(), Gibs[i].Velocity.Y.Min, Gibs[i].Velocity.Y.Max))) + (vect(0.0000000, 0.0000000, 1.0000000) * Lerp(FRand(), Gibs[i].Velocity.Z.Min, Gibs[i].Velocity.Z.Max));
			Gib.SetStaticMesh(Gibs[i].Mesh);
			// End:0x225
			if(Gibs[i].DrawScale != float(0))
			{
				Gib.SetDrawScale(Gibs[i].DrawScale);
			}
		}
		i++;
		// [Loop Continue]
		goto J0x1D;
	}
	GetAxes(Rotator(hitRay), X, Y, Z);
	i = 0;
	J0x24E:

	// End:0x5D4 [Loop If]
	if(i < Emitters.Length)
	{
		// End:0x284
		if((DisableDGV.Length > i) && DisableDGV[i] != 0)
		{
			// [Explicit Continue]
			goto J0x5CA;
		}
		// End:0x3AB
		if(bVerticalZ)
		{
			VMax = ((X * SVX[i].Max) + (Y * SVY[i].Max)) + (vect(0.0000000, 0.0000000, 1.0000000) * SVZ[i].Max);
			vmin = ((X * SVX[i].Min) + (Y * SVY[i].Min)) + (vect(0.0000000, 0.0000000, 1.0000000) * SVZ[i].Min);
			// End:0x3A8
			if(bYIsSpread)
			{
				VMax = VMax + ((Z * SVY[i].Max) * Abs(X.Z));
				vmin = vmin + ((Z * SVY[i].Min) * Abs(X.Z));
			}			
		}
		else
		{
			VMax = ((X * SVX[i].Max) + (Y * SVY[i].Max)) + (Z * SVZ[i].Max);
			vmin = ((X * SVX[i].Min) + (Y * SVY[i].Min)) + (Z * SVZ[i].Min);
		}
		Emitters[i].StartVelocityRange = VtoRV(VMax, vmin);
		Emitters[i].StartVelocityRange.X.Max += (Owner.Velocity.X * 0.5000000);
		Emitters[i].StartVelocityRange.X.Min += (Owner.Velocity.X * 0.5000000);
		Emitters[i].StartVelocityRange.Y.Max += (Owner.Velocity.Y * 0.5000000);
		Emitters[i].StartVelocityRange.Y.Min += (Owner.Velocity.Y * 0.5000000);
		Emitters[i].StartVelocityRange.Z.Max += (Owner.Velocity.Z * 0.5000000);
		Emitters[i].StartVelocityRange.Z.Min += (Owner.Velocity.Z * 0.5000000);
		J0x5CA:

		i++;
		// [Loop Continue]
		goto J0x24E;
	}
	//return;	
}

