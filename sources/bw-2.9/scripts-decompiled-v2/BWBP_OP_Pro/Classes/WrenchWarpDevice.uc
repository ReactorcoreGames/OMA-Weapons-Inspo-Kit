class WrenchWarpDevice extends BallisticMeleeWeapon
	config(BallisticProV55);

const DEPLOYABLE_COUNT = 7;
const DeployRange = 512;

struct DeployableInfo
{
	var Class<Actor> dClass;
	var float WarpInTime;
	var int SpawnOffset;
	var int AmmoReq;
	var int limit;
	var bool CheckSlope;
	var string dDescription;
};

var array<DeployableInfo> Deployables;
var int DeployableCount[7];
var DeployableInfo AltDeployable;
var WrenchTeleporter Teleporters[2];
var bool bRemove;

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	// End:0x26E
	if((FireMode[M] != none) && FireMode[M].AmmoClass != none)
	{
		Ammo[M] = Ammunition(Instigator.FindInventoryType(FireMode[M].AmmoClass));
		// End:0x1F4
		if(Ammo[M] == none)
		{
			Ammo[M] = Spawn(FireMode[M].AmmoClass, Instigator);
			Instigator.AddInventory(Ammo[M]);
			// End:0x11B
			if((WP != none) && WP.bDropped || WP.AmmoAmount[M] > 0)
			{
				Ammo[M].AddAmmo(WP.AmmoAmount[M]);				
			}
			else
			{
				// End:0x1F1
				if((bJustSpawned && (WP == none) || !WP.bDropped) && (M == 0) || FireMode[M].AmmoClass != FireMode[0].AmmoClass)
				{
					// End:0x1C8
					if(Level.Game.MaxLives > 0)
					{
						Ammo[M].AddAmmo(Ammo[M].MaxAmmo);						
					}
					else
					{
						Ammo[M].AddAmmo(Ammo[M].InitialAmount);
					}
				}
			}			
		}
		else
		{
			// End:0x258
			if((WP != none) && WP.bDropped || WP.AmmoAmount[M] > 0)
			{
				Ammo[M].AddAmmo(WP.AmmoAmount[M]);
			}
		}
		Ammo[M].GotoState('None');
	}
	//return;	
}

simulated function PostBeginPlay()
{
	local WrenchTeleporter t;

	super(BallisticWeapon).PostBeginPlay();
	// End:0x4F
	if((int(Role) == int(ROLE_Authority)) && !Level.Game.bAllowVehicles)
	{
		Level.Game.bAllowVehicles = true;
	}
	MeleeSpreadAngle = MeleeFireMode.GetCrosshairInaccAngle();
	// End:0xD8
	foreach DynamicActors(Class'BWBP_OP_Pro.WrenchTeleporter', t)
	{
		// End:0xD7
		if(t.OwningController == Instigator.Controller)
		{
			// End:0xB6
			if(Teleporters[0] == none)
			{
				Teleporters[0] = t;
				continue;								
			}
			else
			{
				// End:0xD4
				if(Teleporters[1] == none)
				{
					Teleporters[1] = t;
					continue;					
				}
			}
			// End:0xD8
			break;
		}		
	}	
	//return;	
}

exec function FastSpawn()
{
	local int i;

	// End:0x1B
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		return;
	}
	i = 0;
	J0x22:

	// End:0x52 [Loop If]
	if(i < Deployables.Length)
	{
		Deployables[i].WarpInTime = 1.0000000;
		++i;
		// [Loop Continue]
		goto J0x22;
	}
	//return;	
}

exec function offset(int Index, int Value)
{
	// End:0x1B
	if(int(Level.NetMode) != int(NM_Standalone))
	{
		return;
	}
	Deployables[Index].SpawnOffset = Value;
	//return;	
}

simulated exec function SwitchWeaponMode(optional byte i)
{
	// End:0x24
	if((int(ClientState) == int(3)) || int(ClientState) == int(1))
	{
		return;
	}
	bRedirectSwitchToFiremode = true;
	PendingMode = CurrentWeaponMode;
	//return;	
}

simulated exec function WeaponModeRelease()
{
	bRedirectSwitchToFiremode = false;
	CurrentWeaponMode = PendingMode;
	ServerSwitchWeaponMode(PendingMode);
	//return;	
}

simulated function Weapon PrevWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x35
	if(bRedirectSwitchToFiremode)
	{
		PendingMode--;
		// End:0x33
		if(int(PendingMode) >= Deployables.Length)
		{
			PendingMode = byte(Deployables.Length - 1);
		}
		return none;
	}
	return super(BallisticWeapon).PrevWeapon(CurrentChoice, CurrentWeapon);
	//return;	
}

simulated function Weapon NextWeapon(Weapon CurrentChoice, Weapon CurrentWeapon)
{
	// End:0x2C
	if(bRedirectSwitchToFiremode)
	{
		PendingMode++;
		// End:0x2A
		if(int(PendingMode) >= Deployables.Length)
		{
			PendingMode = 0;
		}
		return none;
	}
	return super(BallisticWeapon).NextWeapon(CurrentChoice, CurrentWeapon);
	//return;	
}

simulated function bool PutDown()
{
	// End:0x25
	if(Instigator.IsLocallyControlled())
	{
		bRedirectSwitchToFiremode = false;
		PendingMode = CurrentWeaponMode;
	}
	bRemove = false;
	return super(BallisticWeapon).PutDown();
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local float ScaleFactor, XL, YL, YL2;
	local int i;
	local byte StartMode;

	super(Weapon).NewDrawWeaponInfo(C, YPos);
	DrawCrosshairs(C);
	// End:0x26
	if(bSkipDrawWeaponInfo)
	{
		return;
	}
	ScaleFactor = C.ClipY / float(900);
	// End:0x4CE
	if(((int(CurrentWeaponMode) < WeaponModes.Length) && !WeaponModes[int(CurrentWeaponMode)].bUnavailable) && WeaponModes[int(CurrentWeaponMode)].ModeName != "")
	{
		// End:0x2D5
		if(!bRedirectSwitchToFiremode)
		{
			C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
			C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
			C.TextSize(((WeaponModes[int(CurrentWeaponMode)].ModeName @ "(") $ string(Deployables[int(CurrentWeaponMode)].AmmoReq)) $ ")", XL, YL2);
			C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
			C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - YL2) - YL;
			C.DrawText(((WeaponModes[int(CurrentWeaponMode)].ModeName @ "(") $ string(Deployables[int(CurrentWeaponMode)].AmmoReq)) $ ")", false);
			C.Font = GetFontSizeIndex(C, -5 + int(float(2) * Class'Engine.HUD'.default.HudScale));
			C.TextSize(Deployables[int(CurrentWeaponMode)].dDescription, XL, YL);
			C.CurY += (YL / float(2));
			C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
			C.DrawText(Deployables[int(CurrentWeaponMode)].dDescription);			
		}
		else
		{
			StartMode = byte(int(PendingMode) - 2);
			// End:0x31C
			if(int(StartMode) >= Deployables.Length)
			{
				StartMode = byte(int(byte(Deployables.Length - 1)) - (255 - int(StartMode)));
			}
			i = -2;
			J0x327:

			// End:0x4CE [Loop If]
			if(i < 3)
			{
				// End:0x36F
				if(i != 0)
				{
					C.SetDrawColor(byte(255), 128, 128, byte(float(255) - (float(75) * Abs(float(i)))));					
				}
				else
				{
					C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
				}
				C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
				C.TextSize(WeaponModes[int(StartMode)].ModeName, XL, YL2);
				C.CurX = (C.ClipX - ((float(15) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - XL;
				C.CurY = ((C.ClipY - ((float(130) * ScaleFactor) * Class'Engine.HUD'.default.HudScale)) - (YL2 * float(-i + 1))) - YL;
				C.DrawText(WeaponModes[int(StartMode)].ModeName, false);
				StartMode++;
				// End:0x4C4
				if(int(StartMode) >= Deployables.Length)
				{
					StartMode = 0;
				}
				i++;
				// [Loop Continue]
				goto J0x327;
			}
		}
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(BallisticWeapon).PostNetBeginPlay();
	AnimBlendParams(2, 1.0000000, 0.0000000, 0.0000000, 'HammerBase');
	AnimBlendParams(1, 1.0000000, 0.0000000, 0.0000000, 'Mouth');
	LoopAnim('HammerLoop', 1.0000000, 0.0000000, 2);
	LoopAnim('JawsLoop', 1.0000000, 0.0000000, 1);
	//return;	
}

simulated function float AmmoStatus(optional int Mode)
{
	// End:0xD1
	if((Instigator == none) || Instigator.Weapon != self)
	{
		// End:0xD1
		if((FireMode[0].TimerInterval != 0.0000000) && FireMode[0].NextTimerPop < Level.TimeSeconds)
		{
			FireMode[0].Timer();
			// End:0xBB
			if(FireMode[0].bTimerLoop)
			{
				FireMode[0].NextTimerPop = FireMode[0].NextTimerPop + FireMode[0].TimerInterval;				
			}
			else
			{
				FireMode[0].TimerInterval = 0.0000000;
			}
		}
	}
	return super(Weapon).AmmoStatus(Mode);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x25
	if(Level.TimeSeconds < FireMode[0].NextFireTime)
	{
		return;
	}
	PlayAnim(FireMode[0].FireAnim, FireMode[0].FireAnimRate, 0.1000000);
	ServerWeaponSpecial(i);
	FireMode[0].NextFireTime = Level.TimeSeconds + FireMode[0].FireRate;
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	// End:0x25
	if(Level.TimeSeconds < FireMode[0].NextFireTime)
	{
		return;
	}
	bRemove = true;
	PlayAnim(FireMode[0].FireAnim, FireMode[0].FireAnimRate, 0.1000000);
	FireMode[0].NextFireTime = Level.TimeSeconds + FireMode[0].FireRate;
	//return;	
}

function Notify_WrenchDeploy()
{
	local Actor HitActor;
	local Vector Start, End, HitNorm, HitLoc;
	local WrenchPreconstructor WP;
	local WrenchDeployable D;
	local ASTurret_Minigun mT;

	Start = Instigator.Location + Instigator.EyePosition();
	End = Start + (Vector(Instigator.GetViewRotation()) * float(512));
	HitActor = Trace(HitLoc, HitNorm, End, Start, true);
	// End:0xA2
	if(HitActor == none)
	{
		HitActor = Trace(HitLoc, HitNorm, End - vect(0.0000000, 0.0000000, 256.0000000), End, true);
	}
	// End:0x147
	if((WrenchDeployable(HitActor) != none) && WrenchDeployable(HitActor).OwningController == Instigator.Controller)
	{
		WrenchDeployable(HitActor).bWarpOut = true;
		WrenchDeployable(HitActor).GotoState('Destroying');
		// End:0x145
		if(Ammo[0].AmmoAmount <= 40)
		{
			Ammo[0].AddAmmo(Min(40 - Ammo[0].AmmoAmount, 10));
		}
		return;
	}
	// End:0x15A
	if(bRemove)
	{
		bRemove = false;
		return;
	}
	// End:0x1DD
	if((int(CurrentWeaponMode) == 2) && Level.Game.GameName == "Jailbreak")
	{
		Instigator.ClientMessage("You're not allowed to place teleporters in this gametype.");
		return;
	}
	// End:0x274
	if(Deployables[int(CurrentWeaponMode)].AmmoReq > Ammo[0].AmmoAmount)
	{
		Instigator.ClientMessage(("Not enough charge to warp in" @ WeaponModes[int(CurrentWeaponMode)].ModeName) $ ".");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x2F2
	if((HitActor == none) || !HitActor.bWorldGeometry)
	{
		Instigator.ClientMessage("Must target an unoccupied surface.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x351
	if(HitLoc == vect(0.0000000, 0.0000000, 0.0000000))
	{
		Instigator.ClientMessage("Out of range.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x3E8
	if(Deployables[int(CurrentWeaponMode)].CheckSlope && (HitNorm Dot vect(0.0000000, 0.0000000, 1.0000000)) < 0.9000000)
	{
		Instigator.ClientMessage("Surface is too steep for construction.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	Start = HitLoc + HitNorm;
	// End:0x4B8
	if(!SpaceToDeploy(HitLoc + HitNorm, HitNorm, rot(0, 0, 0), Deployables[int(CurrentWeaponMode)].dClass.default.CollisionHeight, Deployables[int(CurrentWeaponMode)].dClass.default.CollisionRadius))
	{
		Instigator.ClientMessage("Insufficient space for construction.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x589
	if((Deployables[int(CurrentWeaponMode)].limit > 0) && DeployableCount[int(CurrentWeaponMode)] >= Deployables[int(CurrentWeaponMode)].limit)
	{
		Instigator.ClientMessage(((("You have " $ string(DeployableCount[int(CurrentWeaponMode)])) $ " of this item and the limit is ") $ string(Deployables[int(CurrentWeaponMode)].limit)) $ ".");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x6FF
	if(int(CurrentWeaponMode) != 4)
	{
		// End:0x60E
		foreach RadiusActors(Class'BWBP_OP_Pro.WrenchDeployable', D, 512.0000000, HitLoc)
		{
			Instigator.ClientMessage("Too close to a major deployable.");
			PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);			
			return;			
		}		
		// End:0x684
		foreach RadiusActors(Class'UT2k4Assault.ASTurret_Minigun', mT, 512.0000000, HitLoc)
		{
			Instigator.ClientMessage("Too close to a minigun turret.");
			PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);			
			return;			
		}		
		// End:0x6FE
		foreach RadiusActors(Class'BWBP_OP_Pro.WrenchPreconstructor', WP, 512.0000000, HitLoc)
		{
			Instigator.ClientMessage("Too close to a warping deployable.");
			PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);			
			return;			
		}		
	}
	WP = Spawn(Class'BWBP_OP_Pro.WrenchPreconstructor', Instigator,, Start + (HitNorm * Deployables[int(CurrentWeaponMode)].dClass.default.CollisionRadius), Instigator.Rotation);
	WP.GroundPoint = Start + HitNorm;
	WP.GroundPoint.Z += float(Deployables[int(CurrentWeaponMode)].SpawnOffset);
	WP.Instigator = Instigator;
	WP.Wrench = self;
	WP.Initialize(Deployables[int(CurrentWeaponMode)].dClass, CurrentWeaponMode, Deployables[int(CurrentWeaponMode)].WarpInTime);
	++DeployableCount[int(CurrentWeaponMode)];
	ConsumeAmmo(0, float(Deployables[int(CurrentWeaponMode)].AmmoReq), true);
	//return;	
}

function LostChild(Actor Lost)
{
	// End:0x1A
	if(ASTurret_Minigun(Lost) != none)
	{
		--DeployableCount[5];
	}
	//return;	
}

function LostDeployable(byte Index)
{
	// End:0x4E
	if(int(Index) < (7 - 1))
	{
		Instigator.ClientMessage(("Your " $ WeaponModes[int(Index)].ModeName) $ " was destroyed.");
	}
	--DeployableCount[int(Index)];
	//return;	
}

function Rotator GetSlopeRotator(Rotator deploy_rotation_yaw, Vector hit_normal)
{
	local float pitch_degrees, roll_degrees;
	local Rotator Result;

	hit_normal = hit_normal << deploy_rotation_yaw;
	pitch_degrees = (Asin(hit_normal.X) * float(180)) / 3.1415930;
	Result.Pitch = int(-pitch_degrees * float(65536 / 360));
	roll_degrees = (Asin(hit_normal.Y) * float(180)) / 3.1415930;
	Result.Roll = int(roll_degrees * float(65536 / 360));
	return Result;
	//return;	
}

function Notify_BarrierDeploy()
{
	local Actor HitActor;
	local Vector Start, End, HitNorm, HitLoc;
	local WrenchPreconstructor WP;
	local Rotator SlopeInputYaw, SlopeRotation;

	Start = Instigator.Location + Instigator.EyePosition();
	End = Start + (Vector(Instigator.GetViewRotation()) * float(512));
	HitActor = Trace(HitLoc, HitNorm, End, Start, true);
	// End:0xA2
	if(HitActor == none)
	{
		HitActor = Trace(HitLoc, HitNorm, End - vect(0.0000000, 0.0000000, 256.0000000), End, true);
	}
	// End:0x147
	if((WrenchDeployable(HitActor) != none) && WrenchDeployable(HitActor).OwningController == Instigator.Controller)
	{
		WrenchDeployable(HitActor).bWarpOut = true;
		WrenchDeployable(HitActor).GotoState('Destroying');
		// End:0x145
		if(Ammo[0].AmmoAmount <= 40)
		{
			Ammo[0].AddAmmo(Min(40 - Ammo[0].AmmoAmount, 10));
		}
		return;
	}
	// End:0x1D0
	if(AltDeployable.AmmoReq > Ammo[0].AmmoAmount)
	{
		Instigator.ClientMessage(("Not enough charge to warp in" @ WeaponModes[0].ModeName) $ ".");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x24E
	if((HitActor == none) || !HitActor.bWorldGeometry)
	{
		Instigator.ClientMessage("Must target an unoccupied surface.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	// End:0x2AD
	if(HitLoc == vect(0.0000000, 0.0000000, 0.0000000))
	{
		Instigator.ClientMessage("Out of range.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	SlopeInputYaw.Yaw = Instigator.Rotation.Yaw;
	SlopeRotation = GetSlopeRotator(SlopeInputYaw, HitNorm);
	Start = HitLoc + HitNorm;
	// End:0x392
	if(!SpaceToDeploy(HitLoc, HitNorm, SlopeRotation, AltDeployable.dClass.default.CollisionHeight, AltDeployable.dClass.default.CollisionRadius))
	{
		Instigator.ClientMessage("Insufficient space for construction.");
		PlayerController(Instigator.Controller).ClientPlaySound(Sound'BWBP_OP_Sounds.Wrench.EnergyStationError',, 1.0000000);
		return;
	}
	SlopeRotation.Yaw = Instigator.Rotation.Yaw;
	WP = Spawn(Class'BWBP_OP_Pro.WrenchPreconstructor', Instigator,, Start + (HitNorm * AltDeployable.dClass.default.CollisionRadius), SlopeRotation);
	WP.GroundPoint = Start + (HitNorm * (float(AltDeployable.SpawnOffset) + AltDeployable.dClass.default.CollisionRadius));
	WP.Instigator = Instigator;
	WP.Wrench = self;
	WP.Initialize(AltDeployable.dClass, 6, AltDeployable.WarpInTime);
	DeployableCount[6]++;
	ConsumeAmmo(0, float(AltDeployable.AmmoReq), true);
	//return;	
}

function bool SpaceToDeploy(Vector hit_location, Vector hit_normal, Rotator slope_rotation, float collision_height, float collision_radius)
{
	local Vector center_point;

	center_point = hit_location + (hit_normal * collision_height);
	return ((FastTrace(center_point, center_point + (collision_radius * (vect(1.0000000, 0.0000000, 0.0000000) >> slope_rotation))) && FastTrace(center_point, center_point + (collision_radius * (vect(-1.0000000, 0.0000000, 0.0000000) >> slope_rotation)))) && FastTrace(center_point, center_point + (collision_radius * (vect(0.0000000, -1.0000000, 0.0000000) >> slope_rotation)))) && FastTrace(center_point, center_point + (collision_radius * (vect(0.0000000, 1.0000000, 0.0000000) >> slope_rotation)));
	//return;	
}

function byte BestMode()
{
	return 1;
	//return;	
}

simulated function AnimEnd(int Channel)
{
	// End:0x16
	if(Channel == 0)
	{
		super.AnimEnd(Channel);
	}
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
	Deployables[0]=(dClass=Class'BWBP_OP_Pro.WrenchBoostPad',WarpInTime=1.0000000,SpawnOffset=4,AmmoReq=50,limit=0,CheckSlope=true,dDescription="A pad which propels players through the air in the direction they were moving.")
	Deployables[1]=(dClass=Class'BWBP_OP_Pro.WrenchTeleporter',WarpInTime=1.0000000,SpawnOffset=1,AmmoReq=50,limit=2,CheckSlope=true,dDescription="A teleporter. Only two may be placed.")
	Deployables[2]=(dClass=Class'BallisticProV55.Sandbag',WarpInTime=1.0000000,SpawnOffset=8,AmmoReq=10,limit=0,CheckSlope=false,dDescription="A unit of three sandbags which can be used as cover.")
	Deployables[3]=(dClass=Class'BWBP_OP_Pro.WrenchShieldGeneratorB',WarpInTime=1.0000000,SpawnOffset=0,AmmoReq=30,limit=1,CheckSlope=true,dDescription="Places a dome shield generator which lasts 12 seconds.")
	Deployables[4]=(dClass=Class'BWBP_OP_Pro.WrenchAmmoCrate',WarpInTime=3.0000000,SpawnOffset=16,AmmoReq=30,limit=0,CheckSlope=true,dDescription="A crate which restocks ammunition to initial levels.")
	Deployables[5]=(dClass=Class'BWBP_OP_Pro.WrenchMinigunTurret',WarpInTime=35.0000000,SpawnOffset=36,AmmoReq=100,limit=1,CheckSlope=true,dDescription="A static minigun turret. Resistant to attacks. Only one may be placed.")
	AltDeployable=(dClass=Class'BWBP_OP_Pro.WrenchEnergyBarrier',WarpInTime=0.1000000,SpawnOffset=52,AmmoReq=10,limit=0,CheckSlope=false,dDescription="A three-second barrier of infinite durability.")
	SpecialInfo[0]=(Id="EvoDefs",Info="180.0;6.0;-999.0;-1.0;-999.0;-999.0;-999.0")
	ParamsClasses[0]=Class'BWBP_OP_Pro.WrenchWeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_OP_Pro.WrenchWeaponParamsComp'
	ParamsClasses[2]=Class'BWBP_OP_Pro.WrenchWeaponParamsTactical'
	ParamsClasses[3]=Class'BWBP_OP_Pro.WrenchWeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_OP_Tex.Wrench.BigIcon_Wrench'
	BigIconCoords=(X1=0,Y1=48,X2=511,Y2=240)
	bAllowWeaponInfoOverride=false
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePullOut',Volume=0.1100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifePutaway',Volume=0.1100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Boost Pad",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Teleporter",bUnavailable=false,ModeID="WM_SemiAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Sandbag Stack",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Shield Generator",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Ammo Crate",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[5]=(ModeName="Minigun Turret",bUnavailable=false,ModeID="WM_SemiAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M763InA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc8',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=255,A=198),Color2=(R=250,G=246,B=85,A=255),StartSize1=141,StartSize2=38)
	MeleeFireClass=Class'BWBP_OP_Pro.WrenchMeleeFire'
	ManualLines[0]="Constructs various deployables. Will deploy to the aim point. A description of each deployable is given underneath the fire mode text. Holding Weapon Function allows the user to scroll through the modes."
	ManualLines[1]="Constructs an energy barrier, regardless of the currently active mode."
	ManualLines[2]="Grants a 10% speed increase."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BWBP_OP_Pro.WrenchPrimaryFire'
	FireModeClass[1]=Class'BWBP_OP_Pro.WrenchSecondaryFire'
	SelectAnimRate=0.7500000
	PutDownAnimRate=0.6500000
	PutDownTime=1.7500000
	BringUpTime=1.7500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.2000000
	CurrentRating=0.2000000
	bMeleeWeapon=true
	bShowChargingBar=false
	Description="Nanoforge Uplink Device 'Combat Wrench'||Manufacturer: Apollo Industries||An oft overlooked tool paramount in keeping a mobile army moving and establishing and fortifying forward bases, the Nanoforge Uplink Device allows a combat engineer to deploy protective fortifications, repair just about anything, and utilize off-site nanoforge plants to rapidly construct key structures and vehicles. Nick-named 'The Attitude Adjuster' by many an engineer, it gained a certain reverence after a single injured combat engineer stayed at his squad's machine gun nest to slow the enemy Cryon forces while the rest of the UFC forces retreated. When his body was recovered, he was found with a Combat Wrench in hand and 14 armored Cryon gunners laying about him, their cause of death - blunt force trauma."
	Priority=13
	HudColor=(R=200,G=100,B=0,A=255)
	CenteredOffsetY=7.0000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	PickupClass=Class'BWBP_OP_Pro.WrenchPickup'
	PlayerViewOffset=(X=10.0000000,Y=0.0000000,Z=-7.0000000)
	AttachmentClass=Class'BWBP_OP_Pro.WrenchAttachment'
	IconMaterial=Texture'BWBP_OP_Tex.Wrench.Icon_Wrench'
	IconCoords=(X1=0,Y1=0,X2=128,Y2=32)
	ItemName="NFUD Combat Wrench"
	Mesh=SkeletalMesh'BWBP_OP_Anim.Techwrench_FPm'
	DrawScale=0.3000000
}
