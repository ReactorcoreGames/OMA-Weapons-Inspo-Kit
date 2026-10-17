class MAG78Longsword extends BallisticMeleeWeapon
	config(BallisticProV55);

var float BladeAlpha;
var float DesiredBladeAlpha;
var float BladeShiftSpeed;
var float NextAmmoTickTime;
var VariableTexPanner ChainsawPanner;
var float ChainSpeed;
var bool bLatchedOn;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLatchedOn;
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
	super(BallisticWeapon).DisplayDebug(Canvas, YL, YPos);
	Canvas.SetDrawColor(128, 0, byte(255));
	Canvas.DrawText((((("Longsword: ChainSpeed: " $ string(ChainSpeed)) $ ", Pan Rate: ") $ string(ChainsawPanner.PanRate)) $ " BladeAlpha: ") $ string(BladeAlpha));
	YPos += YL;
	Canvas.SetPos(4.0000000, YPos);
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x76
	if(NextAmmoTickTime < Level.TimeSeconds)
	{
		// End:0x5B
		if(Ammo[0].AmmoAmount < Ammo[0].MaxAmmo)
		{
			Ammo[0].AddAmmo(3);
		}
		NextAmmoTickTime = Level.TimeSeconds + 0.5000000;
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local float AccelLimit;

	super(BallisticWeapon).WeaponTick(dt);
	// End:0x2D
	if(FireMode[0].IsFiring())
	{
		ChainSpeed = 1.0000000;		
	}
	else
	{
		// End:0x120
		if(FireMode[1].IsFiring())
		{
			DesiredBladeAlpha = 0.0000000;
			BladeShiftSpeed = 4.0000000;
			// End:0x11D
			if(BladeAlpha <= float(0))
			{
				// End:0xC8
				if(bLatchedOn && ChainSpeed != 1.5000000)
				{
					AccelLimit = (0.5000000 + (4.0000000 * (ChainSpeed / float(2)))) * dt;
					ChainSpeed += FClamp(1.5000000 - ChainSpeed, -AccelLimit, AccelLimit);					
				}
				else
				{
					// End:0x11D
					if(!bLatchedOn && ChainSpeed != float(2))
					{
						AccelLimit = (0.5000000 + ChainSpeed) * dt;
						ChainSpeed += FClamp(2.0000000 - ChainSpeed, -AccelLimit, AccelLimit);
					}
				}
			}			
		}
		else
		{
			// End:0x1C2
			if((int(ClientState) == int(4)) && FireMode[1].NextFireTime < (Level.TimeSeconds - float(1)))
			{
				// End:0x1AC
				if(ChainSpeed != float(0))
				{
					AccelLimit = (0.5000000 + (1.5000000 * (ChainSpeed / float(2)))) * dt;
					ChainSpeed += FClamp(-ChainSpeed, -AccelLimit, AccelLimit);					
				}
				else
				{
					DesiredBladeAlpha = 1.0000000;
					BladeShiftSpeed = 3.0000000;
				}
			}
		}
	}
	// End:0x1EB
	if(DesiredBladeAlpha == float(0))
	{
		SoundPitch = byte(float(32) + (float(32) * ChainSpeed));		
	}
	else
	{
		SoundPitch = default.SoundPitch;
	}
	// End:0x21D
	if(ChainsawPanner != none)
	{
		ChainsawPanner.PanRate = -ChainSpeed * float(8);
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	ChainsawPanner = VariableTexPanner(Level.ObjectPool.AllocateObject(Class'Engine.VariableTexPanner'));
	// End:0x91
	if(ChainsawPanner != none)
	{
		ChainsawPanner.Material = Skins[2];
		ChainsawPanner.PanRate = 0.0000000;
		ChainsawPanner.PanDirection = rot(0, 0, 0);
		Skins[2] = ChainsawPanner;		
	}
	else
	{
		Log("Failed to allocate chainsaw panner for MAG-78 Longsword");
	}
	//return;	
}

simulated function PlayIdle()
{
	super(BallisticWeapon).PlayIdle();
	// End:0x29
	if(ChainSpeed <= float(0))
	{
		DesiredBladeAlpha = 1.0000000;
		BladeShiftSpeed = 3.0000000;
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super(BallisticWeapon).BringUp(PrevWeapon);
	ChainSpeed = 0.2500000;
	DesiredBladeAlpha = 0.0000000;
	//return;	
}

simulated function bool PutDown()
{
	// End:0x21
	if(super(BallisticWeapon).PutDown())
	{
		DesiredBladeAlpha = 0.0000000;
		BladeShiftSpeed = 3.0000000;
		return true;
	}
	return false;
	//return;	
}

simulated function Destroyed()
{
	// End:0x28
	if(ChainsawPanner != none)
	{
		Level.ObjectPool.FreeObject(ChainsawPanner);
	}
	super(BallisticWeapon).Destroyed();
	//return;	
}

function bool CanAttack(Actor Other)
{
	return true;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float Result;

	B = Bot(Instigator.Controller);
	// End:0x3D
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0x86
	if(VSize(B.Enemy.Location - Instigator.Location) > (FireMode[0].MaxRange() * 1.5000000))
	{
		return 1;
	}
	Result = FRand();
	// End:0xEB
	if((Vector(B.Enemy.Rotation) Dot Normal(Instigator.Location - B.Enemy.Location)) < 0.0000000)
	{
		Result += 0.3000000;		
	}
	else
	{
		Result -= 0.3000000;
	}
	// End:0x109
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
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = AIRating;
	// End:0x9C
	if(dist > float(1500))
	{
		return 0.1000000;
	}
	// End:0xE4
	if((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000)
	{
		Result += (0.0800000 * B.Skill);
	}
	// End:0x153
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result = FMax(0.0000000, Result *= (0.7000000 - (dist / float(1000))));		
	}
	else
	{
		Result = FMax(0.0000000, Result *= (float(1) - (dist / float(1000))));
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x1F
	if(AIController(Instigator.Controller) == none)
	{
		return 0.5000000;
	}
	return AIController(Instigator.Controller).Skill / float(4);
	//return;	
}

function float SuggestDefenseStyle()
{
	local Bot B;
	local float Result, dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return -0.5000000;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = -1.0000000 * (B.Skill / float(6));
	Result *= (float(1) - (dist / float(1500)));
	return FClamp(Result, -1.0000000, -0.3000000);
	//return;	
}

defaultproperties
{
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;10.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.MAG78WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.MAG78WeaponParamsComp'
	ParamsClasses[2]=Class'BWBP_OP_Pro.MAG78WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_OP_Pro.MAG78WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.Longsword.BigIcon_MAGSaw'
	BigIconCoords=(X1=0,Y1=32,X2=511,Y2=230)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Pullout',Volume=0.2090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.EKS43.EKS-Putaway',Volume=0.2090000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.X3OutA',Pic2=TexRotator'BW_Core_WeaponTex.DarkStar.DarkOutA-Rot',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=0,A=255),Color2=(R=71,G=68,B=66,A=255),StartSize1=75,StartSize2=96)
	ManualLines[0]="Slashes with the longsword. Has a long range and moderate damage output."
	ManualLines[1]="Prepares a thrust, which will be extended to longpoint upon getting within reach of anything, rapidly dealing damage through the animation. This attack inflicts more damage from behind."
	ManualLines[2]="The Weapon Function key allows the player to block. Whilst blocking, no attacks are possible, but all melee damage striking the player frontally will be mitigated.||The MAG-SAW is effective at close range, but has lower DPS than shorter ranged melee weapons."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.MAG78PrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.MAG78SecondaryFire'
	PutDownTime=0.5000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.3000000
	CurrentRating=0.3000000
	bMeleeWeapon=true
	Description="The MAG-SAW is a robust and efficient weapon that utilizes every surface as a dangerous implement. Developed in direct response to the EKS-43 Katana, the MAG-SAW features numerous cutting edge technologies to maximize effectiveness in any and all situations. Such as a titanium alloy blade to reduce weight, combined with a recently developed and 100% tested electro-magnetic drive system which turns the chain with ease and deadly power, the MAG-SAW easily lends itself to aggressive civilian defense. But it doesn't stop there; as demonstrated in the legendary Purge of Lignus CIXIIV by the mercenary group Kriegsknecht, among whom the MAG-SAW is held in high esteem, the MAG-SAW creates absolute butchery of Krao. In any situation, any place, and against any enemy the MAG-SAW is a fierce competitor against its counterpart."
	Priority=12
	HudColor=(R=200,G=200,B=255,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=1
	PickupClass=Class'BWBP_OP_Pro.MAG78Pickup'
	PlayerViewOffset=(X=10.0000000,Y=0.0000000,Z=-20.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.MAG78Attachment'
	IconMaterial=Texture'BWBP_OP_Tex.Longsword.Icon_MAGSaw'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="MAG-SAW Longsword"
	Mesh=SkeletalMesh'BWBP_OP_Anim.MAG78_FPm'
	DrawScale=1.2500000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Shader'BWBP_OP_Tex.Longsword.ChainsawLongswordShiny'
	Skins[2]=Texture'BW_Core_WeaponTex.DarkStar.DarkStarChain'
}
