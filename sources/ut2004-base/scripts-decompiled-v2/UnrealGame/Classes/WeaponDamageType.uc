class WeaponDamageType extends DamageType
	abstract;

var() Class<Weapon> WeaponClass;

static function string GetWeaponClass()
{
	return string(default.WeaponClass);
	//return;	
}

defaultproperties
{
	bDirectDamage=true
}
