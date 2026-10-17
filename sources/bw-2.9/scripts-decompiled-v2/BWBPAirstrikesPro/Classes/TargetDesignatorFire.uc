class TargetDesignatorFire extends BallisticFire;

var DesignatorBeamEffect Beam;
var float UpTime;
var bool bDoHit;
var bool bValidMark;
var bool bInitialMark;
var bool bAlreadyMarked;
var bool bMarkStarted;
var IonCannon IonCannon;
var float MarkTime;
var Vector MarkLocation;
var() float TraceRange;
var() float PaintDuration;
var Vector EndEffect;
var() Sound MarkSound;
var() Sound AquiredSound;
var() string TAGFireForce;
var() string TAGMarkForce;
var() string TAGAquiredForce;
var Vector WarnMarkLocation;
var() int MinApproachDist;
var() float MaxZDist;

simulated function bool AllowFire()
{
	// End:0x2F
	if(!BW.bScopeView || TargetDesignator(BW).bRedirectSwitchToFiremode)
	{
		return false;
	}
	return super.AllowFire();
	//return;	
}

function bool SpawnBomber(Rotator BombDirection)
{
	local Vector BomberStart, BomberStart2, BombTargetCenter, HitNormal, Extent, Temp;

	local float MinZDist;
	local BomberGeneric Bomber;
	local Actor Dropper;

	MinZDist = TargetDesignator(BW).StrikeInfo[int(BW.CurrentWeaponMode)].MinZDist;
	BombDirection.Pitch = 0;
	Extent = Class'BWBPAirstrikesPro.BomberGeneric'.default.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
	Extent.Z = Class'BWBPAirstrikesPro.BomberGeneric'.default.CollisionHeight;
	// End:0xD5
	if(Weapon.Trace(BombTargetCenter, HitNormal, MarkLocation + (MaxZDist * vect(0.0000000, 0.0000000, 1.0000000)), MarkLocation, false) == none)
	{
		BombTargetCenter = MarkLocation + (MaxZDist * vect(0.0000000, 0.0000000, 1.0000000));
	}
	BombTargetCenter.Z -= (Class'BWBPAirstrikesPro.BomberGeneric'.default.CollisionHeight * float(2));
	// End:0x16F
	if(VSize(BombTargetCenter - MarkLocation) < MinZDist)
	{
		// End:0x16D
		if(MarkLocation != WarnMarkLocation)
		{
			PlayerController(Instigator.Controller).ClientMessage("Not enough space above the destination.");
			WarnMarkLocation = MarkLocation;
		}
		return false;
	}
	// End:0x1F4
	if(TargetDesignator(BW).StrikeInfo[int(BW.CurrentWeaponMode)].bRemoteFired)
	{
		Dropper = Weapon.Spawn(TargetDesignator(BW).StrikeInfo[int(BW.CurrentWeaponMode)].Dropper, Instigator,, BombTargetCenter);
		// End:0x1EF
		if(Dropper == none)
		{
			return false;
		}
		return true;		
	}
	else
	{
		// End:0x24F
		if(Weapon.Trace(BomberStart, HitNormal, BombTargetCenter - (Vector(BombDirection) * float(100000)), BombTargetCenter, false, Extent) == none)
		{
			BomberStart = BombTargetCenter - (Vector(BombDirection) * float(100000));
		}
		// End:0x2AA
		if(Weapon.Trace(BomberStart2, HitNormal, BombTargetCenter + (Vector(BombDirection) * float(100000)), BombTargetCenter, false, Extent) == none)
		{
			BomberStart2 = BombTargetCenter + (Vector(BombDirection) * float(100000));
		}
		// End:0x2EC
		if(VSize(BomberStart - BombTargetCenter) < VSize(BomberStart2 - BombTargetCenter))
		{
			Temp = BomberStart;
			BomberStart = BomberStart2;
			BomberStart2 = Temp;
		}
		// End:0x362
		if(VSize(BomberStart - BombTargetCenter) < float(MinApproachDist))
		{
			// End:0x360
			if(MarkLocation != WarnMarkLocation)
			{
				PlayerController(Instigator.Controller).ClientMessage("Bomber's path is obstructed here.");
				WarnMarkLocation = MarkLocation;
			}
			return false;
		}
		Bomber = Weapon.Spawn(Class'BWBPAirstrikesPro.BomberGeneric', Instigator,, BomberStart, Rotator(BombTargetCenter - BomberStart));
		// End:0x3D1
		if(Bomber == none)
		{
			PlayerController(Instigator.Controller).ClientMessage("Can't spawn bomber.");
			return false;
		}
		// End:0x472
		if(TargetDesignator(BW).StrikeInfo[int(BW.CurrentWeaponMode)].Compensation > float(0))
		{
			Temp = vect(0.0000000, 0.0000000, 0.0000000);
			Temp.X = BomberStart.Z * TargetDesignator(BW).StrikeInfo[int(BW.CurrentWeaponMode)].Compensation;
			BombTargetCenter += (Temp >> Rotator(BomberStart - BombTargetCenter));
		}
		Bomber.Initialize(BombTargetCenter, TargetDesignator(BW).StrikeInfo[int(BW.CurrentWeaponMode)]);
		return true;
	}
	//return;	
}

function DoFireEffect()
{
	//return;	
}

function ModeHoldFire()
{
	GotoState('Paint');
	//return;	
}

function StartBerserk()
{
	//return;	
}

function StopBerserk()
{
	//return;	
}

function StartSuperBerserk()
{
	//return;	
}

function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
	return (Instigator.Location + Instigator.EyePosition()) + (X * Instigator.CollisionRadius);
	//return;	
}

function float MaxRange()
{
	return TraceRange;
	//return;	
}

state Paint
{
	function Rotator AdjustAim(Vector Start, float InAimError)
	{
		local bool bRealAimHelp;
		local Rotator Result;

		// End:0xAA
		if(Bot(Instigator.Controller) != none)
		{
			Instigator.Controller.Focus = none;
			// End:0x5B
			if(bAlreadyMarked)
			{
				Instigator.Controller.FocalPoint = MarkLocation;				
			}
			else
			{
				Instigator.Controller.FocalPoint = TargetDesignator(BW).MarkLocation;
			}
			return Rotator(Instigator.Controller.FocalPoint - Start);			
		}
		else
		{
			// End:0x106
			if(PlayerController(Instigator.Controller) != none)
			{
				bRealAimHelp = PlayerController(Instigator.Controller).bAimingHelp;
				PlayerController(Instigator.Controller).bAimingHelp = false;
			}
			Result = global.AdjustAim(Start, InAimError);
			// End:0x159
			if(PlayerController(Instigator.Controller) != none)
			{
				PlayerController(Instigator.Controller).bAimingHelp = bRealAimHelp;
			}
			return Result;
		}
		//return;		
	}

	function BeginState()
	{
		IonCannon = none;
		// End:0xA4
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			// End:0x74
			if(Beam == none)
			{
				Beam = Weapon.Spawn(Class'BWBPAirstrikesPro.DesignatorBeamEffect', Instigator);
				Beam.bOnlyRelevantToOwner = true;
				Beam.EffectOffset = vect(-25.0000000, 35.0000000, 14.0000000);
			}
			bInitialMark = true;
			bValidMark = false;
			MarkTime = Level.TimeSeconds;
			SetTimer(0.2500000, true);
		}
		ClientPlayForceFeedback(TAGFireForce);
		//return;		
	}

	function Timer()
	{
		bDoHit = true;
		//return;		
	}

	function ModeTick(float dt)
	{
		local Vector StartTrace, EndTrace, X, Y, Z, HitLocation,
			HitNormal;

		local Actor Other;
		local Rotator Aim;

		// End:0x11
		if(!bIsFiring)
		{
			StopFiring();
		}
		Weapon.GetViewAxes(X, Y, Z);
		StartTrace = (Instigator.Location + Instigator.EyePosition()) + (X * Instigator.CollisionRadius);
		Aim = AdjustAim(StartTrace, aimerror);
		X = Vector(Aim);
		EndTrace = StartTrace + (TraceRange * X);
		Other = Weapon.Trace(HitLocation, HitNormal, EndTrace, StartTrace, false);
		// End:0x3BA
		if((Other != none) && Other != Instigator)
		{
			// End:0x3AC
			if(bDoHit)
			{
				bValidMark = false;
				// End:0x380
				if(Other.bWorldGeometry)
				{
					// End:0x346
					if(VSize(HitLocation - MarkLocation) < 50.0000000)
					{
						Instigator.MakeNoise(3.0000000);
						// End:0x343
						if((Level.TimeSeconds - MarkTime) > 0.3000000)
						{
							bValidMark = TargetDesignator(BW).CanBomb(HitLocation, Class'BWBPAirstrikesPro.BomberGeneric'.default.CollisionRadius);
							// End:0x27E
							if(bValidMark)
							{
								// End:0x25D
								if(((Level.TimeSeconds - MarkTime) > PaintDuration) && SpawnBomber(Instigator.Rotation))
								{
									Instigator.PendingWeapon = none;
									// End:0x222
									if(int(TargetDesignator(BW).CurrentWeaponMode) != 12)
									{
										TargetDesignator(BW).ReallyConsumeAmmo(ThisModeNum, 1.0000000);
										TargetDesignator(BW).ResupplyStart();
									}
									// End:0x23E
									if(Beam != none)
									{
										Beam.SetTargetState(2);
									}
									StopForceFeedback(TAGMarkForce);
									ClientPlayForceFeedback(TAGAquiredForce);
									StopFiring();									
								}
								else
								{
									// End:0x27B
									if(!bMarkStarted)
									{
										bMarkStarted = true;
										ClientPlayForceFeedback(TAGMarkForce);
									}
								}								
							}
							else
							{
								MarkTime = Level.TimeSeconds;
								bMarkStarted = false;
								// End:0x343
								if(Bot(Instigator.Controller) != none)
								{
									Instigator.Controller.Focus = Instigator.Controller.Enemy;
									MarkLocation = Bot(Instigator.Controller).Enemy.Location - (Bot(Instigator.Controller).Enemy.CollisionHeight * vect(0.0000000, 0.0000000, 2.0000000));
								}
							}
						}						
					}
					else
					{
						bAlreadyMarked = true;
						MarkTime = Level.TimeSeconds;
						MarkLocation = HitLocation;
						bValidMark = false;
						bMarkStarted = false;
					}					
				}
				else
				{
					MarkTime = Level.TimeSeconds;
					bValidMark = false;
					bMarkStarted = false;
				}
				bDoHit = false;
			}
			EndEffect = HitLocation;			
		}
		else
		{
			EndEffect = EndTrace;
		}
		TargetDesignator(BW).EndEffect = EndEffect;
		// End:0x42B
		if(Beam != none)
		{
			Beam.EndEffect = EndEffect;
			// End:0x41A
			if(bValidMark)
			{
				Beam.SetTargetState(1);				
			}
			else
			{
				Beam.SetTargetState(0);
			}
		}
		//return;		
	}

	function StopFiring()
	{
		bMarkStarted = false;
		// End:0x24
		if(Beam != none)
		{
			Beam.SetTargetState(3);
		}
		GotoState('None');
		//return;		
	}

	function EndState()
	{
		bAlreadyMarked = false;
		SetTimer(0.0000000, false);
		StopForceFeedback(TAGFireForce);
		//return;		
	}
	stop;	
}

defaultproperties
{
	TraceRange=50000.0000000
	PaintDuration=0.6000000
	MarkSound=Sound'WeaponSounds.TAGRifle.TAGFireB'
	AquiredSound=Sound'WeaponSounds.TAGRifle.TAGTargetAquired'
	TAGFireForce="TAGFireA"
	TAGMarkForce="TAGFireB"
	TAGAquiredForce="TAGAquire"
	MinApproachDist=2048
	MaxZDist=8200.0000000
	bSplashDamage=true
	bRecommendSplashDamage=true
	bFireOnRelease=true
	FireAnim="Point"
	FireEndAnim="None"
	FireRate=0.6000000
	AmmoClass=Class'XWeapons.BallAmmo'
	BotRefireRate=1.0000000
	WarnTargetPct=0.1000000
}
