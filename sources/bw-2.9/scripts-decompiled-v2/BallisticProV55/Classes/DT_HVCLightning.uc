class DT_HVCLightning extends DT_BWMiscDamage
	config(BallisticProV55);

static function bool OverrideCanSever(Pawn Pawn, name Bone, int Damage, Vector HitLoc, Vector hitRay, bool bDirectHit, out byte bCanSever)
{
	switch(Bone)
	{
		// End:0x37
		case 'pelvis':
			// End:0x34
			if(float(200 + Rand(150)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x67
		case 'spine':
			// End:0x64
			if(float(200 + Rand(150)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x97
		case 'head':
			// End:0x94
			if(float(50 + Rand(50)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0xC7
		case 'lshoulder':
			// End:0xC4
			if(float(60 + Rand(60)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0xF7
		case 'rshoulder':
			// End:0xF4
			if(float(60 + Rand(60)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x127
		case 'lfarm':
			// End:0x124
			if(float(30 + Rand(30)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x157
		case 'rfarm':
			// End:0x154
			if(float(30 + Rand(30)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x187
		case 'lhand':
			// End:0x184
			if(float(20 + Rand(20)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x1B7
		case 'righthand':
			// End:0x1B4
			if(float(20 + Rand(20)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x1E7
		case 'rhand':
			// End:0x1E4
			if(float(20 + Rand(20)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x217
		case 'lthigh':
			// End:0x214
			if(float(60 + Rand(60)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x247
		case 'rthigh':
			// End:0x244
			if(float(60 + Rand(60)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x277
		case 'lfoot':
			// End:0x274
			if(float(20 + Rand(20)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0x2A7
		case 'rfoot':
			// End:0x2A4
			if(float(20 + Rand(20)) < (float(Damage) * default.GibModifier))
			{
				bCanSever = 1;
			}
			// End:0x2AA
			break;
		// End:0xFFFF
		default:
			break;
	}
	return true;
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%o was enlightened by %k."
	DeathStrings[1]="%o was struck down by %k's lightning."
	DeathStrings[2]="%k electrocuted %o with %kh lightning gun."
	DeathStrings[3]="%k seared %o into ash with %kh HVC."
	DeathStrings[4]="%o screamed and burned as %k poured lightning into %vm."
	DeathStrings[5]="%k tossed %o around with scorching lightning."
	DeathStrings[6]="%k exerted the wrath of God on %o."
	SimpleKillString="HVC-Mk9 Lightning Stream"
	BloodManagerName="BallisticProV55.BloodMan_Lightning"
	bMultiSever=true
	FlashThreshold=0
	FlashV=(X=800.0000000,Y=800.0000000,Z=2000.0000000)
	FlashF=0.5000000
	ShieldDamage=15
	bDetonatesBombs=false
	bIgniteFires=true
	InvasionDamageScaling=3.0000000
	DamageIdent="Streak"
	DamageDescription=",Electro,"
	WeaponClass=Class'BallisticProV55.HVCMk9LightningGun'
	DeathString="%o was was enlightened by %k."
	FemaleSuicide="%o was struck down by the hand of God."
	MaleSuicide="%o was struck down by the hand of God."
	bInstantHit=true
	bCauseConvulsions=true
	GibModifier=5.0000000
	DamageOverlayMaterial=Shader'XGameShaders.PlayerShaders.LightningHit'
	DamageOverlayTime=0.9000000
	GibPerterbation=0.2500000
	KDamageImpulse=20000.0000000
}
