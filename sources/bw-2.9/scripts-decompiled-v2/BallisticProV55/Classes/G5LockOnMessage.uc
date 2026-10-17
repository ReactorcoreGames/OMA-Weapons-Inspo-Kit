class G5LockOnMessage extends CriticalEventPlus
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Sound WarningSound;

static function int GetFontSize(int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer)
{
	return default.FontSize;
	//return;	
}

static function string GetRelatedString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	return GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	return "WARNING: Incoming G5 Rocket!";
	//return;	
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	P.ClientPlaySound(default.WarningSound, true, 3.0000000, 5);
	//return;	
}

defaultproperties
{
	WarningSound=Sound'WeaponSounds.BaseGunTech.BSeekLost1'
	DrawColor=(R=255,G=0,B=0,A=255)
}
