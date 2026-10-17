class BallisticBloodSet extends Object;

struct GibInfo
{
	var() Class<BallisticGib> GibClass;
	var() StaticMesh Mesh;
	var() Vector offset;
	var() RangeVector Velocity;
	var() Rotator Pivot;
	var() float DrawScale;
};

var() string MyBloodName;
var() Color MyBloodColor;
var() Class<BallisticDecal> BloodPool;
var() Class<Emitter> WaterBloodClass;
var() Class<Projector> DragDecal;
var() Class<Projector> LowImpactDecal;
var() Class<Projector> HighImpactDecal;
var() Class<Projector> BulletSplat;
var() Class<Projector> ShotgunSplat;
var() Class<Projector> ExplodeSplat;
var() Class<Projector> SlashSplat;
var() Class<Projector> SawSplat;
var() Class<Actor> BulletEffect;
var() Class<Actor> BulletHeadEffect;
var() Class<Actor> ShotgunEffect;
var() Class<Actor> ShotgunHeadEffect;
var() Class<Actor> ExplodeEffect;
var() Class<Actor> SlashEffect;
var() Class<Actor> SlashHeadEffect;
var() Class<Actor> SawEffect;
var() Class<Actor> SawHeadEffect;
var() Class<Actor> BluntEffect;
var() Class<Actor> BluntHeadEffect;
var() Class<Emitter> WoundDripper;
var() Class<Emitter> HeadExplode;
var() Class<Emitter> TorsoExplode;
var() Class<Emitter> ShoulderExplode;
var() Class<Emitter> ArmExplode;
var() Class<Emitter> HandExplode;
var() Class<Emitter> LegExplode;
var() Class<Emitter> FootExplode;
var() Class<Emitter> PelvisExplode;
var() Class<Emitter> ShoulderExplodeLeft;
var() Class<Emitter> ArmExplodeLeft;
var() Class<Emitter> StumpDripper;
var() Class<Actor> DefaultStump;
var() Class<Actor> CharredStump;
var() StaticMesh AltStumpMesh;
var() StaticMesh AltCharStumpMesh;
var() Sound BulletHitSound;
var() Sound BulletHitHeadSound;
var() Class<Actor> ScreenEffectMisc;
var() Class<Actor> ScreenEffectSlice;
var() Class<Actor> ScreenEffectSaw;
var() Class<BallisticGib> DefaultGibClass;
var() array<GibInfo> HeadGibs;
var() array<GibInfo> TorsoGibs;
var() array<GibInfo> PelvsGibs;
var() array<GibInfo> OtherGibs;

static function array<GibInfo> GetGibInfoFor(name Bone)
{
	local array<GibInfo> Gibs;

	switch(Bone)
	{
		// End:0x15
		case 'head':
			return default.HeadGibs;
		// End:0x23
		case 'spine':
			return default.TorsoGibs;
		// End:0x31
		case 'pelvis':
			return default.PelvsGibs;
		// End:0x5C
		case 'lshoulder':
			// End:0x59
			if(default.OtherGibs.Length > 0)
			{
				Gibs[Gibs.Length] = default.OtherGibs[0];
			}
			// End:0x1D5
			break;
		// End:0x87
		case 'rshoulder':
			// End:0x84
			if(default.OtherGibs.Length > 1)
			{
				Gibs[Gibs.Length] = default.OtherGibs[1];
			}
			// End:0x1D5
			break;
		// End:0xB4
		case 'lfarm':
			// End:0xB1
			if(default.OtherGibs.Length > 2)
			{
				Gibs[Gibs.Length] = default.OtherGibs[2];
			}
			// End:0x1D5
			break;
		// End:0xE1
		case 'rfarm':
			// End:0xDE
			if(default.OtherGibs.Length > 3)
			{
				Gibs[Gibs.Length] = default.OtherGibs[3];
			}
			// End:0x1D5
			break;
		// End:0x10E
		case 'lthigh':
			// End:0x10B
			if(default.OtherGibs.Length > 4)
			{
				Gibs[Gibs.Length] = default.OtherGibs[4];
			}
			// End:0x1D5
			break;
		// End:0x13B
		case 'rthigh':
			// End:0x138
			if(default.OtherGibs.Length > 5)
			{
				Gibs[Gibs.Length] = default.OtherGibs[5];
			}
			// End:0x1D5
			break;
		// End:0x168
		case 'lfoot':
			// End:0x165
			if(default.OtherGibs.Length > 6)
			{
				Gibs[Gibs.Length] = default.OtherGibs[6];
			}
			// End:0x1D5
			break;
		// End:0x195
		case 'rfoot':
			// End:0x192
			if(default.OtherGibs.Length > 7)
			{
				Gibs[Gibs.Length] = default.OtherGibs[7];
			}
			// End:0x1D5
			break;
		// End:0x19D
		case 'lhand':
		// End:0x1A5
		case 'rhand':
		// End:0x1D2
		case 'righthand':
			// End:0x1CF
			if(default.OtherGibs.Length > 8)
			{
				Gibs[Gibs.Length] = default.OtherGibs[8];
			}
			// End:0x1D5
			break;
		// End:0xFFFF
		default:
			break;
	}
	return Gibs;
	//return;	
}

static function array<Actor> MakeGibsFor(Pawn Victim, name Bone, Vector hitRay, float GibPerterbation, float ForceScale, array<GibInfo> Gibs, optional bool bFlaming)
{
	local array<Actor> GibActors;
	local BallisticGib Gib;
	local Class<BallisticGib> GibClass;
	local Vector X, Y, Z, BoneLoc, GibRay;

	local int i, j;

	// End:0x12
	if(Gibs.Length < 1)
	{
		return GibActors;
	}
	GetAxes(Victim.Rotation, X, Y, Z);
	BoneLoc = Victim.GetBoneCoords(Bone).Origin;
	i = 0;
	J0x57:

	// End:0x32D [Loop If]
	if(i < Gibs.Length)
	{
		// End:0x323
		if(Gibs[i].Mesh != none)
		{
			// End:0xAC
			if(Gibs[i].GibClass != none)
			{
				GibClass = Gibs[i].GibClass;				
			}
			else
			{
				GibClass = default.DefaultGibClass;
			}
			j = 0;
			J0xBE:

			// End:0x323 [Loop If]
			if(j < Class'BCoreProV55.BloodManager'.default.GibMultiplier)
			{
				GibRay = Class'BCoreProV55.BUtil'.static.VLerp(GibPerterbation - 0.2000000, hitRay, VRand(), true);
				Gib = Victim.Spawn(GibClass, Victim,, ((BoneLoc + (X * Gibs[i].offset.X)) + (Y * Gibs[i].offset.Y)) + (Z * Gibs[i].offset.Z), Victim.Rotation + Gibs[i].Pivot);
				// End:0x319
				if(Gib != none)
				{
					Gib.Velocity = (((GibRay * Lerp(FRand(), Gibs[i].Velocity.X.Min, Gibs[i].Velocity.X.Max)) * ForceScale) + (Y * Lerp(FRand(), Gibs[i].Velocity.Y.Min, Gibs[i].Velocity.Y.Max))) + (vect(0.0000000, 0.0000000, 1.0000000) * Lerp(FRand(), Gibs[i].Velocity.Z.Min, Gibs[i].Velocity.Z.Max));
					Gib.SetStaticMesh(Gibs[i].Mesh);
					// End:0x2DC
					if(Gibs[i].DrawScale != float(0))
					{
						Gib.SetDrawScale(Gibs[i].DrawScale);
					}
					// End:0x307
					if(bFlaming)
					{
						Gib.bFiery = true;
						Gib.bNoTrailWhenStill = false;
					}
					GibActors[GibActors.Length] = Gib;
				}
				j++;
				// [Loop Continue]
				goto J0xBE;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x57;
	}
	return GibActors;
	//return;	
}

static function Class<Emitter> GetStumpDripper(Pawn Victim, name Bone)
{
	return default.StumpDripper;
	//return;	
}

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
			// End:0x3C2
			break;
		// End:0x116
		case 'spine':
			NewStump.SetDrawScale(1.6000000);
			NewStump.SetDrawScale3D(vect(1.2000000, 0.9000000, 1.2000000));
			NewStump.PrePivot.X = -1.0000000;
			NewStump.PrePivot.Y = -1.0000000;
			// End:0x3C2
			break;
		// End:0x19F
		case 'pelvis':
			Victim.AttachToBone(NewStump, 'spine');
			NewStump.SetRelativeRotation(rot(32768, 0, 0));
			NewStump.SetDrawScale(2.0000000);
			NewStump.SetDrawScale3D(vect(1.0000000, 0.8000000, 0.9000000));
			NewStump.PrePivot.X = 5.0000000;
			// End:0x3C2
			break;
		// End:0x1A7
		case 'lthigh':
		// End:0x214
		case 'rthigh':
			NewStump.SetDrawScale(0.8000000);
			NewStump.SetDrawScale3D(vect(1.5000000, 1.0000000, 1.0000000));
			NewStump.PrePivot.X = 1.2000000;
			NewStump.PrePivot.Z = 0.5000000;
			// End:0x3C2
			break;
		// End:0x21C
		case 'lfarm':
		// End:0x2D3
		case 'rfarm':
			// End:0x24F
			if(bCharred)
			{
				// End:0x24C
				if(default.AltCharStumpMesh != none)
				{
					NewStump.SetStaticMesh(default.AltStumpMesh);
				}				
			}
			else
			{
				// End:0x26E
				if(default.AltStumpMesh != none)
				{
					NewStump.SetStaticMesh(default.AltStumpMesh);
				}
			}
			NewStump.SetDrawScale(0.6000000);
			NewStump.SetDrawScale3D(vect(1.5000000, 1.2000000, 1.0000000));
			NewStump.PrePivot.X = 1.5000000;
			NewStump.PrePivot.Y = -1.0000000;
			// End:0x3C2
			break;
		// End:0x2DB
		case 'lfoot':
		// End:0x313
		case 'rfoot':
			NewStump.SetDrawScale(0.8000000);
			NewStump.PrePivot.X = 2.2500000;
			// End:0x3C2
			break;
		// End:0x369
		case 'lshoulder':
			NewStump.PrePivot.X = -3.5000000;
			NewStump.PrePivot.Y = 1.0000000;
			NewStump.PrePivot.Z = 3.5000000;
			// End:0x3C2
			break;
		// End:0x3BF
		case 'rshoulder':
			NewStump.PrePivot.X = -3.5000000;
			NewStump.PrePivot.Y = 1.0000000;
			NewStump.PrePivot.Z = -3.5000000;
			// End:0x3C2
			break;
		// End:0xFFFF
		default:
			break;
	}
	// End:0x3EA
	if(Bone != 'pelvis')
	{
		Victim.AttachToBone(NewStump, Bone);
	}
	return NewStump;
	//return;	
}

static function Class<Emitter> GetDismemberEffectFor(Pawn Victim, name Bone)
{
	switch(Bone)
	{
		// End:0x15
		case 'head':
			return default.HeadExplode;
		// End:0x23
		case 'spine':
			return default.TorsoExplode;
		// End:0x31
		case 'pelvis':
			return default.PelvisExplode;
		// End:0x3F
		case 'lshoulder':
			return default.ShoulderExplodeLeft;
		// End:0x4D
		case 'rshoulder':
			return default.ShoulderExplode;
		// End:0x5B
		case 'lfarm':
			return default.ArmExplodeLeft;
		// End:0x69
		case 'rfarm':
			return default.ArmExplode;
		// End:0x71
		case 'righthand':
		// End:0x79
		case 'lhand':
		// End:0x87
		case 'rhand':
			return default.HandExplode;
		// End:0x8F
		case 'lthigh':
		// End:0x9D
		case 'rthigh':
			return default.LegExplode;
		// End:0xA5
		case 'lfoot':
		// End:0xB3
		case 'rfoot':
			return default.FootExplode;
		// End:0xFFFF
		default:
			return default.ArmExplode;
			break;
	}
	//return;	
}

