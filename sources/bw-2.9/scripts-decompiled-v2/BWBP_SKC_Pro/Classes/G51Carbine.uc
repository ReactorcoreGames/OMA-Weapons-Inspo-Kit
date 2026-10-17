class G51Carbine extends BallisticWeapon
	config(BallisticProV55);

var(G51) name GrenadeLoadAnim;
var(G51) bool bLoaded;
var(G51) name GrenBone;
var(G51) name GrenBoneBase;
var(G51) Sound GrenSlideSound;
var(G51) Sound ClipInSoundEmpty;
var(G51) name BulletBone;
var(G51) name BulletBone2;
var(G51) bool bHasIR;
var(G51) Texture ScopeviewTexIR;
var(G51) FullSound ThermalOnSound;
var(G51) FullSound ThermalOffSound;
var(G51) array<Pawn> PawnList;
var(G51) Material WallVisionSkin;
var(G51) bool bThermal;
var(G51) bool bUpdatePawns;
var(G51) Pawn UpdatedPawns[128];
var(G51) Material Flaretex;
var(G51) float ThermalRange;
var(G51) ColorModifier ColorMod;
var(G51) array<M58Cloud> SmokeList;
var(G51) Actor NVLight;
var(G51) float NextPawnListUpdateTime;
var bool bSilenced;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerAdjustThermal;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		bLoaded;
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasIR = false;
	bSilenced = false;
	// End:0x56
	if(InStr(WeaponParams.LayoutTags, "IR") != -1)
	{
		bHasIR = true;
		bThermal = true;
		AdjustThermalView(true);
	}
	// End:0x82
	if(InStr(WeaponParams.LayoutTags, "silencer") != -1)
	{
		bSilenced = true;
	}
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BWBP_SKC_Pro.AP_STANAGChaff';
	//return;	
}

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	local int M;
	local Weapon W;
	local bool bPossiblySwitch, bJustSpawned;

	Instigator = Other;
	W = Weapon(Other.FindInventoryType(Class));
	// End:0x170
	if((W == none) || Class != W.Class)
	{
		bJustSpawned = true;
		super(Inventory).GiveTo(Other);
		bPossiblySwitch = true;
		W = self;
		// End:0x104
		if((Pickup != none) && BallisticWeaponPickup(Pickup) != none)
		{
			GenerateLayout(BallisticWeaponPickup(Pickup).LayoutIndex);
			GenerateCamo(BallisticWeaponPickup(Pickup).CamoIndex);
			// End:0xE8
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = BallisticWeaponPickup(Pickup).MagAmmo;			
		}
		else
		{
			GenerateLayout(byte(255));
			GenerateCamo(byte(255));
			// End:0x140
			if(int(Role) == int(ROLE_Authority))
			{
				ParamsClasses[int(GameStyleIndex)].static.Initialize(self);
			}
			MagAmmo = MagAmmo + ((int(!bNonCocking) * int(bMagPlusOne)) * int(!bNeedCock));
		}		
	}
	else
	{
		// End:0x18C
		if(!W.HasAmmo())
		{
			bPossiblySwitch = true;
		}
	}
	// End:0x19F
	if(Pickup == none)
	{
		bPossiblySwitch = true;
	}
	M = 0;
	J0x1A6:

	// End:0x202 [Loop If]
	if(M < 2)
	{
		// End:0x1F8
		if(FireMode[M] != none)
		{
			FireMode[M].Instigator = Instigator;
			GiveAmmo(M, WeaponPickup(Pickup), bJustSpawned);
		}
		M++;
		// [Loop Continue]
		goto J0x1A6;
	}
	// End:0x23B
	if((Instigator.Weapon != none) && Instigator.Weapon.IsFiring())
	{
		bPossiblySwitch = false;
	}
	// End:0x268
	if(Instigator.Weapon != W)
	{
		W.ClientWeaponSet(bPossiblySwitch);
	}
	bAimDisabled = default.bAimDisabled || !Instigator.IsHumanControlled();
	// End:0x2C3
	if(!bJustSpawned)
	{
		M = 0;
		J0x29D:

		// End:0x2C0 [Loop If]
		if(M < 2)
		{
			Ammo[M] = none;
			M++;
			// [Loop Continue]
			goto J0x29D;
		}
		Destroy();
	}
	// End:0x2DF
	if(Instigator.FindInventoryType(Class'BCoreProV55.BCGhostWeapon') != none)
	{
		return;
	}
	// End:0x362
	if(Instigator.FindInventoryType(Class'BWBP_SKC_Pro.ChaffGrenadeWeapon') != none)
	{
		W = Spawn(Class'BWBP_SKC_Pro.ChaffGrenadeWeapon',,, Instigator.Location);
		// End:0x362
		if(W != none)
		{
			W.GiveTo(Instigator);
			W.ConsumeAmmo(0, 9999.0000000, true);
			W.ConsumeAmmo(1, 9999.0000000, true);
		}
	}
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x78
	if((Anim == 'Fire') || Anim == 'ReloadEmpty')
	{
		// End:0x78
		if((MagAmmo - bFireMode[0].ConsumedLoad) < 2)
		{
			SetBoneScale(2, 0.0000000, BulletBone);
			SetBoneScale(3, 0.0000000, BulletBone2);
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	// End:0x30
	if(!bLoaded)
	{
		SetBoneScale(0, 0.0000000, GrenBone);
		SetBoneScale(1, 0.0000000, GrenBoneBase);		
	}
	else
	{
		SetBoneScale(0, 1.0000000, GrenBone);
		SetBoneScale(1, 1.0000000, GrenBoneBase);
	}
	// End:0xA1
	if((MagAmmo - bFireMode[0].ConsumedLoad) < 1)
	{
		SetBoneScale(2, 0.0000000, BulletBone);
		SetBoneScale(3, 0.0000000, BulletBone2);
		ReloadAnim = 'ReloadEmpty';		
	}
	else
	{
		ReloadAnim = 'Reload';
	}
	super.BringUp(PrevWeapon);
	// End:0xC4
	if(ColorMod != none)
	{
		return;
	}
	ColorMod = ColorModifier(Level.ObjectPool.AllocateObject(Class'Engine.ColorModifier'));
	// End:0x18D
	if(ColorMod != none)
	{
		ColorMod.Material = FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal';
		ColorMod.Color.R = byte(255);
		ColorMod.Color.G = byte(255);
		ColorMod.Color.B = byte(255);
		ColorMod.Color.A = byte(255);
		ColorMod.AlphaBlend = false;
		ColorMod.RenderTwoSided = true;
	}
	//return;	
}

simulated function bool PutDown()
{
	// End:0x2D
	if(!bLoaded)
	{
		SetBoneScale(0, 0.0000000, GrenBone);
		SetBoneScale(1, 0.0000000, GrenBoneBase);
	}
	// End:0x3F
	if(super.PutDown())
	{
		AdjustThermalView(false);
		return true;
	}
	return false;
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
	// End:0x4D
	if(NVLight != none)
	{
		NVLight.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x31
	if(((int(ClientState) != int(4)) || int(ReloadState) != int(0)) || !bHasIR)
	{
		return;
	}
	bThermal = !bThermal;
	// End:0x69
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

simulated function SetNVLight(bool bOn)
{
	// End:0x16
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x6D
	if(bOn)
	{
		// End:0x59
		if(NVLight == none)
		{
			NVLight = Spawn(Class'BWBP_SKC_Pro.HKARNVLight',,, Instigator.Location);
			NVLight.SetBase(Instigator);
		}
		NVLight.bDynamicLight = true;		
	}
	else
	{
		// End:0x89
		if(NVLight != none)
		{
			NVLight.bDynamicLight = false;
		}
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local Actor t;
	local Vector HitLoc, HitNorm, Start, End;

	super.WeaponTick(dt);
	// End:0x29
	if(Level.TimeSeconds >= NextPawnListUpdateTime)
	{
		UpdatePawnList();
	}
	// End:0x135
	if(bThermal && bScopeView)
	{
		SetNVLight(true);
		Start = Instigator.Location + Instigator.EyePosition();
		End = Start + (Vector(Instigator.GetViewRotation()) * float(1500));
		t = Trace(HitLoc, HitNorm, End, Start, true, vect(16.0000000, 16.0000000, 16.0000000));
		// End:0xD1
		if(t == none)
		{
			HitLoc = End;
		}
		// End:0x114
		if(VSize(HitLoc - Start) > float(400))
		{
			NVLight.SetLocation(Start + ((HitLoc - Start) * 0.5000000));			
		}
		else
		{
			NVLight.SetLocation(HitLoc + (HitNorm * float(30)));
		}		
	}
	else
	{
		SetNVLight(false);
	}
	//return;	
}

simulated event RenderOverlays(Canvas C)
{
	// End:0x23
	if((Instigator == none) || Instigator.Controller == none)
	{
		return;
	}
	// End:0x42
	if(SprintControl != none)
	{
		SprintControl.RenderOverlays(C);
	}
	// End:0x6D
	if(!bScopeView || int(ZoomType) == int(0))
	{
		DrawFPWeapon(C);		
	}
	else
	{
		SetLocation(Instigator.Location + Instigator.CalcDrawOffset(self));
		SetRotation(Instigator.GetViewRotation());
		DrawScopeMuzzleFlash(C);
		DrawScopeOverlays(C);
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
	C.DrawTile(FinalBlend'BW_Core_WeaponTex.Attachment.SKAR-IRFinal', float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	C.SetPos(C.OrgX, C.OrgY);
	C.DrawTile(FinalBlend'BWBP_SKC_Tex.SKAR.SKAR-StaticFinal', float(C.SizeX), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	// End:0x135
	if(ColorMod == none)
	{
		return;
	}
	C.Style = 5;
	Start = Instigator.Location + Instigator.EyePosition();
	j = 0;
	J0x172:

	// End:0x8D5 [Loop If]
	if(j < PawnList.Length)
	{
		// End:0x8CB
		if((PawnList[j] != none) && PawnList[j] != Level.GetLocalPlayerController().Pawn)
		{
			P = PawnList[j];
			bFocused = false;
			bLOS = false;
			ThermalRange = default.ThermalRange + (float(2000) * FMin(1.0000000, VSize(P.Velocity) / float(450)));
			dist = VSize(P.Location - Instigator.Location);
			// End:0x24C
			if(dist > ThermalRange)
			{
				// [Explicit Continue]
				goto J0x8CB;
			}
			DotP = Normal(P.Location - Start) Dot Vector(Instigator.GetViewRotation());
			// End:0x2B0
			if(DotP < Cos((Instigator.Controller.FovAngle / 1.7000000) * 0.0174530))
			{
				// [Explicit Continue]
				goto J0x8CB;
			}
			// End:0x2CF
			if(Instigator.LineOfSightTo(P))
			{
				bLOS = true;
			}
			// End:0x8C8
			if(bLOS)
			{
				DotP = (DotP - 0.6000000) / 0.4000000;
				DotP = FMax(DotP, 0.0000000);
				// End:0x339
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
				J0x3E6:

				// End:0x45C [Loop If]
				if(i < Max(2, OldSkinCount))
				{
					// End:0x42B
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
					goto J0x3E6;
				}
				P.bUnlit = true;
				i = 0;
				J0x474:

				// End:0x687 [Loop If]
				if(i < P.Attached.Length)
				{
					// End:0x67D
					if(P.Attached[i] != none)
					{
						// End:0x65D
						if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
						{
							// End:0x55E
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
							// End:0x604
							if(P.Attached[i].Skins.Length > 1)
							{
								AttOldSkins1[i] = P.Attached[i].Skins[1];
								P.Attached[i].Skins[1] = ColorMod;
							}
							// End:0x65A
							if(P.Attached[i].Skins.Length > 1)
							{
								AttOldSkins1[i] = none;
								P.Attached[i].Skins[1] = ColorMod;
							}
							// [Explicit Continue]
							goto J0x67D;
						}
						P.Attached[i].SetDrawType(0);
					}
					J0x67D:

					i++;
					// [Loop Continue]
					goto J0x474;
				}
				C.DrawActor(P, false, true);
				P.Skins.Length = OldSkinCount;
				i = 0;
				J0x6B6:

				// End:0x6F9 [Loop If]
				if(i < P.Skins.Length)
				{
					P.Skins[i] = OldSkins[i];
					i++;
					// [Loop Continue]
					goto J0x6B6;
				}
				P.bUnlit = false;
				i = 0;
				J0x711:

				// End:0x8B5 [Loop If]
				if(i < P.Attached.Length)
				{
					// End:0x8AB
					if(P.Attached[i] != none)
					{
						// End:0x870
						if((Pawn(P.Attached[i]) != none) || ONSWeapon(P.Attached[i]) != none)
						{
							// End:0x817
							if(AttOldSkins1[i] == none)
							{
								// End:0x7C9
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
							goto J0x8AB;
						}
						P.Attached[i].SetDrawType(P.Attached[i].default.DrawType);
					}
					J0x8AB:

					i++;
					// [Loop Continue]
					goto J0x711;
				}
				AttOldSkins0.Length = 0;
				AttOldSkins1.Length = 0;
				// [Explicit Continue]
				goto J0x8CB;
			}
			// [Explicit Continue]
		}
		J0x8CB:

		j++;
		// [Loop Continue]
		goto J0x172;
	}
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

simulated function LoadGrenade()
{
	// End:0x23
	if((Ammo[1].AmmoAmount < 1) || bLoaded)
	{
		return;
	}
	// End:0x51
	if(int(ReloadState) == int(0))
	{
		ReloadState = 9;
		PlayAnim(GrenadeLoadAnim, ReloadAnimRate + 0.1000000,, 0);
	}
	//return;	
}

simulated function Notify_ClipUp()
{
	SetBoneScale(2, 1.0000000, BulletBone);
	SetBoneScale(3, 1.0000000, BulletBone2);
	//return;	
}

simulated function Notify_ClipOut()
{
	super.Notify_ClipOut();
	// End:0x35
	if(MagAmmo < 1)
	{
		SetBoneScale(2, 0.0000000, BulletBone);
		SetBoneScale(3, 0.0000000, BulletBone2);
	}
	//return;	
}

simulated function Notify_GrenVisible()
{
	SetBoneScale(0, 1.0000000, GrenBone);
	SetBoneScale(1, 1.0000000, GrenBoneBase);
	ReloadState = 2;
	//return;	
}

simulated function Notify_GrenSlide()
{
	PlaySound(GrenSlideSound, 1, 2.2000000,, 64.0000000);
	//return;	
}

simulated function Notify_GrenLoaded()
{
	local Inventory Inv;

	// End:0x12
	if(int(ReloadState) == int(0))
	{
		return;
	}
	ReloadState = 3;
	G51Attachment(ThirdPersonActor).bGrenadier = true;
	G51Attachment(ThirdPersonActor).IAOverride(true);
	Ammo[1].UseAmmo(1, true);
	bLoaded = true;
	// End:0xD3
	if(Ammo[1].AmmoAmount == 0)
	{
		Inv = Instigator.Inventory;
		J0x8A:

		// End:0xD3 [Loop If]
		if(Inv != none)
		{
			// End:0xBC
			if(ChaffGrenadeWeapon(Inv) != none)
			{
				ChaffGrenadeWeapon(Inv).RemoteKill();
				// [Explicit Break]
				goto J0xD3;
			}
			Inv = Inv.Inventory;
			// [Loop Continue]
			goto J0x8A;
		}
	}
	J0xD3:

	//return;	
}

simulated function Notify_GrenReady()
{
	ReloadState = 0;
	//return;	
}

simulated function Notify_GrenLaunch()
{
	SetBoneScale(0, 0.0000000, GrenBone);
	G51Attachment(ThirdPersonActor).IAOverride(false);
	G51Attachment(ThirdPersonActor).bGrenadier = false;
	//return;	
}

simulated function Notify_GrenInvisible()
{
	SetBoneScale(1, 0.0000000, GrenBoneBase);
	//return;	
}

simulated function PlayReload()
{
	// End:0x29
	if(MagAmmo < 1)
	{
		ReloadAnim = 'ReloadEmpty';
		ClipHitSound.Sound = ClipInSoundEmpty;		
	}
	else
	{
		ReloadAnim = 'Reload';
		ClipHitSound.Sound = default.ClipHitSound.Sound;
	}
	// End:0x76
	if(!bLoaded)
	{
		SetBoneScale(0, 0.0000000, GrenBone);
		SetBoneScale(1, 0.0000000, GrenBoneBase);
	}
	SafePlayAnim(ReloadAnim, ReloadAnimRate,, 0, "RELOAD");
	//return;	
}

simulated function IndirectLaunch()
{
	//return;	
}

simulated function float RateSelf()
{
	// End:0x19
	if(!HasAmmo())
	{
		CurrentRating = 0.0000000;		
	}
	else
	{
		// End:0x65
		if((Ammo[0].AmmoAmount < 1) && MagAmmo < 1)
		{
			CurrentRating = Instigator.Controller.RateWeapon(self) * 0.3000000;			
		}
		else
		{
			return super.RateSelf();
		}
	}
	return CurrentRating;
	//return;	
}

function byte BestMode()
{
	local Bot B;

	// End:0x22
	if((bHasIR || bSilenced) || bNoaltfire)
	{
		return 0;
	}
	B = Bot(Instigator.Controller);
	// End:0x5F
	if((B == none) || B.Enemy == none)
	{
		return 0;
	}
	// End:0xE9
	if(B.Skill > float(Rand(6)))
	{
		// End:0xE6
		if((AimComponent.GetChaos() < 0.1000000) || (AimComponent.GetChaos() < 0.5000000) && VSize(B.Enemy.Location - Instigator.Location) > float(500))
		{
			return 1;
		}		
	}
	else
	{
		// End:0xF8
		if(FRand() > 0.7500000)
		{
			return 1;
		}
	}
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;

	B = Bot(Instigator.Controller);
	// End:0x40
	if((B == none) || B.Enemy == none)
	{
		return AIRating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	Result = super.GetAIRating();
	// End:0xA9
	if(dist < float(500))
	{
		Result -= (float(1) - (dist / float(500)));		
	}
	else
	{
		// End:0xDB
		if(dist < float(3000))
		{
			Result += ((dist - float(1000)) / float(2000));			
		}
		else
		{
			Result = (Result + 0.6600000) - ((dist - float(3000)) / float(2500));
		}
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.5000000;
	//return;	
}

defaultproperties
{
	GrenadeLoadAnim="LoadGrenade"
	GrenBone="Grenade"
	GrenBoneBase="GrenadeHandle"
	GrenSlideSound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-GrenLock'
	ClipInSoundEmpty=Sound'BWBP_SKC_Sounds.MJ51.MJ51-MagInEmpty'
	BulletBone="Bullet1"
	BulletBone2="Bullet2"
	ThermalOnSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ThermalOffSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75ThermalOff',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	WallVisionSkin=FinalBlend'BW_Core_WeaponTex.M75.OrangeFinal'
	Flaretex=FinalBlend'BW_Core_WeaponTex.M75.OrangeFlareFinal'
	ThermalRange=25000.0000000
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;20.0;0.9;75.0;0.8;0.7;0.2")
	AIReloadTime=1.0000000
	SightAnimScale=0.3000000
	ParamsClasses[0]=Class'BWBP_SKC_Pro.G51WeaponParamsComp'
	ParamsClasses[1]=Class'BWBP_SKC_Pro.G51WeaponParamsClassic'
	ParamsClasses[2]=Class'BWBP_SKC_Pro.G51WeaponParamsRealistic'
	ParamsClasses[3]=Class'BWBP_SKC_Pro.G51WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BWBP_SKC_Tex.G51.BigIcon_G51'
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-PullOut',Volume=0.2230000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Putaway',Volume=0.2700000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=1
	bNoCrosshairInScope=true
	SightBobScale=0.2000000
	CockSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Cock',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	CockSelectSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Cock',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-MagOut',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-MagInEmpty',Volume=1.8000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.M50Out',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.M50In',USize1=128,VSize1=128,USize2=128,VSize2=128,Color1=(R=255,G=0,B=0,A=158),Color2=(R=255,G=255,B=0,A=255),StartSize1=75,StartSize2=72)
	LongGunOffset=(X=10.0000000,Y=10.0000000,Z=-11.0000000)
	bWT_Bullet=true
	SightingTime=0.2000000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=-0.1200000)
	CockingBringUpTime=1.4000000
	GunLength=50.0000000
	FireModeClass[0]=Class'BWBP_SKC_Pro.G51PrimaryFire'
	FireModeClass[1]=Class'BWBP_SKC_Pro.G51SecondaryFire'
	IdleAnimRate=0.2000000
	PutDownTime=0.7000000
	BringUpTime=0.9000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.6000000
	CurrentRating=0.6000000
	Description="G51 Carbine||Manufacturer: Majestic Firearms 12|Primary: 5.56mm Rifle Fire|Secondary: Attach Smoke Grenade||The G51 is a 3-round burst carbine based off the popular SCAR-LK platform. While the S-AR 12 is the UTC's weapon of choice for close range engagements, the G51 is often seen in the hands of MP and urban security details. When paired with its native MOA-C Rifle Grenade attachment, the G51 makes an efficient riot control weapon. |Majestic Firearms 12 designed their G51 carbine alongside their MOA-C Chaff Grenade to produce a rifle with grenade launching capabilities without the need of a bulky launcher that has to be sperately maintained. Utilizing a hardened tungsten barrel and an advanced rifle grenade design, a soldier is able to seamlessly ready a grenade projectile without having to rechamber specilized rounds"
	Priority=41
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=4
	PickupClass=Class'BWBP_SKC_Pro.G51Pickup'
	PlayerViewOffset=(X=4.0000000,Y=4.5000000,Z=-3.0000000)
	AttachmentClass=Class'BWBP_SKC_Pro.G51Attachment'
	IconMaterial=Texture'BWBP_SKC_Tex.G51.SmallIcon_G51'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="G51 Carbine"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.G51Carbine_FPm'
	DrawScale=0.3000000
}
