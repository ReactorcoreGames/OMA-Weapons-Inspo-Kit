class Redeemer extends Weapon
	config(User);

function PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	//return;	
}

simulated function SuperMaxOutAmmo()
{
	//return;	
}

simulated event ClientStopFire(int Mode)
{
	// End:0x1B
	if(int(Role) < int(ROLE_Authority))
	{
		StopFire(Mode);
	}
	// End:0x33
	if(Mode == 0)
	{
		ServerStopFire(byte(Mode));
	}
	//return;	
}

simulated event WeaponTick(float dt)
{
	// End:0x21
	if((Instigator.Controller == none) || HasAmmo())
	{
		return;
	}
	Instigator.Controller.SwitchToBestWeapon();
	//return;	
}

function float SuggestAttackStyle()
{
	return -1.0000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return -1.0000000;
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

	B = Bot(Instigator.Controller);
	// End:0x2A
	if(B == none)
	{
		return 0.4000000;
	}
	// End:0x42
	if(B.IsShootingObjective())
	{
		return 1.0000000;
	}
	// End:0xB0
	if(((B.Enemy == none) || B.Enemy.bCanFly) || VSize(B.Enemy.Location - Instigator.Location) < float(2400))
	{
		return 0.4000000;
	}
	return AIRating;
	//return;	
}

defaultproperties
{
	FireModeClass[0]=Class'XWeapons.RedeemerFire'
	FireModeClass[1]=Class'XWeapons.RedeemerGuidedFire'
	SelectAnim="Pickup"
	PutDownAnim="PutDown"
	SelectAnimRate=0.6670000
	PutDownAnimRate=1.0000000
	PutDownTime=0.4500000
	BringUpTime=0.6750000
	SelectSound=Sound'WeaponSounds.Misc.redeemer_change'
	SelectForce="SwitchToFlakCannon"
	AIRating=1.5000000
	CurrentRating=1.5000000
	bNotInDemo=true
	Description="The first time you witness this miniature nuclear device in action, you'll agree it is the most powerful weapon in the Tournament.|Launch a slow-moving but utterly devastating missile with the primary fire; but make sure you're out of the Redeemer's impressive blast radius before it impacts. The secondary fire allows you to guide the nuke yourself with a rocket's-eye view.||Keep in mind, however, that you are vulnerable to attack when steering the Redeemer's projectile. Due to the extreme bulkiness of its ammo, the Redeemer is exhausted after a single shot."
	DemoReplacement=Class'XWeapons.RocketLauncher'
	DisplayFOV=60.0000000
	Priority=16
	SmallViewOffset=(X=26.0000000,Y=6.0000000,Z=-34.0000000)
	CustomCrosshair=13
	CustomCrossHairColor=(R=255,G=255,B=128,A=255)
	CustomCrossHairScale=2.0000000
	CustomCrossHairTextureName="Crosshairs.Hud.Crosshair_Circle2"
	InventoryGroup=0
	GroupOffset=1
	PickupClass=Class'XWeapons.RedeemerPickup'
	PlayerViewOffset=(X=14.0000000,Y=0.0000000,Z=-28.0000000)
	PlayerViewPivot=(Pitch=1000,Yaw=-400,Roll=0)
	BobDamping=1.4000000
	AttachmentClass=Class'XWeapons.RedeemerAttachment'
	IconMaterial=Texture'HudContent.Generic.HUD'
	IconCoords=(X1=4,Y1=350,X2=110,Y2=395)
	ItemName="Redeemer"
	Mesh=SkeletalMesh'Weapons.Redeemer_1st'
	DrawScale=1.2000000
}
