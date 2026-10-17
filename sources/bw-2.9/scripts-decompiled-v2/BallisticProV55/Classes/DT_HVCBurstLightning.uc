class DT_HVCBurstLightning extends DT_HVCLightning
	config(BallisticProV55);

static function bool OverrideCanSever(Pawn Pawn, name Bone, int Damage, Vector HitLoc, Vector hitRay, bool bDirectHit, out byte bCanSever)
{
	switch(Bone)
	{
		// End:0x37
		case 'pelvis':
			// End:0x34
			if(float(80 + Rand(200)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x67
		case 'spine':
			// End:0x64
			if(float(80 + Rand(200)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x97
		case 'head':
			// End:0x94
			if(float(50 + Rand(150)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0xC7
		case 'lshoulder':
			// End:0xC4
			if(float(60 + Rand(140)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0xF7
		case 'rshoulder':
			// End:0xF4
			if(float(60 + Rand(140)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x127
		case 'lfarm':
			// End:0x124
			if(float(40 + Rand(80)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x157
		case 'rfarm':
			// End:0x154
			if(float(40 + Rand(80)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x187
		case 'lhand':
			// End:0x184
			if(float(20 + Rand(40)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x1B7
		case 'righthand':
			// End:0x1B4
			if(float(20 + Rand(40)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x1E7
		case 'rhand':
			// End:0x1E4
			if(float(20 + Rand(40)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x217
		case 'lthigh':
			// End:0x214
			if(float(80 + Rand(60)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x247
		case 'rthigh':
			// End:0x244
			if(float(80 + Rand(60)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x277
		case 'lfoot':
			// End:0x274
			if(float(40 + Rand(60)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x2A7
		case 'rfoot':
			// End:0x2A4
			if(float(40 + Rand(60)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0xFFFF
		default:
			break;
	}
	return true;
	//return;	
}

defaultproperties
{
	GibModifier=25.0000000
}
