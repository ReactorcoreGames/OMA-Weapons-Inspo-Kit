class AY90SkrithBoltcaster extends BallisticWeapon
	config(BallisticProV55);

var Actor GlowFX;
var Actor GlowFX2;
var Actor ChargeGlowFX;
var Actor StringSpark1;
var Actor StringSpark2;
var Actor StringEnd1;
var Actor StringEnd2;
var float lastModeChangeTime;
var Vector TheEnd2;
var Vector TheEnd;
var(AY90) ScriptedTexture WeaponScreen;
var(AY90) Material WeaponScreenShader;
var(AY90) int ScreenIndex;
var(AY90) Material ScreenBase;
var(AY90) Material ScreenPie1;
var(AY90) Material ScreenPie2;
var(AY90) Material ScreenPie3;
var(AY90) Material ScreenPie4;
var(AY90) Material ScreenPie1_Y;
var(AY90) Material ScreenPie2_Y;
var(AY90) Material ScreenPie3_Y;
var(AY90) Material ScreenPie4_Y;
var protected const Color MyFontColor;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ClientScreenStart;
}

simulated exec function CockGun(optional byte Type)
{
	//return;	
}

function ServerCockGun(optional byte Type)
{
	//return;	
}

simulated function ClientScreenStart()
{
	ScreenStart();
	//return;	
}

simulated function ScreenStart()
{
	// End:0x22
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Client = self;
	}
	Skins[ScreenIndex] = WeaponScreenShader;
	UpdateScreen();
	// End:0x5B
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated event RenderTexture(ScriptedTexture Tex)
{
	Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenBase, MyFontColor);
	// End:0x8E
	if(MagAmmo >= 10)
	{
		Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie1, MyFontColor);
	}
	// End:0xDB
	if(MagAmmo >= 20)
	{
		Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie2, MyFontColor);
	}
	// End:0x128
	if(MagAmmo >= 30)
	{
		Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie3, MyFontColor);
	}
	// End:0x175
	if(MagAmmo >= 40)
	{
		Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie4, MyFontColor);
	}
	// End:0x34B
	if(FireMode[0].bIsFiring == true)
	{
		// End:0x1FB
		if(((FireMode[0].HoldTime / float(4)) >= 0.2500000) && MagAmmo >= 10)
		{
			Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie1_Y, MyFontColor);
		}
		// End:0x26A
		if(((FireMode[0].HoldTime / float(4)) >= 0.5000000) && MagAmmo >= 20)
		{
			Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie2_Y, MyFontColor);
		}
		// End:0x2D9
		if(((FireMode[0].HoldTime / float(4)) >= 0.7500000) && MagAmmo >= 30)
		{
			Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie3_Y, MyFontColor);
		}
		// End:0x348
		if(((FireMode[0].HoldTime / float(4)) >= 1.0000000) && MagAmmo >= 40)
		{
			Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie4_Y, MyFontColor);
		}		
	}
	else
	{
		// End:0x51E
		if(FireMode[1].bIsFiring == true)
		{
			// End:0x3D1
			if(((FireMode[1].HoldTime / float(4)) >= 0.2500000) && MagAmmo >= 10)
			{
				Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie1_Y, MyFontColor);
			}
			// End:0x440
			if(((FireMode[1].HoldTime / float(4)) >= 0.5000000) && MagAmmo >= 20)
			{
				Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie2_Y, MyFontColor);
			}
			// End:0x4AF
			if(((FireMode[1].HoldTime / float(4)) >= 0.7500000) && MagAmmo >= 30)
			{
				Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie3_Y, MyFontColor);
			}
			// End:0x51E
			if(((FireMode[1].HoldTime / float(4)) >= 1.0000000) && MagAmmo >= 40)
			{
				Tex.DrawTile(0.0000000, 0.0000000, 256.0000000, 256.0000000, 0.0000000, 0.0000000, 256.0000000, 256.0000000, ScreenPie4_Y, MyFontColor);
			}
		}
	}
	//return;	
}

simulated function UpdateScreen()
{
	// End:0x28
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x4A
	if(Instigator.IsLocallyControlled())
	{
		WeaponScreen.Revision++;
	}
	//return;	
}

simulated function bool ConsumeMagAmmo(int Mode, float load, optional bool bAmountNeededIsMax)
{
	local bool bSuper;

	bSuper = super.ConsumeMagAmmo(Mode, load, bAmountNeededIsMax);
	UpdateScreen();
	return bSuper;
	//return;	
}

simulated function Notify_ClipIn()
{
	super.Notify_ClipIn();
	UpdateScreen();
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x46
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		ScreenStart();
		// End:0x46
		if(!Instigator.IsLocallyControlled())
		{
			ClientScreenStart();
		}
	}
	super.BringUp(PrevWeapon);
	GunLength = default.GunLength;
	// End:0xE7
	if(((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2) && (GlowFX == none) || GlowFX.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(GlowFX, Class'BWBP_SKC_Pro.AY90AmbientFX', DrawScale, self, 'tip');
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Vector End, Start, DirVec, SpecVec;

	super.WeaponTick(dt);
	// End:0xD2
	if(MagAmmo > 0)
	{
		// End:0x45
		if(StringSpark1 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(StringSpark1, Class'BWBP_SKC_Pro.AY90EmitterBowString', DrawScale, self, 'LBeamSrc');
		}
		// End:0x74
		if(StringSpark2 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(StringSpark2, Class'BWBP_SKC_Pro.AY90EmitterBowString', DrawScale, self, 'RBeamSrc');
		}
		// End:0xA3
		if(StringEnd1 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(StringEnd1, Class'BWBP_SKC_Pro.AY90EmitterBowStringEnd', DrawScale, self, 'LBeamB');
		}
		// End:0xD2
		if(StringEnd2 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(StringEnd2, Class'BWBP_SKC_Pro.AY90EmitterBowStringEnd', DrawScale, self, 'RBeamB');
		}
	}
	// End:0x222
	if(StringSpark1 != none)
	{
		// End:0xFE
		if(MagAmmo <= 0)
		{
			StringSpark1.Destroy();
			StringSpark1 = none;			
		}
		else
		{
			StringSpark1.bHidden = false;
			StringSpark1.bHidden = false;
			End = GetBoneCoords('LBeamB').Origin;
			Start = StringSpark1.Location;
			StringSpark1.SetRotation(Rotator(End - Start));
			End = vect(1.0000000, 0.0000000, 0.0000000) * (VSize(GetBoneCoords('tip').Origin - End) - float(6));
			SpecVec = vect(0.0000000, 0.0000000, 1.0000000) * (VSize(GetBoneCoords('tip').Origin - Start) - float(14));
			DirVec = End + SpecVec;
			BeamEmitter(Emitter(StringSpark1).Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(DirVec, DirVec);
		}
	}
	// End:0x336
	if(StringSpark2 != none)
	{
		// End:0x24E
		if(MagAmmo <= 0)
		{
			StringSpark2.Destroy();
			StringSpark2 = none;			
		}
		else
		{
			StringSpark2.bHidden = false;
			End = GetBoneCoords('RBeamB').Origin;
			Start = StringSpark2.Location;
			End = vect(1.0000000, 0.0000000, 0.0000000) * VSize(End - Start);
			SpecVec = vect(0.0000000, 0.0000000, 1.0000000) * (VSize(GetBoneCoords('tip').Origin - Start) - float(14));
			DirVec = End - SpecVec;
			BeamEmitter(Emitter(StringSpark2).Emitters[0]).BeamEndPoints[0].offset = Class'BCoreProV55.BallisticEmitter'.static.VtoRV(DirVec, DirVec);
		}
	}
	// End:0x387
	if(FireMode[0].bIsFiring || FireMode[1].bIsFiring)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(ChargeGlowFX, Class'BWBP_SKC_Pro.AY90ChargeGlow', DrawScale, self, 'tip');		
	}
	else
	{
		// End:0x39E
		if(ChargeGlowFX != none)
		{
			ChargeGlowFX.Destroy();
		}
	}
	//return;	
}

simulated event Timer()
{
	// End:0x60
	if(int(ClientState) == int(3))
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(GlowFX);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(ChargeGlowFX);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(StringSpark1);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(StringSpark2);
	}
	super.Timer();
	//return;	
}

simulated event Destroyed()
{
	// End:0x36
	if((Instigator != none) && AIController(Instigator.Controller) == none)
	{
		WeaponScreen.Client = none;
	}
	// End:0x4D
	if(GlowFX != none)
	{
		GlowFX.Destroy();
	}
	// End:0x64
	if(ChargeGlowFX != none)
	{
		ChargeGlowFX.Destroy();
	}
	// End:0x7B
	if(StringSpark1 != none)
	{
		StringSpark1.Destroy();
	}
	// End:0x92
	if(StringSpark2 != none)
	{
		StringSpark2.Destroy();
	}
	// End:0xA9
	if(StringEnd1 != none)
	{
		StringEnd1.Destroy();
	}
	// End:0xC0
	if(StringEnd2 != none)
	{
		StringEnd2.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function SetGlowSize(float SizeX, float SizeY, float SizeZ)
{
	// End:0x2E
	if(ChargeGlowFX != none)
	{
		AY90ChargeGlow(ChargeGlowFX).SetSize(SizeX, SizeY, SizeZ);
	}
	//return;	
}

simulated function float RateSelf()
{
	// End:0x54
	if(((PlayerController(Instigator.Controller) != none) && Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
	{
		CurrentRating = super.RateSelf() * 0.2000000;		
	}
	else
	{
		return super.RateSelf();
	}
	return CurrentRating;
	//return;	
}

function byte BestMode()
{
	local Bot B;
	local float dist;
	local Vector Dir;
	local Vehicle V;

	// End:0x0E
	if(MagAmmo < 1)
	{
		return 1;
	}
	B = Bot(Instigator.Controller);
	// End:0x4F
	if((B == none) || B.Enemy == none)
	{
		return byte(Rand(2));
	}
	Dir = Instigator.Location - B.Enemy.Location;
	dist = VSize(Dir);
	// End:0x175
	if((((DestroyableObjective(B.Squad.SquadObjective) != none) && B.Squad.SquadObjective.TeamLink(B.GetTeamNum())) || ((B.Squad.SquadObjective == none) && DestroyableObjective(B.Target) != none) && B.Target.TeamLink(B.GetTeamNum())) && (B.Enemy == none) || !B.EnemyVisible())
	{
		return 0;
	}
	// End:0x1B1
	if(FocusOnLeader(B.Focus == B.Squad.SquadLeader.Pawn))
	{
		return 0;
	}
	// End:0x1C5
	if(dist > float(300))
	{
		return 0;
	}
	V = B.Squad.GetLinkVehicle(B);
	// End:0x20C
	if(V == none)
	{
		V = Vehicle(B.MoveTarget);
	}
	// End:0x227
	if(V == B.Target)
	{
		return 0;
	}
	// End:0x288
	if((((V != none) && float(V.Health) < V.HealthMax) && V.LinkHealMult > float(0)) && B.LineOfSightTo(V))
	{
		return 0;
	}
	// End:0x2A6
	if(dist < FireMode[1].MaxRange())
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
	local DestroyableObjective O;
	local Vehicle V;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	// End:0x28F
	if((HasMagAmmo(0)) || Ammo[0].AmmoAmount > 0)
	{
		V = B.Squad.GetLinkVehicle(B);
		// End:0xFD
		if((((V != none) && VSize(Instigator.Location - V.Location) < (1.5000000 * FireMode[0].MaxRange())) && float(V.Health) < V.HealthMax) && V.LinkHealMult > float(0))
		{
			return 1.2000000;
		}
		// End:0x1AB
		if((((Vehicle(B.RouteGoal) != none) && B.Enemy == none) && VSize(Instigator.Location - B.RouteGoal.Location) < (1.5000000 * FireMode[0].MaxRange())) && Vehicle(B.RouteGoal).TeamLink(B.GetTeamNum()))
		{
			return 1.2000000;
		}
		O = DestroyableObjective(B.Squad.SquadObjective);
		// End:0x28F
		if((((((O != none) && B.Enemy == none) && O.TeamLink(B.GetTeamNum())) && O.Health < O.DamageCapacity) && VSize(Instigator.Location - O.Location) < (1.1000000 * FireMode[0].MaxRange())) && B.LineOfSightTo(O))
		{
			return 1.2000000;
		}
	}
	// End:0x2AA
	if(B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	// End:0x347
	if(!HasMagAmmo(0) && Ammo[0].AmmoAmount < 1)
	{
		// End:0x32C
		if(dist > float(400))
		{
			return 0.0000000;
		}
		return Result / (float(1) + (dist / float(400)));
	}
	// End:0x376
	if(dist > float(1300))
	{
		Result -= ((dist - float(1000)) / float(3000));
	}
	// End:0x393
	if(dist < float(500))
	{
		Result += 0.5000000;
	}
	return Result;
	//return;	
}

function bool FocusOnLeader(bool bLeaderFiring)
{
	local Bot B;
	local Pawn LeaderPawn;
	local Actor Other;
	local Vector HitLocation, HitNormal, StartTrace;
	local Vehicle V;

	B = Bot(Instigator.Controller);
	// End:0x26
	if(B == none)
	{
		return false;
	}
	// End:0x71
	if(PlayerController(B.Squad.SquadLeader) != none)
	{
		LeaderPawn = B.Squad.SquadLeader.Pawn;		
	}
	else
	{
		V = B.Squad.GetLinkVehicle(B);
		// End:0x113
		if(V != none)
		{
			LeaderPawn = V;
			bLeaderFiring = ((float(LeaderPawn.Health) < LeaderPawn.HealthMax) && V.LinkHealMult > float(0)) && (B.Enemy == none) || V.bKeyVehicle;
		}
	}
	// End:0x151
	if(LeaderPawn == none)
	{
		LeaderPawn = B.Squad.SquadLeader.Pawn;
		// End:0x151
		if(LeaderPawn == none)
		{
			return false;
		}
	}
	// End:0x15E
	if(!bLeaderFiring)
	{
		return false;
	}
	// End:0x20C
	if(Vehicle(LeaderPawn) != none)
	{
		StartTrace = Instigator.Location + Instigator.EyePosition();
		// End:0x20C
		if(VSize(LeaderPawn.Location - StartTrace) < FireMode[0].MaxRange())
		{
			Other = Trace(HitLocation, HitNormal, LeaderPawn.Location, StartTrace, true);
			// End:0x20C
			if(Other == LeaderPawn)
			{
				B.Focus = Other;
				return true;
			}
		}
	}
	return false;
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x22
	if(!HasNonMagAmmo(0) && !HasMagAmmo(0))
	{
		return 1.2000000;
	}
	return 0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -0.5000000;
	//return;	
}

function bool CanHeal(Actor Other)
{
	// End:0x2F
	if((DestroyableObjective(Other) != none) && DestroyableObjective(Other).LinkHealMult > float(0))
	{
		return true;
	}
	// End:0x5E
	if((Vehicle(Other) != none) && Vehicle(Other).LinkHealMult > float(0))
	{
		return true;
	}
	return false;
	//return;	
}

simulated function bool MayNeedReload(byte Mode, float load)
{
	// End:0x4B
	if(((!bNoMag && bFireMode[1] != none) && bFireMode[1].bUseWeaponMag) && (float(MagAmmo) - load) < float(5))
	{
		return true;
	}
	return bNeedReload;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x38
	if(FireMode[1].bIsFiring == true)
	{
		return FMin(FireMode[1].HoldTime / float(4), 1.0000000);		
	}
	else
	{
		return FMin(FireMode[0].HoldTime / float(4), 1.0000000);
	}
	//return;	
}

defaultproperties
{
	WeaponScreen=ScriptedTexture'BWBP_SKC_Tex.SkrithBow.SKBow-ScriptLCD'
	WeaponScreenShader=Shader'BWBP_SKC_Tex.SkrithBow.SKBow-ScriptLCD-SD'
	ScreenIndex=6
	ScreenBase=Texture'BWBP_SKC_Tex.SkrithBow.SKBow-ScreenBase'
	ScreenPie1=Texture'BWBP_SKC_Tex.SkrithBow.SBow-ScreenPie1'
	ScreenPie2=Texture'BWBP_SKC_Tex.SkrithBow.SBow-ScreenPie2'
	ScreenPie3=Texture'BWBP_SKC_Tex.SkrithBow.SBow-ScreenPie3'
	ScreenPie4=Texture'BWBP_SKC_Tex.SkrithBow.SBow-ScreenPie4'
	ScreenPie1_Y=Texture'BWBP_SKC_Tex.SkrithBow.SBow-ScreenPie1_Y'
	ScreenPie2_Y=Texture'BWBP_SKC_Tex.SkrithBow.SBow-ScreenPie2_Y'
	ScreenPie3_Y=Texture'BWBP_SKC_Tex.SkrithBow.SBow-ScreenPie3_Y'
	ScreenPie4_Y=Texture'BWBP_SKC_Tex.SkrithBow.SBow-ScreenPie4_Y'
	MyFontColor=(R=255,G=255,B=255,A=255)
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;25.0;1.5;85.0;0.6;0.6;0.6")
	ParamsClasses[0]=Class'BWBP_SKC_Pro.AY90WeaponParamsArena'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.AY90WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.AY90WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.AY90WeaponParamsClassic'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.SkrithBow.BigIcon_SBow'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Putaway',Volume=0.2250000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Charged Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Plasma Charge",bUnavailable=true,ModeID="WM_FullAuto",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="ALaser",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="BLaser",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="CLaser",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoCrosshairInScope=true
	bNonCocking=true
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.7000000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc7',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Misc3',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=93,B=255,A=112),Color2=(R=226,G=212,B=0,A=255),StartSize1=110,StartSize2=55)
	MeleeFireClass=Class'BWBP_SKC_Pro.AY90MeleeFire'
	bWT_RapidProj=true
	bWT_Energy=true
	UsedAmbientSound=Sound'BW_Core_WeaponSound.A73.A73Hum1'
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	SightOffset=(X=-4.5000000,Y=0.0000000,Z=5.7000000)
	MagAmmo=40
	FireModeClass[0]=Class'BWBP_SKC_Pro.AY90PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.AY90SecondaryFire'
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	bMeleeWeapon=true
	bShowChargingBar=true
	Description="AY90 Skrith Boltcaster||Manufacturer: Unknown Skrith Engineers|Primary: Variable Charge Shot|Secondary: Charged Bolt Spread||Named after a certain dragonic being, the AY90 'Wyvern' is a Skrith's companion to take down terrans without being seen or heard.  A boltcaster with all the signs that it's Skrith in origin; blades on the bow arms, blue in color and firing powerful plasma with this weapon taking the form of a variable charge system.  Able to fire sticky bolts, plasma rockets, or fully charging to snipe a soldier from a distance, and if that wasn't enough; the Wyvern has a charged bolt spread to eliminate multiple enemies in rapid succession.  A versatile, deadly tool of destruction without being heard, just ask the PTSD-ridden troops of UTCâ€™s elite division on Ravenos; who watched 90% of their squad dying to plasma bolts without their enemies being known."
	Priority=92
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=5
	GroupOffset=19
	PickupClass=Class'BWBP_SKC_Pro.AY90Pickup'
	PlayerViewOffset=(X=7.0000000,Y=8.0000000,Z=-6.5000000)
	AttachmentClass=Class'BWBP_SKC_Pro.AY90Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.SkrithBow.SmallIcon_Sbow'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="AY90 Skrith Boltcaster"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=192.0000000
	LightRadius=12.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.AY90_FPm'
	DrawScale=0.3000000
	bFullVolume=true
	SoundRadius=256.0000000
}
