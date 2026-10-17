class BloodSet_Jugg extends BloodSetDefault;

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
		// End:0xC5
		case 'head':
			NewStump.SetDrawScale(1.1000000);
			NewStump.SetDrawScale3D(vect(1.1000000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = 2.5000000;
			NewStump.PrePivot.Z = 0.5000000;
			// End:0x48C
			break;
		// End:0x14B
		case 'spine':
			NewStump.SetDrawScale(2.1000000);
			NewStump.SetDrawScale3D(vect(1.2500000, 1.0000000, 1.3000000));
			NewStump.PrePivot.X = 2.5000000;
			NewStump.PrePivot.Y = 0.9000000;
			NewStump.PrePivot.Z = 0.0000000;
			// End:0x48C
			break;
		// End:0x206
		case 'pelvis':
			Victim.AttachToBone(NewStump, 'spine');
			NewStump.SetRelativeRotation(rot(32768, 0, 0));
			NewStump.SetDrawScale(2.0000000);
			NewStump.SetDrawScale3D(vect(1.2000000, 1.3000000, 1.3000000));
			NewStump.PrePivot.X = 3.0000000;
			NewStump.PrePivot.Y = 0.0000000;
			NewStump.PrePivot.Z = 0.0000000;
			// End:0x48C
			break;
		// End:0x20E
		case 'lthigh':
		// End:0x262
		case 'rthigh':
			NewStump.SetDrawScale(1.4000000);
			NewStump.SetDrawScale3D(vect(1.2500000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = 2.0000000;
			// End:0x48C
			break;
		// End:0x26A
		case 'lfarm':
		// End:0x321
		case 'rfarm':
			// End:0x29D
			if(bCharred)
			{
				// End:0x29A
				if(default.AltCharStumpMesh != none)
				{
					NewStump.SetStaticMesh(default.AltStumpMesh);
				}				
			}
			else
			{
				// End:0x2BC
				if(default.AltStumpMesh != none)
				{
					NewStump.SetStaticMesh(default.AltStumpMesh);
				}
			}
			NewStump.SetDrawScale(0.6000000);
			NewStump.SetDrawScale3D(vect(1.5000000, 1.2000000, 1.0000000));
			NewStump.PrePivot.X = 1.0000000;
			NewStump.PrePivot.Y = -1.0000000;
			// End:0x48C
			break;
		// End:0x329
		case 'lfoot':
		// End:0x37D
		case 'rfoot':
			NewStump.SetDrawScale3D(vect(1.0000000, 1.0000000, 1.0000000));
			NewStump.SetDrawScale(1.2500000);
			NewStump.PrePivot.X = 1.0000000;
			// End:0x48C
			break;
		// End:0x403
		case 'lshoulder':
			NewStump.SetDrawScale(1.5000000);
			NewStump.SetDrawScale3D(vect(1.2500000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = -3.0000000;
			NewStump.PrePivot.Y = 0.0000000;
			NewStump.PrePivot.Z = -1.0000000;
			// End:0x48C
			break;
		// End:0x489
		case 'rshoulder':
			NewStump.SetDrawScale(1.5000000);
			NewStump.SetDrawScale3D(vect(1.2500000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = -3.0000000;
			NewStump.PrePivot.Y = 0.0000000;
			NewStump.PrePivot.Z = 1.0000000;
			// End:0x48C
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0x4B4
	if(Bone != 'pelvis')
	{
		Victim.AttachToBone(NewStump, Bone);
	}
	return NewStump;
	//return;	
}

