class LeopardTurret extends ONSWeapon
	config(BWBP_VPC_Pro);

var Vector oldDir;
var Rotator OldRot;
var(Turret) Sound TurretTurnSound;
var(Turret) float VelocitySpreadFactor;
var float TurretStopTurnSoundTime;
var float dt;
var int LastTurretYaw;
var float InitialSpread;
var ShortLeopardSmoke ShortSmoke[20];
var LongLeopardSmoke LongSmoke[20];
var(Smoke) int ShortSmokerCount;
var(Smoke) int SmokerCount;
var(Smoke) name SmokeBoneNames[20];
var(Smoke) name ShortSmokeBoneNames[20];
var(Smoke) config bool bAllowSmoke;

function byte BestMode()
{
	return 0;
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	InitialSpread = Spread;
	oldDir = Vector(CurrentAim);
	//return;	
}

simulated function ToggleSmokers(bool bOn)
{
	local int i;

	// End:0x80
	if(bOn && bAllowSmoke)
	{
		i = 0;
		J0x1B:

		// End:0x4A [Loop If]
		if(i < ShortSmokerCount)
		{
			ShortSmoke[i].ActivateSmoke(true);
			i++;
			// [Loop Continue]
			goto J0x1B;
		}
		i = 0;
		J0x51:

		// End:0x80 [Loop If]
		if(i < SmokerCount)
		{
			LongSmoke[i].ActivateSmoke(true);
			i++;
			// [Loop Continue]
			goto J0x51;
		}
	}
	// End:0x102
	if(!bOn && bAllowSmoke)
	{
		i = 0;
		J0x9D:

		// End:0xCC [Loop If]
		if(i < ShortSmokerCount)
		{
			ShortSmoke[i].ActivateSmoke(false);
			i++;
			// [Loop Continue]
			goto J0x9D;
		}
		i = 0;
		J0xD3:

		// End:0x102 [Loop If]
		if(i < SmokerCount)
		{
			LongSmoke[i].ActivateSmoke(false);
			i++;
			// [Loop Continue]
			goto J0xD3;
		}
	}
	//return;	
}

simulated function SpawnSmokers(byte OwnerTeam)
{
	local int i;

	// End:0x123
	if(bAllowSmoke)
	{
		i = 0;
		J0x10:

		// End:0x96 [Loop If]
		if(i < ShortSmokerCount)
		{
			// End:0x42
			if(ShortSmoke[i] != none)
			{
				ShortSmoke[i].Destroy();
			}
			ShortSmoke[i] = Spawn(Class'BWBP_VPC_Pro.ShortLeopardSmoke');
			ShortSmoke[i].SetTeamColor(OwnerTeam);
			AttachToBone(ShortSmoke[i], ShortSmokeBoneNames[i]);
			i++;
			// [Loop Continue]
			goto J0x10;
		}
		i = 0;
		J0x9D:

		// End:0x123 [Loop If]
		if(i < SmokerCount)
		{
			// End:0xCF
			if(LongSmoke[i] != none)
			{
				LongSmoke[i].Destroy();
			}
			LongSmoke[i] = Spawn(Class'BWBP_VPC_Pro.LongLeopardSmoke');
			LongSmoke[i].SetTeamColor(OwnerTeam);
			AttachToBone(LongSmoke[i], SmokeBoneNames[i]);
			i++;
			// [Loop Continue]
			goto J0x9D;
		}
	}
	//return;	
}

simulated function GetSmokeScale(float Size)
{
	local int i;

	// End:0x43
	if(bAllowSmoke)
	{
		i = 0;
		J0x10:

		// End:0x43 [Loop If]
		if(i < ShortSmokerCount)
		{
			ShortSmoke[i].SmokeScale(Size);
			i++;
			// [Loop Continue]
			goto J0x10;
		}
	}
	//return;	
}

simulated function Destroyed()
{
	local int i;

	super.Destroyed();
	// End:0xA5
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		i = 0;
		J0x26:

		// End:0x62 [Loop If]
		if(i < ShortSmokerCount)
		{
			// End:0x58
			if(ShortSmoke[i] != none)
			{
				ShortSmoke[i].Destroy();
			}
			i++;
			// [Loop Continue]
			goto J0x26;
		}
		i = 0;
		J0x69:

		// End:0xA5 [Loop If]
		if(i < SmokerCount)
		{
			// End:0x9B
			if(LongSmoke[i] != none)
			{
				LongSmoke[i].Destroy();
			}
			i++;
			// [Loop Continue]
			goto J0x69;
		}
	}
	//return;	
}

function Tick(float Delta)
{
	local Rotator R;
	local int i;
	local xPawn P;
	local Vector NewDir, PawnDir;
	local Coords WeaponBoneCoords;

	super(Actor).Tick(Delta);
	R = GetBoneRotation(YawBone);
	R = Normalize(R - Rotation);
	// End:0x78
	if((Abs(float(R.Yaw - LastTurretYaw)) / dt) > float(2048))
	{
		TurretStopTurnSoundTime = Level.TimeSeconds + 0.1500000;
	}
	LastTurretYaw = R.Yaw;
	// End:0xAA
	if(Level.TimeSeconds >= TurretStopTurnSoundTime)
	{
		AmbientSound = none;		
	}
	else
	{
		AmbientSound = TurretTurnSound;
	}
	// End:0x377
	if((int(Role) == int(ROLE_Authority)) && Base != none)
	{
		WeaponBoneCoords = GetBoneCoords(YawBone);
		NewDir = WeaponBoneCoords.XAxis;
		// End:0x36C
		if((Vehicle(Base).Controller != none) && NewDir.Z < 0.9000000)
		{
			i = 0;
			J0x129:

			// End:0x36C [Loop If]
			if(i < Base.Attached.Length)
			{
				P = xPawn(Base.Attached[i]);
				// End:0x362
				if(((P != none) && int(P.Physics) != int(0)) && P != Vehicle(Base).Driver)
				{
					PawnDir = P.Location - WeaponBoneCoords.Origin;
					PawnDir.Z = 0.0000000;
					PawnDir = Normal(PawnDir);
					// End:0x362
					if(((PawnDir.X <= NewDir.X) && PawnDir.X > oldDir.X) || (PawnDir.X >= NewDir.X) && PawnDir.X < oldDir.X)
					{
						// End:0x362
						if(((PawnDir.Y <= NewDir.Y) && PawnDir.Y > oldDir.Y) || (PawnDir.Y >= NewDir.Y) && PawnDir.X < oldDir.Y)
						{
							P.SetPhysics(2);
							P.Velocity = WeaponBoneCoords.YAxis;
							// End:0x315
							if(((NewDir - oldDir) Dot WeaponBoneCoords.YAxis) < float(0))
							{
								P.Velocity *= float(-1);
							}
							P.Velocity = float(500) * (P.Velocity + (0.3000000 * NewDir));
							P.Velocity.Z = 200.0000000;
						}
					}
				}
				i++;
				// [Loop Continue]
				goto J0x129;
			}
		}
		oldDir = NewDir;
	}
	//return;	
}

simulated function SetSpread(float VehicleSpeed)
{
	Spread = InitialSpread + (VehicleSpeed / VelocitySpreadFactor);
	//return;	
}

simulated function FlashMuzzleFlash()
{
	super.FlashMuzzleFlash();
	// End:0x3C
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && EffectEmitter != none)
	{
		AttachToBone(EffectEmitter, WeaponFireAttachmentBone);
	}
	//return;	
}

defaultproperties
{
	TurretTurnSound=Sound'BWBP_Vehicles_Sound.Leopard.Leo-TurretMove'
	VelocitySpreadFactor=3000.0000000
	ShortSmokerCount=6
	SmokerCount=8
	SmokeBoneNames[0]="SmokeBone0"
	SmokeBoneNames[1]="SmokeBone1"
	SmokeBoneNames[2]="SmokeBone2"
	SmokeBoneNames[3]="SmokeBone3"
	SmokeBoneNames[4]="SmokeBone4"
	SmokeBoneNames[5]="SmokeBone5"
	SmokeBoneNames[6]="SmokeBone6"
	SmokeBoneNames[7]="SmokeBone7"
	ShortSmokeBoneNames[0]="SmokeBone8"
	ShortSmokeBoneNames[1]="SmokeBone9"
	ShortSmokeBoneNames[2]="SmokeBone10"
	ShortSmokeBoneNames[3]="SmokeBone11"
	ShortSmokeBoneNames[4]="SmokeBone12"
	ShortSmokeBoneNames[5]="SmokeBone13"
	bAllowSmoke=true
	YawBone="BaseBone"
	PitchBone="BarrelBone"
	PitchUpLimit=7000
	PitchDownLimit=64000
	WeaponFireAttachmentBone="FireBone"
	RotationsPerSecond=0.0800000
	Spread=0.0050000
	RedSkin=Texture'BWBP_Vehicles_Tex.Leopard.LeopardTurretRed'
	BlueSkin=Texture'BWBP_Vehicles_Tex.Leopard.LeopardTurretBlue'
	FireInterval=4.5000000
	EffectEmitterClass=Class'BWBP_VPC_Pro.LeopardTankFireEffect'
	FireSoundClass=Sound'BWBP_Vehicles_Sound.Leopard.Leo-Fire'
	FireSoundVolume=1024.0000000
	FireSoundRadius=800.0000000
	FireSoundPitch=96.0000000
	AltFireSoundClass=Sound'BWBP_Vehicles_Sound.Leopard.Leo-Fire'
	FireForce="Explosion05"
	ProjectileClass=Class'BWBP_VPC_Pro.LeopardShell'
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=4.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	AIInfo=(bTossed=false,bTrySplash=true,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.7500000,RefireRate=0.8000000)
	Mesh=SkeletalMesh'BWBP_Vehicles_Anim.LeopardTurret'
	ScaleGlow=0.7500000
	bFullVolume=true
	SoundVolume=75
	SoundRadius=50.0000000
}
