class CheatManager extends Object within PlayerController
	native;

var Rotator LockedRotation;
var bool bCheatsEnabled;

exec function ReviewJumpSpots(name TestLabel)
{
	// End:0x1D
	if(TestLabel == 'Transloc')
	{
		TestLabel = 'Begin';		
	}
	else
	{
		// End:0x3A
		if(TestLabel == 'Jump')
		{
			TestLabel = 'Finished';			
		}
		else
		{
			// End:0x57
			if(TestLabel == 'Combo')
			{
				TestLabel = 'FinishedJumping';				
			}
			else
			{
				// End:0x71
				if(TestLabel == 'LowGrav')
				{
					TestLabel = 'FinishedComboJumping';
				}
			}
		}
	}
	Log("TestLabel is " $ string(TestLabel));
	Outer.Level.Game.ReviewJumpSpots(TestLabel);
	//return;	
}

exec function ListDynamicActors()
{
	local Actor A;
	local int i;

	// End:0x33
	foreach Outer.DynamicActors(Class'Engine.Actor', A)
	{
		i++;
		Log(string(i) @ string(A));		
	}	
	Log("Num dynamic actors: " $ string(i));
	//return;	
}

exec function FreezeFrame(float Delay)
{
	Outer.Level.Game.SetPause(true, Outer);
	Outer.Level.PauseDelay = Outer.Level.TimeSeconds + Delay;
	//return;	
}

exec function TestImagePage()
{
	Outer.ClientOpenMenu("XInterface.TestImagePage");
	//return;	
}

exec function WriteToLog(string Param)
{
	Log("NOW!" $ Eval(Param != "", (" '" $ Param) $ "'", ""));
	//return;	
}

exec function SetFlash(float F)
{
	Outer.FlashScale.X = F;
	//return;	
}

exec function SetFogR(float F)
{
	Outer.FlashFog.X = F;
	//return;	
}

exec function SetFogG(float F)
{
	Outer.FlashFog.Y = F;
	//return;	
}

exec function SetFogB(float F)
{
	Outer.FlashFog.Z = F;
	//return;	
}

exec function KillViewedActor()
{
	// End:0xB0
	if(Outer.ViewTarget != none)
	{
		// End:0x74
		if((Pawn(Outer.ViewTarget) != none) && Pawn(Outer.ViewTarget).Controller != none)
		{
			Pawn(Outer.ViewTarget).Controller.Destroy();
		}
		Outer.ViewTarget.Destroy();
		Outer.SetViewTarget(none);
		ReportCheat("KillViewedActor");
	}
	//return;	
}

exec function LogScriptedSequences()
{
	local AIScript S;

	// End:0x3B
	foreach Outer.AllActors(Class'Engine.AIScript', S)
	{
		S.bLoggingEnabled = !S.bLoggingEnabled;		
	}	
	//return;	
}

exec function Teleport()
{
	local Actor HitActor;
	local Vector HitNormal, HitLocation;

	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	HitActor = Outer.Trace(HitLocation, HitNormal, Outer.ViewTarget.Location + (float(10000) * Vector(Outer.Rotation)), Outer.ViewTarget.Location, true);
	// End:0xB9
	if(HitActor == none)
	{
		HitLocation = Outer.ViewTarget.Location + (float(10000) * Vector(Outer.Rotation));		
	}
	else
	{
		HitLocation = HitLocation + (Outer.ViewTarget.CollisionRadius * HitNormal);
	}
	Outer.ViewTarget.SetLocation(HitLocation);
	ReportCheat("Teleport");
	//return;	
}

exec function ChangeSize(float F)
{
	// End:0x16
	if(Outer.Pawn == none)
	{
		return;
	}
	// End:0xB3
	if(Outer.Pawn.SetCollisionSize(Outer.Pawn.default.CollisionRadius * F, Outer.Pawn.default.CollisionHeight * F))
	{
		Outer.Pawn.SetDrawScale(F);
		Outer.Pawn.SetLocation(Outer.Pawn.Location);
	}
	//return;	
}

exec function LockCamera()
{
	local Vector LockedLocation;
	local Rotator LockedRot;
	local Actor LockedActor;

	// End:0x65
	if(!Outer.bCameraPositionLocked)
	{
		Outer.PlayerCalcView(LockedActor, LockedLocation, LockedRot);
		Outer.SetLocation(LockedLocation);
		LockedRotation = LockedRot;
		Outer.SetViewTarget(Outer);		
	}
	else
	{
		Outer.SetViewTarget(Outer.Pawn);
	}
	Outer.bCameraPositionLocked = !Outer.bCameraPositionLocked;
	Outer.bBehindView = Outer.bCameraPositionLocked;
	Outer.bFreeCamera = false;
	//return;	
}

exec function SetCameraDist(float F)
{
	Outer.CameraDist = FMax(F, 2.0000000);
	//return;	
}

exec function EndPath()
{
	//return;	
}

exec function FreeCamera(bool B)
{
	Outer.bFreeCamera = B;
	Outer.bBehindView = B;
	//return;	
}

exec function CauseEvent(name EventName)
{
	Outer.TriggerEvent(EventName, Outer.Pawn, Outer.Pawn);
	//return;	
}

exec function Amphibious()
{
	// End:0x23
	if(!areCheatsEnabled() || Outer.Pawn == none)
	{
		return;
	}
	Outer.Pawn.UnderWaterTime = 999999.0000000;
	ReportCheat("Amphibious");
	//return;	
}

exec function Fly()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	// End:0x90
	if((Outer.Pawn != none) && Outer.Pawn.CheatFly())
	{
		Outer.ClientMessage("You feel much lighter");
		Outer.bCheatFlying = true;
		Outer.GotoState('PlayerFlying');
		ReportCheat("Fly");
	}
	//return;	
}

exec function Walk()
{
	Outer.bCheatFlying = false;
	// End:0x5F
	if((Outer.Pawn != none) && Outer.Pawn.CheatWalk())
	{
		Outer.ClientReStart(Outer.Pawn);
	}
	//return;	
}

exec function Ghost()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	// End:0x8E
	if((Outer.Pawn != none) && Outer.Pawn.CheatGhost())
	{
		Outer.ClientMessage("You feel ethereal");
		Outer.bCheatFlying = true;
		Outer.GotoState('PlayerFlying');
		ReportCheat("Ghost");
	}
	//return;	
}

exec function AllAmmo()
{
	local Weapon Inv;

	// End:0x23
	if(!areCheatsEnabled() || Outer.Pawn == none)
	{
		return;
	}
	// End:0x55
	foreach Outer.Pawn.__NFUN_326__(Class'Engine.Weapon', Inv)
	{
		Inv.SuperMaxOutAmmo();		
	}	
	Outer.AwardAdrenaline(999.0000000);
	ReportCheat("AllAmmo");
	//return;	
}

exec function Invisible(bool B)
{
	// End:0x23
	if(!areCheatsEnabled() || Outer.Pawn == none)
	{
		return;
	}
	Outer.Pawn.bHidden = B;
	// End:0x68
	if(B)
	{
		Outer.Pawn.Visibility = 0;		
	}
	else
	{
		Outer.Pawn.Visibility = Outer.Pawn.default.Visibility;
	}
	ReportCheat("Invisible");
	//return;	
}

exec function Phil()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	// End:0x5C
	if(!Outer.bGodMode)
	{
		Outer.bGodMode = true;
		Outer.ClientMessage("phil == god");
		ReportCheat("God");		
	}
	else
	{
		Outer.bGodMode = false;
		Outer.ClientMessage("you're not phil!");
	}
	//return;	
}

exec function God()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	// End:0x4F
	if(Outer.bGodMode)
	{
		Outer.bGodMode = false;
		Outer.ClientMessage("God mode off");
		return;
	}
	Outer.bGodMode = true;
	Outer.ClientMessage("God Mode on");
	ReportCheat("God");
	//return;	
}

exec function SloMo(float t)
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	Outer.Level.Game.SetGameSpeed(t);
	Outer.Level.Game.SaveConfig();
	Outer.Level.Game.GameReplicationInfo.SaveConfig();
	ReportCheat("SloMo");
	//return;	
}

exec function SetJumpZ(float F)
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	Outer.Pawn.JumpZ = F;
	ReportCheat("SetJumpZ");
	//return;	
}

exec function SetGravity(float F)
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	Outer.PhysicsVolume.Gravity.Z = F;
	ReportCheat("SetGravity");
	//return;	
}

exec function SetSpeed(float F)
{
	// End:0x23
	if(!areCheatsEnabled() || Outer.Pawn == none)
	{
		return;
	}
	Outer.Pawn.GroundSpeed = Outer.Pawn.default.GroundSpeed * F;
	Outer.Pawn.WaterSpeed = Outer.Pawn.default.WaterSpeed * F;
	ReportCheat("SetSpeed");
	//return;	
}

exec function KillPawns()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	Outer.KillAllPawns(Class'Engine.Pawn');
	ReportCheat("KillPawns");
	//return;	
}

exec function Avatar(string ClassName)
{
	local Class<Actor> NewClass;
	local Pawn P;

	NewClass = Class<Actor>(DynamicLoadObject(ClassName, Class'Core.Class'));
	// End:0xD6
	if(NewClass != none)
	{
		// End:0xD5
		foreach Outer.DynamicActors(Class'Engine.Pawn', P)
		{
			// End:0xD4
			if((P.Class == NewClass) && P != Outer.Pawn)
			{
				// End:0xBD
				if(Outer.Pawn.Controller != none)
				{
					Outer.Pawn.Controller.PawnDied(Outer.Pawn);
				}
				Outer.Possess(P);
				// End:0xD5
				break;
			}			
		}		
	}
	//return;	
}

exec function Summon(string ClassName)
{
	local Class<Actor> NewClass;
	local Vector SpawnLoc;

	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	Log("Fabricate " $ ClassName);
	NewClass = Class<Actor>(DynamicLoadObject(ClassName, Class'Core.Class'));
	// End:0xD5
	if(NewClass != none)
	{
		// End:0x7C
		if(Outer.Pawn != none)
		{
			SpawnLoc = Outer.Pawn.Location;			
		}
		else
		{
			SpawnLoc = Outer.Location;
		}
		Outer.Spawn(NewClass,,, (SpawnLoc + (float(72) * Vector(Outer.Rotation))) + (vect(0.0000000, 0.0000000, 1.0000000) * float(15)));
	}
	ReportCheat("Summon");
	//return;	
}

exec function PlayersOnly()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	Outer.Level.bPlayersOnly = !Outer.Level.bPlayersOnly;
	ReportCheat("PlayersOnly");
	//return;	
}

exec function FreezeAll()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	Outer.Level.bPlayersOnly = !Outer.Level.bPlayersOnly;
	Outer.Level.bFreezeKarma = Outer.Level.bPlayersOnly;
	ReportCheat("FreezeAll");
	//return;	
}

exec function ClearAllDebugLines()
{
	local Actor A;

	// End:0x29
	foreach Outer.AllActors(Class'Engine.Actor', A)
	{
		A.ClearStayingDebugLines();		
	}	
	//return;	
}

exec function CheatView(Class<Actor> aClass, optional bool bQuiet)
{
	ViewClass(aClass, bQuiet, true);
	//return;	
}

exec function RememberSpot()
{
	// End:0x3D
	if(Outer.Pawn != none)
	{
		Outer.Destination = Outer.Pawn.Location;		
	}
	else
	{
		Outer.Destination = Outer.Location;
	}
	//return;	
}

exec function ViewSelf(optional bool bQuiet)
{
	Outer.bBehindView = false;
	Outer.bViewBot = false;
	// End:0x56
	if(Outer.Pawn != none)
	{
		Outer.SetViewTarget(Outer.Pawn);		
	}
	else
	{
		Outer.SetViewTarget(Outer);
	}
	// End:0x97
	if(!bQuiet)
	{
		Outer.ClientMessage(Outer.OwnCamera, 'Event');
	}
	Outer.FixFOV();
	//return;	
}

exec function ViewPlayer(string S)
{
	local Controller P;

	// End:0x68
	foreach Outer.__NFUN_325__(Class'Engine.Controller', P)
	{
		// End:0x67
		if((P.bIsPlayer && P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.PlayerName ~= S)
		{
			// End:0x68
			break;
		}		
	}	
	// End:0xD5
	if(P.Pawn != none)
	{
		Outer.ClientMessage(Outer.ViewingFrom @ P.PlayerReplicationInfo.PlayerName, 'Event');
		Outer.SetViewTarget(P.Pawn);
	}
	Outer.bBehindView = Outer.ViewTarget != Outer.Pawn;
	// End:0x12D
	if(Outer.bBehindView)
	{
		Outer.ViewTarget.BecomeViewTarget();
	}
	//return;	
}

exec function ViewActor(name ActorName)
{
	local Actor A;

	// End:0x5A
	foreach Outer.AllActors(Class'Engine.Actor', A)
	{
		// End:0x59
		if(A.Name == ActorName)
		{
			Outer.SetViewTarget(A);
			Outer.bBehindView = true;			
			return;
		}		
	}	
	//return;	
}

exec function ViewFlag()
{
	local AIController C;

	// End:0x6D
	foreach Outer.__NFUN_325__(Class'Engine.AIController', C)
	{
		// End:0x6C
		if((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.HasFlag != none)
		{
			Outer.SetViewTarget(C.Pawn);			
			return;
		}		
	}	
	//return;	
}

exec function ViewBot()
{
	local Actor First;
	local bool bFound;
	local AIController C;

	Outer.bViewBot = true;
	// End:0xA2
	foreach Outer.__NFUN_325__(Class'Engine.AIController', C)
	{
		// End:0xA1
		if((C.Pawn != none) && C.IsA('Bot'))
		{
			// End:0x81
			if(bFound || First == none)
			{
				First = C;
				// End:0x81
				if(bFound)
				{
					// End:0xA2
					break;
				}
			}
			// End:0xA1
			if(C == Outer.RealViewTarget)
			{
				bFound = true;
			}
		}		
	}	
	// End:0xFD
	if(First != none)
	{
		Outer.SetViewTarget(First);
		Outer.bBehindView = true;
		Outer.ViewTarget.BecomeViewTarget();
		Outer.FixFOV();		
	}
	else
	{
		ViewSelf(true);
	}
	//return;	
}

exec function ViewTurret()
{
	local Actor First;
	local bool bFound;
	local AIController C;

	Outer.bViewBot = true;
	// End:0xB6
	foreach Outer.__NFUN_325__(Class'Engine.AIController', C)
	{
		// End:0xB5
		if((C.Pawn != none) && !C.IsA('Bot'))
		{
			// End:0x8C
			if(bFound || First == none)
			{
				First = C.Pawn;
				// End:0x8C
				if(bFound)
				{
					// End:0xB6
					break;
				}
			}
			// End:0xB5
			if(C.Pawn == Outer.ViewTarget)
			{
				bFound = true;
			}
		}		
	}	
	// End:0x111
	if(First != none)
	{
		Outer.SetViewTarget(First);
		Outer.bBehindView = true;
		Outer.ViewTarget.BecomeViewTarget();
		Outer.FixFOV();		
	}
	else
	{
		ViewSelf(true);
	}
	//return;	
}

exec function ViewClass(Class<Actor> aClass, optional bool bQuiet, optional bool bCheat)
{
	local Actor Other, First;
	local bool bFound;

	// End:0x54
	if((!bCheat && Outer.Level.Game != none) && !Outer.Level.Game.bCanViewOthers)
	{
		return;
	}
	First = none;
	// End:0xC2
	foreach Outer.AllActors(aClass, Other)
	{
		// End:0xA1
		if(bFound || First == none)
		{
			First = Other;
			// End:0xA1
			if(bFound)
			{
				// End:0xC2
				break;
			}
		}
		// End:0xC1
		if(Other == Outer.ViewTarget)
		{
			bFound = true;
		}		
	}	
	// End:0x1BF
	if(First != none)
	{
		// End:0x14A
		if(!bQuiet)
		{
			// End:0x11F
			if(Pawn(First) != none)
			{
				Outer.ClientMessage(Outer.ViewingFrom @ First.GetHumanReadableName(), 'Event');				
			}
			else
			{
				Outer.ClientMessage(Outer.ViewingFrom @ string(First), 'Event');
			}
		}
		Outer.SetViewTarget(First);
		Outer.bBehindView = Outer.ViewTarget != Outer;
		// End:0x1AD
		if(Outer.bBehindView)
		{
			Outer.ViewTarget.BecomeViewTarget();
		}
		Outer.FixFOV();		
	}
	else
	{
		ViewSelf(bQuiet);
	}
	//return;	
}

exec function Loaded()
{
	local Weapon Inv;

	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	AllWeapons();
	AllAmmo();
	// End:0x60
	if(Outer.Pawn != none)
	{
		// End:0x5F
		foreach Outer.Pawn.__NFUN_326__(Class'Engine.Weapon', Inv)
		{
			Inv.Loaded();			
		}		
	}
	ReportCheat("Loaded");
	//return;	
}

exec function AllWeapons()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	// End:0x3E
	if((Outer.Pawn == none) || Vehicle(Outer.Pawn) != none)
	{
		return;
	}
	Outer.Pawn.GiveWeapon("XWeapons.AssaultRifle");
	Outer.Pawn.GiveWeapon("XWeapons.RocketLauncher");
	Outer.Pawn.GiveWeapon("XWeapons.ShockRifle");
	Outer.Pawn.GiveWeapon("XWeapons.ShieldGun");
	Outer.Pawn.GiveWeapon("XWeapons.LinkGun");
	Outer.Pawn.GiveWeapon("XWeapons.SniperRifle");
	Outer.Pawn.GiveWeapon("XWeapons.FlakCannon");
	Outer.Pawn.GiveWeapon("XWeapons.MiniGun");
	Outer.Pawn.GiveWeapon("XWeapons.TransLauncher");
	Outer.Pawn.GiveWeapon("XWeapons.Painter");
	Outer.Pawn.GiveWeapon("XWeapons.BioRifle");
	Outer.Pawn.GiveWeapon("XWeapons.Redeemer");
	Outer.Pawn.GiveWeapon("UTClassic.ClassicSniperRifle");
	Outer.Pawn.GiveWeapon("Onslaught.ONSGrenadeLauncher");
	Outer.Pawn.GiveWeapon("Onslaught.ONSAVRiL");
	Outer.Pawn.GiveWeapon("Onslaught.ONSMineLayer");
	Outer.Pawn.GiveWeapon("OnslaughtFull.ONSPainter");
	ReportCheat("AllWeapons");
	//return;	
}

exec function SkipMatch()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	// End:0x47
	if((int(Outer.Level.NetMode) != int(NM_Standalone)) || Outer.Pawn == none)
	{
		return;
	}
	ReportCheat("SkipMatch");
	// End:0xBF
	if(Outer.Level.Game.CurrentGameProfile != none)
	{
		Outer.Level.Game.CurrentGameProfile.CheatSkipMatch(Outer.Level.Game);
	}
	//return;	
}

exec function JumpMatch(int ladderrung)
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	// End:0x47
	if((int(Outer.Level.NetMode) != int(NM_Standalone)) || Outer.Pawn == none)
	{
		return;
	}
	// End:0x54
	if(ladderrung < 0)
	{
		return;
	}
	ReportCheat("JumpMatch");
	// End:0xD1
	if(Outer.Level.Game.CurrentGameProfile != none)
	{
		Outer.Level.Game.CurrentGameProfile.CheatJumpMatch(Outer.Level.Game, ladderrung);
	}
	//return;	
}

exec function WinMatch()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	ReportCheat("WinMatch");
	// End:0x80
	if(Outer.PlayerReplicationInfo.Team != none)
	{
		Outer.PlayerReplicationInfo.Team.Score = float(Outer.Level.Game.GoalScore);		
	}
	else
	{
		Outer.PlayerReplicationInfo.Score = float(Outer.Level.Game.GoalScore);
	}
	Outer.Level.Game.CheckScore(Outer.PlayerReplicationInfo);
	//return;	
}

exec function EnableCheats()
{
	bCheatsEnabled = true;
	Outer.ClientMessage("Cheats enabled");
	//return;	
}

function bool areCheatsEnabled()
{
	// End:0xD5
	if(Outer.Level.Game.CurrentGameProfile != none)
	{
		// End:0xCE
		if(!bCheatsEnabled)
		{
			Outer.ClientMessage("Cheats are NOT enabled, to enable cheats type: EnableCheats");
			Outer.ClientMessage("Enabling cheats prevents you from unlocking the bonus characters");
		}
		return bCheatsEnabled;
	}
	return true;
	//return;	
}

function ReportCheat(optional string cheat)
{
	// End:0x5A
	if(Outer.Level.Game.CurrentGameProfile != none)
	{
		Outer.Level.Game.CurrentGameProfile.ReportCheat(Outer, cheat);
	}
	//return;	
}

exec function WeakObjectives()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	ReportCheat("WeakObjectives");
	Outer.Level.Game.WeakObjectives();
	//return;	
}

exec function DisableNextObjective()
{
	// End:0x0D
	if(!areCheatsEnabled())
	{
		return;
	}
	ReportCheat("DisableNextObjective");
	Outer.Level.Game.DisableNextObjective();
	//return;	
}

exec function ruler()
{
	local NavigationPoint N;

	// End:0x4B
	foreach Outer.AllActors(Class'Engine.NavigationPoint', N)
	{
		// End:0x4A
		if(N.IsA('ONSPowerCore'))
		{
			N.Bump(Outer.Pawn);
		}		
	}	
	//return;	
}

