class BloodSet_Abaddon extends BloodSetDefault;

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
			// End:0x3DB
			break;
		// End:0x116
		case 'spine':
			NewStump.SetDrawScale(1.6000000);
			NewStump.SetDrawScale3D(vect(1.2000000, 0.9000000, 1.2000000));
			NewStump.PrePivot.X = -1.0000000;
			NewStump.PrePivot.Y = -1.0000000;
			// End:0x3DB
			break;
		// End:0x1B8
		case 'pelvis':
			Victim.AttachToBone(NewStump, 'spine');
			NewStump.SetRelativeRotation(rot(32768, 0, 0));
			NewStump.SetDrawScale(1.5000000);
			NewStump.SetDrawScale3D(vect(1.5000000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = 1.5000000;
			NewStump.PrePivot.Z = 1.0000000;
			// End:0x3DB
			break;
		// End:0x1C0
		case 'lthigh':
		// End:0x22D
		case 'rthigh':
			NewStump.SetDrawScale(0.8000000);
			NewStump.SetDrawScale3D(vect(1.5000000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = 1.2000000;
			NewStump.PrePivot.Z = 0.5000000;
			// End:0x3DB
			break;
		// End:0x235
		case 'lfarm':
		// End:0x2EC
		case 'rfarm':
			// End:0x268
			if(bCharred)
			{
				// End:0x265
				if(default.AltCharStumpMesh != none)
				{
					NewStump.SetStaticMesh(default.AltStumpMesh);
				}				
			}
			else
			{
				// End:0x287
				if(default.AltStumpMesh != none)
				{
					NewStump.SetStaticMesh(default.AltStumpMesh);
				}
			}
			NewStump.SetDrawScale(0.6000000);
			NewStump.SetDrawScale3D(vect(1.5000000, 1.2000000, 1.0000000));
			NewStump.PrePivot.X = 1.5000000;
			NewStump.PrePivot.Y = -1.0000000;
			// End:0x3DB
			break;
		// End:0x2F4
		case 'lfoot':
		// End:0x32C
		case 'rfoot':
			NewStump.SetDrawScale(0.8000000);
			NewStump.PrePivot.X = 2.2500000;
			// End:0x3DB
			break;
		// End:0x382
		case 'lshoulder':
			NewStump.PrePivot.X = -3.5000000;
			NewStump.PrePivot.Y = 1.0000000;
			NewStump.PrePivot.Z = 3.5000000;
			// End:0x3DB
			break;
		// End:0x3D8
		case 'rshoulder':
			NewStump.PrePivot.X = -3.5000000;
			NewStump.PrePivot.Y = 1.0000000;
			NewStump.PrePivot.Z = -3.5000000;
			// End:0x3DB
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0x403
	if(Bone != 'pelvis')
	{
		Victim.AttachToBone(NewStump, Bone);
	}
	return NewStump;
	//return;	
}

