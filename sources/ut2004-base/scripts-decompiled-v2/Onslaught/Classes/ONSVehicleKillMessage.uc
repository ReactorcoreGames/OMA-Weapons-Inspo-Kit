class ONSVehicleKillMessage extends LocalMessage
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string KillString[8];
var name KillSound[8];

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	return default.KillString[Min(Switch, 7)];
	//return;	
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	P.PlayRewardAnnouncement(default.KillSound[Min(Switch, 7)], 1, true);
	//return;	
}

defaultproperties
{
	KillString[0]="Road Kill!"
	KillString[1]="Hit and Run!"
	KillString[2]="Road Rage!"
	KillString[3]="Vehicular Manslaughter!"
	KillString[4]="Pancake!"
	KillString[5]="Eagle Eye!"
	KillString[6]="Top Gun!"
	KillString[7]="Fender Bender!"
	KillSound[0]="Road_Kill"
	KillSound[1]="Hit_and_run"
	KillSound[2]="Road_Rage"
	KillSound[3]="Vehicular_manslaughter"
	KillSound[4]="Pancake"
	KillSound[5]="EagleEye"
	KillSound[6]="Top_Gun"
	KillSound[7]="Fender_Bender"
	bIsUnique=true
	bFadeMessage=true
	DrawColor=(R=255,G=0,B=0,A=255)
	StackMode=2
	PosY=0.2420000
	FontSize=1
}
