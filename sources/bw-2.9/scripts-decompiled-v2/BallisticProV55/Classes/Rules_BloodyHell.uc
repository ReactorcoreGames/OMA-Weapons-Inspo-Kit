class Rules_BloodyHell extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Class<DamageType> LastDamageType;
var Class<BallisticDamageType> ExplodedDamage;
var() string ExplodedDamageName;

event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	ExplodedDamage = Class<BallisticDamageType>(DynamicLoadObject(ExplodedDamageName, Class'Core.Class'));
	//return;	
}

function bool PreventDeath(Pawn Killed, Controller Killer, Class<DamageType> dt, Vector HitLocation)
{
	LastDamageType = dt;
	// End:0x2A
	if(super.PreventDeath(Killed, Killer, dt, HitLocation))
	{
		return true;
	}
	// End:0x5B
	if(((ExplodedDamage == none) || UnrealPawn(Killed) == none) || BallisticPawn(Killed) != none)
	{
		return false;
	}
	// End:0x1E5
	if((!ClassIsChildOf(dt, Class'BCoreProV55.BallisticDamageType') && dt.default.bCausesBlood) && ((((((((((((dt.default.bAlwaysGibs || ClassIsChildOf(dt, Class'Engine.Gibbed')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeRocket')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeFlakShell')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeSuperShockBeam')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeRedeemer')) || ClassIsChildOf(dt, Class'Onslaught.DamTypeTankShell')) || ClassIsChildOf(dt, Class'Onslaught.DamTypeAttackCraftMissle')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeShockCombo')) || ClassIsChildOf(dt, Class'OnslaughtFull.DamTypeMASCannon')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeTeleFrag')) || ClassIsChildOf(dt, Class'XWeapons.DamTypeIonBlast')) || ClassIsChildOf(dt, Class'Engine.DamTypeTelefragged')) || ClassIsChildOf(dt, Class'UT2k4AssaultFull.DamTypeIonCannonBlast'))
	{
		ExplodedDamage.static.DoBloodEffects(HitLocation, 100.0000000, Killed.Location - (HitLocation * float(10000)), Killed, Level.bDropDetail || int(Level.DetailMode) == int(0));
	}
	return false;
	//return;	
}

function ScoreKill(Controller Killer, Controller Killed)
{
	local BWBloodControl bc;

	super.ScoreKill(Killer, Killed);
	// End:0x75
	if((Killed.Pawn != none) && BallisticPawn(Killed.Pawn) == none)
	{
		bc = Spawn(Class'BallisticProV55.BWBloodControl', Killed.Pawn);
		bc.Initialize(LastDamageType);
		DoDamageDeathBlood();
	}
	//return;	
}

simulated function DoDamageDeathBlood()
{
	//return;	
}

defaultproperties
{
	ExplodedDamageName="BallisticProV55.DT_BWExplode"
}
