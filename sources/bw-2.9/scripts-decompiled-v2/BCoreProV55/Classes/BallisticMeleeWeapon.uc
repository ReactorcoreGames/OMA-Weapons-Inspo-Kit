class BallisticMeleeWeapon extends BallisticWeapon
	abstract
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

var() bool bCanBlock;
var bool bBlocked;
var() name BlockUpAnim;
var() name BlockDownAnim;
var() name BlockIdleAnim;
var float FatigueDeclineTime;
var float FatigueDeclineDelay;
var float MeleeSpreadAngle;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSetBlocked;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	MeleeSpreadAngle = BallisticMeleeFire(bFireMode[0]).GetCrosshairInaccAngle();
	//return;	
}

function ServerSetBlocked(bool NewValue)
{
	bBlocked = NewValue;
	BallisticAttachment(ThirdPersonActor).SetBlocked(NewValue);
	//return;	
}

simulated function float ChargeBar()
{
	return MeleeFatigue;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x18
	if(!bCanBlock || bBlocked)
	{
		return;
	}
	ServerSetBlocked(true);
	bBlocked = true;
	// End:0x3F
	if(!IsFiring())
	{
		PlayAnim(BlockUpAnim, 1.5000000);
	}
	IdleAnim = BlockIdleAnim;
	//return;	
}

simulated exec function WeaponSpecialRelease(optional byte i)
{
	// End:0x1A
	if(!bCanBlock || !bBlocked)
	{
		return;
	}
	ServerSetBlocked(false);
	bBlocked = false;
	// End:0x41
	if(!IsFiring())
	{
		PlayAnim(BlockDownAnim, 1.5000000);
	}
	IdleAnim = default.IdleAnim;
	//return;	
}

final function bool CheckBlockArc(Vector HitLocation, Pawn instigatedBy)
{
	local float Result;

	// End:0x66
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Result = Normal(instigatedBy.Location - (Instigator.Location + Instigator.EyePosition())) Dot Vector(Instigator.GetViewRotation());		
	}
	else
	{
		Result = Normal(HitLocation - (Instigator.Location + Instigator.EyePosition())) Dot Vector(Instigator.GetViewRotation());
	}
	return Result > 0.4000000;
	//return;	
}

function AdjustPlayerDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
	local Class<BallisticDamageType> BDT;

	// End:0x23
	if((instigatedBy == none) || instigatedBy.Controller == none)
	{
		return;
	}
	// End:0x45
	if(instigatedBy.Controller.SameTeamAs(InstigatorController))
	{
		return;
	}
	BDT = Class<BallisticDamageType>(DamageType);
	// End:0xB3
	if(VSize(Momentum) < float(60))
	{
		// End:0xA7
		if(VSize(Instigator.Location - instigatedBy.Location) < float(384))
		{
			Momentum = vect(0.0000000, 0.0000000, 0.0000000);			
		}
		else
		{
			Momentum *= 0.5000000;
		}
	}
	// End:0x131
	if(BDT != none)
	{
		// End:0x131
		if((((bBlocked && !IsFiring()) && Level.TimeSeconds > (LastFireTime + float(1))) && BDT.default.bCanBeBlocked) && CheckBlockArc(HitLocation, instigatedBy))
		{
			BlockDamage(Damage, instigatedBy, BDT);
		}
	}
	//return;	
}

function BlockDamage(out int Damage, Pawn instigatedBy, Class<BallisticDamageType> DamageType)
{
	local float ReducibleDamage, BlockFatigueFactor;

	ReducibleDamage = float(Damage) * (float(1) - DamageType.default.BlockPenetration);
	Damage -= int(ReducibleDamage);
	BlockFatigueFactor = MeleeFatigue * 0.5000000;
	Damage += int(ReducibleDamage * BlockFatigueFactor);
	ApplyBlockFatigue(DamageType.default.BlockFatiguePenalty);
	BallisticAttachment(ThirdPersonActor).UpdateBlockHit();
	// End:0xC2
	if((instigatedBy != none) && BallisticWeapon(instigatedBy.Weapon) != none)
	{
		BallisticWeapon(instigatedBy.Weapon).ApplyAttackFatigue();
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x72
	if(bBlocked && (Anim == FireMode[0].FireAnim) || Anim == FireMode[1].FireAnim)
	{
		PlayAnim(BlockUpAnim, 1.5000000);
		IdleAnim = BlockIdleAnim;		
	}
	else
	{
		// End:0x88
		if(!bBlocked)
		{
			IdleAnim = default.IdleAnim;
		}
		super.AnimEnd(Channel);
	}
	//return;	
}

simulated function DrawSimpleCrosshairs(Canvas C)
{
	local float offset;

	offset = C.ClipX / float(2);
	offset *= (Tan(MeleeSpreadAngle) / Tan((Instigator.Controller.FovAngle / float(2)) * 0.0174533));
	DrawSimpleCrosshairBars(C, int(offset), int(offset / float(3)));
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x59
	if((LastFireTime < (Level.TimeSeconds - FatigueDeclineDelay)) && MeleeFatigue > float(0))
	{
		MeleeFatigue = FMax(0.0000000, MeleeFatigue - (dt / FatigueDeclineTime));
	}
	//return;	
}

function bool CanAttack(Actor Other)
{
	return VSize(Other.Location - Instigator.Location) < (FireMode[0].MaxRange() * float(2));
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local BallisticWeapon BW;
	local Vector Dir;
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x44
	if(B.Enemy == none)
	{
		return 0.0000000;
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	// End:0xC6
	if((Vector(B.Enemy.Rotation) Dot Normal(Dir)) < 0.0000000)
	{
		rating += (0.0800000 * B.Skill);
	}
	BW = BallisticWeapon(B.Enemy.Weapon);
	// End:0x147
	if(BW != none)
	{
		// End:0x111
		if(BW.bMeleeWeapon)
		{
			rating *= 0.7500000;
		}
		// End:0x147
		if(BW.bWT_Shotgun || int(BW.InventoryGroup) == 3)
		{
			rating = 0.0000000;
		}
	}
	rating = Class'BCoreProV55.BUtil'.static.DistanceAtten(rating, 0.4000000, dist, 128.0000000, 128.0000000);
	return rating * (float(1) - MeleeFatigue);
	//return;	
}

function float SuggestAttackStyle()
{
	return 1.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -1.0000000;
	//return;	
}

defaultproperties
{
	bCanBlock=true
	BlockUpAnim="PrepBlock"
	BlockDownAnim="EndBlock"
	BlockIdleAnim="BlockIdle"
	FatigueDeclineTime=4.0000000
	FatigueDeclineDelay=0.7500000
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bUseSights=false
	bNoMag=true
	bNonCocking=true
	AIRating=0.7000000
	CurrentRating=0.7000000
	bShowChargingBar=true
}
