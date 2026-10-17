class MGLWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		InventorySize=8
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.5000000
		SightPivot=(Pitch=512,Yaw=0,Roll=0)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Desert'
	begin object name="MGL_Desert" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Desert"
	end object
	Camos[0]=MGL_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Black'
	begin object name="MGL_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MGL_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Jungle'
	begin object name="MGL_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=MGL_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Arctic'
	begin object name="MGL_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainArctic",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=MGL_Arctic
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Purple'
	begin object name="MGL_Purple" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Purple"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainPurble",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=MGL_Purple
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Red'
	begin object name="MGL_Red" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainRed",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=MGL_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Gold'
	begin object name="MGL_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=MGL_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=200.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.MGLGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=150.0000000
	DamageRadius=1050.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-Fire',Volume=9.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.6500000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=200.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.MGLGrenadeRemote'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=150.0000000
	DamageRadius=1050.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-Fire',Volume=9.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.6500000
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
end object
// Reference: AimParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	InventorySize=8
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.5000000
	SightPivot=(Pitch=512,Yaw=0,Roll=0)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Desert'
begin object name="MGL_Desert" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Desert"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Black'
begin object name="MGL_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Jungle'
begin object name="MGL_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Arctic'
begin object name="MGL_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainArctic",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Purple'
begin object name="MGL_Purple" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Purple"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainPurble",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Red'
begin object name="MGL_Red" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainRed",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsTactical.MGL_Gold'
begin object name="MGL_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
