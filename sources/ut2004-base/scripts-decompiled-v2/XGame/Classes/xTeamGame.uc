class xTeamGame extends TeamGame
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function PrecacheGameTextures(LevelInfo MyLevel)
{
	Class'XGame.xDeathMatch'.static.PrecacheGameTextures(MyLevel);
	MyLevel.AddPrecacheMaterial(Texture'TeamSymbols.TeamBeaconT');
	MyLevel.AddPrecacheMaterial(Texture'TeamSymbols.LinkBeaconT');
	MyLevel.AddPrecacheMaterial(FinalBlend'XEffectMat.Shield.RedShell');
	MyLevel.AddPrecacheMaterial(FinalBlend'XEffectMat.Shield.BlueShell');
	MyLevel.AddPrecacheMaterial(Texture'TeamSymbols.soundBeacon_a00');
	MyLevel.AddPrecacheMaterial(Texture'TeamSymbols.soundBeacon_a01');
	MyLevel.AddPrecacheMaterial(Texture'TeamSymbols.soundBeacon_a02');
	MyLevel.AddPrecacheMaterial(Texture'TeamSymbols.soundBeacon_a03');
	//return;	
}

static function PrecacheGameStaticMeshes(LevelInfo MyLevel)
{
	Class'XGame.xDeathMatch'.static.PrecacheGameStaticMeshes(MyLevel);
	//return;	
}

defaultproperties
{
	DefaultEnemyRosterClass="xGame.xTeamRoster"
	HUDType="XInterface.HudCTeamDeathMatch"
	MapListType="XInterface.MapListTeamDeathMatch"
	DeathMessageClass=Class'XGame.xDeathMessage'
	GameName="Team DeathMatch"
	ScreenShotName="UT2004Thumbnails.TDMShots"
	DecoTextName="XGame.TeamGame"
	Acronym="TDM"
}
