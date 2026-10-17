class XOXOStaff extends BallisticWeapon
	config(BallisticProV55);

var Actor HeartGlow;
var Actor ProngGlow1;
var Actor ProngGlow2;
var XOXOStreamEffect StreamEffect;
var float Lewdness;
var bool bLoveMode;
var Emitter LoveEffect;
var int ShockwaveDamageRadius;
var int ShockwaveDamage;
var int ShockwaveMomentum;
var Class<DamageType> ShockwaveDamageType;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Lewdness;
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x22
	if(HeartGlow != none)
	{
		HeartGlow.Destroy();
	}
	// End:0xB4
	if((Instigator.IsLocallyControlled() && int(Level.DetailMode) >= int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		HeartGlow = none;
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(HeartGlow, Class'BWBP_OP_Pro.XOXOCoverGlow', DrawScale, self, 'HeartGlowSocket');
		Emitter(HeartGlow).Emitters[0].ZTest = false;
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x2E
	if(super.PutDown())
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(HeartGlow);
		// End:0x2C
		if(bLoveMode)
		{
			ArousalDepleted();
		}
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(HeartGlow);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(LoveEffect);
	super.Destroyed();
	//return;	
}

simulated function RenderOverlays(Canvas C)
{
	super.RenderOverlays(C);
	// End:0xA3
	if(StreamEffect != none)
	{
		StreamEffect.bHidden = true;
		StreamEffect.SetLocation(ConvertFOVs(GetBoneCoords('Muzzle').Origin, DisplayFOV, Instigator.Controller.FovAngle, 96.0000000));
		StreamEffect.UpdateEndpoint();
		C.DrawActor(StreamEffect, false, false, Instigator.Controller.FovAngle);
	}
	//return;	
}

simulated function Vector ConvertFOVs(Vector InVec, float InFOV, float OutFOV, float Distance)
{
	local Vector ViewLoc, Outvec, Dir, X, Y, Z;

	local Rotator ViewRot;

	ViewLoc = Instigator.Location + Instigator.EyePosition();
	ViewRot = Instigator.GetViewRotation();
	Dir = InVec - ViewLoc;
	GetAxes(ViewRot, X, Y, Z);
	Outvec.X = Distance / Tan((OutFOV * 3.1415930) / float(360));
	Outvec.Y = ((Dir Dot Y) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec.Z = ((Dir Dot Z) * (Distance / Tan((InFOV * 3.1415930) / float(360)))) / (Dir Dot X);
	Outvec = Outvec >> ViewRot;
	return Outvec + ViewLoc;
	//return;	
}

function Shockwave()
{
	local Actor Victims;
	local float damageScale, dist, finalDamage, totaldamage;
	local Vector Dir;
	local int i;
	local Controller C;
	local array<Pawn> HealedAllies;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x223
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, float(ShockwaveDamageRadius), Instigator.Location)
	{
		// End:0x222
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && Victims.bCanBeDamaged) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Instigator)
		{
			// End:0xF1
			if(((Pawn(Victims) != none) && Pawn(Victims).Controller != none) && Pawn(Victims).Controller.SameTeamAs(InstigatorController))
			{
				continue;				
			}
			Dir = Victims.Location - Instigator.Location;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = FClamp(0.5000000 + (0.5000000 * (float(1) - ((dist - Victims.CollisionRadius) / float(ShockwaveDamageRadius)))), 0.0000000, 1.0000000);
			finalDamage = damageScale * float(ShockwaveDamage);
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, finalDamage, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * float(ShockwaveMomentum)) * Dir, ShockwaveDamageType);
			// End:0x222
			if(Pawn(Victims) != none)
			{
				totaldamage += finalDamage;
			}
		}		
	}	
	// End:0x3A3
	if(totaldamage > float(0))
	{
		C = Level.ControllerList;
		J0x245:

		// End:0x2D5 [Loop If]
		if(C != none)
		{
			// End:0x2BE
			if((C.SameTeamAs(Instigator.Controller) && C.Pawn != none) && C.Pawn.bProjTarget)
			{
				HealedAllies[HealedAllies.Length] = C.Pawn;
			}
			C = C.nextController;
			// [Loop Continue]
			goto J0x245;
		}
		// End:0x3A3
		if(totaldamage >= float(HealedAllies.Length))
		{
			i = 0;
			J0x2EE:

			// End:0x3A3 [Loop If]
			if(i < HealedAllies.Length)
			{
				// End:0x35D
				if(BallisticPawn(HealedAllies[i]) != none)
				{
					BallisticPawn(HealedAllies[i]).GiveAttributedHealth(int(totaldamage / float(HealedAllies.Length)), int(HealedAllies[i].SuperHealthMax), Instigator);
					// [Explicit Continue]
					goto J0x399;
				}
				HealedAllies[i].GiveHealth(int(totaldamage / float(HealedAllies.Length)), int(HealedAllies[i].SuperHealthMax));
				J0x399:

				i++;
				// [Loop Continue]
				goto J0x2EE;
			}
		}
	}
	bHurtEntry = false;
	//return;	
}

function AddLewd(float Amount)
{
	// End:0x24
	if((Amount < float(0)) && bLoveMode)
	{
		Amount *= 0.5000000;
	}
	Lewdness = FClamp(Lewdness + Amount, 0.0000000, 5.0000000);
	//return;	
}

simulated function float ChargeBar()
{
	return Lewdness / float(5);
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	super.GiveTo(Other, Pickup);
	// End:0x39
	if(XOXOPickup(Pickup) != none)
	{
		AddLewd(XOXOPickup(Pickup).Lewdness);
	}
	//return;	
}

function DropFrom(Vector StartLocation)
{
	local int M;
	local Pickup Pickup;

	// End:0x0D
	if(!bCanThrow)
	{
		return;
	}
	// End:0x1F
	if(AmbientSound != none)
	{
		AmbientSound = none;
	}
	ClientWeaponThrown();
	M = 0;
	J0x2C:

	// End:0x78 [Loop If]
	if(M < 2)
	{
		// End:0x6E
		if((FireMode[M] != none) && FireMode[M].bIsFiring)
		{
			StopFire(M);
		}
		M++;
		// [Loop Continue]
		goto J0x2C;
	}
	// End:0x8E
	if(Instigator != none)
	{
		DetachFromPawn(Instigator);
	}
	Pickup = Spawn(PickupClass, self,, StartLocation);
	// End:0x125
	if(Pickup != none)
	{
		// End:0xD8
		if(Instigator.Health > 0)
		{
			WeaponPickup(Pickup).bThrown = true;
		}
		Pickup.InitDroppedPickupFor(self);
		Pickup.Velocity = Velocity;
		// End:0x125
		if(XOXOPickup(Pickup) != none)
		{
			XOXOPickup(Pickup).Lewdness = Lewdness;
		}
	}
	Destroy();
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x1C
	if(Lewdness >= float(5))
	{
		LoveMode();
		ClientWeaponSpecial(1);
	}
	//return;	
}

simulated function ClientWeaponSpecial(optional byte i)
{
	// End:0x16
	if(int(i) > 0)
	{
		LoveMode();		
	}
	else
	{
		ArousalDepleted();
	}
	//return;	
}

simulated function LoveMode()
{
	// End:0x0B
	if(bLoveMode)
	{
		return;
	}
	bLoveMode = true;
	XOXOAttachment(ThirdPersonActor).bLoveMode = true;
	LoveEffect = Spawn(Class'BWBP_OP_Pro.XOXOLoveModeGlow', Instigator,, Instigator.Location, Instigator.Rotation);
	// End:0x75
	if(LoveEffect != none)
	{
		LoveEffect.SetBase(Instigator);
	}
	WeaponModes[3].bUnavailable = false;
	//return;	
}

simulated function ArousalDepleted()
{
	// End:0x0D
	if(!bLoveMode)
	{
		return;
	}
	bLoveMode = false;
	XOXOAttachment(ThirdPersonActor).bLoveMode = false;
	// End:0x45
	if(LoveEffect != none)
	{
		LoveEffect.Kill();
	}
	ParamsClasses[int(GameStyleIndex)].static.OverrideFireParams(self, 0);
	WeaponModes[3].bUnavailable = true;
	CurrentWeaponMode = 0;
	XOXOPrimaryFire(FireMode[0]).SwitchWeaponMode(CurrentWeaponMode);
	Lewdness = 0.0000000;
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x21
	if(bLoveMode)
	{
		Damage *= 0.6000000;
		Momentum *= -0.2000000;
	}
	// End:0x3D
	if(int(MeleeState) >= int(2))
	{
		Momentum *= 0.5000000;
	}
	super.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	//return;	
}

simulated function float GetModifiedJumpZ(Pawn P)
{
	// End:0x1C
	if(bLoveMode)
	{
		return super.GetModifiedJumpZ(P) * 2.0000000;
	}
	return super.GetModifiedJumpZ(P);
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x30
	if(bLoveMode && Instigator.Weapon != self)
	{
		ArousalDepleted();
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	super.WeaponTick(dt);
	// End:0x51
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x51
		if(bLoveMode)
		{
			Lewdness -= (dt / float(12));
			// End:0x51
			if(Lewdness <= float(0))
			{
				ArousalDepleted();
				ClientWeaponSpecial(0);
			}
		}
	}
	//return;	
}

simulated function FirePressed(float F)
{
	// End:0x1E
	if(bNeedReload && MagAmmo > 0)
	{
		bNeedReload = false;
	}
	super.FirePressed(F);
	//return;	
}

function byte BestMode()
{
	return 1;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.2000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.2000000;
	//return;	
}

defaultproperties
{
	ShockwaveDamageRadius=1024
	ShockwaveDamage=80
	ShockwaveMomentum=40000
	ShockwaveDamageType=Class'BWBP_OP_Pro.DTXOXOShockwave'
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;40.0;1.0;80.0;0.0;1.0;1.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.XOXOWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.XOXOWeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_OP_Pro.XOXOWeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.XOXOWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.XOXO.BigIcon_XOXO'
	BigIconCoords=(X1=0,Y1=16,X2=511,Y2=220)
	BringUpSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Pullout',Volume=0.2220000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Putdown',Volume=0.2160000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
	WeaponModes[2]=(ModeName="Lust Shockwave",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Sexplosion",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	SightBobScale=0.2500000
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-GemHit',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-MagOut',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-MagIn',Volume=0.7000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M806OutA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=113,B=213,A=255),Color2=(R=255,G=71,B=63,A=255),StartSize1=96,StartSize2=54)
	MeleeFireClass=Class'BWBP_OP_Pro.XOXOMeleeFire'
	ManualLines[0]="The Bomb firemode shoots Xes and Os, that explode and deal relatively high damage on direct hit and also release smaller, shrapnel-like Xes and Os that deal some area damage. The projectile travels relatively slow though and has to deal with noticeable trajectory.|The Fast Charge has high RPM, deals good damage and travels in a straight line. Gains damage over range.|Lust creates a shockwave, damaging and knocking back nearby enemies. Every shockwave has vampiristic abilities, healing you and random teammates on the map, no matter wher they are, the health of your enemies will be evenly distributed between you and your team. This mode costs Lewdness to use."
	ManualLines[1]="The Stream, with its spazzing movement, performs rather poorly on medium range, on the other hand, continously hitting someone with it at close range increases the base damage until you next miss.. Aiming it at teammates however enables its homing capability, which makes it rather convenient to heal them."
	ManualLines[2]="Has a melee attack.|By killing enemies, you can collect their lewdness (similar to Dark Star and Nova Staff souls) and fill up your luv-o-meter. Filling it up, makes it possible to activate love-mode by pressing the Weapon Special-Key. This gives you damage resistance, improved jump, reduces the Lewdness cost of Lust Shockwave and allows the Sexplosion to be used.||The Sexplosion is an impressive firemode, which creates a gargantuan ball of love, acting bomb-like, but much slower. Upon impact, it explodes violently and kills pretty much everyone in proximity. The Sexplosion however wastes the complete charge of Le Big Xoxo and ends Love-Mode. Think twice, before wasting it!"
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	SightOffset=(X=5.0000000,Y=0.6500000,Z=0.5000000)
	GunLength=128.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.XOXOPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.XOXOSecondaryFire'
	PutDownAnimRate=1.3500000
	PutDownTime=0.6000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	bShowChargingBar=true
	Description="Le Big XOXO. Not a soul knows where this artifact came from or who might have created it. It might have been forged by an ancient, forgotten culture or found its way to us by having traveled through the vastness of space before becoming a fabulous, longish meteor. What matters in the end is, that it is an absolutely marvelous addition to the weapon roster, providing completely diverse firemodes, the ability to deal enormous amounts of damage, heal teammates and even improve upon killing enemies and sucking up their lewdness. Remember: Don't judge a book by its cover. (Although I don't see how this ABSOLUTELY ASTONISHING COVER could possibly lead anyone to underestimate Le Big Xoxo's power.)"
	Priority=38
	HudColor=(R=235,G=155,B=225,A=255)
	InventoryGroup=5
	GroupOffset=2
	PickupClass=Class'BWBP_OP_Pro.XOXOPickup'
	PlayerViewOffset=(X=5.0000000,Y=4.5000000,Z=-4.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.XOXOAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.XOXO.SmallIcon_XOXO'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="Le Big XOXO"
	LightType=2
	LightEffect=13
	LightSaturation=64
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.XOXO_FPm'
	DrawScale=0.3000000
	bFullVolume=true
	SoundRadius=32.0000000
}
