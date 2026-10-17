class M75Railgun extends BallisticWeapon
	config(BallisticProV55);

var() FullSound ThermalOnSound;
var() FullSound ThermalOffSound;
var array<Pawn> PawnList;
var() Material WallVisionSkin;
var bool bThermal;
var bool bUpdatePawns;
var Pawn UpdatedPawns[128];
var() Material Flaretex;
var() float ThermalRange;
var ColorModifier ColorMod;
var float NextPawnListUpdateTime;

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x25
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassicOrRealism())
	{
		FireModeClass[1] = Class'BCoreProV55.BallisticScopeFire';
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x30
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
	{
		M75PrimaryFire(FireMode[0]).bFireOnRelease = true;
	}
	//return;	
}

simulated function OnScopeViewChanged()
{
	super.OnScopeViewChanged();
	// End:0x3E
	if(!bScopeView)
	{
		// End:0x34
		if(int(Level.NetMode) == int(NM_Client))
		{
			AdjustThermalView(false);			
		}
		else
		{
			ServerAdjustThermal(false);
		}		
	}
	else
	{
		// End:0x71
		if(bThermal)
		{
			// End:0x6A
			if(int(Level.NetMode) == int(NM_Client))
			{
				AdjustThermalView(true);				
			}
			else
			{
				ServerAdjustThermal(true);
			}
		}
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x18
	if(ColorMod != none)
	{
		return;
	}
	ColorMod = ColorModifier(Level.ObjectPool.AllocateObject(Class'Engine.ColorModifier'));
	// End:0xDD
	if(ColorMod != none)
	{
		ColorMod.Material = FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal';
		ColorMod.Color.R = byte(255);
		ColorMod.Color.G = 96;
		ColorMod.Color.B = 0;
		ColorMod.Color.A = byte(255);
		ColorMod.AlphaBlend = false;
		ColorMod.RenderTwoSided = true;
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x35
	if(super.PutDown())
	{
		// End:0x2C
		if(int(Level.NetMode) == int(NM_Client))
		{
			AdjustThermalView(false);			
		}
		else
		{
			ServerAdjustThermal(false);
		}
		return true;
	}
	return false;
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x24
	if((int(ClientState) != int(4)) || int(ReloadState) != int(0))
	{
		return;
	}
	bThermal = !bThermal;
	// End:0x5C
	if(bThermal)
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOnSound);
		ServerWeaponSpecial(1);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, ThermalOffSound);
		ServerWeaponSpecial(0);
	}
	AdjustThermalView(bThermal);
	//return;	
}

function ServerWeaponSpecial(optional byte i)
{
	bThermal = bool(i);
	ServerAdjustThermal(bThermal);
	//return;	
}

simulated event Destroyed()
{
	// End:0x2F
	if(ColorMod != none)
	{
		Level.ObjectPool.FreeObject(ColorMod);
		ColorMod = none;
	}
	AdjustThermalView(false);
	super.Destroyed();
	//return;	
}

simulated function AdjustThermalView(bool bNewValue)
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x31
	if(!bNewValue)
	{
		bUpdatePawns = false;		
	}
	else
	{
		bUpdatePawns = true;
		UpdatePawnList();
		NextPawnListUpdateTime = Level.TimeSeconds + float(1);
	}
	//return;	
}

function ServerAdjustThermal(bool bNewValue)
{
	local int i;

	// End:0x33
	if(bNewValue)
	{
		bUpdatePawns = true;
		UpdatePawnList();
		NextPawnListUpdateTime = Level.TimeSeconds + float(1);		
	}
	else
	{
		bUpdatePawns = false;
		i = 0;
		J0x42:

		// End:0x94 [Loop If]
		if(i < 128)
		{
			// End:0x8A
			if(UpdatedPawns[i] != none)
			{
				UpdatedPawns[i].bAlwaysRelevant = UpdatedPawns[i].default.bAlwaysRelevant;
			}
			i++;
			// [Loop Continue]
			goto J0x42;
		}
	}
	//return;	
}

simulated function WeaponTick(float DeltaTime)
{
	super.WeaponTick(DeltaTime);
	// End:0x29
	if(Level.TimeSeconds >= NextPawnListUpdateTime)
	{
		UpdatePawnList();
	}
	//return;	
}

simulated function DrawScopeMuzzleFlash(Canvas C)
{
	local Vector X, Y, Z;

	GetViewAxes(X, Y, Z);
	// End:0xD0
	if(bFireMode[0].MuzzleFlash != none)
	{
		bFireMode[0].MuzzleFlash.SetLocation(((Instigator.Location + Instigator.EyePosition()) + (X * SMuzzleFlashOffset.X)) + (Z * SMuzzleFlashOffset.Z));
		bFireMode[0].MuzzleFlash.SetRotation(Instigator.GetViewRotation());
		C.DrawActor(bFireMode[0].MuzzleFlash, false, false, DisplayFOV);
	}
	// End:0x18B
	if(bFireMode[1].MuzzleFlash != none)
	{
		bFireMode[1].MuzzleFlash.SetLocation(((Instigator.Location + Instigator.EyePosition()) + (X * SMuzzleFlashOffset.X)) + (Z * SMuzzleFlashOffset.Z));
		bFireMode[1].MuzzleFlash.SetRotation(Instigator.GetViewRotation());
		C.DrawActor(bFireMode[1].MuzzleFlash, false, false, DisplayFOV);
	}
	//return;	
}

simulated event DrawScopeOverlays(Canvas C)
{
	// End:0x14
	if(bThermal)
	{
		DrawThermalMode(C);
	}
	super.DrawScopeOverlays(C);
	//return;	
}

simulated function UpdatePawnList()
{
	local Pawn P;
	local int i;
	local float dist;

	PawnList.Length = 0;
	// End:0x21E
	foreach DynamicActors(Class'Engine.Pawn', P)
	{
		// End:0x96
		if(((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none) && P.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
		{
			continue;			
		}
		PawnList[PawnList.Length] = P;
		dist = VSize(P.Location - Instigator.Location);
		// End:0x21D
		if(((dist <= ThermalRange) && (Normal(P.Location - (Instigator.Location + Instigator.EyePosition())) Dot Vector(Instigator.GetViewRotation())) > (float(1) - ((Instigator.Controller.FovAngle * 0.9000000) / float(180)))) && Instigator.LineOfSightTo(P) || (Normal(P.Location - Instigator.Location) Dot Vector(Instigator.GetViewRotation())) > (0.9850000 + (0.0150000 * (dist / ThermalRange))))
		{
			// End:0x205
			if(!Instigator.IsLocallyControlled())
			{
				P.NetUpdateTime = Level.TimeSeconds - float(1);
				P.bAlwaysRelevant = true;
			}
			UpdatedPawns[i] = P;
			i++;
		}		
	}	
	//return;	
}

simulated event DrawThermalMode(Canvas C)
{
	local Pawn P;
	local int i, j;
	local float dist, DotP;
	local array<Material> OldSkins;
	local int OldSkinCount;
	local bool bLOS, bFocused;
	local Vector Start;
	local array<Material> AttOldSkins0, AttOldSkins1;

	C.Style = 4;
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.DrawTile(FinalBlend'BW_Core_WeaponTex.M75.M75SeekerFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.DrawTile(FinalBlend'BW_Core_WeaponTex.M75.M75RadarFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	C.SetPos(C.OrgX, C.OrgY);
	C.DrawTile(FinalBlend'BW_Core_WeaponTex.M75.M75LinesFinal', float(C.SizeX), float(C.SizeY), 0.0000000, 0.0000000, 512.0000000, 512.0000000);
	// End:0x1BD
	if(ColorMod == none)
	{
		return;
	}
	C.Style = 5;
	Start = Instigator.Location + Instigator.EyePosition();
	j = 0;
	J0x1FA:

	// End:0x9D1 [Loop If]
	if(j < PawnList.Length)
	{
		// End:0x9C7
		if((PawnList[j] != none) && PawnList[j] != Level.GetLocalPlayerController().Pawn)
		{
			P = PawnList[j];
			bFocused = false;
			bLOS = false;
			ThermalRange = default.ThermalRange + (float(2000) * FMin(1.0000000, VSize(P.Velocity) / float(450)));
			dist = VSize(P.Location - Instigator.Location);
			// End:0x2D4
			if(dist > ThermalRange)
			{
				// [Explicit Continue]
				goto J0x9C7;
			}
			DotP = Normal(P.Location - Start) Dot Vector(Instigator.GetViewRotation());
			// End:0x338
			if(DotP < Cos((Instigator.Controller.FovAngle / 1.7000000) * 0.0174530))
			{
				// [Explicit Continue]
				goto J0x9C7;
			}
			// End:0x35A
			if(Instigator.LineOfSightTo(P))
			{
				bLOS = true;				
			}
			else
			{
				// End:0x386
				if(DotP > (0.9840000 + (0.0160000 * (dist / ThermalRange))))
				{
					bFocused = true;
				}
			}
			// End:0x9C4
			if(bFocused || bLOS)
			{
				// End:0x3BF
				if(bLOS)
				{
					DotP = (DotP - 0.6000000) / 0.4000000;					
				}
				else
				{
					DotP = (DotP - (0.9840000 + ((dist / ThermalRange) * 0.0160000))) / 0.0160000;
				}
				DotP = FMax(DotP, 0.0000000);
				// End:0x435
				if(dist < float(500))
				{
					ColorMod.Color.R = byte(DotP * 255.0000000);					
				}
				else
				{
					ColorMod.Color.R = byte(DotP * (float(255) - (FClamp((dist - float(500)) / ((ThermalRange - float(500)) * 0.8000000), 0.0000000, 1.0000000) * float(255))));
				}
				ColorMod.Color.G = byte(DotP * (128.0000000 - ((dist / ThermalRange) * 96.0000000)));
				OldSkinCount = P.Skins.Length;
				i = 0;
				J0x4E2:

				// End:0x558 [Loop If]
				if(i < Max(2, OldSkinCount))
				{
					// End:0x527
					if(OldSkinCount > i)
					{
						OldSkins[i] = P.Skins[i];						
					}
					else
					{
						OldSkins[i] = none;
					}
					P.Skins[i] = ColorMod;
					i++;
					// [Loop Continue]
					goto J0x4E2;
				}
				P.bUnlit = true;
				i = 0;
				J0x570:

				// End:0x783 [Loop If]
				if(i < P.Attached.Length)
				{
					// End:0x779
					if(P.Attached[i] != none)
					{
						// End:0x759
						if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
						{
							// End:0x65A
							if(P.Attached[i].Skins.Length > 0)
							{
								AttOldSkins0[i] = P.Attached[i].Skins[0];
								P.Attached[i].Skins[0] = ColorMod;								
							}
							else
							{
								AttOldSkins0[i] = none;
								P.Attached[i].Skins[0] = ColorMod;
							}
							// End:0x700
							if(P.Attached[i].Skins.Length > 1)
							{
								AttOldSkins1[i] = P.Attached[i].Skins[1];
								P.Attached[i].Skins[1] = ColorMod;
							}
							// End:0x756
							if(P.Attached[i].Skins.Length > 1)
							{
								AttOldSkins1[i] = none;
								P.Attached[i].Skins[1] = ColorMod;
							}
							// [Explicit Continue]
							goto J0x779;
						}
						P.Attached[i].SetDrawType(0);
					}
					J0x779:

					i++;
					// [Loop Continue]
					goto J0x570;
				}
				C.DrawActor(P, false, true);
				P.Skins.Length = OldSkinCount;
				i = 0;
				J0x7B2:

				// End:0x7F5 [Loop If]
				if(i < P.Skins.Length)
				{
					P.Skins[i] = OldSkins[i];
					i++;
					// [Loop Continue]
					goto J0x7B2;
				}
				P.bUnlit = false;
				i = 0;
				J0x80D:

				// End:0x9B1 [Loop If]
				if(i < P.Attached.Length)
				{
					// End:0x9A7
					if(P.Attached[i] != none)
					{
						// End:0x96C
						if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
						{
							// End:0x913
							if(AttOldSkins1[i] == none)
							{
								// End:0x8C5
								if(AttOldSkins0[i] == none)
								{
									P.Attached[i].Skins.Length = 0;									
								}
								else
								{
									P.Attached[i].Skins.Length = 1;
									P.Attached[i].Skins[0] = AttOldSkins0[i];
								}								
							}
							else
							{
								P.Attached[i].Skins[0] = AttOldSkins0[i];
								P.Attached[i].Skins[1] = AttOldSkins1[i];
							}
							// [Explicit Continue]
							goto J0x9A7;
						}
						P.Attached[i].SetDrawType(P.Attached[i].default.DrawType);
					}
					J0x9A7:

					i++;
					// [Loop Continue]
					goto J0x80D;
				}
				AttOldSkins0.Length = 0;
				AttOldSkins1.Length = 0;
				// [Explicit Continue]
				goto J0x9C7;
			}
			// [Explicit Continue]
		}
		J0x9C7:

		j++;
		// [Loop Continue]
		goto J0x1FA;
	}
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x34
	if(M75PrimaryFire(FireMode[0]).IsInState('ClassicRail'))
	{
		return M75PrimaryFire(FireMode[0]).RailPower;		
	}
	else
	{
		// End:0x68
		if(M75PrimaryFire(FireMode[0]).IsInState('FullChargedRail'))
		{
			return M75PrimaryFire(FireMode[0]).RailPower;			
		}
		else
		{
			return M75SecondaryFire(FireMode[1]).RailPower;
		}
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x38
	if((!bNoMag && FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x7D
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	// End:0xAB
	if(Vehicle(B.Enemy) != none)
	{
		Result *= float(2);
	}
	Result += ((dist - float(1000)) / float(2000));
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	ThermalOnSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ThermalOffSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	WallVisionSkin=FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal'
	Flaretex=FinalBlend'BW_Core_WeaponTex.M75.OrangeFlareFinal'
	ThermalRange=3500.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="300.0;45.0;1.0;80.0;1.0;0.0;0.0")
	ParamsClasses[0]=Class'BallisticProV55.M75WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.M75WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.M75WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.M75WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_M75'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Pullout',Volume=0.1820000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Putaway',Volume=0.1830000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Single Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	bNoTweenToScope=true
	ScopeXScale=1.3333330
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=4.0000000
	MaxZoom=16.0000000
	FullZoomFOV=20.0000000
	bNoCrosshairInScope=true
	SMuzzleFlashOffset=(X=50.0000000,Y=0.0000000,Z=-35.0000000)
	CockAnimPostReload="Cock2"
	CockSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Cock',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Cliphit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Clipout',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Clipin',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	bAltTriggerReload=true
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc1',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.R78InA',USize1=256,VSize1=256,USize2=256,VSize2=256,Color1=(R=0,G=0,B=95,A=171),Color2=(R=0,G=100,B=255,A=255),StartSize1=103,StartSize2=101)
	bWT_Bullet=true
	ManualLines[0]="Uncharged rail slug shot. High damage, moderate fire rate and recoil, and good penetration."
	ManualLines[1]="Charged rail slug shot. The railgun will fire when the fire key is released, or immediately upon becoming fully charged. Damage and penetration improve with charge, to extreme levels when fully charged."
	ManualLines[2]="Weapon Function toggles the thermal scope, allowing the user to see enemies through walls. The further away the opponent, the closer the player's aim needs to be to their position to view them.||As a heavy weapon, the M75 reduces the user's movement speed and jump ability.||The M75 is effective at long range and through cover."
	SightOffset=(X=15.0000000,Y=0.0000000,Z=2.9000000)
	GunLength=80.0000000
	FireModeClass[0]=Class'BallisticProV55.M75PrimaryFire'
	FireModeClass[1]=Class'BallisticProV55.M75SecondaryFire'
	PutDownAnimRate=1.3000000
	PutDownTime=0.8000000
	BringUpTime=0.6000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.7000000
	CurrentRating=0.7000000
	bSniping=true
	bShowChargingBar=true
	Description="There are very few things feared by the Skrith and the Railgun is one of them. Railguns use electromagnetism to fire metallic projectiles at incredible speeds, some moving at hundreds of thousands of feet per second. This one uses depleted uranium-dragonium slugs for ammo. Railguns were far too large and heavy for infantry use until Enravion developed the Tactical Infantry Cannon version. No comparable infantry weapon currently available is capable of as much damage in a single shot as the M75. When fully charged it can flip over a tank, or fire right through a concrete building. Designed for use against vehicles, no infantry armor could be considered protection against this weapon. The M75 does have some disadvantages though. Its slow firerate, great weight and highly visible trail make it a weapon that will benefit only the most skilled soldiers."
	Priority=34
	HudColor=(R=0,G=25,B=255,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	PickupClass=Class'BallisticProV55.M75Pickup'
	PlayerViewOffset=(X=-1.0000000,Y=7.0000000,Z=-6.0000000)
	AttachmentClass=Class'BallisticProV55.M75Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_M75'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="M75 Railgun"
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=180.0000000
	LightRadius=8.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.M75_FPm'
	DrawScale=0.3000000
}
