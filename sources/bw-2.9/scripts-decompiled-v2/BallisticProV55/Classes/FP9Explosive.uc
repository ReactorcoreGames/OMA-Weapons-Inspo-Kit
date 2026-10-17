class FP9Explosive extends BallisticWeapon
	config(BallisticProV55);

var bool bLaserMode;
var array<FP9Bomb> Bombs;
var FP9Bomb ChosenBomb;
var byte ChosenBombindex;
var float LastAIPickBombTime;
var() FullSound LaserTweakSound;
var() FullSound Button1Sound;
var() FullSound Button2Sound;
var() FullSound Button3Sound;
var() FullSound DeploySound;
var() name LaserOnAnim;
var() name LaserOffAnim;
var() name BombBone;
var() name HandBone;
var bool bOutOfBombs;
var() Sound DetonateSound;
var() Material LaserScreenMat;
var() Material ScreenMat;
var FP9Bomb SelectedBomb;
var float DetAllStartTime;
var() float DetAllDelayTime;
var bool bHasDetonator;
var bool bOldHasDetonator;
var() name DetHandBone;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSetLaserMode, ServerSwitchBombLaser;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ChosenBomb, ChosenBombindex, 
		SelectedBomb, bHasDetonator;
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local FP9Bomb E;
	local Actor A;

	super.GiveTo(Other, Pickup);
	// End:0xA2
	foreach DynamicActors(Class'Engine.Actor', A)
	{
		// End:0x34
		if(FP9Bomb(A) == none)
		{
			continue;			
		}
		E = FP9Bomb(A);
		// End:0xA1
		if((E.InstigatorController != none) && E.InstigatorController == Instigator.Controller)
		{
			Bombs[Bombs.Length] = E;
			E.Instigator = Instigator;
		}		
	}	
	bHasDetonator = true;
	//return;	
}

function ServerSwitchWeaponMode(byte newmode)
{
	// End:0x0D
	if(!bHasDetonator)
	{
		return;
	}
	// End:0x21
	if(SelectedBomb != none)
	{
		ShiftBombLaser();		
	}
	else
	{
		// End:0x37
		if(ChosenBomb != none)
		{
			SelectedBomb = ChosenBomb;
		}
	}
	//return;	
}

simulated function ShiftBombLaser()
{
	local Actor t;
	local Vector HitLoc, HitNorm, Start, End;

	// End:0x0D
	if(!bHasDetonator)
	{
		return;
	}
	// End:0x15B
	if(SelectedBomb != none)
	{
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(5000));
		t = Trace(HitLoc, HitNorm, End, Start, true);
		// End:0x9A
		if(t == SelectedBomb)
		{
			SelectedBomb = none;
			return;
		}
		// End:0x12C
		if(((Vector(SelectedBomb.Rotation) Dot Normal(HitLoc - SelectedBomb.Location)) > 0.4000000) && FastTrace(HitLoc, SelectedBomb.Location))
		{
			SelectedBomb.OldLaserRange = -1.0000000;
			SelectedBomb.SetLaserDir(Rotator(HitLoc - SelectedBomb.Location));
			SelectedBomb = none;			
		}
		else
		{
			// End:0x15B
			if(ChosenBomb != none)
			{
				// End:0x150
				if(ChosenBomb == SelectedBomb)
				{
					SelectedBomb = none;					
				}
				else
				{
					SelectedBomb = ChosenBomb;
				}
			}
		}
	}
	//return;	
}

function ServerSetLaserMode(bool bNewValue)
{
	bLaserMode = bNewValue;
	//return;	
}

function ServerSwitchBombLaser()
{
	// End:0x25
	if((ChosenBomb != none) && bHasDetonator)
	{
		ChosenBomb.ToggleLaserMode();
	}
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x1E
	if((AmmoAmount(0)) > 0)
	{
		SetBoneScale(0, 1.0000000, BombBone);
	}
	// End:0xCD
	if(!Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena())
	{
		// End:0xBE
		if((ChosenBomb == none) && (AmmoAmount(0)) > 0)
		{
			SetBoneScale(1, 1.0000000, DetHandBone);
			// End:0x93
			if(!bLaserMode)
			{
				PlayAnim(LaserOnAnim, 1.0000000, 0.1000000);
				// End:0x90
				if(!bHasDetonator)
				{
					SetAnimFrame(0.1300000);
				}				
			}
			else
			{
				PlayAnim(LaserOffAnim, 1.0000000, 0.1000000);
				// End:0xBB
				if(!bHasDetonator)
				{
					SetAnimFrame(0.1400000);
				}
			}			
		}
		else
		{
			// End:0xCD
			if(bHasDetonator)
			{
				ServerSwitchBombLaser();
			}
		}
	}
	//return;	
}

simulated exec function Reload(optional byte i)
{
	// End:0x0D
	if(!bHasDetonator)
	{
		return;
	}
	ServerStartReload(i);
	// End:0x45
	if(int(Level.NetMode) == int(NM_Client))
	{
		DetAllStartTime = Level.TimeSeconds;
	}
	//return;	
}

function ServerStartReload(optional byte i)
{
	// End:0x0D
	if(!bHasDetonator)
	{
		return;
	}
	DetAllStartTime = Level.TimeSeconds;
	//return;	
}

simulated exec function ReloadRelease(optional byte i)
{
	// End:0x0D
	if(!bHasDetonator)
	{
		return;
	}
	ServerReloadRelease(i);
	// End:0x3C
	if(int(Level.NetMode) == int(NM_Client))
	{
		CommonReloadRelease(i);
	}
	//return;	
}

function ServerReloadRelease(optional byte i)
{
	// End:0x0D
	if(!bHasDetonator)
	{
		return;
	}
	CommonReloadRelease(i);
	//return;	
}

simulated function CommonReloadRelease(optional byte i)
{
	// End:0x41
	if((AIController(Instigator.Controller) == none) && (Level.TimeSeconds - DetAllStartTime) > DetAllDelayTime)
	{
		Detonate(true);
	}
	DetAllStartTime = 0.0000000;
	//return;	
}

simulated function Detonate(optional bool ball)
{
	local int i;
	local array<int> DetonatedBombs;

	// End:0x0D
	if(!bHasDetonator)
	{
		return;
	}
	// End:0x2B
	if((AmmoAmount(0)) > 0)
	{
		SetBoneScale(0, 1.0000000, BombBone);
	}
	PlayAnim('Fire');
	// End:0x53
	if(Instigator.IsLocallyControlled())
	{
		PlaySound(DetonateSound,, 0.5000000);
	}
	// End:0x65
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x12D
	if(ball)
	{
		i = 0;
		J0x75:

		// End:0xF0 [Loop If]
		if(i < Bombs.Length)
		{
			// End:0xE6
			if((Bombs[i] != none) && Level.TimeSeconds >= Bombs[i].DetonateTime)
			{
				Bombs[i].Detonate();
				DetonatedBombs[DetonatedBombs.Length] = i;
			}
			i++;
			// [Loop Continue]
			goto J0x75;
		}
		i = DetonatedBombs.Length - 1;
		J0xFF:

		// End:0x12A [Loop If]
		if(i > -1)
		{
			Bombs.Remove(DetonatedBombs[i], 1);
			i--;
			// [Loop Continue]
			goto J0xFF;
		}		
	}
	else
	{
		// End:0x1B7
		if((ChosenBomb != none) && Level.TimeSeconds >= ChosenBomb.DetonateTime)
		{
			ChosenBomb.Detonate();
			i = 0;
			J0x171:

			// End:0x19F [Loop If]
			if(i < Bombs.Length)
			{
				// End:0x195
				if(Bombs[i] != none)
				{
					// [Explicit Break]
					goto J0x19F;
				}
				i++;
				// [Loop Continue]
				goto J0x171;
			}
			J0x19F:

			// End:0x1B7
			if(i >= Bombs.Length)
			{
				Bombs.Length = 0;
			}
		}
	}
	//return;	
}

function AddBomb(FP9Bomb Bomb)
{
	Bombs[Bombs.Length] = Bomb;
	SelectedBomb = Bomb;
	//return;	
}

simulated function Notify_FP9LaserOnHandDown()
{
	// End:0x35
	if(!bHasDetonator)
	{
		AnimEnd(0);
		SetBoneScale(1, 0.0000000, DetHandBone);
		SetBoneScale(2, 0.0000000, 'FP9Detonator');
	}
	//return;	
}

simulated function Notify_FP9LaserOffHandDown()
{
	// End:0x35
	if(!bHasDetonator)
	{
		AnimEnd(0);
		SetBoneScale(1, 0.0000000, DetHandBone);
		SetBoneScale(2, 0.0000000, 'FP9Detonator');
	}
	//return;	
}

simulated function Notify_FP9Button1()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, Button1Sound);
	//return;	
}

simulated function Notify_FP9Button2()
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, Button2Sound);
	Skins[2] = LaserScreenMat;
	// End:0x5A
	if(int(Level.NetMode) == int(NM_Client))
	{
		bLaserMode = true;
	}
	ServerSetLaserMode(true);
	//return;	
}

simulated function Notify_FP9Button3()
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, Button3Sound);
	Skins[2] = ScreenMat;
	// End:0x5A
	if(int(Level.NetMode) == int(NM_Client))
	{
		bLaserMode = false;
	}
	ServerSetLaserMode(false);
	//return;	
}

simulated function Notify_FP9LaserFiddle()
{
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, LaserTweakSound);
	//return;	
}

simulated function Notify_FP9Thrown()
{
	SetBoneScale(0, 0.0000000, BombBone);
	//return;	
}

simulated function Notify_FP9Deploy()
{
	SetBoneScale(0, 0.0000000, BombBone);
	Class'BCoreProV55.BUtil'.static.PlayFullSound(self, DeploySound);
	//return;	
}

simulated function Notify_FP9HandDown()
{
	// End:0x21
	if((AmmoAmount(0)) > 0)
	{
		SetBoneScale(0, 1.0000000, BombBone);		
	}
	else
	{
		bOutOfBombs = true;
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x3A
	if(bHasDetonator)
	{
		SetBoneScale(1, 1.0000000, DetHandBone);
		SetBoneScale(2, 1.0000000, 'FP9Detonator');		
	}
	else
	{
		SetBoneScale(1, 0.0000000, DetHandBone);
		SetBoneScale(2, 0.0000000, 'FP9Detonator');
	}
	// End:0x72
	if((AmmoAmount(0)) < 1)
	{
		bOutOfBombs = true;
	}
	// End:0x8C
	if(bLaserMode)
	{
		Skins[2] = LaserScreenMat;		
	}
	else
	{
		Skins[2] = ScreenMat;
	}
	//return;	
}

function AIPickBomb()
{
	local Bot B;
	local float Best;
	local Controller C;
	local int i;

	B = Bot(Instigator.Controller);
	// End:0x26
	if(B == none)
	{
		return;
	}
	// End:0x4C
	if(Level.TimeSeconds > (LastAIPickBombTime + 2.0000000))
	{
		ChosenBomb = none;
	}
	// End:0x2AD
	if(Bombs.Length > 0)
	{
		Best = 500.0000000 - (float(28) * B.Skill);
		i = 0;
		J0x80:

		// End:0x2AD [Loop If]
		if(i < Bombs.Length)
		{
			// End:0x2A3
			if(((Bombs[i] != none) && !Bombs[i].bDetonate) && !Bombs[i].bDamaged)
			{
				C = Level.ControllerList;
				J0xED:

				// End:0x2A3 [Loop If]
				if(C != none)
				{
					// End:0x28C
					if((((((C != none) && C.Pawn != none) && !Instigator.Controller.SameTeamAs(C)) && VSize(C.Pawn.Location - Bombs[i].Location) < Best) && (VSize(Instigator.Location - Bombs[i].Location) > float(300)) || B.Skill <= float(Rand(7))) && Instigator.Controller.CanSee(C.Pawn))
					{
						Best = VSize(C.Pawn.Location - Bombs[i].Location);
						ChosenBomb = Bombs[i];
						LastAIPickBombTime = Level.TimeSeconds;
						// End:0x28C
						if((B.Enemy != none) && C.Pawn == B.Enemy)
						{
							Best *= 0.5000000;
						}
					}
					C = C.nextController;
					// [Loop Continue]
					goto J0xED;
				}
			}
			i++;
			// [Loop Continue]
			goto J0x80;
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x37
	if((Instigator != none) && AIController(Instigator.Controller) != none)
	{
		AIPickBomb();
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local int i, Best;
	local float BestDot, ThisDot;

	super.WeaponTick(dt);
	// End:0x26
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x7A
	if(((AmmoAmount(0)) > 0) && bOutOfBombs)
	{
		SetBoneScale(0, 1.0000000, BombBone);
		bOutOfBombs = false;
		// End:0x7A
		if(int(ClientState) == int(4))
		{
			PlayAnim('Place');
			SetAnimFrame(0.6590000);
		}
	}
	// End:0xDF
	if(bHasDetonator)
	{
		// End:0xDC
		if(!bOldHasDetonator)
		{
			SetBoneScale(1, 1.0000000, DetHandBone);
			SetBoneScale(2, 1.0000000, 'FP9Detonator');
			// End:0xD4
			if(int(ClientState) == int(4))
			{
				PlayAnim(LaserOffAnim);
				SetAnimFrame(0.9000000);
			}
			bOldHasDetonator = true;
		}		
	}
	else
	{
		bOldHasDetonator = false;
	}
	// End:0xF9
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	i = 0;
	J0x100:

	// End:0x1CF [Loop If]
	if(i < Bombs.Length)
	{
		// End:0x1C5
		if((Bombs[i] != none) && Bombs[i].StartDelay == float(0))
		{
			ThisDot = Normal(Bombs[i].Location - (Instigator.Location + Instigator.EyePosition())) Dot Vector(Instigator.GetViewRotation());
			// End:0x1C5
			if((ThisDot > 0.9800000) && ThisDot > BestDot)
			{
				Best = i;
				BestDot = ThisDot;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x100;
	}
	// End:0x1F0
	if(BestDot < 0.9800000)
	{
		ChosenBombindex = 0;
		ChosenBomb = none;		
	}
	else
	{
		// End:0x225
		if(int(ChosenBombindex) != (Best + 1))
		{
			ChosenBombindex = byte(Best + 1);
			ChosenBomb = Bombs[Best];
		}
	}
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	local Vector V, v2, X, Y, Z;

	local float ScaleFactor, XL, YL;

	super.RenderOverlays(C);
	// End:0x25
	if((ChosenBomb == none) && SelectedBomb == none)
	{
		return;
	}
	// End:0x32
	if(!bHasDetonator)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	GetViewAxes(X, Y, Z);
	// End:0x321
	if(ChosenBomb != none)
	{
		V = C.WorldToScreen((ChosenBomb.Location - (Y * ChosenBomb.CollisionRadius)) + (Z * ChosenBomb.CollisionHeight));
		C.SetPos(V.X - (float(16) * ScaleFactor), V.Y - (float(16) * ScaleFactor));
		v2 = C.WorldToScreen((ChosenBomb.Location + (Y * ChosenBomb.CollisionRadius)) - (Z * ChosenBomb.CollisionHeight));
		C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
		C.DrawTileStretched(Texture'BW_Core_WeaponTex.G5.G5TargetBox', (v2.X - V.X) + (float(32) * ScaleFactor), (v2.Y - V.Y) + (float(32) * ScaleFactor));
		C.Font = GetFontSizeIndex(C, -3 + int(float(2) * Class'Engine.HUD'.default.HudScale));
		C.StrLen(string(ChosenBombindex), XL, YL);
		C.SetPos((V.X + ((v2.X - V.X) / float(2))) - (XL / float(2)), (V.Y + ((v2.Y - V.Y) / float(2))) - (YL / float(2)));
		// End:0x2F3
		if(((int(Level.NetMode) != int(NM_Client)) && ChosenBomb.bLaserMode) || ChosenBomb.bNetLaserOn)
		{
			C.SetDrawColor(64, byte(255), 192, byte(255));			
		}
		else
		{
			C.SetDrawColor(byte(255), 192, 0, byte(255));
		}
		C.DrawText(string(ChosenBombindex));
	}
	// End:0x4E8
	if(((SelectedBomb != none) && SelectedBomb.StartDelay == float(0)) && (Normal(SelectedBomb.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation())) > 0.4000000)
	{
		V = C.WorldToScreen((SelectedBomb.Location - (Y * SelectedBomb.CollisionRadius)) + (Z * SelectedBomb.CollisionHeight));
		C.SetPos(V.X - (float(32) * ScaleFactor), V.Y - (float(32) * ScaleFactor));
		v2 = C.WorldToScreen((SelectedBomb.Location + (Y * SelectedBomb.CollisionRadius)) - (Z * SelectedBomb.CollisionHeight));
		C.SetDrawColor(0, byte(255), 0, byte(255));
		C.DrawTile(Texture'BW_Core_WeaponTex.Crosshairs.M50Out', (v2.X - V.X) + (float(64) * ScaleFactor), (v2.Y - V.Y) + (float(64) * ScaleFactor), 0.0000000, 0.0000000, 128.0000000, 128.0000000);
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x31
	if(DetAllStartTime > float(0))
	{
		return FMin(Level.TimeSeconds - DetAllStartTime, 1.0000000) / DetAllDelayTime;
	}
	return FClamp(FireMode[0].HoldTime - 0.3000000, 0.0000000, 1.0000000) / float(1);
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function byte BestMode()
{
	// End:0x1D
	if(((AmmoAmount(0)) < 1) || ChosenBomb != none)
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
	// End:0x2B
	if(B == none)
	{
		return super.GetAIRating();
	}
	// End:0x79
	if(B.Enemy != none)
	{
		Dir = B.Enemy.Location - Instigator.Location;
		dist = VSize(Dir);
	}
	// End:0xE8
	if(ChosenBomb != none)
	{
		Result = 1.0000000;
		// End:0xE5
		if((B.Enemy != none) && VSize(B.Enemy.Location - ChosenBomb.Location) < float(300))
		{
			Result = 2.0000000;
		}		
	}
	else
	{
		// End:0xFB
		if((AmmoAmount(0)) < 1)
		{
			return 0.0000000;
		}
		// End:0x11D
		if(B.Enemy == none)
		{
			Result = 1.0000000;			
		}
		else
		{
			// End:0x158
			if(dist > float(1000))
			{
				Result = 0.4000000 - (0.3000000 * ((dist / float(1000)) - float(1)));				
			}
			else
			{
				Result = super.GetAIRating();
			}
		}
	}
	// End:0x19C
	if((dist < float(300)) && B.Skill > float(Rand(7)))
	{
		Result *= 0.5000000;
	}
	return Result;
	//return;	
}

function bool CanAttack(Actor Other)
{
	local Bot B;

	// End:0x0D
	if(ChosenBomb != none)
	{
		return true;
	}
	// End:0x9F
	if((AmmoAmount(0)) > 0)
	{
		B = Bot(Instigator.Controller);
		// End:0x95
		if((B != none) && B.Enemy != none)
		{
			// End:0x8B
			if(VSize(Instigator.Location - B.Enemy.Location) < float(1000))
			{
				return true;
			}
			return FRand() > 0.5000000;
		}
		return FRand() > 0.8000000;
	}
	return false;
	//return;	
}

function float SuggestAttackStyle()
{
	// End:0x1F
	if((ChosenBomb == none) && FRand() > 0.6000000)
	{
		return 0.7000000;
	}
	return -1.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	LaserTweakSound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-LaserTurn',Volume=0.5000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Button1Sound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Button1',Volume=0.5000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Button2Sound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Button2',Volume=0.5000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Button3Sound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Button3',Volume=0.5000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	DeploySound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Place',Volume=1.0000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	LaserOnAnim="LaserOn"
	LaserOffAnim="LaserOff"
	BombBone="FP9Bomb"
	HandBone="LeftHand"
	DetonateSound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Detonate'
	LaserScreenMat=Shader'BW_Core_WeaponTex.FP9A5.FP9LCDActiveSD'
	ScreenMat=Shader'BW_Core_WeaponTex.FP9A5.FP9LCDArmedSD'
	DetAllDelayTime=0.3000000
	bHasDetonator=true
	bOldHasDetonator=true
	DetHandBone="Bone-Arm"
	SpecialInfo[0]=(Id="EvoDefs",Info="180.0;10.0;0.4;-1.0;0.0;0.0;0.5")
	ParamsClasses[0]=Class'BallisticProV55.FP9WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.FP9WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.FP9WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.FP9WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_FP9A5'
	BigIconCoords=(X1=0,Y1=24,X2=511,Y2=235)
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Pullout',Volume=0.1280000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Putaway',Volume=0.1100000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bUseSights=false
	bNoMag=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M353InA',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50OutA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=255,G=0,B=0,A=192),Color2=(R=0,G=255,B=0,A=192),StartSize1=96,StartSize2=96)
	NDCrosshairInfo=(SpreadRatios=(X1=0.5000000,Y1=0.5000000,X2=0.5000000,Y2=0.5000000),SizeFactors=(X1=1.0000000,Y1=1.0000000,X2=1.0000000,Y2=1.0000000),MaxScale=8.0000000,CurrentScale=0.0000000)
	bWT_Hazardous=true
	bWT_Splash=true
	bWT_Grenade=true
	bWT_Trap=true
	ManualLines[0]="Places an FP9 explosive device. If used close to a wall or surface, the weapon will attach itself to the surface: otherwise the bomb falls to the floor. If the laser tripmine is activated, enemies walking into the beam will set off the bomb. If not, the user must detonate the bomb manually by facing it and using the altfire. Bombs may be picked up with the Use key."
	ManualLines[1]="Detonates the FP9. The user must be facing the mine to detonate, which will be displayed surrounded by a red box."
	ManualLines[2]="The FP9 has a number of special functions.||When not facing a placed bomb:|The Weapon Function key toggles whether the next bomb placed will use the laser tripwire.||When facing a placed bomb:|The Weapon Function key toggles whether the placed bomb will use the laser tripwire.|The Switch Fire Mode key selects the faced bomb, highlighting it in green.||With a bomb highlighted:|Targeting an area and pressing Switch Weapon Mode will cause the endpoint of the selected bomb's laser, if active, to shift to the targeted location."
	bAimDisabled=true
	GunLength=0.0000000
	FireModeClass[0]=Class'BallisticProV55.FP9PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.FP9SecondaryFire'
	PutDownTime=0.7000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.2000000
	CurrentRating=0.2000000
	bShowChargingBar=true
	Description="NDTR's versatile FP9 is a favourite UTC weapon of high quality and extensive use. The FP9A5 greatly enhances the standard explosive by incorporating many tactical features to make it an incredibly versatile bomb. The soldier can deploy or toss the device, and wait to manually detonate it by means of a radio frequency controller, or activate the laser feature, and wait for an unsuspecting foe to walk into the beam. As well as this, the latest model now has the ability to activate the laser mode when the bomb is already deployed, making it even more effective. This allows the user to deactivate the beam, pick it up, and place it elsewhere, or merely to allow oneself to walk past the device without incident."
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=0
	GroupOffset=18
	PickupClass=Class'BallisticProV55.FP9Pickup'
	PlayerViewOffset=(X=10.0000000,Y=-1.5000000,Z=-9.0000000)
	AttachmentClass=Class'BallisticProV55.FP9Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_FP9Explosive'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="FP9A5 Explosive Device"
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.FP9_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.FP9A5.FP9Bomb'
}
