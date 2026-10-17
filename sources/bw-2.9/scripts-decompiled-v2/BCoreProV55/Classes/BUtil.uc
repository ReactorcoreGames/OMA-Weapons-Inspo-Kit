class BUtil extends Object
	exportstructs;

const DEG_TO_RAD = 0.017453f;
const RAD_TO_DEG = 57.29578f;

struct IntRange
{
	var int Min;
	var int Max;
};

struct IntVector2
{
	var int X;
	var int Y;
};

struct IntVector3
{
	var int X;
	var int Y;
	var int Z;
};

struct FullSound
{
	var() Sound Sound;
	var() float Volume;
	var() float Radius;
	var() Actor.ESoundSlot Slot;
	var() float Pitch;
	var() bool bAtten;
	var() bool bNoOverride;
};

var() array<string> NM;
var() array<string> RL;

static final operator(34) IntRange *=(out IntRange A, float B)
{
	A.Min *= B;
	A.Max *= B;
	return A;
	//return;	
}

static final operator(34) IntRange /=(out IntRange A, float B)
{
	A.Min /= B;
	A.Min /= B;
	return A;
	//return;	
}

static function string MyNetMode(LevelInfo L)
{
	return default.NM[int(L.NetMode)];
	//return;	
}

static function string MyRole(Actor A)
{
	return default.RL[int(A.Role)];
	//return;	
}

static final simulated function PlayFullSound(Actor A, FullSound snd, optional bool bOwned)
{
	// End:0x53
	if(A == none)
	{
		Log(("PlayFullSound: tried to play " $ string(snd.Sound)) $ " with no actor", 'Warning');
		return;
	}
	// End:0xA3
	if(snd.Sound == none)
	{
		Log(("PlayFullSound: " $ string(A)) $ " tried to play Null sound", 'Warning');
		return;
	}
	// End:0xC5
	if(snd.Pitch == float(0))
	{
		snd.Pitch = 1.0000000;
	}
	// End:0x128
	if(bOwned)
	{
		A.PlayOwnedSound(snd.Sound, snd.Slot, snd.Volume, snd.bNoOverride, snd.Radius, snd.Pitch, snd.bAtten);		
	}
	else
	{
		A.PlaySound(snd.Sound, snd.Slot, snd.Volume, snd.bNoOverride, snd.Radius, snd.Pitch, snd.bAtten);
	}
	//return;	
}

static function InitEmitterFlash(Emitter F, float FlashScale)
{
	// End:0x0D
	if(F == none)
	{
		return;
	}
	Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(F, FlashScale);
	// End:0x4A
	if(DGVEmitter(F) != none)
	{
		DGVEmitter(F).InitDGV();
	}
	return;
	//return;	
}

static function InitMuzzleFlash(out Actor Flash, Class<Actor> FlashClass, float FlashScale, Actor OwnedBy, name AttachBone)
{
	// End:0x27
	if(((Flash != none) || OwnedBy == none) || FlashClass == none)
	{
		return;
	}
	Flash = OwnedBy.Spawn(FlashClass, OwnedBy);
	// End:0x71
	if(Emitter(Flash) != none)
	{
		Class'BCoreProV55.BUtil'.static.InitEmitterFlash(Emitter(Flash), FlashScale);
	}
	Flash.SetDrawScale(FlashScale);
	OwnedBy.AttachToBone(Flash, AttachBone);
	//return;	
}

static function KillEmitterEffect(Actor Flash)
{
	// End:0x0D
	if(Flash == none)
	{
		return;
	}
	// End:0x34
	if(Emitter(Flash) != none)
	{
		Emitter(Flash).Kill();		
	}
	else
	{
		Flash.Destroy();
	}
	//return;	
}

static function Actor CleanTrace(Actor TraceOwner, Vector End, Vector Start, out Vector HitLocation, out Vector HitNormal, optional bool bTraceActors, optional Vector Extent, optional out Material HitMaterial)
{
	local Actor t;

	t = TraceOwner.Trace(HitLocation, HitNormal, End, Start, bTraceActors, Extent, HitMaterial);
	// End:0x4E
	if(t == none)
	{
		HitLocation = End;
		return none;
	}
	// End:0x79
	if(int(t.DrawType) == int(8))
	{
		HitLocation -= (HitNormal * float(3));
	}
	// End:0xA6
	if((HitNormal Dot Normal(End - Start)) > 0.0000000)
	{
		HitNormal *= float(-1);
	}
	return t;
	//return;	
}

static final function Vector AlignedOffset(Rotator R, Vector offset)
{
	local Vector X, Y, Z;

	GetAxes(R, X, Y, Z);
	return ((X * offset.X) + (Y * offset.Y)) + (Z * offset.Z);
	//return;	
}

static final function Vector ViewAlignedOffset(Weapon W, Vector offset)
{
	local Vector X, Y, Z;

	W.GetViewAxes(X, Y, Z);
	return ((X * offset.X) + (Y * offset.Y)) + (Z * offset.Z);
	//return;	
}

static final function Vector VLerp(float Alpha, Vector A, Vector B, optional bool bClampRange)
{
	local Vector V;

	V.X = Lerp(Alpha, A.X, B.X, bClampRange);
	V.Y = Lerp(Alpha, A.Y, B.Y, bClampRange);
	V.Z = Lerp(Alpha, A.Z, B.Z, bClampRange);
	return V;
	//return;	
}

static final function Vector VSmerp(float Alpha, Vector A, Vector B)
{
	local Vector V;

	V.X = Smerp(Alpha, A.X, B.X);
	V.Y = Smerp(Alpha, A.Y, B.Y);
	V.Z = Smerp(Alpha, A.Z, B.Z);
	return V;
	//return;	
}

static final function Rotator RLerp(float Alpha, Rotator A, Rotator B, optional bool bClampRange)
{
	local Rotator R;

	R.Yaw = int(Lerp(Alpha, float(A.Yaw), float(B.Yaw), bClampRange));
	R.Pitch = int(Lerp(Alpha, float(A.Pitch), float(B.Pitch), bClampRange));
	R.Roll = int(Lerp(Alpha, float(A.Roll), float(B.Roll), bClampRange));
	return R;
	//return;	
}

static final function Rotator RSmerp(float Time, Rotator Min, Rotator Max)
{
	local Rotator R;

	R.Yaw = int(Smerp(Time, float(Min.Yaw), float(Max.Yaw)));
	R.Pitch = int(Smerp(Time, float(Min.Pitch), float(Max.Pitch)));
	R.Roll = int(Smerp(Time, float(Min.Roll), float(Max.Roll)));
	return R;
	//return;	
}

static final function float GetClosestDistanceTo(Vector target_point, Vector start_loc, Vector Dir)
{
	return VSize(target_point - GetClosestPointTo(target_point, start_loc, Dir));
	//return;	
}

static final function Vector GetClosestPointTo(Vector target_point, Vector start_loc, Vector Dir)
{
	return start_loc + (Dir * ((target_point - start_loc) Dot Dir));
	//return;	
}

static final function int Loop(int it, int bY, optional int Max, optional int Min)
{
	// End:0x38
	if((it + bY) > Max)
	{
		return (((-1 + Min) + it) + bY) - Max;
	}
	// End:0x6C
	if((it + bY) < Min)
	{
		return (((1 + Max) + it) + bY) - Min;
	}
	return it + bY;
	//return;	
}

static final function float LoopFloat(float it, float bY, optional float Max, optional float Min)
{
	// End:0x31
	if((it + bY) > Max)
	{
		return ((Min + it) + bY) - Max;
	}
	// End:0x62
	if((it + bY) < Min)
	{
		return ((Max + it) + bY) - Min;
	}
	return it + bY;
	//return;	
}

static final function Rotator RotateAboutAxis(Rotator Axis, Rotator offset)
{
	local Vector X, Y, Z;

	GetAxes(offset, X, Y, Z);
	return OrthoRotation(X >> Axis, Y >> Axis, Z >> Axis);
	//return;	
}

static final function byte NormToByte(Vector V)
{
	local byte B;

	// End:0x6F
	if(V.X > float(0))
	{
		// End:0x31
		if(V.X >= 1.0000000)
		{
			B = 1;			
		}
		else
		{
			// End:0x50
			if(V.X >= 0.7000000)
			{
				B = 4;				
			}
			else
			{
				// End:0x6C
				if(V.X >= 0.4000000)
				{
					B = 3;
				}
			}
		}		
	}
	else
	{
		// End:0xDB
		if(V.X < float(0))
		{
			// End:0xA0
			if(V.X <= -1.0000000)
			{
				B = 2;				
			}
			else
			{
				// End:0xBF
				if(V.X <= -0.7000000)
				{
					B = 6;					
				}
				else
				{
					// End:0xDB
					if(V.X <= -0.4000000)
					{
						B = 5;
					}
				}
			}
		}
	}
	// End:0x16B
	if(V.Y > float(0))
	{
		// End:0x117
		if(V.Y >= 1.0000000)
		{
			B = byte(int(B) | 8);			
		}
		else
		{
			// End:0x141
			if(V.Y >= 0.7000000)
			{
				B = byte(int(B) | 32);				
			}
			else
			{
				// End:0x168
				if(V.Y >= 0.4000000)
				{
					B = byte(int(B) | 24);
				}
			}
		}		
	}
	else
	{
		// End:0x1F8
		if(V.Y < float(0))
		{
			// End:0x1A7
			if(V.Y <= -1.0000000)
			{
				B = byte(int(B) | 16);				
			}
			else
			{
				// End:0x1D1
				if(V.Y <= -0.7000000)
				{
					B = byte(int(B) | 48);					
				}
				else
				{
					// End:0x1F8
					if(V.Y <= -0.4000000)
					{
						B = byte(int(B) | 40);
					}
				}
			}
		}
	}
	// End:0x25E
	if(V.Z > float(0))
	{
		// End:0x234
		if(V.Z >= 0.7500000)
		{
			B = byte(int(B) | 64);			
		}
		else
		{
			// End:0x25B
			if(V.Z >= 0.5000000)
			{
				B = byte(int(B) | 192);
			}
		}		
	}
	else
	{
		// End:0x285
		if(V.Z < 0.4000000)
		{
			B = byte(int(B) | 128);
		}
	}
	return B;
	//return;	
}

static final function Vector ByteToNorm(byte B)
{
	local Vector V;

	switch(int(B) & 7)
	{
		// End:0x25
		case 6:
			V.X = -0.7000000;
			// End:0x9F
			break;
		// End:0x3D
		case 5:
			V.X = -0.4000000;
			// End:0x9F
			break;
		// End:0x55
		case 4:
			V.X = 0.7000000;
			// End:0x9F
			break;
		// End:0x6D
		case 3:
			V.X = 0.4000000;
			// End:0x9F
			break;
		// End:0x85
		case 2:
			V.X = -1.0000000;
			// End:0x9F
			break;
		// End:0x9C
		case 1:
			V.X = 1.0000000;
			// End:0x9F
			break;
		// End:0xFFFF
		default:
			break;
	}
	switch(int(B) & 56)
	{
		// End:0xC4
		case 8:
			V.Y = 1.0000000;
			// End:0x13F
			break;
		// End:0xDC
		case 16:
			V.Y = -1.0000000;
			// End:0x13F
			break;
		// End:0xF4
		case 24:
			V.Y = 0.4000000;
			// End:0x13F
			break;
		// End:0x10C
		case 32:
			V.Y = 0.7000000;
			// End:0x13F
			break;
		// End:0x124
		case 40:
			V.Y = -0.4000000;
			// End:0x13F
			break;
		// End:0x13C
		case 48:
			V.Y = -0.7000000;
			// End:0x13F
			break;
		// End:0xFFFF
		default:
			break;
	}
	switch(int(B) & 192)
	{
		// End:0x164
		case 64:
			V.Z = 1.0000000;
			// End:0x197
			break;
		// End:0x17C
		case 128:
			V.Z = -1.0000000;
			// End:0x197
			break;
		// End:0x194
		case 192:
			V.Z = 0.7000000;
			// End:0x197
			break;
		// End:0xFFFF
		default:
			break;
	}
	return V;
	//return;	
}

static final function Vector ConvertFOVs(Vector ViewLoc, Rotator ViewRot, Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector Outvec, Dir, X, Y, Z;

	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

static final function Vector WeaponConvertFOVs(Weapon Weap, Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Weap.Instigator.Location + Weap.Instigator.EyePosition();
	ViewRot = Weap.Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

static final function float CalcZoomFOV(float BaseFOV, float ZoomMagnification)
{
	return (2.0000000 * Atan(Tan((BaseFOV * 0.0174530) / float(2)) / ZoomMagnification, 1.0000000)) * 57.2957800;
	//return;	
}

static final function float CalculateDistanceAtten(float Distance, float AttenStartDist, float AttenDist)
{
	return FClamp(Distance - AttenStartDist, 0.0000000, AttenDist) / AttenDist;
	//return;	
}

static final function float DistanceAmplify(float Input, float MaxAmplifyMult, float Distance, float AmpStartDist, float AmpDist)
{
	local float amp_factor;

	amp_factor = Class'BCoreProV55.BUtil'.static.CalculateDistanceAtten(Distance, AmpStartDist, AmpDist);
	// End:0x39
	if(amp_factor < 0.0200000)
	{
		return Input;
	}
	return Input + ((Input * (MaxAmplifyMult - float(1))) * amp_factor);
	//return;	
}

static final function float DistanceAtten(float Input, float MaxReductionMult, float Distance, float AttenStartDist, float AttenDist)
{
	local float reduction_factor;

	reduction_factor = Class'BCoreProV55.BUtil'.static.CalculateDistanceAtten(Distance, AttenStartDist, AttenDist);
	// End:0x39
	if(reduction_factor < 0.0200000)
	{
		return Input;
	}
	return Input - ((Input * (float(1) - MaxReductionMult)) * reduction_factor);
	//return;	
}

static final function float ReverseDistanceAtten(float Input, float MaxReductionMult, float Distance, float AttenStartDist, float AttenDist)
{
	local float reduction_factor;

	reduction_factor = 1.0000000 - Class'BCoreProV55.BUtil'.static.CalculateDistanceAtten(Distance, AttenStartDist, AttenDist);
	// End:0x40
	if(reduction_factor < 0.0200000)
	{
		return Input;
	}
	return Input - ((Input * (float(1) - MaxReductionMult)) * reduction_factor);
	//return;	
}

defaultproperties
{
	NM[0]="NM_Standalone"
	NM[1]="NM_DedicatedServer"
	NM[2]="NM_ListenServer"
	NM[3]="NM_Client"
	RL[0]="ROLE_None"
	RL[1]="ROLE_DumbProxy"
	RL[2]="ROLE_SimulatedProxy"
	RL[3]="ROLE_AutonomousProxy"
	RL[4]="ROLE_Authority"
}
