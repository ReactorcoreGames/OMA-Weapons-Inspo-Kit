class A51AcidControl extends Actor
	notplaceable;

struct AcidPoolStruct
{
	var Vector PoolLoc;
	var byte bStuck;
};

struct HitPawnInfo
{
	var Pawn HitPawn;
	var float HitTime;
};

var float BaseSpreadRadius;
var int Ident;
var() float DamageRadius;
var AcidPoolStruct AcidSpots[10];
var array<HitPawnInfo> HitPawnData;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		AcidSpots;
}

function Reset()
{
	Destroy();
	//return;	
}

function TryDamage(Pawn Victim, float Interval, float Damage, Class<DamageType> DamageType)
{
	local int Index;

	Index = FindIndex(Victim);
	// End:0xB2
	if(((HitPawnData[Index].HitTime + Interval) < Level.TimeSeconds) || HitPawnData[Index].HitTime == float(0))
	{
		HitPawnData[Index].HitTime = Level.TimeSeconds;
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Damage, Instigator, Victim.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
	}
	//return;	
}

function int FindIndex(Pawn Sought)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x3D [Loop If]
	if((i < HitPawnData.Length) && Sought != HitPawnData[i].HitPawn)
	{
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x72
	if(i == HitPawnData.Length)
	{
		HitPawnData.Length = i + 1;
		HitPawnData[i].HitPawn = Sought;
	}
	return i;
	//return;	
}

simulated function Initialize(Vector HitNormal, int load)
{
	local int i, Count, SpreadRadius;
	local Vector Start, End, HitLoc, HitNorm;
	local Actor t;
	local A51GroundAcid GF;
	local Projector P;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	SpreadRadius = int(BaseSpreadRadius * (float(load) ** 0.4000000));
	Count = int(float(2) * (float(load) ** 1.3500000));
	Start = Location + (HitNormal * float(8));
	i = 0;
	J0x73:

	// End:0x28A [Loop If]
	if(i < Count)
	{
		// End:0x127
		if(i > 0)
		{
			End = VRand();
			End.Z = Abs(End.Z);
			End = Start + (End * float(SpreadRadius));
			t = Trace(HitLoc, HitNorm, End, Start,, vect(6.0000000, 6.0000000, 6.0000000));
			// End:0x108
			if(t == none)
			{
				HitLoc = End;
			}
			GF = Spawn(Class'BWBP_SWC_Pro.A51GroundAcid', self,, HitLoc, Rotator(HitNorm));			
		}
		else
		{
			GF = Spawn(Class'BWBP_SWC_Pro.A51GroundAcid', self,, Location, rot(0, 0, 0));
		}
		// End:0x280
		if(GF != none)
		{
			GF.Instigator = Instigator;
			// End:0x1B8
			if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
			{
				GF.InstigatorController = Instigator.Controller;
			}
			GF.AcidControl = self;
			GF.Timer();
			// End:0x280
			if((((int(Level.NetMode) != int(NM_DedicatedServer)) && GF.bStuck) && t != none) && t.bWorldGeometry)
			{
				P = Spawn(Class'BallisticProV55.AD_A500BlastSplat', self,, HitLoc, Rotator(-HitNorm));
				// End:0x280
				if((BallisticDecal(P) != none) && BallisticDecal(P).bWaitForInit)
				{
					BallisticDecal(P).InitDecal();
				}
			}
		}
		i++;
		// [Loop Continue]
		goto J0x73;
	}
	//return;	
}

defaultproperties
{
	BaseSpreadRadius=128.0000000
	DamageRadius=384.0000000
	LightType=1
	LightEffect=21
	LightHue=54
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	bHidden=true
	bDynamicLight=true
	bAlwaysRelevant=true
	RemoteRole=2
	LifeSpan=10.0000000
	bFullVolume=true
	SoundVolume=255
	SoundRadius=192.0000000
}
