class BallisticDamageType extends WeaponDamageType
	config(BallisticProV55);

enum EDisplacementType
{
	DSP_None,                       // 0
	DSP_Linear,                     // 1
	DSP_Scaling                     // 2
};

enum EDamageBasis
{
	DB_Physical,                    // 0
	DB_Heat,                        // 1
	DB_Plasma,                      // 2
	DB_Cold,                        // 3
	DB_Explosive,                   // 4
	DB_Poison,                      // 5
	DB_Electric                     // 6
};

var globalconfig bool bSimpleDeathMessages;
var() localized array<localized string> DeathStrings;
var() localized array<localized string> FemaleSuicides;
var() localized array<localized string> MaleSuicides;
var() localized string SimpleKillString;
var() localized string SimpleSuicideString;
var() localized string HipString;
var() localized string AimedString;
var() localized string PenetratedString;
var() localized string His;
var() localized string Her;
var() localized string Himself;
var() localized string Herself;
var() localized string Him;
var() localized string MHer;
var() localized string He;
var() localized string She;
var() float EffectChance;
var() Class<BloodManager> BloodManager;
var() string BloodManagerName;
var() bool bMultiSever;
var() bool bOnlySeverLimbs;
var() bool bSeverPreventsBlood;
var() bool bNoSeverStumps;
var bool bCantLoadBlood;
var() Class<BCImpactManager> ImpactManager;
var() byte ArmorHitType;
var() float MinMotionBlurDamage;
var() float MotionBlurDamageRange;
var() float MotionBlurFactor;
var() float MotionBlurTime;
var() bool bUseMotionBlur;
var globalconfig bool bLessDisruptiveFlash;
var int FlashThreshold;
var Vector FlashV;
var float FlashF;
var Vector AltFlashV;
var float AltFlashF;
var() bool bCanBeBlocked;
var() float BlockPenetration;
var() float BlockFatiguePenalty;
var() int ShieldDamage;
var() BallisticDamageType.EDisplacementType DisplacementType;
var() int AimDisplacementDamageThreshold;
var() float AimDisplacementDuration;
var() float TagMultiplier;
var() float TagDuration;
var() BallisticDamageType.EDamageBasis DamageBasis;
var() float Penetration;
var() bool bDetonatesBombs;
var() bool bIgniteFires;
var() bool bMetallic;
var() bool bAimable;
var() bool bSnipingDamage;
var() bool bPowerPush;
var() bool bNegatesMomentum;
var() bool bHeaddie;
var() bool bIgnoredOnLifts;
var() float InvasionDamageScaling;
var() string DamageIdent;
var() string DamageDescription;

static function string Detag(string S, PlayerReplicationInfo Victim, PlayerReplicationInfo Killer)
{
	local string kh, VH, VS, ks, km, vm,
		ve, ke;

	// End:0x4E
	if((Victim != none) && Victim.bIsFemale)
	{
		VH = default.Her;
		VS = default.Herself;
		vm = default.MHer;
		ve = default.She;		
	}
	else
	{
		VH = default.His;
		VS = default.Himself;
		vm = default.Him;
		ve = default.He;
	}
	// End:0xC8
	if((Killer != none) && Killer.bIsFemale)
	{
		kh = default.Her;
		ks = default.Herself;
		km = default.MHer;
		ke = default.She;		
	}
	else
	{
		kh = default.His;
		ks = default.Himself;
		km = default.Him;
		ke = default.He;
	}
	SwitchText(S, "%ke", ke);
	SwitchText(S, "%ve", ve);
	SwitchText(S, "%km", km);
	SwitchText(S, "%vm", vm);
	SwitchText(S, "%kh", kh);
	SwitchText(S, "%vh", VH);
	SwitchText(S, "%ks", ks);
	SwitchText(S, "%vs", VS);
	return S;
	//return;	
}

static function SwitchText(out string Text, string Replace, string With)
{
	local int i;
	local string Input;

	Input = Text;
	Text = "";
	i = InStr(Input, Replace);
	J0x25:

	// End:0x84 [Loop If]
	if(i != -1)
	{
		Text = (Text $ Left(Input, i)) $ With;
		Input = Mid(Input, i + Len(Replace));
		i = InStr(Input, Replace);
		// [Loop Continue]
		goto J0x25;
	}
	Text = Text $ Input;
	//return;	
}

static function bool IsAimed(PlayerController PC)
{
	// End:0x6C
	if(((PC.Pawn != none) && BallisticWeapon(PC.Pawn.Weapon) != none) && int(BallisticWeapon(PC.Pawn.Weapon).SightingState) != int(0))
	{
		return true;
	}
	return false;
	//return;	
}

static function string DeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Victim)
{
	local string S, t;

	// End:0xF5
	if(default.bSimpleDeathMessages)
	{
		// End:0x3A
		if(default.WeaponClass == none)
		{
			S = ("%k [" $ (GetItemName(string(default.Class)))) $ "] %o";			
		}
		else
		{
			// End:0x5D
			if(default.SimpleKillString == "")
			{
				t = default.WeaponClass.default.ItemName;				
			}
			else
			{
				t = default.SimpleKillString;
			}
			// End:0x82
			if(default.HipString != "")
			{
				t @= default.HipString;
			}
			// End:0xBB
			if((default.DamageIdent == "Melee") && int(default.WeaponClass.default.InventoryGroup) != 1)
			{
				t @= "Melee";
			}
			// End:0xD7
			if(default.bHeaddie)
			{
				t @= "Headshot";
			}
			S = ("%k [" $ t) $ "] %o";
		}		
	}
	else
	{
		// End:0x118
		if(default.DeathStrings.Length > 0)
		{
			S = default.DeathStrings[Rand(default.DeathStrings.Length)];			
		}
		else
		{
			S = default.DeathString;
		}
	}
	return Detag(S, Victim, Killer);
	//return;	
}

static function string ScopedDeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Victim)
{
	local string S, t;

	// End:0x31
	if(default.WeaponClass == none)
	{
		S = ("%k [" $ (GetItemName(string(default.Class)))) $ "] %o";		
	}
	else
	{
		// End:0x54
		if(default.SimpleKillString == "")
		{
			t = default.WeaponClass.default.ItemName;			
		}
		else
		{
			t = default.SimpleKillString;
		}
		// End:0x9B
		if((default.DamageIdent == "Melee") && int(default.WeaponClass.default.InventoryGroup) != 1)
		{
			t @= "Melee";			
		}
		else
		{
			t @= default.AimedString;
		}
		// End:0xC5
		if(default.bHeaddie)
		{
			t @= "Headshot";
		}
		S = ("%k [" $ t) $ "] %o";
	}
	return Detag(S, Victim, Killer);
	//return;	
}

static function string PeneDeathMessage(PlayerReplicationInfo Killer, PlayerReplicationInfo Victim)
{
	local string S, t;

	// End:0x31
	if(default.WeaponClass == none)
	{
		S = ("%k [" $ (GetItemName(string(default.Class)))) $ "] %o";		
	}
	else
	{
		// End:0x54
		if(default.SimpleKillString == "")
		{
			t = default.WeaponClass.default.ItemName;			
		}
		else
		{
			t = default.SimpleKillString;
		}
		t @= default.PenetratedString;
		// End:0x89
		if(default.bHeaddie)
		{
			t @= "Headshot";
		}
		S = ("%k [" $ t) $ "] %o";
	}
	return Detag(S, Victim, Killer);
	//return;	
}

static function string SuicideMessage(PlayerReplicationInfo Victim)
{
	// End:0x65
	if(default.bSimpleDeathMessages)
	{
		// End:0x29
		if(default.WeaponClass == none)
		{
			return ("[" $ string(default.Class)) $ "] %o";
		}
		// End:0x51
		if(default.SimpleKillString == "")
		{
			return ("[" $ default.WeaponClass.default.ItemName) $ "] %o";
		}
		return ("[" $ default.SimpleKillString) $ "] %o ";
	}
	// End:0x8B
	if(Victim.bIsFemale && default.FemaleSuicides.Length < 1)
	{
		return default.FemaleSuicide;
	}
	// End:0x9D
	if(default.MaleSuicides.Length < 1)
	{
		return default.MaleSuicide;
	}
	// End:0xBE
	if(Victim.bIsFemale)
	{
		return default.FemaleSuicides[Rand(default.FemaleSuicides.Length)];
	}
	return default.MaleSuicides[Rand(default.MaleSuicides.Length)];
	//return;	
}

static function bool IsDamage(string TypeString)
{
	return InStr(default.DamageDescription, TypeString) >= 0;
	//return;	
}

static function Hurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	Victim.TakeDamage(int(Damage), Instigator, HitLocation, Momentum, dt);
	// End:0x80
	if(((default.TagDuration > float(0)) && Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical()) && Pawn(Victim) != none)
	{
		Class'BCoreProV55.BCSprintControl'.static.SetSlowTo(Pawn(Victim), default.TagMultiplier, default.TagDuration);
	}
	//return;	
}

static function GenericHurt(Actor Victim, float Damage, Pawn Instigator, Vector HitLocation, Vector Momentum, Class<DamageType> dt)
{
	// End:0x45
	if(Class<BallisticDamageType>(dt) != none)
	{
		Class<BallisticDamageType>(dt).static.Hurt(Victim, Damage, Instigator, HitLocation, Momentum, dt);		
	}
	else
	{
		Victim.TakeDamage(int(Damage), Instigator, HitLocation, Momentum, dt);
	}
	//return;	
}

static function bool IgnitesFires()
{
	return ((int(default.DamageBasis) == int(1)) || int(default.DamageBasis) == int(2)) || int(default.DamageBasis) == int(4);
	//return;	
}

static function DoBloodEffects(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x89
	if((((Monster(Victim) == none) && !Victim.PhysicsVolume.bWaterVolume) && !default.bCantLoadBlood) && (GetBloodManager()) != none)
	{
		static.GetBloodManager().StartSpawnBlood(HitLocation + ((Normal(Momentum) * Victim.CollisionRadius) * 1.5000000), Momentum, Victim);
	}
	//return;	
}

static function Class<BloodManager> GetBloodManager()
{
	// End:0x3A
	if(default.BloodManager == none)
	{
		default.BloodManager = Class<BloodManager>(DynamicLoadObject(default.BloodManagerName, Class'Core.Class', true));
		// End:0x3A
		if(default.BloodManager == none)
		{
			default.bCantLoadBlood = true;
		}
	}
	return default.BloodManager;
	//return;	
}

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x110
	if(xPawn(Victim) != none)
	{
		// End:0x42
		if(default.PawnDamageSounds.Length > 0)
		{
			Victim.PlaySound(default.PawnDamageSounds[Rand(default.PawnDamageSounds.Length)],, default.TransientSoundVolume,, default.TransientSoundRadius);
		}
		// End:0x7D
		if((default.EffectChance > float(0)) && default.EffectChance > FRand())
		{
			DoBloodEffects(HitLocation, Damage, Momentum, Victim, bLowDetail);
		}
		// End:0x110
		if(Damage >= float(default.FlashThreshold))
		{
			// End:0x110
			if(PlayerController(Victim.Controller) != none)
			{
				// End:0xE9
				if(default.bLessDisruptiveFlash && default.AltFlashF != float(0))
				{
					PlayerController(Victim.Controller).ClientFlash(default.AltFlashF, default.AltFlashV);					
				}
				else
				{
					PlayerController(Victim.Controller).ClientFlash(default.FlashF, default.FlashV);
				}
			}
		}
	}
	return super(DamageType).GetPawnDamageEffect(HitLocation, Damage, Momentum, Victim, bLowDetail);
	//return;	
}

static function ModifyHit(Pawn Victim, out float Damage, Vector Momentum, out Vector HitLocation, out Vector hitRay, out name HitBone)
{
	//return;	
}

static function bool OverrideCanSever(Pawn Pawn, name Bone, int Damage, Vector HitLoc, Vector hitRay, bool bDirectHit, out byte bCanSever)
{
	//return;	
}

static function bool DoBloodHit(Pawn Victim, name Bone, Vector HitLoc, Vector hitRay, int Damage)
{
	// End:0x19
	if(default.bCantLoadBlood || (GetBloodManager()) == none)
	{
		return false;
	}
	static.GetBloodManager().DoBloodHit(Victim, Bone, HitLoc, hitRay, Damage);
	return true;
	//return;	
}

static function bool DoSeverEffect(Pawn Victim, name Bone, Vector hitRay, int Damage)
{
	// End:0x19
	if(default.bCantLoadBlood || (GetBloodManager()) == none)
	{
		return false;
	}
	static.GetBloodManager().DoSeverEffects(Victim, Bone, hitRay, default.GibPerterbation, float(Damage));
	return true;
	//return;	
}

static function bool DoSeverStump(Pawn Victim, name Bone, Vector hitRay, int Damage)
{
	// End:0x19
	if(default.bCantLoadBlood || (GetBloodManager()) == none)
	{
		return false;
	}
	// End:0x24
	if(default.bNoSeverStumps)
	{
		return true;
	}
	static.GetBloodManager().DoSeverStump(Victim, Bone, hitRay, float(Damage));
	return true;
	//return;	
}

static function LocalHitEffects(Pawn Victim, name HitBone, Vector HitLocation, Vector hitRay, int Damage)
{
	local float ScaleFactor;

	// End:0xC9
	if(((default.bUseMotionBlur && int(Victim.Level.NetMode) != int(NM_DedicatedServer)) && Victim.Level.GetLocalPlayerController().ViewTarget == Victim) && float(Damage) > default.MinMotionBlurDamage)
	{
		ScaleFactor = FMin(1.0000000, (float(Damage) - default.MinMotionBlurDamage) / default.MotionBlurDamageRange);
		Class'BCoreProV55.BC_MotionBlurActor'.static.DoMotionBlur(PlayerController(Victim.Controller), default.MotionBlurFactor * ScaleFactor, default.MotionBlurTime * ScaleFactor);
	}
	//return;	
}

static final function bool Displaces()
{
	return int(default.DisplacementType) != int(0);
	//return;	
}

static final function bool ScalingDisplace()
{
	return int(default.DisplacementType) == int(2);
	//return;	
}

defaultproperties
{
	AimedString="Aimed"
	PenetratedString="Penetrated"
	His="his"
	Her="her"
	Himself="himself"
	Herself="herself"
	Him="him"
	MHer="her"
	He="he"
	She="she"
	ArmorHitType=255
	MinMotionBlurDamage=10.0000000
	MotionBlurDamageRange=80.0000000
	MotionBlurFactor=4.0000000
	MotionBlurTime=3.0000000
	FlashThreshold=200
	BlockFatiguePenalty=0.1000000
	AimDisplacementDuration=0.5000000
	TagMultiplier=1.0000000
	bDetonatesBombs=true
	bAimable=true
	InvasionDamageScaling=1.0000000
	DamageIdent="Unknown"
	bDetonatesGoop=true
	bKUseTearOffMomentum=true
	bExtraMomentumZ=false
	bDirectDamage=false
	TransientSoundVolume=1.0000000
	TransientSoundRadius=64.0000000
}
