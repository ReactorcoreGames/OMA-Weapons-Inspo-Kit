class SRS900Rifle extends BallisticWeapon
	config(BallisticProV55);

var float LastRangeFound;
var float LastStabilityFound;
var float StealthRating;
var float StealthImps;
var float ZRefHeight;
var() bool bHasSuppressor;
var() bool bSilenced;
var() name SilencerBone;
var() name SilencerOnAnim;
var() name SilencerOffAnim;
var() Sound SilencerOnSound;
var() Sound SilencerOffSound;
var() Material ScopeViewTexAlt;
var() Material ScopeViewOverlayTexClassic;
var() Material BulletTex;
var() Material ReadoutTex;
var() Material ElevationRulerTex;
var() Material ElevationGraphTex;
var() Material RangeRulerTex;
var() Material RangeCursorTex;
var() Material RangeTitleTex;
var() Material StealthBackTex;
var() Material StealthTex;
var() Material StabTitleTex;
var() Material StabBackTex;
var() Material StabCurveTex;
var() Material GeneralUITexArena;
var() Material ScopeViewOverlayTexArena;
var() Material ReadoutTexArena;
var() Material ElevationRulerTexArena;
var() Material ElevationGraphTexArena;
var() Material RangeRulerTexArena;
var() Material RangeCursorTexArena;
var() Material RangeTitleTexArena;
var() Material StealthBackTexArena;
var() Material StealthTexArena;
var() Material StabTitleTexArena;
var() Material StabBackTexArena;
var() Material StabCurveTexArena;

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerSwitchSilencer;
}

simulated function PostNetBeginPlay()
{
	local NavigationPoint N;
	local float TotalZ;
	local int ZCount;

	super.PostNetBeginPlay();
	N = Level.NavigationPointList;
	J0x1A:

	// End:0x5D [Loop If]
	if(N != none)
	{
		TotalZ += N.Location.Z;
		ZCount++;
		N = N.nextNavigationPoint;
		// [Loop Continue]
		goto J0x1A;
	}
	// End:0x7C
	if(ZCount > 0)
	{
		ZRefHeight = TotalZ / float(ZCount);
	}
	//return;	
}

simulated function OnWeaponParamsChanged()
{
	super.OnWeaponParamsChanged();
	assert(WeaponParams != none);
	bHasSuppressor = true;
	// End:0x6A
	if(InStr(WeaponParams.LayoutTags, "irons") != -1)
	{
		SightAnimScale = 0.7500000;
		SightBobScale = 0.1000000 * Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle().default.SightBobScale;
	}
	// End:0x99
	if(InStr(WeaponParams.LayoutTags, "no_suppress") != -1)
	{
		bHasSuppressor = false;
	}
	// End:0xDF
	if(InStr(WeaponParams.LayoutTags, "start_suppressed") != -1)
	{
		bSilenced = true;
		ApplySuppressorAim();
		SightingTime *= 1.2500000;
	}
	//return;	
}

simulated function ClientPlayerDamaged(int Damage)
{
	super.ClientPlayerDamaged(Damage);
	// End:0x31
	if(Instigator.IsLocallyControlled())
	{
		StealthImpulse(FMin(0.8000000, float(Damage)));
	}
	//return;	
}

simulated function ClientJumped()
{
	super.ClientJumped();
	// End:0x23
	if(Instigator.IsLocallyControlled())
	{
		StealthImpulse(0.1500000);
	}
	//return;	
}

simulated function StealthImpulse(float Amount)
{
	// End:0x2B
	if(Instigator.IsLocallyControlled())
	{
		StealthImps = FMin(1.0000000, StealthImps + Amount);
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	local float Speed, NewSR, P;
	local Vector Start, HitLoc, HitNorm;
	local Actor t;

	super.WeaponTick(dt);
	// End:0x21
	if(!Instigator.IsLocallyControlled())
	{
		return;
	}
	// End:0x67
	if(Instigator.Base != none)
	{
		Speed = VSize(Instigator.Velocity - Instigator.Base.Velocity);		
	}
	else
	{
		Speed = VSize(Instigator.Velocity);
	}
	// End:0x9D
	if(Instigator.bIsCrouched)
	{
		NewSR = 0.0600000;		
	}
	else
	{
		NewSR = 0.2000000;
	}
	// End:0xE8
	if(Speed > (Instigator.WalkingPct * Instigator.GroundSpeed))
	{
		NewSR += (Speed / float(1100));		
	}
	else
	{
		NewSR += (Speed / float(1900));
	}
	NewSR = FMin(1.0000000, NewSR + StealthImps);
	P = NewSR - StealthRating;
	P = P / Abs(P);
	StealthRating = FClamp(StealthRating + (P * dt), NewSR, StealthRating);
	StealthImps = FMax(0.0000000, StealthImps - (dt / float(4)));
	// End:0x21C
	if(int(ClientState) == int(4))
	{
		Start = Instigator.Location + Instigator.EyePosition();
		t = Trace(HitLoc, HitNorm, Start + (Vector(Instigator.GetViewRotation()) * float(40000)), Start, true);
		// End:0x208
		if(t == none)
		{
			LastRangeFound = -1.0000000;			
		}
		else
		{
			LastRangeFound = VSize(HitLoc - Start);
		}
	}
	//return;	
}

function ServerSwitchSilencer(bool bDetachSuppressor)
{
	SwitchSilencer(bSilenced);
	//return;	
}

simulated exec function WeaponSpecial(optional byte i)
{
	// End:0x0D
	if(!bHasSuppressor)
	{
		return;
	}
	// End:0x31
	if((int(ReloadState) != int(0)) || int(SightingState) != int(0))
	{
		return;
	}
	TemporaryScopeDown(0.5000000);
	ServerSwitchSilencer(bSilenced);
	SwitchSilencer(bSilenced);
	ReloadState = 9;
	StealthImpulse(0.1000000);
	//return;	
}

simulated function SwitchSilencer(bool bDetachSuppressor)
{
	// End:0x18
	if(int(Role) == int(ROLE_Authority))
	{
		bServerReloading = true;
	}
	ReloadState = 9;
	// End:0x34
	if(bDetachSuppressor)
	{
		PlayAnim(SilencerOffAnim);		
	}
	else
	{
		PlayAnim(SilencerOnAnim);
	}
	OnSuppressorSwitched();
	//return;	
}

simulated function OnSuppressorSwitched()
{
	// End:0x1E
	if(bSilenced)
	{
		ApplySuppressorAim();
		SightingTime *= 1.2500000;		
	}
	else
	{
		AimComponent.Recalculate();
		SightingTime = default.SightingTime;
	}
	//return;	
}

simulated function OnAimParamsChanged()
{
	super.OnAimParamsChanged();
	// End:0x15
	if(bSilenced)
	{
		ApplySuppressorAim();
	}
	//return;	
}

simulated function ApplySuppressorAim()
{
	AimComponent.AimSpread.Min *= 1.2500000;
	AimComponent.AimSpread.Max *= 1.2500000;
	//return;	
}

simulated function Notify_SilencerOn()
{
	PlaySound(SilencerOnSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerOff()
{
	PlaySound(SilencerOffSound,, 0.5000000);
	//return;	
}

simulated function Notify_SilencerShow()
{
	SetBoneScale(0, 1.0000000, SilencerBone);
	bSilenced = true;
	SRS900PrimaryFire(bFireMode[0]).SetSilenced(true);
	//return;	
}

simulated function Notify_SilencerHide()
{
	SetBoneScale(0, 0.0000000, SilencerBone);
	bSilenced = false;
	SRS900PrimaryFire(bFireMode[0]).SetSilenced(false);
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	// End:0x34
	if(AIController(Instigator.Controller) != none)
	{
		bSilenced = FRand() > 0.5000000;
	}
	// End:0x51
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	//return;	
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale(1, 1.0000000, 'Bullet');
	//return;	
}

simulated function PlayReload()
{
	super.PlayReload();
	StealthImpulse(0.1000000);
	// End:0x2D
	if(MagAmmo < 1)
	{
		SetBoneScale(1, 0.0000000, 'Bullet');
	}
	// End:0x4A
	if(bSilenced)
	{
		SetBoneScale(0, 1.0000000, SilencerBone);		
	}
	else
	{
		SetBoneScale(0, 0.0000000, SilencerBone);
	}
	//return;	
}

static function Class<Pickup> RecommendAmmoPickup(int Mode)
{
	return Class'BallisticProV55.AP_SRS900Clip';
	//return;	
}

simulated function DrawNewScope(Canvas C)
{
	local PlayerController PC;
	local float ScaleFactor, XL, XY;

	ScaleFactor = C.ClipY / float(1200);
	// End:0x2A
	if(ScopeViewTex == none)
	{
		return;
	}
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.DrawTile(ScopeViewOverlayTexArena, float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 256.0000000, 256.0000000);
	C.SetDrawColor(byte(255), 0, 0, 96);
	C.SetPos((C.ClipX / float(2)) + (float(156) * ScaleFactor), (C.ClipY / float(2)) - (float(12 * (default.MagAmmo / 2)) * ScaleFactor));
	C.DrawTile(BulletTex, 51.0000000 * ScaleFactor, (12.0000000 * float(default.MagAmmo)) * ScaleFactor, 0.0000000, 0.0000000, 256.0000000, 64.0000000 * float(default.MagAmmo));
	// End:0x344
	if(MagAmmo > 0)
	{
		C.SetDrawColor(byte(255), 128, 64, byte(255));
		C.SetPos((C.ClipX / float(2)) + (float(156) * ScaleFactor), (C.ClipY / float(2)) + (float((12 * (default.MagAmmo / 2)) - (12 * MagAmmo)) * ScaleFactor));
		C.DrawTile(BulletTex, 51.0000000 * ScaleFactor, 12.0000000 * ScaleFactor, 0.0000000, 0.0000000, 256.0000000, 64.0000000);
		// End:0x344
		if(MagAmmo > 1)
		{
			C.SetDrawColor(byte(255), 0, 0, byte(255));
			C.SetPos((C.ClipX / float(2)) + (float(156) * ScaleFactor), (C.ClipY / float(2)) + (float((12 * (default.MagAmmo / 2)) - (12 * (MagAmmo - 1))) * ScaleFactor));
			C.DrawTile(BulletTex, 51.0000000 * ScaleFactor, (12.0000000 * float(MagAmmo - 1)) * ScaleFactor, 0.0000000, 0.0000000, 256.0000000, 64.0000000 * float(MagAmmo - 1));
		}
	}
	C.SetDrawColor(byte(255), 0, 0, byte(255));
	C.SetPos((C.ClipX / float(2)) - (float(262) * ScaleFactor), (C.ClipY / float(2)) - (float(179) * ScaleFactor));
	C.DrawTile(GeneralUITexArena, 91.0000000 * ScaleFactor, 358.0000000 * ScaleFactor, 1.0000000, 2.0000000, 63.0000000, 252.0000000);
	C.SetPos((C.ClipX / float(2)) + (float(171) * ScaleFactor), (C.ClipY / float(2)) - (float(179) * ScaleFactor));
	C.DrawTile(GeneralUITexArena, 91.0000000 * ScaleFactor, 358.0000000 * ScaleFactor, 64.0000000, 2.0000000, 63.0000000, 252.0000000);
	C.SetDrawColor(byte(255), 0, 0, 96);
	C.SetPos((C.ClipX / float(2)) - (float(262) * ScaleFactor), (C.ClipY / float(2)) - (float(179) * ScaleFactor));
	C.DrawTile(GeneralUITexArena, 91.0000000 * ScaleFactor, 358.0000000 * ScaleFactor, 128.0000000, 2.0000000, 63.0000000, 252.0000000);
	C.SetDrawColor(byte(255), 0, 0, byte(255));
	C.SetPos((C.ClipX / float(2)) - (float(262) * ScaleFactor), (C.ClipY / float(2)) + ((float(179) - (float(358) * StealthRating)) * ScaleFactor));
	C.DrawTile(GeneralUITexArena, 91.0000000 * ScaleFactor, (358.0000000 * StealthRating) * ScaleFactor, 128.0000000, 254.0000000 - (float(252) * StealthRating), 63.0000000, 252.0000000 * StealthRating);
	C.SetDrawColor(byte(255), 0, 0, byte(255));
	C.SetPos((C.ClipX / float(2)) - (float(38) * ScaleFactor), (C.ClipY / float(2)) - (float(218) * ScaleFactor));
	// End:0x6B8
	if(int(CurrentWeaponMode) == 1)
	{
		C.DrawTile(GeneralUITexArena, 38.0000000 * ScaleFactor, 38.0000000 * ScaleFactor, 192.0000000, 0.0000000, 32.0000000, 32.0000000);		
	}
	else
	{
		// End:0x702
		if(int(CurrentWeaponMode) == 0)
		{
			C.DrawTile(GeneralUITexArena, 38.0000000 * ScaleFactor, 38.0000000 * ScaleFactor, 224.0000000, 0.0000000, 32.0000000, 32.0000000);
		}
	}
	PC = PlayerController(Instigator.Controller);
	// End:0x89E
	if(PC != none)
	{
		C.SetDrawColor(byte(255), 0, 0, byte(255));
		C.SetPos((C.ClipX / float(2)) + (float(0) * ScaleFactor), (C.ClipY / float(2)) - (float(218) * ScaleFactor));
		// End:0x7F9
		if((PC.DefaultFOV / PC.DesiredFOV) <= 3.2000000)
		{
			C.DrawTile(GeneralUITexArena, 38.0000000 * ScaleFactor, 38.0000000 * ScaleFactor, 192.0000000, 64.0000000, 32.0000000, 32.0000000);			
		}
		else
		{
			// End:0x861
			if((PC.DefaultFOV / PC.DesiredFOV) <= 6.4000000)
			{
				C.DrawTile(GeneralUITexArena, 38.0000000 * ScaleFactor, 38.0000000 * ScaleFactor, 192.0000000, 96.0000000, 32.0000000, 32.0000000);				
			}
			else
			{
				C.DrawTile(GeneralUITexArena, 38.0000000 * ScaleFactor, 38.0000000 * ScaleFactor, 192.0000000, 128.0000000, 32.0000000, 32.0000000);
			}
		}
	}
	C.SetDrawColor(byte(255), 0, 0, byte(255));
	C.SetPos((C.ClipX / float(2)) - (float(38) * ScaleFactor), (C.ClipY / float(2)) - (float(256) * ScaleFactor));
	// End:0x958
	if(!bSilenced)
	{
		C.DrawTile(GeneralUITexArena, 76.0000000 * ScaleFactor, 38.0000000 * ScaleFactor, 192.0000000, 192.0000000, 64.0000000, 32.0000000);		
	}
	else
	{
		C.DrawTile(GeneralUITexArena, 76.0000000 * ScaleFactor, 38.0000000 * ScaleFactor, 192.0000000, 224.0000000, 64.0000000, 32.0000000);
	}
	C.SetDrawColor(byte(255), 0, 0, byte(255));
	C.Font = GetFontSizeIndex(C, -6 + int(((float(2) * Class'Engine.HUD'.default.HudScale) * (C.ClipY / C.ClipX)) * float(4 / 3)));
	// End:0xAFF
	if(LastRangeFound >= float(0))
	{
		C.StrLen("999.99 m", XL, XY);
		C.DrawTextJustified(string(FMin(999.9900000, LastRangeFound / 52.5000000)) $ " m", 2, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) + (float(179) * ScaleFactor)) - XY, (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) + (float(179) * ScaleFactor)) + XY);		
	}
	else
	{
		C.StrLen("N/A m", XL, XY);
		C.DrawTextJustified(string(FMin(999.9900000, LastRangeFound / 52.5000000)) $ " m", 2, (C.ClipX / float(2)) - (XL / float(2)), ((C.ClipY / float(2)) + (float(179) * ScaleFactor)) - XY, (C.ClipX / float(2)) + (XL / float(2)), ((C.ClipY / float(2)) + (float(179) * ScaleFactor)) + XY);
	}
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.SetPos(C.OrgX, C.OrgY);
	C.DrawTile(ScopeViewTex, float(C.SizeX - C.SizeY) / float(2), float(C.SizeY), 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	C.SetPos(float(C.SizeX - C.SizeY) / float(2), C.OrgY);
	C.DrawTile(ScopeViewTex, float(C.SizeY), float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
	C.SetPos(float(C.SizeX - ((C.SizeX - C.SizeY) / 2)), C.OrgY);
	C.DrawTile(ScopeViewTex, float(C.SizeX - C.SizeY) / float(2), float(C.SizeY), 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	//return;	
}

simulated function DrawClassicScope(Canvas C)
{
	local float ScaleFactor, HF, ZM, ImageScaleRatio;

	ScaleFactor = C.ClipX / float(1600);
	// End:0x3E1
	if(ScopeViewTexAlt != none)
	{
		C.ColorModulate.W = 1.0000000;
		// End:0x1CE
		if(MagAmmo > 0)
		{
			C.SetDrawColor(byte(255), 128, 64, byte(255));
			C.SetPos(C.OrgX + (float(1273) * ScaleFactor), C.OrgY + (float(840 - (24 * MagAmmo)) * ScaleFactor));
			C.DrawTile(BulletTex, 102.0000000 * ScaleFactor, 24.0000000 * ScaleFactor, 0.0000000, 0.0000000, 256.0000000, 64.0000000);
			// End:0x1CE
			if(MagAmmo > 1)
			{
				C.SetDrawColor(byte(255), 0, 0, byte(255));
				C.SetPos(C.OrgX + (float(1273) * ScaleFactor), C.OrgY + (float(840 - (24 * (MagAmmo - 1))) * ScaleFactor));
				C.DrawTile(BulletTex, 102.0000000 * ScaleFactor, (24.0000000 * float(MagAmmo - 1)) * ScaleFactor, 0.0000000, 0.0000000, 256.0000000, 64.0000000 * float(MagAmmo - 1));
			}
		}
		C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
		C.SetPos(C.OrgX, C.OrgY);
		ImageScaleRatio = 1.2400000;
		C.DrawTile(ScopeViewTexAlt, (float(C.SizeX) - (float(C.SizeY) * ImageScaleRatio)) / float(2), float(C.SizeY), 0.0000000, 0.0000000, 1.0000000, 1024.0000000);
		C.SetPos((float(C.SizeX) - (float(C.SizeY) * ImageScaleRatio)) / float(2), C.OrgY);
		C.DrawTile(ScopeViewTexAlt, float(C.SizeY) * ImageScaleRatio, float(C.SizeY), 0.0000000, 0.0000000, 1024.0000000, 1024.0000000);
		C.SetPos(float(C.SizeX) - ((float(C.SizeX) - (float(C.SizeY) * ImageScaleRatio)) / float(2)), C.OrgY);
		C.DrawTile(ScopeViewTexAlt, (float(C.SizeX) - (float(C.SizeY) * ImageScaleRatio)) / float(2), float(C.SizeY), 0.0000000, 0.0000000, 1.0000000, 1024.0000000);
	}
	C.Font = GetFontSizeIndex(C, -2 + int(float(2) * Class'Engine.HUD'.default.HudScale));
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.SetPos(C.OrgX, C.OrgY + (float(565) * ScaleFactor));
	C.DrawTile(ReadoutTex, 729.0000000 * ScaleFactor, 635.0000000 * ScaleFactor, -1.0000000, 1.0000000, 512.0000000, 512.0000000);
	HF = ((Instigator.Location.Z - ZRefHeight) / float(1024)) - float(int((Instigator.Location.Z - ZRefHeight) / float(1024)));
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.SetPos(C.OrgX + (float(1385) * ScaleFactor), C.OrgY + (float(256) * ScaleFactor));
	C.DrawTile(ElevationRulerTex, 85.0000000 * ScaleFactor, 768.0000000 * ScaleFactor, 0.0000000, 1024.0000000 * HF, 64.0000000, 1024.0000000);
	C.SetPos(C.OrgX + (float(1450) * ScaleFactor), C.OrgY + (float(128) * ScaleFactor));
	C.DrawTile(ElevationGraphTex, 150.0000000 * ScaleFactor, 1024.0000000 * ScaleFactor, 0.0000000, 0.0000000, 128.0000000, 1024.0000000);
	C.SetDrawColor(64, byte(255), 32, byte(255));
	C.SetPos(1300.0000000 * ScaleFactor, 192.0000000 * ScaleFactor);
	C.DrawText("Elevation", false);
	C.SetPos(1300.0000000 * ScaleFactor, 1024.0000000 * ScaleFactor);
	ZM = (Instigator.Location.Z - ZRefHeight) / 44.0000000;
	C.DrawText(string(ZM) $ "m", false);
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.SetPos(C.OrgX + (float(498) * ScaleFactor), C.OrgY);
	C.DrawTile(RangeRulerTex, 602.0000000 * ScaleFactor, 86.0000000 * ScaleFactor, 0.0000000, 0.0000000, 512.0000000, 64.0000000);
	C.SetPos(C.OrgX + (((float(600) + (float(398) * (LastRangeFound / float(15000)))) - float(9)) * ScaleFactor), C.OrgY + (float(12) * ScaleFactor));
	C.DrawTile(RangeCursorTex, 19.0000000 * ScaleFactor, 36.0000000 * ScaleFactor, 0.0000000, 0.0000000, 16.0000000, 32.0000000);
	C.SetPos(C.OrgX + (float(280) * ScaleFactor), C.OrgY + (float(7) * ScaleFactor));
	C.DrawTile(RangeTitleTex, 219.0000000 * ScaleFactor, 62.0000000 * ScaleFactor, 0.0000000, 0.0000000, 256.0000000, 64.0000000);
	C.SetDrawColor(byte(255), 0, 0, byte(255));
	C.SetPos(440.0000000 * ScaleFactor, 23.0000000 * ScaleFactor);
	// End:0x919
	if(LastRangeFound < float(0))
	{
		C.DrawText("N/A", false);		
	}
	else
	{
		C.DrawText(string(LastRangeFound / 52.5000000) $ "m", false);
	}
	C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
	C.SetPos(C.OrgX + (float(184) * ScaleFactor), C.OrgY + (float(705) * ScaleFactor));
	C.DrawTile(StealthBackTex, 432.0000000 * ScaleFactor, 396.0000000 * ScaleFactor, 0.0000000, 0.0000000, 512.0000000, 512.0000000);
	C.SetPos(C.OrgX + (float(184) * ScaleFactor), C.OrgY + ((float(705) + (float(396) * (float(1) - StealthRating))) * ScaleFactor));
	C.DrawTile(StealthTex, 432.0000000 * ScaleFactor, (396.0000000 * StealthRating) * ScaleFactor, 0.0000000, 512.0000000 - (float(512) * StealthRating), 64.0000000, 512.0000000 * StealthRating);
	C.SetPos(C.OrgX + (float(26) * ScaleFactor), C.OrgY + (float(170) * ScaleFactor));
	C.DrawTile(StabTitleTex, 240.0000000 * ScaleFactor, 30.0000000 * ScaleFactor, 0.0000000, 0.0000000, 256.0000000, 32.0000000);
	C.SetPos(C.OrgX + (float(26) * ScaleFactor), C.OrgY + (float(204) * ScaleFactor));
	C.DrawTile(StabBackTex, 227.0000000 * ScaleFactor, 227.0000000 * ScaleFactor, 0.0000000, 0.0000000, 256.0000000, 256.0000000);
	C.SetDrawColor(64, byte(255), 32, byte(255));
	C.SetPos(C.OrgX + (float(26) * ScaleFactor), C.OrgY + (float(204) * ScaleFactor));
	C.DrawTile(StabCurveTex, 227.0000000 * ScaleFactor, 227.0000000 * ScaleFactor, 192.0000000 * (float(1) - AimComponent.GetChaos()), Smerp(1.0000000 - Abs((AimComponent.GetChaos() * float(2)) - float(1)), 0.0000000, 48.0000000), 64.0000000, 64.0000000);
	C.SetDrawColor(0, byte(255), 0, byte(255));
	C.SetPos(64.0000000 * ScaleFactor, 431.0000000 * ScaleFactor);
	C.DrawText(string(int(LastStabilityFound * float(100))) $ "%", false);
	//return;	
}

simulated function DrawScopeOverlays(Canvas C)
{
	// End:0x22
	if(!Class'BCoreProV55.BallisticReplicationInfo'.static.IsClassic())
	{
		DrawNewScope(C);		
	}
	else
	{
		DrawClassicScope(C);
	}
	//return;	
}

simulated event Timer()
{
	local Vector Start, HitLoc, HitNorm;
	local Actor t;

	StealthImpulse((FRand() * 0.1000000) - 0.0500000);
	// End:0xD0
	if(int(ClientState) == int(4))
	{
		Start = Instigator.Location + Instigator.EyePosition();
		t = Trace(HitLoc, HitNorm, Start + (Vector(Instigator.GetViewRotation()) * float(15000)), Start, true);
		// End:0x9E
		if(t == none)
		{
			LastRangeFound = -1.0000000;			
		}
		else
		{
			LastRangeFound = VSize(HitLoc - Start);
		}
		LastStabilityFound = 1.0000000 - AimComponent.GetChaos();
		return;
	}
	// End:0xEC
	if(int(ClientState) == int(2))
	{
		SetTimer(0.2000000, true);		
	}
	else
	{
		SetTimer(0.0000000, false);
	}
	super.Timer();
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
	local float dist, rating;

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return AIRating;
	}
	rating = super.GetAIRating();
	// End:0x50
	if(B.Enemy == none)
	{
		return rating;
	}
	dist = VSize(B.Enemy.Location - Instigator.Location);
	return Class'BCoreProV55.BUtil'.static.ReverseDistanceAtten(rating, 0.5000000, dist, 3072.0000000, 2048.0000000);
	//return;	
}

function float SuggestAttackStyle()
{
	return -0.6000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.6000000;
	//return;	
}

defaultproperties
{
	bHasSuppressor=true
	SilencerBone="Silencer"
	SilencerOnAnim="SilencerOn"
	SilencerOffAnim="SilencerOff"
	SilencerOnSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOn'
	SilencerOffSound=Sound'BW_Core_WeaponSound.SRS900.SRS-SilencerOff'
	ScopeViewTexAlt=Texture'BW_Core_WeaponTex.SRS900.SRS900ScopeView'
	ScopeViewOverlayTexClassic=FinalBlend'BW_Core_WeaponTex.SRS900.SRSScopeViewOverlay_FB'
	BulletTex=Texture'BW_Core_WeaponTex.SRS900-UI.ScopeBullet'
	ReadoutTex=Shader'BW_Core_WeaponTex.SRS900-UI.Readout-SD'
	ElevationRulerTex=Texture'BW_Core_WeaponTex.SRS900-UI.ElevationLines'
	ElevationGraphTex=TexPanner'BW_Core_WeaponTex.SRS900-UI.Elevation-G-Panner'
	RangeRulerTex=Texture'BW_Core_WeaponTex.SRS900-UI.RangeLines'
	RangeCursorTex=Texture'BW_Core_WeaponTex.SRS900-UI.RangeCursor'
	RangeTitleTex=Texture'BW_Core_WeaponTex.SRS900-UI.RangeIcon'
	StealthBackTex=Texture'BW_Core_WeaponTex.SRS900-UI.DBMeterBG'
	StealthTex=Shader'BW_Core_WeaponTex.SRS900-UI.DBLevel-SD'
	StabTitleTex=Texture'BW_Core_WeaponTex.SRS900-UI.StabilityIcon'
	StabBackTex=Texture'BW_Core_WeaponTex.SRS900-UI.StabilityScreen'
	StabCurveTex=FinalBlend'BW_Core_WeaponTex.SRS900-UI.StabilityCurve-FB'
	GeneralUITexArena=Texture'BW_Core_WeaponTex.SRS900-SUI.SRS900UI'
	ScopeViewOverlayTexArena=FinalBlend'BW_Core_WeaponTex.SRS900-SUI.SRSScopeViewOverlay_FB'
	SpecialInfo[0]=(Id="EvoDefs",Info="240.0;20.0;0.9;75.0;1.0;0.0;-999.0")
	ParamsClasses[0]=Class'BallisticProV55.SRS900WeaponParamsComp'
	ParamsClasses[1]=Class'BallisticProV55.SRS900WeaponParamsClassic'
	ParamsClasses[2]=Class'BallisticProV55.SRS900WeaponParamsRealistic'
	ParamsClasses[3]=Class'BallisticProV55.SRS900WeaponParamsTactical'
	TeamSkins[0]=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=0)
	BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_SRS900'
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Pullout',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78Putaway',Volume=0.2200000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	CurrentWeaponMode=0
	ScopeXScale=1.3330000
	ZoomInSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomIn',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ZoomOutSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78ZoomOut',Volume=0.5000000,Radius=0.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MinZoom=2.0000000
	MaxZoom=8.0000000
	FullZoomFOV=20.0000000
	ScopeViewTex=Texture'BW_Core_WeaponTex.SRS900-SUI.SRS900ScopeView'
	bNoCrosshairInScope=true
	CockSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-Cock',Volume=0.6500000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-ClipHit',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-ClipOut',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.SRS900.SRS-ClipIn',Volume=0.5000000,Radius=24.0000000,Slot=3,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	ClipInFrame=0.6500000
	NDCrosshairCfg=(Pic1=Texture'BW_Core_WeaponTex.Crosshairs.Misc9',Pic2=Texture'BW_Core_WeaponTex.Crosshairs.Dot1',USize1=256,VSize1=256,USize2=128,VSize2=128,Color1=(R=255,G=255,B=0,A=108),Color2=(R=255,G=0,B=0,A=255),StartSize1=103,StartSize2=19)
	bWT_Bullet=true
	bWT_Machinegun=true
	ManualLines[0]="High-powered battle rifle fire. Long range, good penetration and high per-shot damage. Recoil is significant."
	ManualLines[1]="Attaches a suppressor. This reduces the recoil, but also the effective range. The flash is removed and the gunfire becomes less audible."
	ManualLines[2]="Effective at medium to long range."
	SightOffset=(X=9.0000000,Y=0.0000000,Z=3.1500000)
	MagAmmo=20
	GunLength=72.0000000
	FireModeClass[0]=Class'BallisticProV55.SRS900PrimaryFire'
	FireModeClass[1]=Class'BCoreProV55.BallisticScopeFire'
	PutDownTime=0.4000000
	BringUpTime=0.5000000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.8000000
	CurrentRating=0.8000000
	Description="Designed and refined in NDTR Industries' top notch R&D labs before the war, the SRS is indeed a fine weapon. Using high velocity 7.62mm ammunition, this rifle causes a lot of damage to the target, but suffers from high recoil, chaos and a low clip capacity. The SRS-600 is a civilian variant of the SRS-900, awarded a 10 out of 10 by the Gentleman's Rifle Association for amazing precision and accuracy and was quoted to be 'the best gun for big game and home defense!' The 900 variant can now incorporate a silencer to the end of the barrel, increasing its capabilities as a stealth weapon. This particular model also features a versatile, red-filter scope, complete with various tactical readouts and indicators, including a range finder, stability meter, elevation indicator, ammo display and stealth meter. After 11 years of being backlogged and the Skrith wars dampening sales, gold camos are slated to return to shelves soon."
	Priority=40
	HudColor=(R=200,G=50,B=50,A=255)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=9
	GroupOffset=6
	PickupClass=Class'BallisticProV55.SRS900Pickup'
	PlayerViewOffset=(X=3.0000000,Y=3.0000000,Z=-4.0000000)
	AttachmentClass=Class'BallisticProV55.SRS900Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.SRS900.SmallIcon_SRS900'
	IconCoords=(X1=0,Y1=0,X2=127,Y2=31)
	ItemName="SRS-900 Battle Rifle"
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=5.0000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.SRS900_FPm'
	DrawScale=0.3000000
	Skins[0]=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
	Skins[1]=Texture'BW_Core_WeaponTex.SRS900.SRS900Main'
	Skins[2]=Shader'BW_Core_WeaponTex.SRS900.SRS900ScopeShine'
	Skins[3]=Texture'BW_Core_WeaponTex.SRS900.SRS900Ammo'
	Skins[4]=FinalBlend'BW_Core_WeaponTex.SRS.SRS-HSight-FB'
	Skins[5]=Shader'BW_Core_WeaponTex.SRS.SRS-HSight-S'
}
