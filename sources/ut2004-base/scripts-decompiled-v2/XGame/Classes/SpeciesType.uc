class SpeciesType extends Object
	abstract
	native;

var string MaleVoice;
var string FemaleVoice;
var string GibGroup;
var string MaleRagSkelName;
var string FemaleRagSkelName;
var string FemaleSkeleton;
var string MaleSkeleton;
var string MaleSoundGroup;
var string FemaleSoundGroup;
var string PawnClassName;
var localized string SpeciesName;
var int RaceNum;
var int DMTeam;
var name TauntAnims[16];
var localized string TauntAnimNames[16];
var float AirControl;
var float GroundSpeed;
var float WaterSpeed;
var float JumpZ;
var float ReceivedDamageScaling;
var float DamageScaling;
var float AccelRate;
var float WalkingPct;
var float CrouchedPct;
var float DodgeSpeedFactor;
var float DodgeSpeedZ;

static function string GetVoiceType(bool bIsFemale, LevelInfo Level)
{
	// End:0x3C
	if(bIsFemale)
	{
		// End:0x36
		if(Level.bLowSoundDetail)
		{
			return "XGame.JuggFemaleVoice";			
		}
		else
		{
			return default.FemaleVoice;
		}
	}
	// End:0x67
	if(Level.bLowSoundDetail)
	{
		return "XGame.JuggMaleVoice";		
	}
	else
	{
		return default.MaleVoice;
	}
	//return;	
}

static function LoadResources(PlayerRecord Rec, LevelInfo Level, PlayerReplicationInfo PRI, int TeamNum)
{
	local string BodySkinName, VoiceType, SkelName, FaceSkinName;
	local Material NewBodySkin, NewFaceSkin, TeamFaceSkin;
	local Class<VoicePack> VoiceClass;
	local Class<xPawnGibGroup> GibGroupClass;
	local Mesh customskel;

	// End:0x2F
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Class'UnrealGame.DeathMatch'.default.bForceDefaultCharacter)
	{
		return;
	}
	DynamicLoadObject(Rec.MeshName, Class'Engine.Mesh');
	// End:0x90
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && Rec.Skeleton != "")
	{
		customskel = Mesh(DynamicLoadObject(Rec.Skeleton, Class'Engine.Mesh'));
	}
	// End:0x102
	if(Rec.Sex ~= "Female")
	{
		SkelName = default.FemaleSkeleton;
		// End:0xEF
		if(Level.bLowSoundDetail)
		{
			DynamicLoadObject("XGame.xJuggFemaleSoundGroup", Class'Core.Class');			
		}
		else
		{
			DynamicLoadObject(default.FemaleSoundGroup, Class'Core.Class');
		}		
	}
	else
	{
		SkelName = default.MaleSkeleton;
		// End:0x148
		if(Level.bLowSoundDetail)
		{
			DynamicLoadObject("XGame.xJuggMaleSoundGroup", Class'Core.Class');			
		}
		else
		{
			DynamicLoadObject(default.MaleSoundGroup, Class'Core.Class');
		}
	}
	// End:0x204
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		// End:0x1B8
		if(Rec.Sex ~= "Female")
		{
			VoiceClass = Class<VoicePack>(DynamicLoadObject("XGame.JuggFemaleVoice", Class'Core.Class'));			
		}
		else
		{
			VoiceClass = Class<VoicePack>(DynamicLoadObject("XGame.JuggMaleVoice", Class'Core.Class'));
		}
		// End:0x202
		if(PRI != none)
		{
			PRI.VoiceType = VoiceClass;
		}
		return;
	}
	// End:0x256
	if(!Level.bLowSoundDetail && Rec.VoiceClassName != "")
	{
		VoiceType = Rec.VoiceClassName;
		VoiceClass = Class<VoicePack>(DynamicLoadObject(VoiceType, Class'Core.Class'));
	}
	// End:0x29B
	if(VoiceClass == none)
	{
		VoiceType = GetVoiceType(Rec.Sex ~= "Female", Level);
		Class<VoicePack>(DynamicLoadObject(VoiceType, Class'Core.Class'));
	}
	// End:0x2C4
	if((customskel == none) && SkelName != "")
	{
		DynamicLoadObject(SkelName, Class'Engine.Mesh');
	}
	NewFaceSkin = Material(DynamicLoadObject(Rec.FaceSkinName, Class'Engine.Material'));
	// End:0x32E
	if(((TeamNum == 255) && Level.GRI != none) && Level.GRI.bForceTeamSkins)
	{
		TeamNum = default.DMTeam;
	}
	// End:0x4DC
	if((TeamNum != 255) && (Level.GRI == none) || !Level.GRI.bNoTeamSkins)
	{
		// End:0x3ED
		if(Class'UnrealGame.DMMutator'.default.bBrightSkins && Left(Rec.BodySkinName, 12) ~= "PlayerSkins.")
		{
			BodySkinName = ((("Bright" $ Rec.BodySkinName) $ "_") $ string(TeamNum)) $ "B";
			NewBodySkin = Material(DynamicLoadObject(BodySkinName, Class'Engine.Material', true));
		}
		// End:0x48E
		if(NewBodySkin == none)
		{
			BodySkinName = (Rec.BodySkinName $ "_") $ string(TeamNum);
			NewBodySkin = Material(DynamicLoadObject(BodySkinName, Class'Engine.Material'));
			// End:0x48E
			if(Rec.TeamFace)
			{
				FaceSkinName = (Rec.FaceSkinName $ "_") $ string(TeamNum);
				TeamFaceSkin = Material(DynamicLoadObject(FaceSkinName, Class'Engine.Material'));
				// End:0x48E
				if(TeamFaceSkin != none)
				{
					NewFaceSkin = TeamFaceSkin;
				}
			}
		}
		// End:0x4D9
		if(NewBodySkin == none)
		{
			Log("TeamSkin not found " $ string(NewBodySkin));
			NewBodySkin = Material(DynamicLoadObject(Rec.BodySkinName, Class'Engine.Material'));
		}		
	}
	else
	{
		NewBodySkin = Material(DynamicLoadObject(Rec.BodySkinName, Class'Engine.Material'));
	}
	// End:0x55B
	if(Rec.BodySkinName ~= "UT2004PlayerSkins.XanMk3V2_Body")
	{
		DynamicLoadObject("UT2004PlayerSkins.XanMk3V2_abdomen", Class'Engine.Material');
	}
	Level.AddPrecacheMaterial(NewBodySkin);
	Level.AddPrecacheMaterial(NewFaceSkin);
	Level.AddPrecacheMaterial(Rec.Portrait);
	GibGroupClass = Class<xPawnGibGroup>(DynamicLoadObject(default.GibGroup, Class'Core.Class'));
	GibGroupClass.static.PrecacheContent(Level);
	//return;	
}

static function int ModifyReceivedDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	return int(float(Damage) * default.ReceivedDamageScaling);
	//return;	
}

static function int ModifyImpartedDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	return int(float(Damage) * default.DamageScaling);
	//return;	
}

static function ModifyPawn(Pawn P)
{
	P.AirControl = P.default.AirControl * default.AirControl;
	P.GroundSpeed = P.default.GroundSpeed * default.GroundSpeed;
	P.WaterSpeed = P.default.WaterSpeed * default.WaterSpeed;
	P.JumpZ = P.default.JumpZ * default.JumpZ;
	P.AccelRate = P.default.AccelRate * default.AccelRate;
	P.WalkingPct = P.default.WalkingPct * default.WalkingPct;
	P.CrouchedPct = P.default.CrouchedPct * default.CrouchedPct;
	P.DodgeSpeedFactor = P.default.DodgeSpeedFactor * default.DodgeSpeedFactor;
	P.DodgeSpeedZ = P.default.DodgeSpeedZ * default.DodgeSpeedZ;
	//return;	
}

static function string GetRagSkelName(string MeshName)
{
	// End:0x1B
	if(InStr(MeshName, "Female") >= 0)
	{
		return default.FemaleRagSkelName;
	}
	return default.MaleRagSkelName;
	//return;	
}

static function SetTeamSkin(xPawn P, PlayerRecord Rec, int TeamNum)
{
	local string BodySkinName, FaceSkinName;
	local Material NewBodySkin, TeamFaceSkin, NewFaceSkin;

	NewFaceSkin = Material(DynamicLoadObject(Rec.FaceSkinName, Class'Engine.Material'));
	P.TeamSkin = byte(TeamNum);
	P.bClearWeaponOffsets = Rec.ZeroWeaponOffsets;
	// End:0x73
	if(TeamNum == 0)
	{
		P.Texture = Texture'XEffects.RedMarker_t';		
	}
	else
	{
		P.Texture = Texture'XEffects.BlueMarker_t';
	}
	// End:0x2AB
	if((TeamNum != 255) && (P.Level.GRI == none) || !P.Level.GRI.bNoTeamSkins)
	{
		// End:0x18B
		if(Class'UnrealGame.DMMutator'.default.bBrightSkins && Left(Rec.BodySkinName, 12) ~= "PlayerSkins.")
		{
			BodySkinName = ((("Bright" $ Rec.BodySkinName) $ "_") $ string(TeamNum)) $ "B";
			NewBodySkin = Material(DynamicLoadObject(BodySkinName, Class'Engine.Material', true));
			// End:0x18B
			if(NewBodySkin != none)
			{
				P.AmbientGlow = byte(0.5000000 * float(P.default.AmbientGlow));
			}
		}
		// End:0x22C
		if(NewBodySkin == none)
		{
			BodySkinName = (Rec.BodySkinName $ "_") $ string(TeamNum);
			NewBodySkin = Material(DynamicLoadObject(BodySkinName, Class'Engine.Material'));
			// End:0x22C
			if(Rec.TeamFace)
			{
				FaceSkinName = (Rec.FaceSkinName $ "_") $ string(TeamNum);
				TeamFaceSkin = Material(DynamicLoadObject(FaceSkinName, Class'Engine.Material'));
				// End:0x22C
				if(TeamFaceSkin != none)
				{
					NewFaceSkin = TeamFaceSkin;
				}
			}
		}
		// End:0x292
		if(NewBodySkin == none)
		{
			Log((("TeamSkin not found " $ string(NewBodySkin)) $ " for ") $ string(P.Mesh));
			NewBodySkin = Material(DynamicLoadObject(Rec.BodySkinName, Class'Engine.Material'));
		}
		P.Skins[0] = NewBodySkin;		
	}
	else
	{
		P.Skins[0] = Material(DynamicLoadObject(Rec.BodySkinName, Class'Engine.Material'));
	}
	P.Skins[1] = NewFaceSkin;
	//return;	
}

static function bool Setup(xPawn P, PlayerRecord Rec)
{
	local Mesh NewMesh, customskel;
	local string VoiceType, SkelName;
	local Class<VoicePack> VoiceClass;
	local int TeamNum, i, j;

	// End:0x14D
	if(P.bAlreadySetup)
	{
		// End:0x14B
		if(int(P.Level.NetMode) == int(NM_Client))
		{
			// End:0x90
			if((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none)
			{
				TeamNum = P.PlayerReplicationInfo.Team.TeamIndex;				
			}
			else
			{
				// End:0x11A
				if(((P.DrivenVehicle != none) && P.DrivenVehicle.PlayerReplicationInfo != none) && P.DrivenVehicle.PlayerReplicationInfo.Team != none)
				{
					TeamNum = P.DrivenVehicle.PlayerReplicationInfo.Team.TeamIndex;
				}
			}
			// End:0x136
			if(int(P.TeamSkin) == TeamNum)
			{
				return true;
			}
			SetTeamSkin(P, Rec, TeamNum);
		}
		return true;
	}
	NewMesh = Mesh(DynamicLoadObject(Rec.MeshName, Class'Engine.Mesh'));
	// End:0x1A5
	if(NewMesh == none)
	{
		Log("Failed to load player mesh " $ Rec.MeshName);
		return false;
	}
	P.bAlreadySetup = true;
	P.LinkMesh(NewMesh);
	P.AssignInitialPose();
	P.bIsFemale = Rec.Sex ~= "Female";
	// End:0x239
	if(P.PlayerReplicationInfo != none)
	{
		P.PlayerReplicationInfo.bIsFemale = P.bIsFemale;
	}
	// End:0x28E
	if((int(P.Level.NetMode) != int(NM_DedicatedServer)) && Rec.Skeleton != "")
	{
		customskel = Mesh(DynamicLoadObject(Rec.Skeleton, Class'Engine.Mesh'));
	}
	// End:0x32C
	if(P.bIsFemale)
	{
		SkelName = default.FemaleSkeleton;
		// End:0x305
		if(P.Level.bLowSoundDetail)
		{
			P.SoundGroupClass = Class<xPawnSoundGroup>(DynamicLoadObject("XGame.xJuggFemaleSoundGroup", Class'Core.Class'));			
		}
		else
		{
			P.SoundGroupClass = Class<xPawnSoundGroup>(DynamicLoadObject(default.FemaleSoundGroup, Class'Core.Class'));
		}		
	}
	else
	{
		SkelName = default.MaleSkeleton;
		// End:0x38F
		if(P.Level.bLowSoundDetail)
		{
			P.SoundGroupClass = Class<xPawnSoundGroup>(DynamicLoadObject("XGame.xJuggMaleSoundGroup", Class'Core.Class'));			
		}
		else
		{
			P.SoundGroupClass = Class<xPawnSoundGroup>(DynamicLoadObject(default.MaleSoundGroup, Class'Core.Class'));
		}
	}
	// End:0x637
	if(int(P.Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x3F7
		if(customskel != none)
		{
			P.SkeletonMesh = customskel;			
		}
		else
		{
			// End:0x427
			if(SkelName != "")
			{
				P.SkeletonMesh = Mesh(DynamicLoadObject(SkelName, Class'Engine.Mesh'));
			}
		}
		TeamNum = 255;
		// End:0x48B
		if((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none)
		{
			TeamNum = P.PlayerReplicationInfo.Team.TeamIndex;			
		}
		else
		{
			// End:0x518
			if(((P.DrivenVehicle != none) && P.DrivenVehicle.PlayerReplicationInfo != none) && P.DrivenVehicle.PlayerReplicationInfo.Team != none)
			{
				TeamNum = P.DrivenVehicle.PlayerReplicationInfo.Team.TeamIndex;				
			}
			else
			{
				// End:0x566
				if((P.Level.GRI != none) && P.Level.GRI.bForceTeamSkins)
				{
					TeamNum = default.DMTeam;
				}
			}
		}
		SetTeamSkin(P, Rec, TeamNum);
		// End:0x637
		if(Rec.UseSpecular && int(P.Level.DetailMode) != int(0))
		{
			P.HighDetailOverlay = Shader'UT2004Weapons.WeaponShader';
			// End:0x637
			if(Rec.BodySkinName ~= "UT2004PlayerSkins.XanMk3V2_Body")
			{
				P.Skins[2] = Material(DynamicLoadObject("UT2004PlayerSkins.XanMk3V2_abdomen", Class'Engine.Material'));
			}
		}
	}
	P.GibGroupClass = Class<xPawnGibGroup>(DynamicLoadObject(default.GibGroup, Class'Core.Class'));
	// End:0x74B
	if(int(P.Level.NetMode) == int(NM_DedicatedServer))
	{
		// End:0x6B4
		if(Rec.Sex ~= "Female")
		{
			VoiceType = "XGame.JuggFemaleVoice";			
		}
		else
		{
			VoiceType = "XGame.JuggMaleVoice";
		}
		VoiceClass = Class<VoicePack>(DynamicLoadObject(VoiceType, Class'Core.Class'));
		P.VoiceType = VoiceType;
		// End:0x72F
		if(P.PlayerReplicationInfo != none)
		{
			P.PlayerReplicationInfo.VoiceType = VoiceClass;
		}
		P.VoiceClass = Class<TeamVoicePack>(VoiceClass);		
	}
	else
	{
		// End:0x7F3
		if(!P.Level.bLowSoundDetail)
		{
			// End:0x7BC
			if((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.VoiceTypeName != "")
			{
				VoiceType = P.PlayerReplicationInfo.VoiceTypeName;				
			}
			else
			{
				VoiceType = Rec.VoiceClassName;
			}
			// End:0x7F3
			if(VoiceType != "")
			{
				VoiceClass = Class<VoicePack>(DynamicLoadObject(VoiceType, Class'Core.Class'));
			}
		}
		// End:0x842
		if(VoiceClass == none)
		{
			VoiceType = GetVoiceType(P.bIsFemale, P.Level);
			VoiceClass = Class<VoicePack>(DynamicLoadObject(VoiceType, Class'Core.Class'));
		}
		P.VoiceType = VoiceType;
		// End:0x887
		if(P.PlayerReplicationInfo != none)
		{
			P.PlayerReplicationInfo.VoiceType = VoiceClass;
		}
		P.VoiceClass = Class<TeamVoicePack>(VoiceClass);
	}
	i = 0;
	J0x8A7:

	// End:0x936 [Loop If]
	if(i < 16)
	{
		// End:0x92C
		if(default.TauntAnims[i] != 'None')
		{
			j = P.TauntAnims.Length;
			P.TauntAnims[j] = default.TauntAnims[i];
			P.TauntAnimNames[j] = default.TauntAnimNames[i];
			// End:0x92C
			if(j == 15)
			{
				// [Explicit Break]
				goto J0x936;
			}
		}
		i++;
		// [Loop Continue]
		goto J0x8A7;
	}
	J0x936:

	return true;
	//return;	
}

static function int GetOffsetForSequence(name Sequence)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x53 [Loop If]
	if(i < 16)
	{
		// End:0x2E
		if(default.TauntAnims[i] == 'None')
		{
			return -1;
		}
		// End:0x49
		if(default.TauntAnims[i] == Sequence)
		{
			return i;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	return -1;
	//return;	
}

defaultproperties
{
	PawnClassName="xGame.xPawn"
	SpeciesName="Human"
	TauntAnims[0]="gesture_point"
	TauntAnims[1]="gesture_beckon"
	TauntAnims[2]="gesture_halt"
	TauntAnims[3]="gesture_cheer"
	TauntAnims[4]="PThrust"
	TauntAnims[5]="AssSmack"
	TauntAnims[6]="ThroatCut"
	TauntAnims[7]="Specific_1"
	TauntAnims[8]="Gesture_Taunt01"
	TauntAnims[9]="Idle_Character01"
	TauntAnimNames[0]="Point"
	TauntAnimNames[1]="Beckon"
	TauntAnimNames[2]="Halt"
	TauntAnimNames[3]="Cheer"
	TauntAnimNames[4]="Pelvic Thrust"
	TauntAnimNames[5]="Ass Smack"
	TauntAnimNames[6]="Throat Cut"
	TauntAnimNames[7]="Unique"
	TauntAnimNames[8]="Team Taunt"
	TauntAnimNames[9]="Team Idle"
	AirControl=1.0000000
	GroundSpeed=1.0000000
	WaterSpeed=1.0000000
	JumpZ=1.0000000
	ReceivedDamageScaling=1.0000000
	DamageScaling=1.0000000
	AccelRate=1.0000000
	WalkingPct=1.0000000
	CrouchedPct=1.0000000
	DodgeSpeedFactor=1.0000000
	DodgeSpeedZ=1.0000000
}
