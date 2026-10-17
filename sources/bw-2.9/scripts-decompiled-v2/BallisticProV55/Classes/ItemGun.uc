class ItemGun extends Weapon
	config
	hidedropdown
	cacheexempt;

var Mut_ItemizerTool IMut;

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

simulated function Weapon WeaponChange(byte F, bool bSilent)
{
	// End:0x1F
	if(IMut != none)
	{
		IMut.KeyPress(F);
	}
	return none;
	//return;	
}

simulated function NewDrawWeaponInfo(Canvas C, float YPos)
{
	local int i;
	local float ScaleFactor;

	super.NewDrawWeaponInfo(C, YPos);
	// End:0x1D
	if(IMut == none)
	{
		return;
	}
	ScaleFactor = C.ClipX / float(1600);
	C.CurX = C.OrgX;
	C.CurY = C.OrgY + ((float(200) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
	C.SetDrawColor(0, 0, 64, 64);
	C.Style = 5;
	C.DrawTile(Texture'Engine.MenuWhite', (300.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale, (300.0000000 * ScaleFactor) * Class'Engine.HUD'.default.HudScale, 0.0000000, 0.0000000, 1.0000000, 1.0000000);
	i = 0;
	J0x11D:

	// End:0x211 [Loop If]
	if(i < 10)
	{
		// End:0x161
		if(IMut.SelectedItem == i)
		{
			C.DrawColor = Class'Engine.HUD'.default.GoldColor;			
		}
		else
		{
			C.DrawColor = Class'Engine.HUD'.default.WhiteColor;
		}
		C.CurX = C.OrgX + float(5);
		C.CurY = C.OrgY + ((float(200 + (30 * i)) * ScaleFactor) * Class'Engine.HUD'.default.HudScale);
		C.DrawText(IMut.MenuText[i], false);
		i++;
		// [Loop Continue]
		goto J0x11D;
	}
	//return;	
}

simulated function BringUp(optional Weapon PrevWeapon)
{
	local Mutator mut;

	super.BringUp();
	mut = Level.Game.BaseMutator;
	J0x23:

	// End:0x67 [Loop If]
	if(mut != none)
	{
		// End:0x50
		if(Mut_ItemizerTool(mut) != none)
		{
			IMut = Mut_ItemizerTool(mut);
			return;
		}
		mut = mut.NextMutator;
		// [Loop Continue]
		goto J0x23;
	}
	Log("Item gun could not link to Itemizer mutator", 'Warning');
	//return;	
}

defaultproperties
{
	FireModeClass[0]=Class'BallisticProV55.ItemgunFire'
	FireModeClass[1]=Class'BallisticProV55.ItemgunFire'
	PutDownAnim="PutDown"
	IdleAnimRate=0.2500000
	SelectSound=Sound'WeaponSounds.Misc.translocator_change'
	SelectForce="Translocator_change"
	AIRating=-999.0000000
	CurrentRating=-999.0000000
	bShowChargingBar=true
	bCanThrow=false
	Description="item gun."
	Priority=231
	HudColor=(R=0,G=0,B=255,A=255)
	SmallViewOffset=(X=38.0000000,Y=16.0000000,Z=-16.0000000)
	CenteredOffsetY=0.0000000
	CenteredRoll=0
	CustomCrosshair=2
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Circle1"
	InventoryGroup=10
	PickupClass=Class'XWeapons.Transpickup'
	PlayerViewOffset=(X=28.5000000,Y=12.0000000,Z=-12.0000000)
	PlayerViewPivot=(Pitch=1000,Yaw=400,Roll=0)
	AttachmentClass=Class'XWeapons.TransAttachment'
	IconMaterial=Texture'HUDContent.Generic.HUD'
	IconCoords=(X1=0,Y1=0,X2=2,Y2=2)
	ItemName="Item Gun"
	Mesh=SkeletalMesh'NewWeapons2004.NewTranslauncher_1st'
	DrawScale=0.8000000
	Skins[0]=FinalBlend'EpicParticles.JumpPad.NewTransLaunBoltFB'
	Skins[1]=Texture'WeaponSkins.Skins.NEWTranslocatorTEX'
	Skins[2]=Texture'WeaponSkins.AmmoPickups.NEWTranslocatorPUCK'
	Skins[3]=FinalBlend'WeaponSkins.AmmoPickups.NewTransGlassFB'
}
