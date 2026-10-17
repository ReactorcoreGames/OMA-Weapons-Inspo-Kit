class BallisticArmor extends Armor;

var byte HitType;

event PostBeginPlay()
{
	AttachToPawn(Pawn(Owner));
	super(Actor).PostBeginPlay();
	//return;	
}

function AttachToPawn(Pawn P)
{
	Instigator = P;
	// End:0x41
	if(ThirdPersonActor == none)
	{
		ThirdPersonActor = Spawn(AttachmentClass, Owner);
		InventoryAttachment(ThirdPersonActor).InitFor(self);		
	}
	else
	{
		ThirdPersonActor.NetUpdateTime = Level.TimeSeconds - float(1);
	}
	ThirdPersonActor.SetLocation(P.Location);
	ThirdPersonActor.SetBase(P);
	//return;	
}

function ArmorImpactEffect(Vector HitLocation)
{
	// End:0x3B
	if((ThirdPersonActor != none) && ArmorAttachment(ThirdPersonActor) != none)
	{
		ArmorAttachment(ThirdPersonActor).UpdateHit(HitLocation, HitType);
	}
	//return;	
}

function int ArmorAbsorbDamage(int Damage, Class<DamageType> DamageType, Vector HitLocation)
{
	// End:0x1E
	if(xPawn(Owner).ShieldStrength == float(0))
	{
		Destroy();
	}
	// End:0xC7
	if(DamageType.default.bArmorStops)
	{
		// End:0x7A
		if((Class<BallisticDamageType>(DamageType) != none) && int(Class<BallisticDamageType>(DamageType).default.ArmorHitType) != 255)
		{
			HitType = Class<BallisticDamageType>(DamageType).default.ArmorHitType;			
		}
		else
		{
			// End:0x97
			if(DamageType.default.bBulletHit)
			{
				HitType = 0;				
			}
			else
			{
				// End:0xB4
				if(DamageType.default.bLocationalHit)
				{
					HitType = 1;					
				}
				else
				{
					HitType = 2;
				}
			}
		}
		ArmorImpactEffect(HitLocation);
	}
	// End:0xE5
	if((DamageType != none) && ProtectionType == DamageType)
	{
		return 0;
	}
	return Damage;
	//return;	
}

defaultproperties
{
	ArmorAbsorption=100
	AbsorptionPriority=1
	Charge=100
	AttachmentClass=Class'BallisticProV55.ArmorAttachment'
}
