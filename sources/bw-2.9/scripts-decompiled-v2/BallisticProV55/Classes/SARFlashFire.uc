class SARFlashFire extends BallisticFire;

var() Sound ChargeSound;
var() byte ChargeSoundPitch;
var() float DecayCharge;

function float MaxRange()
{
	return 1250.0000000;
	//return;	
}

function PlayStartHold()
{
	HoldTime = FMax(DecayCharge, 0.1000000);
	Weapon.AmbientSound = ChargeSound;
	Weapon.ThirdPersonActor.AmbientSound = ChargeSound;
	Weapon.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(128)));
	Weapon.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(ChargeSoundPitch)));
	Weapon.ThirdPersonActor.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(128)));
	Weapon.ThirdPersonActor.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(ChargeSoundPitch)));
	BW.bPreventReload = true;
	//return;	
}

function ModeTick(float DeltaTime)
{
	super.ModeTick(DeltaTime);
	// End:0xF5
	if(bIsFiring)
	{
		Weapon.ThirdPersonActor.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(128)));
		Weapon.ThirdPersonActor.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(ChargeSoundPitch)));
		Weapon.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(128)));
		Weapon.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, HoldTime) / MaxHoldTime) * float(ChargeSoundPitch)));		
	}
	else
	{
		// End:0x234
		if(DecayCharge > float(0))
		{
			Weapon.ThirdPersonActor.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, DecayCharge) / MaxHoldTime) * float(128)));
			Weapon.ThirdPersonActor.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, DecayCharge) / MaxHoldTime) * float(ChargeSoundPitch)));
			Weapon.SoundVolume = byte(float(48) + ((FMin(MaxHoldTime, DecayCharge) / MaxHoldTime) * float(128)));
			Weapon.SoundPitch = byte(float(ChargeSoundPitch) + ((FMin(MaxHoldTime, DecayCharge) / MaxHoldTime) * float(ChargeSoundPitch)));
			DecayCharge -= (DeltaTime * 2.5000000);
			// End:0x234
			if(DecayCharge < float(0))
			{
				DecayCharge = 0.0000000;
				Weapon.ThirdPersonActor.AmbientSound = none;
				Weapon.AmbientSound = none;
			}
		}
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x7F
	if((HoldTime >= MaxHoldTime) || (int(Level.NetMode) == int(NM_DedicatedServer)) && HoldTime >= (MaxHoldTime - 0.1000000))
	{
		super.ModeDoFire();
		Weapon.ThirdPersonActor.AmbientSound = none;
		Weapon.AmbientSound = none;
		DecayCharge = 0.0000000;		
	}
	else
	{
		DecayCharge = HoldTime;
		NextFireTime = Level.TimeSeconds + (DecayCharge * 0.3500000);
	}
	HoldTime = 0.0000000;
	//return;	
}

function ServerPlayFiring()
{
	// End:0x67
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	//return;	
}

function PlayFiring()
{
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x79
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	CheckClipFinished();
	//return;	
}

function DoFireEffect()
{
	local Controller C;
	local Vector StartTrace, Dir, EnemyEye;
	local float DF, dist, EnemyDF;
	local int i;
	local AM67ViewMesser vm;

	Dir = (GetFireSpread()) >> (GetFireAim(StartTrace));
	C = Level.ControllerList;
	J0x2E:

	// End:0x31C [Loop If]
	if(C != none)
	{
		// End:0x94
		if(((C.Pawn == none) || C.Pawn.Health <= 0) || C.GetTeamNum() == Instigator.GetTeamNum())
		{			
		}
		else
		{
			EnemyEye = C.Pawn.EyePosition() + C.Pawn.Location;
			dist = VSize(EnemyEye - StartTrace);
			DF = Dir Dot Normal(EnemyEye - StartTrace);
			// End:0x305
			if(((DF > 0.8000000) && dist < float(1250)) && Weapon.FastTrace(EnemyEye, StartTrace))
			{
				EnemyDF = Normal(StartTrace - EnemyEye) Dot Vector(C.Pawn.GetViewRotation());
				EnemyDF = (EnemyDF + float(1)) / float(2);
				// End:0x197
				if(EnemyDF < -0.7000000)
				{
					EnemyDF = 0.1000000;
				}
				DF = (DF - 0.8000000) * float(5);
				// End:0x1E3
				if(dist > float(800))
				{
					DF /= (float(1) + ((dist - float(800)) / float(800)));
				}
				DF *= EnemyDF;
				// End:0x2B3
				if(PlayerController(C) != none)
				{
					i = 0;
					J0x206:

					// End:0x26A [Loop If]
					if(i < C.Attached.Length)
					{
						// End:0x260
						if(AM67ViewMesser(C.Attached[i]) != none)
						{
							vm = AM67ViewMesser(C.Attached[i]);
							// [Explicit Break]
							goto J0x26A;
						}
						i++;
						// [Loop Continue]
						goto J0x206;
					}
					J0x26A:

					// End:0x29C
					if(vm == none)
					{
						vm = Spawn(Class'BallisticProV55.AM67ViewMesser', C);
						vm.SetBase(C);
					}
					vm.AddImpulse(DF);					
				}
				else
				{
					// End:0x305
					if((AIController(C) != none) && DF > 0.1000000)
					{
						Class'BCoreProV55.BC_BotStoopidizer'.static.DoBotStun(AIController(C), 2.0000000 * DF, 12.0000000 * DF);
					}
				}
			}
		}
		C = C.nextController;
		// [Loop Continue]
		goto J0x2E;
	}
	SendFireEffect(none, StartTrace + (Dir * float(1000)), -Dir, 0);
	super.DoFireEffect();
	//return;	
}

defaultproperties
{
	ChargeSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	ChargeSoundPitch=32
	FlashBone="tip2"
	bUseWeaponMag=false
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	bModeExclusive=false
	MaxHoldTime=0.5000000
	FireAnim="None"
	FireEndAnim="None"
	FireRate=10.0000000
	AmmoClass=Class'BallisticProV55.Ammo_556mm'
	AmmoPerFire=0
	BotRefireRate=0.3000000
}
