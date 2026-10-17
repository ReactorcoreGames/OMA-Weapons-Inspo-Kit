class Combo extends Info
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string ExecMessage;
var float AdrenalineCost;
var float Duration;
var Sound ActivateSound;
var Material Icon;
var Class<xEmitter> ActivationEffectClass;
var Sound ComboAnnouncement;
var name ComboAnnouncementName;
var int keys[4];
var Class<SpeciesType> Species;

function PostBeginPlay()
{
	local xPawn P;

	P = xPawn(Owner);
	// End:0x20
	if(P == none)
	{
		Destroy();
		return;
	}
	// End:0x41
	if(ActivateSound != none)
	{
		PlaySound(ActivateSound, 0, 2.0000000 * TransientSoundVolume);
	}
	// End:0x76
	if(ActivationEffectClass != none)
	{
		Spawn(ActivationEffectClass, P,, P.Location, P.Rotation);
	}
	StartEffect(P);
	//return;	
}

function AdrenalineEmpty()
{
	Destroy();
	//return;	
}

function Destroyed()
{
	local xPawn P;

	P = xPawn(Owner);
	// End:0x4A
	if(P != none)
	{
		StopEffect(P);
		// End:0x4A
		if(P.CurrentCombo == self)
		{
			P.CurrentCombo = none;
		}
	}
	//return;	
}

function StartEffect(xPawn P)
{
	//return;	
}

function StopEffect(xPawn P)
{
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local Pawn P;

	P = Pawn(Owner);
	// End:0x36
	if((P == none) || P.Controller == none)
	{
		Destroy();
		return;
	}
	// End:0x86
	if((P.Controller.PlayerReplicationInfo != none) && P.Controller.PlayerReplicationInfo.HasFlag != none)
	{
		DeltaTime *= float(2);
	}
	P.Controller.Adrenaline -= ((AdrenalineCost * DeltaTime) / Duration);
	// End:0xF3
	if(P.Controller.Adrenaline <= 0.0000000)
	{
		P.Controller.Adrenaline = 0.0000000;
		Destroy();
	}
	//return;	
}

defaultproperties
{
	AdrenalineCost=100.0000000
	Duration=30.0000000
	ActivateSound=Sound'GameSounds.Combo.ComboActivated'
	ActivationEffectClass=Class'XEffects.ComboActivation'
}
