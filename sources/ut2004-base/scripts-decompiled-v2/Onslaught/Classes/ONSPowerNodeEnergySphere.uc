class ONSPowerNodeEnergySphere extends Actor
	notplaceable;

var() float InducerRotationSpeed;
var Rotator InducerRotation;
var ONSPowerNode PowerNode;
var array<Material> RedConstructingSkins;
var array<Material> BlueConstructingSkins;
var array<Material> RedActiveSkins;
var array<Material> BlueActiveSkins;

simulated function UpdatePrecacheMaterials()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x3B [Loop If]
	if(i < RedConstructingSkins.Length)
	{
		Level.AddPrecacheMaterial(RedConstructingSkins[i]);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	i = 0;
	J0x42:

	// End:0x76 [Loop If]
	if(i < BlueConstructingSkins.Length)
	{
		Level.AddPrecacheMaterial(BlueConstructingSkins[i]);
		i++;
		// [Loop Continue]
		goto J0x42;
	}
	i = 0;
	J0x7D:

	// End:0xB1 [Loop If]
	if(i < RedActiveSkins.Length)
	{
		Level.AddPrecacheMaterial(RedActiveSkins[i]);
		i++;
		// [Loop Continue]
		goto J0x7D;
	}
	i = 0;
	J0xB8:

	// End:0xEC [Loop If]
	if(i < BlueActiveSkins.Length)
	{
		Level.AddPrecacheMaterial(BlueActiveSkins[i]);
		i++;
		// [Loop Continue]
		goto J0xB8;
	}
	super.UpdatePrecacheMaterials();
	//return;	
}

function PostBeginPlay()
{
	PowerNode = ONSPowerNode(Owner);
	SetBoneLocation('EnergyDome', vect(-15.0000000, 0.0000000, 0.0000000));
	//return;	
}

function SetInitialState()
{
	super.SetInitialState();
	// End:0x26
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Disable('Tick');
	}
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x33
	if(PowerNode != none)
	{
		PowerNode.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
	}
	//return;	
}

simulated function bool TeamLink(int TeamNum)
{
	return (PowerNode != none) && PowerNode.TeamLink(TeamNum);
	//return;	
}

simulated event Tick(float dt)
{
	local PlayerController P;
	local Rotator FacePlayerRotation, YawRot;

	// End:0x10D
	if((PowerNode != none) && int(PowerNode.CoreStage) != 4)
	{
		InducerRotation.Yaw += int((InducerRotationSpeed * float(65535)) * dt);
		InducerRotation.Yaw = InducerRotation.Yaw & 65535;
		SetBoneRotation('EnergyInducers', InducerRotation, 0);
		P = Level.GetLocalPlayerController();
		// End:0x10D
		if((P != none) && P.Pawn != none)
		{
			FacePlayerRotation = Rotator((P.Pawn.Location - Location) << Rotation);
			FacePlayerRotation *= float(-1);
			YawRot.Yaw = FacePlayerRotation.Yaw;
			SetBoneRotation('EnergyDome', YawRot, 0);
		}
	}
	//return;	
}

defaultproperties
{
	InducerRotationSpeed=0.5000000
	RedConstructingSkins[0]=FinalBlend'ONSstructureTextures.CoreConstructionRed'
	RedConstructingSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.InvisibleFinal'
	RedConstructingSkins[2]=FinalBlend'ONSstructureTextures.CoreGroup.InvisibleFinal'
	RedConstructingSkins[3]=FinalBlend'ONSstructureTextures.CoreGroup.InvisibleFinal'
	BlueConstructingSkins[0]=FinalBlend'ONSstructureTextures.CoreConstructionBlue'
	BlueConstructingSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.InvisibleFinal'
	BlueConstructingSkins[2]=FinalBlend'ONSstructureTextures.CoreGroup.InvisibleFinal'
	BlueConstructingSkins[3]=FinalBlend'ONSstructureTextures.CoreGroup.InvisibleFinal'
	RedActiveSkins[0]=Texture'ONSstructureTextures.CoreGroup.PowerNodeTEX'
	RedActiveSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.powerNodeUpperFLAREredFinal'
	RedActiveSkins[2]=FinalBlend'ONSstructureTextures.CoreBreachGroup.powerNodeBeamREDfb'
	RedActiveSkins[3]=FinalBlend'ONSstructureTextures.CoreBreachGroup.PowerNodeREDfb'
	BlueActiveSkins[0]=Texture'ONSstructureTextures.CoreGroup.PowerNodeTEX'
	BlueActiveSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.powerNodeUpperFLAREblueFinal'
	BlueActiveSkins[2]=FinalBlend'ONSstructureTextures.CoreBreachGroup.PowerNodeBeamBLUEfb'
	BlueActiveSkins[3]=FinalBlend'ONSstructureTextures.CoreBreachGroup.PowerNodeBlueFB'
	DrawType=2
	bHidden=true
	bIgnoreEncroachers=true
	RemoteRole=0
	Mesh=SkeletalMesh'ONSWeapons-A.PowerNode'
	CollisionRadius=90.0000000
	CollisionHeight=75.0000000
	bCollideActors=true
	bCollideWorld=true
	bBlockActors=true
	bProjTarget=true
	bUseCylinderCollision=true
}
