class Rules_Ballistic extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() float damageScale;
var() float VehicleDamageScale;

function PostBeginPlay()
{
	damageScale = Class'BCoreProV55.BallisticReplicationInfo'.default.damageScale;
	VehicleDamageScale = Class'BCoreProV55.BallisticReplicationInfo'.default.VehicleDamageScale;
	//return;	
}

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x4F
	if(Class<BallisticDamageType>(DamageType) != none)
	{
		// End:0x39
		if(Vehicle(injured) != none)
		{
			Damage = int(float(Damage) * VehicleDamageScale);			
		}
		else
		{
			Damage = int(float(Damage) * damageScale);
		}
	}
	// End:0x8D
	if(NextGameRules != none)
	{
		return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
	}
	return Damage;
	//return;	
}

defaultproperties
{
	damageScale=1.0000000
	VehicleDamageScale=1.0000000
}
