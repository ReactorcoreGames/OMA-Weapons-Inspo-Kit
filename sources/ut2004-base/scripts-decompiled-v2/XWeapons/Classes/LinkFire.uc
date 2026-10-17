class LinkFire extends WeaponFire;

var LinkBeamEffect Beam;
var Class<LinkBeamEffect> BeamEffectClass;
var Sound MakeLinkSound;
var float UpTime;
var Pawn LockedPawn;
var float LinkBreakTime;
var() float LinkBreakDelay;
var float LinkScale[6];
var string MakeLinkForce;
var() Class<DamageType> DamageType;
var() int Damage;
var() float MomentumTransfer;
var() float TraceRange;
var() float LinkFlexibility;
var bool bDoHit;
var() bool bFeedbackDeath;
var bool bInitAimError;
var bool bLinkFeedbackPlaying;
var bool bStartFire;
var byte LinkVolume;
var byte SentLinkVolume;
var Rotator DesiredAimError;
var Rotator CurrentAimError;
var Sound BeamSounds[4];

simulated function DestroyEffects()
{
	super.DestroyEffects();
	// End:0x36
	if(int(Level.NetMode) != int(NM_Client))
	{
		// End:0x36
		if(Beam != none)
		{
			Beam.Destroy();
		}
	}
	//return;	
}

simulated function bool myHasAmmo(LinkGun LinkGun)
{
	return LinkGun.AmmoAmount(ThisModeNum) >= AmmoPerFire;
	//return;	
}

simulated function Rotator GetPlayerAim(Vector StartTrace, float InAimError)
{
	return AdjustAim(StartTrace, InAimError);
	//return;	
}

simulated function float AdjustLinkDamage(LinkGun LinkGun, Actor Other, float Damage)
{
	return Damage * ((1.5000000 * float(LinkGun.Links)) + float(1));
	//return;	
}

simulated function ModeTick(float dt)
{
	local Vector StartTrace, EndTrace, V, X, Y, Z,
		HitLocation, HitNormal, EndEffect;

	local Actor Other;
	local Rotator Aim;
	local LinkGun LinkGun;
	local float Step, ls;
	local Bot B;
	local bool bShouldStop, bIsHealingObjective;
	local int AdjustedDamage;
	local LinkBeamEffect LB;
	local DestroyableObjective HealObjective;
	local Vehicle LinkedVehicle;

	// End:0x15
	if(!bIsFiring)
	{
		bInitAimError = true;
		return;
	}
	LinkGun = LinkGun(Weapon);
	// End:0x88
	if(LinkGun.Links < 0)
	{
		Log(((("warning:" @ string(Instigator)) @ "linkgun had") @ string(LinkGun.Links)) @ "links");
		LinkGun.Links = 0;
	}
	ls = LinkScale[Min(LinkGun.Links, 5)];
	// End:0x115D
	if((myHasAmmo(LinkGun)) && (UpTime > 0.0000000) || int(Instigator.Role) < int(ROLE_Authority))
	{
		UpTime -= dt;
		LinkGun.GetViewAxes(X, Y, Z);
		StartTrace = GetFireStart(X, Y, Z);
		TraceRange = default.TraceRange + float(LinkGun.Links * 250);
		// End:0x1F6
		if(int(Instigator.Role) < int(ROLE_Authority))
		{
			// End:0x1D7
			if(Beam == none)
			{
				// End:0x1D6
				foreach Weapon.DynamicActors(Class'XWeapons.LinkBeamEffect', LB)
				{
					// End:0x1D5
					if((!LB.bDeleteMe && LB.Instigator != none) && LB.Instigator == Instigator)
					{
						Beam = LB;
						// End:0x1D6
						break;
					}					
				}				
			}
			// End:0x1F6
			if(Beam != none)
			{
				LockedPawn = Beam.LinkedPawn;
			}
		}
		// End:0x20D
		if(LockedPawn != none)
		{
			TraceRange *= 1.5000000;
		}
		// End:0x546
		if(int(Instigator.Role) == int(ROLE_Authority))
		{
			// End:0x24A
			if(bDoHit)
			{
				LinkGun.ConsumeAmmo(ThisModeNum, float(AmmoPerFire));
			}
			B = Bot(Instigator.Controller);
			// End:0x546
			if(((B != none) && PlayerController(B.Squad.SquadLeader) != none) && B.Squad.SquadLeader.Pawn != none)
			{
				// End:0x50B
				if(((IsLinkable(B.Squad.SquadLeader.Pawn)) && (B.Squad.SquadLeader.Pawn.Weapon != none) && B.Squad.SquadLeader.Pawn.Weapon.GetFireMode(1).bIsFiring) && VSize(B.Squad.SquadLeader.Pawn.Location - StartTrace) < TraceRange)
				{
					Other = Weapon.Trace(HitLocation, HitNormal, B.Squad.SquadLeader.Pawn.Location, StartTrace, true);
					// End:0x4CD
					if(Other == B.Squad.SquadLeader.Pawn)
					{
						B.Focus = B.Squad.SquadLeader.Pawn;
						// End:0x478
						if(B.Focus != LockedPawn)
						{
							SetLinkTo(B.Squad.SquadLeader.Pawn);
						}
						B.SetRotation(Rotator(B.Focus.Location - StartTrace));
						X = Normal(B.Focus.Location - StartTrace);						
					}
					else
					{
						// End:0x508
						if(B.Focus == B.Squad.SquadLeader.Pawn)
						{
							bShouldStop = true;
						}
					}					
				}
				else
				{
					// End:0x546
					if(B.Focus == B.Squad.SquadLeader.Pawn)
					{
						bShouldStop = true;
					}
				}
			}
		}
		// End:0x619
		if(LockedPawn != none)
		{
			EndTrace = LockedPawn.Location + (LockedPawn.BaseEyeHeight * vect(0.0000000, 0.0000000, 0.5000000));
			// End:0x619
			if(int(Instigator.Role) == int(ROLE_Authority))
			{
				V = Normal(EndTrace - StartTrace);
				// End:0x619
				if(((((V Dot X) < LinkFlexibility) || LockedPawn.Health <= 0) || LockedPawn.bDeleteMe) || VSize(EndTrace - StartTrace) > (1.5000000 * TraceRange))
				{
					SetLinkTo(none);
				}
			}
		}
		// End:0x8E7
		if(LockedPawn == none)
		{
			// End:0x8AB
			if(Bot(Instigator.Controller) != none)
			{
				// End:0x667
				if(bInitAimError)
				{
					CurrentAimError = AdjustAim(StartTrace, aimerror);
					bInitAimError = false;					
				}
				else
				{
					BoundError();
					CurrentAimError.Yaw = CurrentAimError.Yaw + Instigator.Rotation.Yaw;
				}
				Step = 7500.0000000 * dt;
				// End:0x726
				if(ClockwiseFrom_IntInt(DesiredAimError.Yaw, CurrentAimError.Yaw))
				{
					CurrentAimError.Yaw += int(Step);
					// End:0x723
					if(!ClockwiseFrom_IntInt(DesiredAimError.Yaw, CurrentAimError.Yaw))
					{
						CurrentAimError.Yaw = DesiredAimError.Yaw;
						DesiredAimError = AdjustAim(StartTrace, aimerror);
					}					
				}
				else
				{
					CurrentAimError.Yaw -= int(Step);
					// End:0x781
					if(ClockwiseFrom_IntInt(DesiredAimError.Yaw, CurrentAimError.Yaw))
					{
						CurrentAimError.Yaw = DesiredAimError.Yaw;
						DesiredAimError = AdjustAim(StartTrace, aimerror);
					}
				}
				CurrentAimError.Yaw = CurrentAimError.Yaw - Instigator.Rotation.Yaw;
				// End:0x7CA
				if(BoundError())
				{
					DesiredAimError = AdjustAim(StartTrace, aimerror);
				}
				CurrentAimError.Yaw = CurrentAimError.Yaw + Instigator.Rotation.Yaw;
				// End:0x83A
				if(Instigator.Controller.Target == none)
				{
					Aim = Rotator(Instigator.Controller.FocalPoint - StartTrace);					
				}
				else
				{
					Aim = Rotator(Instigator.Controller.Target.Location - StartTrace);
				}
				Aim.Yaw = CurrentAimError.Yaw;
				CurrentAimError.Yaw = CurrentAimError.Yaw - Instigator.Rotation.Yaw;				
			}
			else
			{
				Aim = GetPlayerAim(StartTrace, aimerror);
			}
			X = Vector(Aim);
			EndTrace = StartTrace + (TraceRange * X);
		}
		Other = Weapon.Trace(HitLocation, HitNormal, EndTrace, StartTrace, true);
		// End:0x938
		if((Other != none) && Other != Instigator)
		{
			EndEffect = HitLocation;			
		}
		else
		{
			EndEffect = EndTrace;
		}
		// End:0x962
		if(Beam != none)
		{
			Beam.EndEffect = EndEffect;
		}
		// End:0xAE1
		if(int(Instigator.Role) < int(ROLE_Authority))
		{
			// End:0xADF
			if(LinkGun.ThirdPersonActor != none)
			{
				// End:0xA8A
				if(LinkGun.Linking || ((Other != none) && Instigator.PlayerReplicationInfo.Team != none) && Other.TeamLink(Instigator.PlayerReplicationInfo.Team.TeamIndex))
				{
					// End:0xA68
					if((Instigator.PlayerReplicationInfo.Team == none) || Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
					{
						LinkAttachment(LinkGun.ThirdPersonActor).SetLinkColor(1);						
					}
					else
					{
						LinkAttachment(LinkGun.ThirdPersonActor).SetLinkColor(2);
					}					
				}
				else
				{
					// End:0xAC0
					if(LinkGun.Links > 0)
					{
						LinkAttachment(LinkGun.ThirdPersonActor).SetLinkColor(3);						
					}
					else
					{
						LinkAttachment(LinkGun.ThirdPersonActor).SetLinkColor(0);
					}
				}
			}
			return;
		}
		// End:0xD6D
		if((Other != none) && Other != Instigator)
		{
			// End:0xB43
			if(IsLinkable(Other))
			{
				// End:0xB2A
				if(Other != LockedPawn)
				{
					SetLinkTo(Pawn(Other));
				}
				// End:0xB40
				if(LockedPawn != none)
				{
					LinkBreakTime = LinkBreakDelay;
				}				
			}
			else
			{
				// End:0xB73
				if(LockedPawn != none)
				{
					// End:0xB67
					if(LinkBreakTime <= 0.0000000)
					{
						SetLinkTo(none);						
					}
					else
					{
						LinkBreakTime -= dt;
					}
				}
				// End:0xD6D
				if(bDoHit)
				{
					// End:0xB98
					if(Beam != none)
					{
						Beam.bLockedOn = false;
					}
					Instigator.MakeNoise(1.0000000);
					AdjustedDamage = int(AdjustLinkDamage(LinkGun, Other, float(Damage)));
					// End:0xD6D
					if(!Other.bWorldGeometry)
					{
						// End:0xC65
						if(((Level.Game.bTeamGame && Pawn(Other) != none) && Pawn(Other).PlayerReplicationInfo != none) && Pawn(Other).PlayerReplicationInfo.Team == Instigator.PlayerReplicationInfo.Team)
						{
							AdjustedDamage = 0;
						}
						HealObjective = DestroyableObjective(Other);
						// End:0xC99
						if(HealObjective == none)
						{
							HealObjective = DestroyableObjective(Other.Owner);
						}
						// End:0xD22
						if((HealObjective != none) && HealObjective.TeamLink(Instigator.GetTeamNum()))
						{
							SetLinkTo(none);
							bIsHealingObjective = true;
							// End:0xD1F
							if(!HealObjective.HealDamage(AdjustedDamage, Instigator.Controller, DamageType))
							{
								LinkGun.ConsumeAmmo(ThisModeNum, float(-AmmoPerFire));
							}							
						}
						else
						{
							Other.TakeDamage(AdjustedDamage, Instigator, HitLocation, MomentumTransfer * X, DamageType);
						}
						// End:0xD6D
						if(Beam != none)
						{
							Beam.bLockedOn = true;
						}
					}
				}
			}
		}
		LinkedVehicle = Vehicle(LockedPawn);
		// End:0xE36
		if((LinkedVehicle != none) && bDoHit)
		{
			AdjustedDamage = int((float(Damage) * ((1.5000000 * float(LinkGun.Links)) + float(1))) * Instigator.DamageScaling);
			// End:0xDED
			if(Instigator.HasUDamage())
			{
				AdjustedDamage *= float(2);
			}
			// End:0xE36
			if(!LinkedVehicle.HealDamage(AdjustedDamage, Instigator.Controller, DamageType))
			{
				LinkGun.ConsumeAmmo(ThisModeNum, float(-AmmoPerFire));
			}
		}
		// End:0x115A
		if((Weapon != none) && LinkGun(Weapon) != none)
		{
			LinkGun.Linking = (LockedPawn != none) || bIsHealingObjective;
			// End:0xE91
			if(bShouldStop)
			{
				B.StopFiring();				
			}
			else
			{
				// End:0xEF6
				if((Beam == none) && bIsFiring)
				{
					Beam = Weapon.Spawn(BeamEffectClass, Instigator);
					// End:0xEEB
					if(int(SentLinkVolume) == int(default.LinkVolume))
					{
						SentLinkVolume = byte(int(default.LinkVolume) + 1);						
					}
					else
					{
						SentLinkVolume = default.LinkVolume;
					}
				}
				// End:0x115A
				if(Beam != none)
				{
					// End:0x1044
					if(LinkGun.Linking || ((Other != none) && Instigator.PlayerReplicationInfo.Team != none) && Other.TeamLink(Instigator.PlayerReplicationInfo.Team.TeamIndex))
					{
						Beam.LinkColor = byte(Instigator.PlayerReplicationInfo.Team.TeamIndex + 1);
						// End:0x1041
						if(LinkGun.ThirdPersonActor != none)
						{
							// End:0x1022
							if((Instigator.PlayerReplicationInfo.Team == none) || Instigator.PlayerReplicationInfo.Team.TeamIndex == 0)
							{
								LinkAttachment(LinkGun.ThirdPersonActor).SetLinkColor(1);								
							}
							else
							{
								LinkAttachment(LinkGun.ThirdPersonActor).SetLinkColor(2);
							}
						}						
					}
					else
					{
						Beam.LinkColor = 0;
						// End:0x10BE
						if(LinkGun.ThirdPersonActor != none)
						{
							// End:0x109F
							if(LinkGun.Links > 0)
							{
								LinkAttachment(LinkGun.ThirdPersonActor).SetLinkColor(3);								
							}
							else
							{
								LinkAttachment(LinkGun.ThirdPersonActor).SetLinkColor(0);
							}
						}
					}
					Beam.Links = byte(LinkGun.Links);
					Instigator.AmbientSound = BeamSounds[Min(int(Beam.Links), 3)];
					Instigator.SoundVolume = SentLinkVolume;
					Beam.LinkedPawn = LockedPawn;
					Beam.bHitSomething = Other != none;
					Beam.EndEffect = EndEffect;
				}
			}
		}		
	}
	else
	{
		StopFiring();
	}
	bStartFire = false;
	bDoHit = false;
	//return;	
}

simulated function UpdateLinkColor(LinkAttachment.ELinkColor Color)
{
	// End:0x0D
	if(FlashEmitter == none)
	{
		return;
	}
	switch(Color)
	{
		// End:0x32
		case 0:
			FlashEmitter.Skins[0] = Texture'XEffectMat.Link.link_muz_green';
			// End:0x8F
			break;
		// End:0x50
		case 3:
			FlashEmitter.Skins[0] = Texture'XEffectMat.Link.link_muz_yellow';
			// End:0x8F
			break;
		// End:0x6E
		case 1:
			FlashEmitter.Skins[0] = Texture'XEffectMat.Link.link_muz_red';
			// End:0x8F
			break;
		// End:0x8C
		case 2:
			FlashEmitter.Skins[0] = Texture'XEffectMat.Link.link_muz_blue';
			// End:0x8F
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

function bool BoundError()
{
	CurrentAimError.Yaw = CurrentAimError.Yaw & 65535;
	// End:0x7F
	if(CurrentAimError.Yaw > 2048)
	{
		// End:0x59
		if(CurrentAimError.Yaw < 32768)
		{
			CurrentAimError.Yaw = 2048;
			return true;			
		}
		else
		{
			// End:0x7F
			if(CurrentAimError.Yaw < 63487)
			{
				CurrentAimError.Yaw = 63487;
				return true;
			}
		}
	}
	return false;
	//return;	
}

event ModeDoFire()
{
	load = 0.0000000;
	super.ModeDoFire();
	//return;	
}

function DoFireEffect()
{
	bDoHit = true;
	UpTime = FireRate + 0.1000000;
	//return;	
}

function PlayFiring()
{
	// End:0x4E
	if((LinkGun(Weapon).Links <= 0) && Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire)
	{
		ClientPlayForceFeedback("BLinkGunBeam1");
	}
	super.PlayFiring();
	//return;	
}

function StopFiring()
{
	Instigator.AmbientSound = none;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	// End:0x4B
	if(Beam != none)
	{
		Beam.Destroy();
		Beam = none;
	}
	SetLinkTo(none);
	bStartFire = true;
	bFeedbackDeath = false;
	// End:0x90
	if(LinkGun(Weapon).Links <= 0)
	{
		StopForceFeedback("BLinkGunBeam1");
	}
	//return;	
}

function SetLinkTo(Pawn Other)
{
	// End:0x4F
	if((LockedPawn != none) && Weapon != none)
	{
		RemoveLink(1 + LinkGun(Weapon).Links, Instigator);
		LinkGun(Weapon).Linking = false;
	}
	LockedPawn = Other;
	// End:0xBC
	if(LockedPawn != none)
	{
		// End:0x93
		if(!AddLink(1 + LinkGun(Weapon).Links, Instigator))
		{
			bFeedbackDeath = true;
		}
		LinkGun(Weapon).Linking = true;
		LockedPawn.PlaySound(MakeLinkSound, 0);
	}
	//return;	
}

function bool AddLink(int Size, Pawn Starter)
{
	local Inventory Inv;

	// End:0xA2
	if((LockedPawn != none) && !bFeedbackDeath)
	{
		// End:0x2C
		if(LockedPawn == Starter)
		{
			return false;			
		}
		else
		{
			Inv = LockedPawn.FindInventoryType(Class'XWeapons.LinkGun');
			// End:0xA2
			if(Inv != none)
			{
				// End:0xA0
				if(LinkFire(LinkGun(Inv).GetFireMode(1)).AddLink(Size, Starter))
				{
					LinkGun(Inv).Links += Size;					
				}
				else
				{
					return false;
				}
			}
		}
	}
	return true;
	//return;	
}

function RemoveLink(int Size, Pawn Starter)
{
	local Inventory Inv;

	// End:0x95
	if((LockedPawn != none) && !bFeedbackDeath)
	{
		// End:0x95
		if(LockedPawn != Starter)
		{
			Inv = LockedPawn.FindInventoryType(Class'XWeapons.LinkGun');
			// End:0x95
			if(Inv != none)
			{
				LinkFire(LinkGun(Inv).GetFireMode(1)).RemoveLink(Size, Starter);
				LinkGun(Inv).Links -= Size;
			}
		}
	}
	//return;	
}

function bool IsLinkable(Actor Other)
{
	local Pawn P;
	local LinkGun LG;
	local LinkFire LF;
	local int sanity;

	// End:0x1CA
	if(Other.IsA('Pawn') && Other.bProjTarget)
	{
		P = Pawn(Other);
		// End:0x9E
		if((P.Weapon == none) || !P.Weapon.IsA('LinkGun'))
		{
			// End:0x9C
			if(Vehicle(P) != none)
			{
				return P.TeamLink(Instigator.GetTeamNum());
			}
			return false;
		}
		LG = LinkGun(P.Weapon);
		LF = LinkFire(LG.GetFireMode(1));
		J0xD3:

		// End:0x18C [Loop If]
		if((((LF != none) && LF.LockedPawn != none) && LF.LockedPawn != P) && sanity < 32)
		{
			// End:0x136
			if(LF.LockedPawn == Instigator)
			{
				return false;
			}
			LG = LinkGun(LF.LockedPawn.Weapon);
			// End:0x166
			if(LG == none)
			{
				// [Explicit Break]
				goto J0x18C;
			}
			LF = LinkFire(LG.GetFireMode(1));
			sanity++;
			// [Loop Continue]
			goto J0xD3;
		}
		J0x18C:

		return Level.Game.bTeamGame && P.GetTeamNum() == Instigator.GetTeamNum();
	}
	return false;
	//return;	
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
	return (Instigator.Location + Instigator.EyePosition()) + (X * Instigator.CollisionRadius);
	//return;	
}

function StartBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	Damage = int(float(default.Damage) * 1.3300000);
	Damage = int(float(default.Damage) * 1.3300000);
	//return;	
}

function StopBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	Damage = default.Damage;
	Damage = default.Damage;
	//return;	
}

defaultproperties
{
	BeamEffectClass=Class'XWeapons.LinkBeamEffect'
	MakeLinkSound=Sound'WeaponSounds.LinkGun.LinkActivated'
	LinkBreakDelay=0.5000000
	LinkScale[1]=0.5000000
	LinkScale[2]=0.9000000
	LinkScale[3]=1.2000000
	LinkScale[4]=1.4000000
	LinkScale[5]=1.5000000
	MakeLinkForce="LinkActivated"
	DamageType=Class'XWeapons.DamTypeLinkShaft'
	Damage=9
	MomentumTransfer=2000.0000000
	TraceRange=1100.0000000
	LinkFlexibility=0.6400000
	bInitAimError=true
	LinkVolume=240
	BeamSounds[0]=Sound'WeaponSounds.LinkGun.BLinkGunBeam1'
	BeamSounds[1]=Sound'WeaponSounds.LinkGun.BLinkGunBeam2'
	BeamSounds[2]=Sound'WeaponSounds.LinkGun.BLinkGunBeam3'
	BeamSounds[3]=Sound'WeaponSounds.LinkGun.BLinkGunBeam4'
	bPawnRapidFireAnim=true
	FireAnim="Idle"
	FireEndAnim="None"
	NoAmmoSound=ProceduralSound'WeaponSounds.PReload5.P1Reload5'
	FireRate=0.1200000
	AmmoClass=Class'XWeapons.LinkAmmo'
	AmmoPerFire=1
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=60.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=4000.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=1.0000000,Z=1.0000000)
	ShakeOffsetRate=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
	ShakeOffsetTime=3.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
	FlashEmitterClass=Class'XEffects.LinkMuzFlashBeam1st'
}
