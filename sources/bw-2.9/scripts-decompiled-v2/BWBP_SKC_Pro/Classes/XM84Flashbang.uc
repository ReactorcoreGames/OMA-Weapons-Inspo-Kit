class XM84Flashbang extends BallisticHandGrenade
	config(BallisticProV55);

var() Material MatGlow1;
var() Material MatGlow2;
var() Material MatGlow3;
var() Material MatSparks;

simulated function XM84StaticProOn()
{
	Skins[1] = MatSparks;
	//return;	
}

simulated function XM84StaticProOff()
{
	local float F;

	F = FRand();
	// End:0x27
	if(F > 0.8500000)
	{
		Skins[1] = MatGlow3;		
	}
	else
	{
		// End:0x46
		if(F > 0.5500000)
		{
			Skins[1] = MatGlow2;			
		}
		else
		{
			Skins[1] = MatGlow1;
		}
	}
	//return;	
}

simulated function CheckNoGrenades()
{
	local BCGhostWeapon GW;

	// End:0x135
	if((Ammo[0] != none) && (Ammo[0].AmmoAmount < 1) || (Ammo[0].AmmoAmount == 1) && (bFireMode[0].ConsumedLoad > 0) || bFireMode[1].ConsumedLoad > 0)
	{
		AIRating = -999.0000000;
		Priority = byte(-999);
		Instigator.Weapon = none;
		// End:0xF6
		if(int(Role) == int(ROLE_Authority))
		{
			GW = Spawn(Class'BCoreProV55.BCGhostWeapon',,, Instigator.Location);
			// End:0xF6
			if(GW != none)
			{
				GW.MyWeaponClass = Class;
				GW.GiveTo(Instigator);
			}
		}
		// End:0x12F
		if((Instigator != none) && Instigator.Controller != none)
		{
			Instigator.Controller.ClientSwitchToBestWeapon();
		}
		Destroy();		
	}
	else
	{
		PlayAnim(SelectAnim, 1.0000000, 0.0000000);
	}
	//return;	
}

simulated function SpecialHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir, Dummy;
	local bool bHitInstigator;
	local XM84ActorCorrupt PF;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x2C2
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x2C1
		if(((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			// End:0x93
			if((Victims == Instigator) && Instigator != none)
			{
				bHitInstigator = true;
				continue;				
			}
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x139
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			PF = Spawn(Class'BWBP_SKC_Pro.XM84ActorCorrupt', self,, Victims.Location);
			PF.Instigator = Instigator;
			// End:0x234
			if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
			{
				PF.InstigatorController = Instigator.Controller;
			}
			PF.Initialize(Victims);
			// End:0x2C1
			if((Pawn(Victims) != none) && Level.Game.ReduceDamage(int(DamageAmount), xPawn(Victims), Instigator, Victims.Location, Dummy, DamageType) > 0)
			{
				ApplySlowdown(Pawn(Victims), DamageAmount / float(4));
			}
		}		
	}	
	// End:0x4D2
	if(bHitInstigator)
	{
		Victims = Instigator;
		Dir = Victims.Location - HitLocation;
		dist = FMax(1.0000000, VSize(Dir));
		Dir = Dir / dist;
		// End:0x34D
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victims.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, DamageAmount * float(5), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (float(1) * Momentum) * Dir, DamageType);
		PF = Spawn(Class'BWBP_SKC_Pro.XM84ActorCorrupt', self,, Victims.Location);
		PF.Instigator = Instigator;
		// End:0x445
		if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
		{
			PF.InstigatorController = Instigator.Controller;
		}
		PF.Initialize(Victims);
		// End:0x4D2
		if((Pawn(Victims) != none) && Level.Game.ReduceDamage(int(DamageAmount), xPawn(Victims), Instigator, Victims.Location, Dummy, DamageType) > 0)
		{
			ApplySlowdown(Pawn(Victims), DamageAmount / float(4));
		}
	}
	bHurtEntry = false;
	//return;	
}

function ApplySlowdown(Pawn P, float Duration)
{
	Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(P, 0.6000000, Duration);
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist, Height, Result;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	Result = 0.5000000;
	// End:0xD9
	if(dist > float(500))
	{
		Result -= 0.4000000;		
	}
	else
	{
		Result += 0.4000000;
	}
	// End:0x108
	if(Abs(Height) > float(32))
	{
		Result -= (Height / dist);
	}
	// End:0x11A
	if(Result > 0.5000000)
	{
		return 1;
	}
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist, Height;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Height = B.Enemy.Location.Z - Instigator.Location.Z;
	Result = AIRating;
	Result += (Height / float(-500));
	// End:0x13C
	if(Height > float(-200))
	{
		// End:0x111
		if(dist > float(800))
		{
			Result -= ((dist - float(800)) / float(2000));
		}
		// End:0x13C
		if(dist < float(500))
		{
			Result -= (float(1) - (dist / float(500)));
		}
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.2000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.5000000;
	//return;	
}

defaultproperties
{
	MatGlow1=Shader'BWBP_SKC_Tex.XM84.XM84-Glow2'
	MatGlow2=Shader'BWBP_SKC_Tex.XM84.XM84-Glow4'
	MatGlow3=Shader'BWBP_SKC_Tex.XM84.XM84-Glow3'
	MatSparks=Shader'BWBP_SKC_Tex.XM84.XM84-Glow'
	FuseDelay=2.0000000
	HeldDamage=45
	HeldRadius=350
	HeldMomentum=75000
	HeldDamageType=Class'BWBP_SKC_Pro.DTXM84Held'
	GrenadeSmokeClass=Class'BWBP_SKC_Pro.XM84Trail'
	ClipReleaseSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PinPullSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-PinOut',Volume=0.1000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	SpecialInfo[0]=(Id="EvoDefs",Info="60.0;5.0;0.25;30.0;0.0;0.0;0.4")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.XM84WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.XM84WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.XM84WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.XM84WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.XM84.BigIcon_XM84'
	BigIconCoords=(X1=0,Y1=12,X2=511,Y2=255)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Pullout',Volume=0.1120000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Putaway',Volume=0.1110000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.NRP57OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.NRP57InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=255,B=7,A=166),Color2=(R=12,G=26,B=255,A=229),StartSize1=112,StartSize2=210)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Grenade=true
	ManualLines[0]="Throws an XM84 overarm. After the 1 second fuse has expired, it explodes with a wide radius, inflicting a long-lasting continuous blind with a damage over time component upon the enemy. Can affect allies."
	ManualLines[1]="As primary, but the XM84 is rolled underarm."
	ManualLines[2]="While the XM84 can be cooked in hand, its short fuse makes this a bad idea.||Effective in group engagements."
	FireModeClass[0]=Class'BWBP_SKC_Pro.XM84PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.XM84SecondaryFire'
	SelectAnimRate=2.0000000
	PutDownAnimRate=2.0000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.4000000
	CurrentRating=0.4000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_XM84HTG'
	Description="The XM84 Heavy Disruptor grenade is an advanced electromagnetic pulsar weapon designed for incapacitation and disorientation. State of the art field psionic generators ensure the XM84 can tackle all types of targets. A fission criticality-inducing core combined with the Tandem MS flux generator gives the XM84 the destructive ability to strip away energy shields and fry any electrical system without a Warship-Grade Faraday cage. Warning: Long term exposure to armed XM84s is known to cause acute radiation poisoning and cerebral hemorrhaging. Proximity to a disruptive burst will cause permanent memory loss and irreversible neurological damage."
	Priority=142
	HudColor=(R=100,G=150,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	PickupClass=Class'BWBP_SKC_Pro.XM84Pickup'
	PlayerViewOffset=(X=6.0000000,Y=7.5000000,Z=-9.0000000)
	PlayerViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	AttachmentClass=Class'BWBP_SKC_Pro.XM84Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.XM84.SmallIcon_XM84'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="XM84 Heavy Tech Grenade"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.XM84_FPm'
	DrawScale=0.3000000
}
