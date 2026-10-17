class X93PainterFire extends WeaponFire;

var X93PainterBeamEffect Beam;
var float UpTime;
var bool bDoHit;
var bool bValidMark;
var bool bInitialMark;
var bool bAlreadyMarked;
var bool bMarkStarted;
var X93IonCannon X93IonCannon;
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

function DestroyEffects()
{
	// End:0x17
	if(Beam != none)
	{
		Beam.Destroy();
	}
	super.DestroyEffects();
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

		// End:0xB3
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
				Instigator.Controller.FocalPoint = X93Painter(Instigator.Weapon).MarkLocation;
			}
			return Rotator(Instigator.Controller.FocalPoint - Start);			
		}
		else
		{
			// End:0x10F
			if(PlayerController(Instigator.Controller) != none)
			{
				bRealAimHelp = PlayerController(Instigator.Controller).bAimingHelp;
				PlayerController(Instigator.Controller).bAimingHelp = false;
			}
			Result = global.AdjustAim(Start, InAimError);
			// End:0x162
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
		// End:0x6B
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			// End:0x3B
			if(Beam == none)
			{
				Beam = Weapon.Spawn(Class'BWBPAirstrikesPro.X93PainterBeamEffect');
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
		local bool bEngageCannon;

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
		// End:0x3D7
		if((Other != none) && Other != Instigator)
		{
			// End:0x3C9
			if(bDoHit)
			{
				bValidMark = false;
				// End:0x39D
				if(Other.bWorldGeometry)
				{
					// End:0x363
					if(VSize(HitLocation - MarkLocation) < 50.0000000)
					{
						Instigator.MakeNoise(3.0000000);
						// End:0x360
						if((Level.TimeSeconds - MarkTime) > 0.3000000)
						{
							bEngageCannon = (Level.TimeSeconds - MarkTime) > PaintDuration;
							// End:0x1A8
							if(X93IonCannon == none)
							{
								X93IonCannon = X93Painter(Weapon).CheckMark(HitLocation, bEngageCannon);
							}
							// End:0x293
							if((X93IonCannon != none) && X93IonCannon.CheckMark(Instigator, HitLocation, bEngageCannon))
							{
								// End:0x26A
								if(X93IonCannon.IsFiring())
								{
									Instigator.PendingWeapon = none;
									X93Painter(Weapon).ReallyConsumeAmmo(ThisModeNum, 1.0000000);
									Instigator.Controller.ClientSwitchToBestWeapon();
									// End:0x24B
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
									bValidMark = true;
									// End:0x290
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
								bValidMark = false;
								bMarkStarted = false;
								// End:0x360
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
		X93Painter(Weapon).EndEffect = EndEffect;
		// End:0x448
		if(Beam != none)
		{
			Beam.EndEffect = EndEffect;
			// End:0x437
			if(bValidMark)
			{
				Beam.SetTargetState(1);				
			}
			else
			{
				Beam.SetTargetState(0);
			}
		}
		// End:0x57E
		if(X93IonCannon != none)
		{
			// End:0x55B
			if(bValidMark)
			{
				// End:0x558
				if(X93IonCannon.Fear == none)
				{
					X93IonCannon.Fear = Weapon.Spawn(Class'Engine.AvoidMarker',,, MarkLocation);
					X93IonCannon.Fear.SetCollisionSize(0.4000000 * X93IonCannon.DamageRadius, 100.0000000);
					// End:0x540
					if(((Instigator != none) && Instigator.PlayerReplicationInfo != none) && Instigator.PlayerReplicationInfo.Team != none)
					{
						X93IonCannon.Fear.TeamNum = byte(Instigator.PlayerReplicationInfo.Team.TeamIndex);
					}
					X93IonCannon.Fear.StartleBots();
				}				
			}
			else
			{
				// End:0x57E
				if(X93IonCannon.Fear != none)
				{
					X93IonCannon.RemoveFear();
				}
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
	TraceRange=65000.0000000
	PaintDuration=1.2000000
	MarkSound=Sound'WeaponSounds.TAGRifle.TAGFireB'
	AquiredSound=Sound'WeaponSounds.TAGRifle.TAGTargetAquired'
	TAGFireForce="TAGFireA"
	TAGMarkForce="TAGFireB"
	TAGAquiredForce="TAGAquire"
	bSplashDamage=true
	bRecommendSplashDamage=true
	bFireOnRelease=true
	FireEndAnim="None"
	FireRate=0.6000000
	AmmoClass=Class'XWeapons.BallAmmo'
	AmmoPerFire=1
	BotRefireRate=1.0000000
	WarnTargetPct=0.1000000
}
