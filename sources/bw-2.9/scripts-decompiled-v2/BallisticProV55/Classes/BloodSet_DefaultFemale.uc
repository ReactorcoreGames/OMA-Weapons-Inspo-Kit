class BloodSet_DefaultFemale extends BloodSetDefault;

static function Actor GetStumpFor(Actor Victim, name Bone, bool bCharred)
{
	local Actor NewStump;

	// End:0x28
	if(bCharred)
	{
		NewStump = Victim.Spawn(default.CharredStump, Victim);		
	}
	else
	{
		NewStump = Victim.Spawn(default.DefaultStump, Victim);
	}
	// End:0x51
	if(NewStump == none)
	{
		return none;
	}
	switch(Bone)
	{
		// End:0xA9
		case 'head':
			NewStump.SetDrawScale(0.9000000);
			NewStump.PrePivot.X = 3.0000000;
			NewStump.PrePivot.Y = 0.5000000;
			// End:0x461
			break;
		// End:0x12F
		case 'spine':
			NewStump.SetDrawScale(1.7500000);
			NewStump.SetDrawScale3D(vect(1.2250000, 0.6250000, 1.0000000));
			NewStump.PrePivot.X = 1.7500000;
			NewStump.PrePivot.Y = 1.0000000;
			NewStump.PrePivot.Z = 0.5000000;
			// End:0x461
			break;
		// End:0x1D1
		case 'pelvis':
			Victim.AttachToBone(NewStump, 'spine');
			NewStump.SetRelativeRotation(rot(32768, 0, 0));
			NewStump.SetDrawScale(1.7500000);
			NewStump.SetDrawScale3D(vect(1.0000000, 0.6250000, 1.0000000));
			NewStump.PrePivot.X = 1.7500000;
			NewStump.PrePivot.Y = 1.0000000;
			// End:0x461
			break;
		// End:0x1D9
		case 'lthigh':
		// End:0x25F
		case 'rthigh':
			NewStump.SetDrawScale(0.8000000);
			NewStump.SetDrawScale3D(vect(1.3000000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = 7.0000000;
			NewStump.PrePivot.Y = -1.0000000;
			NewStump.PrePivot.Z = 0.5000000;
			// End:0x461
			break;
		// End:0x267
		case 'lfarm':
		// End:0x31E
		case 'rfarm':
			// End:0x29A
			if(bCharred)
			{
				// End:0x297
				if(default.AltCharStumpMesh != none)
				{
					NewStump.SetStaticMesh(default.AltStumpMesh);
				}				
			}
			else
			{
				// End:0x2B9
				if(default.AltStumpMesh != none)
				{
					NewStump.SetStaticMesh(default.AltStumpMesh);
				}
			}
			NewStump.SetDrawScale(0.5000000);
			NewStump.SetDrawScale3D(vect(1.2500000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = 1.0000000;
			NewStump.PrePivot.Y = 1.0000000;
			// End:0x461
			break;
		// End:0x326
		case 'lfoot':
		// End:0x37A
		case 'rfoot':
			NewStump.SetDrawScale3D(vect(1.3000000, 1.0000000, 1.0000000));
			NewStump.SetDrawScale(0.8750000);
			NewStump.PrePivot.X = 1.0000000;
			// End:0x461
			break;
		// End:0x3EC
		case 'lshoulder':
			NewStump.SetDrawScale3D(vect(1.4000000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = -2.0000000;
			NewStump.PrePivot.Y = 1.0000000;
			NewStump.PrePivot.Z = 3.0000000;
			// End:0x461
			break;
		// End:0x45E
		case 'rshoulder':
			NewStump.SetDrawScale3D(vect(1.4000000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = -2.0000000;
			NewStump.PrePivot.Y = 1.0000000;
			NewStump.PrePivot.Z = -3.0000000;
			// End:0x461
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0x489
	if(Bone != 'pelvis')
	{
		Victim.AttachToBone(NewStump, Bone);
	}
	return NewStump;
	//return;	
}

