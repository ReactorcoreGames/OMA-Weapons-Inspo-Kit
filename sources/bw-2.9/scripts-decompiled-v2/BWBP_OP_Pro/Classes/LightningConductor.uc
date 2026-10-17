class LightningConductor extends Actor
	notplaceable;

var int Damage;
var IntRange ConductionRadiusRange;
var IntRange TargetCountRange;
var float ConductDelay;
var() Class<BCTraceEmitter> TracerClass;
var() Class<BallisticDamageType> CDamageType;
var float ChargePower;
var bool bIsCombo;
var int DmgScalar;
var int CurrentTargetIndex;
var Vector VertDisplacement;
var array<Actor> ShockTargets;
var int HitCounter;
var int OldHitCounter;
var Vector EffectStart;
var Vector EffectEnd;
var Actor EffectSource;
var Actor EffectDest;
var float SelfDmgScalar;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		EffectDest, EffectEnd, 
		EffectSource, EffectStart, 
		HitCounter;
}

function ReplicateShock(Vector Start, Vector End, Actor Src, Actor Dest)
{
	EffectStart = Start;
	EffectEnd = End;
	EffectSource = Src;
	EffectDest = Dest;
	HitCounter++;
	NetUpdateTime = Level.TimeSeconds - float(1);
	//return;	
}

simulated function PostNetReceive()
{
	// End:0x34
	if(HitCounter != OldHitCounter)
	{
		OldHitCounter = HitCounter;
		ClientDrawShock(EffectStart, EffectEnd, EffectSource, EffectDest);
	}
	super.PostNetReceive();
	//return;	
}

simulated function ClientDrawShock(Vector Start, Vector End, Actor Src, Actor Dest)
{
	// End:0x1F
	if(Src != none)
	{
		Start = Src.Location;
	}
	// End:0x3E
	if(Dest != none)
	{
		End = Dest.Location;
	}
	DrawShock(Start, End);
	//return;	
}

function Initialize(Actor InitialTarget)
{
	local Pawn PVictim;
	local int ConductionRadius, MaxConductors;

	ShockTargets.Insert(ShockTargets.Length, 1);
	ShockTargets[ShockTargets.Length - 1] = InitialTarget;
	ConductionRadius = int(float(default.ConductionRadiusRange.Min) + (ChargePower * float(default.ConductionRadiusRange.Max - default.ConductionRadiusRange.Min)));
	MaxConductors = int(float(default.TargetCountRange.Min) + (ChargePower * float(default.TargetCountRange.Max - default.TargetCountRange.Min)));
	// End:0x117
	foreach RadiusActors(Class'Engine.Pawn', PVictim, float(ConductionRadius))
	{
		// End:0xB6
		if(PVictim == Instigator)
		{
			continue;			
		}
		// End:0xC9
		if(PVictim == InitialTarget)
		{
			continue;			
		}
		// End:0x116
		if(ValidTarget(Instigator, PVictim, Level))
		{
			ShockTargets.Insert(ShockTargets.Length, 1);
			ShockTargets[ShockTargets.Length - 1] = PVictim;
			// End:0x116
			if(ShockTargets.Length == MaxConductors)
			{
				// End:0x117
				break;
			}
		}		
	}	
	// End:0x12D
	if(ShockTargets.Length == 1)
	{
		Kill();		
	}
	else
	{
		StartElectrocution();
	}
	//return;	
}

static function bool ValidTarget(Pawn Instigator, Actor Target, LevelInfo Level)
{
	local byte Team, InTeam;

	// End:0x2D
	if((Pawn(Target) == none) || !Pawn(Target).bProjTarget)
	{
		return false;
	}
	// End:0x48
	if(Pawn(Target).Controller == none)
	{
		return true;
	}
	Team = byte(Instigator.Controller.GetTeamNum());
	InTeam = byte(Pawn(Target).Controller.GetTeamNum());
	return ((Level.TimeSeconds - Pawn(Target).SpawnTime) > DeathMatch(Level.Game).SpawnProtectionTime) && (int(InTeam) == 255) || int(InTeam) != int(Team);
	//return;	
}

function StartElectrocution()
{
	SetTimer(ConductDelay, true);
	Propagate();
	//return;	
}

simulated function DrawShock(Vector Start, Vector End)
{
	local TraceEmitter_LightningConduct LightningTracer;

	Start += VertDisplacement;
	End += VertDisplacement;
	LightningTracer = TraceEmitter_LightningConduct(Spawn(TracerClass, self,, Start, Rotator(End - Start)));
	// End:0x68
	if(LightningTracer != none)
	{
		LightningTracer.Initialize(VSize(End - Start));
	}
	//return;	
}

function Timer()
{
	Propagate();
	//return;	
}

function Propagate()
{
	local Actor Src, Dest;

	// End:0x13
	if(bIsCombo)
	{
		Src = self;		
	}
	else
	{
		Src = ShockTargets[CurrentTargetIndex - 1];
	}
	Dest = ShockTargets[CurrentTargetIndex];
	// End:0x7E
	if(((Src == none) || Dest == none) || !FastTrace(Src.Location, Dest.Location))
	{
		Kill();
		return;
	}
	DrawShock(Src.Location, Dest.Location);
	ReplicateShock(Src.Location, Dest.Location, Src, Dest);
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Dest, float(CalcDamageForIndex(CurrentTargetIndex)), Instigator, Dest.Location, vect(0.0000000, 0.0000000, 0.0000000), CDamageType);
	++CurrentTargetIndex;
	// End:0x12F
	if(CurrentTargetIndex >= ShockTargets.Length)
	{
		Kill();
	}
	//return;	
}

final function float CalcDecayMult()
{
	return 0.6700000;
	//return;	
}

final function int CalcDamageForIndex(int Index)
{
	return Max(1, int(float(Damage) * (CalcDecayMult() ** float(CurrentTargetIndex))));
	//return;	
}

function Kill()
{
	local int i;

	// End:0x87
	if(bIsCombo)
	{
		i = 0;
		J0x10:

		// End:0x87 [Loop If]
		if(i <= (ShockTargets.Length - 1))
		{
			// End:0x7D
			if(LightningProjectile(ShockTargets[i]) != none)
			{
				LightningProjectile(ShockTargets[i]).Explode(ShockTargets[i].Location, -ShockTargets[i].Acceleration);
			}
			i++;
			// [Loop Continue]
			goto J0x10;
		}
	}
	ShockTargets.Remove(0, ShockTargets.Length);
	SetTimer(0.0000000, false);
	Destroy();
	//return;	
}

defaultproperties
{
	ConductionRadiusRange=(Min=128,Max=512)
	TargetCountRange=(Min=1,Max=4)
	ConductDelay=0.0600000
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_LightningConduct'
	CDamageType=Class'BWBP_OP_Pro.DT_LightningConduct'
	CurrentTargetIndex=1
	VertDisplacement=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	SelfDmgScalar=0.6000000
	bHidden=true
	bAlwaysRelevant=true
	RemoteRole=2
	bNetNotify=true
}
