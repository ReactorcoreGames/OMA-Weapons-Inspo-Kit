class LandMine extends Triggers;

var() Vector ChuckVelocity;
var() Class<DamageType> DamageType;
var() Class<Emitter> BlowupEffect;
var() Sound BlowupSound;

function Touch(Actor Other)
{
	// End:0x2B
	if(Pawn(Other) != none)
	{
		Other.PendingTouch = self;
		PendingTouch = Other;
	}
	//return;	
}

function PostTouch(Actor Other)
{
	local Pawn P;

	P = Pawn(Other);
	// End:0x9E
	if(P != none)
	{
		PlaySound(BlowupSound,, 3.0000000 * TransientSoundVolume);
		Spawn(BlowupEffect,,, P.Location - (P.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)));
		P.AddVelocity(ChuckVelocity);
		P.Died(none, DamageType, P.Location);
	}
	//return;	
}

defaultproperties
{
	ChuckVelocity=(X=0.0000000,Y=0.0000000,Z=1000.0000000)
	DamageType=Class'Engine.DamageType'
	BlowupEffect=Class'XEffects.LandMineExplosion'
	BlowupSound=Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3'
	CollisionRadius=100.0000000
	CollisionHeight=50.0000000
}
