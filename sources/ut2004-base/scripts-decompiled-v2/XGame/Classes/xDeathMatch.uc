class xDeathMatch extends DeathMatch
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var globalconfig bool bCustomPreload;

static function PrecacheGameTextures(LevelInfo MyLevel)
{
	local int i;
	local array<PlayerRecord> AllPlayerList, PlayerList;
	local bool bIsTeamGame;
	local Class<GameInfo> GameClass;
	local Texture LoadedSkin, LoadedSkinBlue, LoadedFace, LoadedFaceBlue;

	MyLevel.AddPrecacheMaterial(Texture'UT2004Weapons.NewWeaps.AssaultRifleTex0');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.bulletpock');
	MyLevel.AddPrecacheMaterial(Texture'WeaponSkins.Skins.GrenadeTex');
	MyLevel.AddPrecacheMaterial(Texture'WeaponSkins.Skins.ShieldTex0');
	MyLevel.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.Minigun_burst');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.Skins.pcl_Spark');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.EmitSmoke_t');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.SmokeTex');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.rocketblastmark');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.FlakTrailTex');
	MyLevel.AddPrecacheMaterial(Texture'ExplosionTex.Framed.we1_frames');
	MyLevel.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	MyLevel.AddPrecacheMaterial(Texture'ExplosionTex.Framed.SmokeReOrdered');
	MyLevel.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp1_frames');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.Skins.Rexpt');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.SmokeAlphab_t');
	MyLevel.AddPrecacheMaterial(Texture'XEffectMat.Shock.shock_ring_b');
	MyLevel.AddPrecacheMaterial(Texture'XEffectMat.Shield.ShieldSpark');
	MyLevel.AddPrecacheMaterial(Texture'XEffectMat.goop.SlimeSkin');
	MyLevel.AddPrecacheMaterial(Texture'XEffectMat.goop.goop_green_a');
	MyLevel.AddPrecacheMaterial(Texture'XGameShaders.PlayerShaders.PlayerShield');
	MyLevel.AddPrecacheMaterial(FinalBlend'XEffectMat.Shield.Shield3rdFB');
	MyLevel.AddPrecacheMaterial(FinalBlend'XEffectMat.Shield.ShieldRip3rdFB');
	MyLevel.AddPrecacheMaterial(Texture'XGameShaders.PlayerShaders.LinkGunShell');
	MyLevel.AddPrecacheMaterial(Texture'Engine.BlobTexture');
	MyLevel.AddPrecacheMaterial(Texture'XGameShaders.PlayerShaders.LEnergy');
	MyLevel.AddPrecacheMaterial(Class'XEffects.NewTransDeresBlue'.default.Texture);
	MyLevel.AddPrecacheMaterial(Texture'intro_characters.CubeMaps.BRface1');
	MyLevel.AddPrecacheMaterial(Texture'AW-2004Particles.Fire.BlastMark');
	MyLevel.AddPrecacheMaterial(Texture'Engine.GRADIENT_Fade');
	MyLevel.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.Skins.BotSpark');
	MyLevel.AddPrecacheMaterial(Texture'InterfaceContent.Menu.SquareBoxA');
	MyLevel.AddPrecacheMaterial(Texture'LastManStanding.LMSLogoSmall');
	MyLevel.AddPrecacheMaterial(Texture'XEffectMat.Combos.redbolt');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.SpeedTrailTex');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.Skins.pcl_ball');
	MyLevel.AddPrecacheMaterial(Texture'XGameShaders.WeaponShaders.minigunflash');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat1');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat2');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat3');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat1P');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat2P');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.BloodSplat3P');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.xbiosplat');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.xbiosplat2');
	MyLevel.AddPrecacheMaterial(Texture'xGameShadersB.Blood.BloodJetc');
	MyLevel.AddPrecacheMaterial(Texture'xGameShadersB.Blood.BloodPuffA');
	MyLevel.AddPrecacheMaterial(Texture'xGameShadersB.Blood.AlienBloodJet');
	MyLevel.AddPrecacheMaterial(Texture'xGameShadersB.Blood.BloodPuffGreen');
	MyLevel.AddPrecacheMaterial(Texture'xGameShadersB.Blood.BloodPuffOil');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.GibOrganicGreen');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.GibOrganicRed');
	MyLevel.AddPrecacheMaterial(Texture'XEffects.GibBot');
	MyLevel.AddPrecacheMaterial(Texture'EpicParticles.Flares.FlickerFlare2');
	// End:0x47E
	if(MyLevel.IsDemoBuild())
	{
		MyLevel.AddPrecacheMaterial(Texture'DemoPlayerSkins.DemoSkeleton');		
	}
	else
	{
		MyLevel.AddPrecacheMaterial(Texture(DynamicLoadObject("PlayerSkins.Human_Skeleton", Class'Engine.Material')));
	}
	// End:0x550
	if(!NeverAllowTransloc())
	{
		MyLevel.AddPrecacheMaterial(Texture'XEffects.Skins.TransTrailT');
		MyLevel.AddPrecacheMaterial(Texture'XGameShaders.PlayerShaders.TransPlayerCell');
		MyLevel.AddPrecacheMaterial(Texture'XGameShaders.PlayerShaders.TransPlayerCellRed');
		MyLevel.AddPrecacheMaterial(Texture'WeaponSkins.Skins.NEWTranslocatorTEX');
		MyLevel.AddPrecacheMaterial(Texture'WeaponSkins.Skins.NEWTranslocatorBLUE');
		MyLevel.AddPrecacheMaterial(Texture'WeaponSkins.AmmoPickups.NEWTranslocatorPUCK');
		MyLevel.AddPrecacheMaterial(Texture'WeaponSkins.AmmoPickups.NEWtranslocatorGlass');
	}
	// End:0x56D
	if(default.bAllowVehicles)
	{
		MyLevel.AddPrecacheMaterial(Texture'HudContent.Generic.NoEntry');
	}
	MyLevel.AddPrecacheMaterial(Texture'EpicParticles.Flares.BurnFlare1');
	MyLevel.AddPrecacheMaterial(Texture'DeRez.Base.DeRezSkin');
	MyLevel.AddPrecacheMaterial(Texture'DeRez.Base.RezTest4');
	MyLevel.AddPrecacheMaterial(Texture'XGame.Water.xCausticRing2');
	MyLevel.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.SparkHead');
	MyLevel.AddPrecacheMaterial(Texture'XGame.Water.xSplashBase');
	MyLevel.AddPrecacheMaterial(Texture'XGame.Water.xWaterDrops2');
	// End:0xC3E
	if((((int(MyLevel.NetMode) == int(NM_ListenServer)) || int(MyLevel.NetMode) == int(NM_Client)) && !MyLevel.bSkinsPreloaded) && ((MyLevel.bShouldPreload && MyLevel.bDesireSkinPreload) && !default.bForceDefaultCharacter) || MyLevel.IsDemoBuild())
	{
		Class'XGame.xUtil'.static.GetPlayerList(AllPlayerList);
		// End:0x73B
		if(!MyLevel.IsDemoBuild())
		{
			MyLevel.ForceLoadTexture(Texture(DynamicLoadObject("UT2004PlayerSkins.XanMk3V2_abdomen", Class'Engine.Material')));
			MyLevel.ForceLoadTexture(Texture(DynamicLoadObject("UT2004PlayerSkins.Skaarj_Skeleton_Body", Class'Engine.Material')));
		}
		i = 0;
		J0x742:

		// End:0x868 [Loop If]
		if(i < AllPlayerList.Length)
		{
			// End:0x85E
			if((AllPlayerList[i].Menu != "DUP") && int(AllPlayerList[i].BotUse) > 0)
			{
				// End:0x85E
				if((((default.bCustomPreload || Left(AllPlayerList[i].BodySkinName, 12) ~= "PlayerSkins.") || Left(AllPlayerList[i].BodySkinName, 18) ~= "UT2004PlayerSkins.") || Left(AllPlayerList[i].BodySkinName, 21) ~= "UT2004ECEPlayerSkins.") || Left(AllPlayerList[i].BodySkinName, 16) ~= "DemoPlayerSkins.")
				{
					PlayerList[PlayerList.Length] = AllPlayerList[i];
				}
			}
			i++;
			// [Loop Continue]
			goto J0x742;
		}
		GameClass = MyLevel.GetGameClass();
		bIsTeamGame = (GameClass != none) && GameClass.default.bTeamGame;
		i = 0;
		J0x8A7:

		// End:0xC3E [Loop If]
		if(i < PlayerList.Length)
		{
			DynamicLoadObject(PlayerList[i].MeshName, Class'Engine.Mesh');
			// End:0x9F0
			if(!bIsTeamGame)
			{
				// End:0x9B3
				if((MyLevel.GRI != none) && MyLevel.GRI.bForceTeamSkins)
				{
					// End:0x984
					if(Class'UnrealGame.DMMutator'.default.bBrightSkins && Left(PlayerList[i].BodySkinName, 12) ~= "PlayerSkins.")
					{
						LoadedSkin = Texture(DynamicLoadObject(("Bright" $ PlayerList[i].BodySkinName) $ "_0B", Class'Engine.Material', true));						
					}
					else
					{
						LoadedSkin = Texture(DynamicLoadObject(PlayerList[i].BodySkinName $ "_0", Class'Engine.Material'));
					}					
				}
				else
				{
					LoadedSkin = Texture(DynamicLoadObject(PlayerList[i].BodySkinName, Class'Engine.Material'));
				}
				MyLevel.ForceLoadTexture(LoadedSkin);				
			}
			else
			{
				// End:0xA9E
				if(Class'UnrealGame.DMMutator'.default.bBrightSkins && Left(PlayerList[i].BodySkinName, 12) ~= "PlayerSkins.")
				{
					LoadedSkin = Texture(DynamicLoadObject(("Bright" $ PlayerList[i].BodySkinName) $ "_0B", Class'Engine.Material', true));
					LoadedSkinBlue = Texture(DynamicLoadObject(("Bright" $ PlayerList[i].BodySkinName) $ "_1B", Class'Engine.Material', true));					
				}
				else
				{
					LoadedSkin = Texture(DynamicLoadObject(PlayerList[i].BodySkinName $ "_0", Class'Engine.Material'));
					LoadedSkinBlue = Texture(DynamicLoadObject(PlayerList[i].BodySkinName $ "_1", Class'Engine.Material'));
					// End:0xB8A
					if(PlayerList[i].TeamFace)
					{
						LoadedFace = Texture(DynamicLoadObject(PlayerList[i].FaceSkinName $ "_0", Class'Engine.Material'));
						LoadedFaceBlue = Texture(DynamicLoadObject(PlayerList[i].FaceSkinName $ "_1", Class'Engine.Material'));
						MyLevel.ForceLoadTexture(LoadedFace);
						MyLevel.ForceLoadTexture(LoadedFaceBlue);
					}
				}
				MyLevel.ForceLoadTexture(LoadedSkin);
				MyLevel.ForceLoadTexture(LoadedSkinBlue);
			}
			// End:0xC02
			if(!PlayerList[i].TeamFace)
			{
				LoadedFace = Texture(DynamicLoadObject(PlayerList[i].FaceSkinName, Class'Engine.Material'));
				MyLevel.ForceLoadTexture(LoadedFace);
			}
			// End:0xC34
			if(PlayerList[i].VoiceClassName != "")
			{
				DynamicLoadObject(PlayerList[i].VoiceClassName, Class'Core.Class');
			}
			i++;
			// [Loop Continue]
			goto J0x8A7;
		}
	}
	//return;	
}

static function PrecacheGameStaticMeshes(LevelInfo MyLevel)
{
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotCalf');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotForearm');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotHand');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotHead');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotTorso');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibBotUpperArm');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicCalf');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicForearm');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicHand');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicHead');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicTorso');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'XEffects.GibOrganicUpperArm');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.Shield');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.GrenadeMesh');
	MyLevel.AddPrecacheStaticMesh(StaticMesh'NewWeaponPickups.AssaultPickupSM');
	// End:0x14B
	if(!NeverAllowTransloc())
	{
		MyLevel.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.NEWTranslocatorPUCK');
	}
	//return;	
}

defaultproperties
{
	DefaultEnemyRosterClass="XGame.xDMRoster"
	DeathMessageClass=Class'XGame.xDeathMessage'
	GameName="DeathMatch"
	ScreenShotName="UT2004Thumbnails.DMShots"
	DecoTextName="XGame.Deathmatch"
	Acronym="DM"
}
