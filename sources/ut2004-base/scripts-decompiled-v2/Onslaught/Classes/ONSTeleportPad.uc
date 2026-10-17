class ONSTeleportPad extends Actor
	placeable;

var array<Material> RedSkins;
var array<Material> BlueSkins;

function UsedBy(Pawn User)
{
	// End:0x1F
	if(Owner != none)
	{
		Owner.UsedBy(User);
	}
	//return;	
}

simulated function SetTeam(byte Team)
{
	// End:0x1B
	if(int(Team) == 0)
	{
		Skins = RedSkins;		
	}
	else
	{
		// End:0x36
		if(int(Team) == 1)
		{
			Skins = BlueSkins;			
		}
		else
		{
			Skins.Length = 0;
		}
	}
	//return;	
}

defaultproperties
{
	RedSkins[0]=Texture'ONSstructureTextures.CoreGroup.PowerNodeTEX'
	RedSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.powerNodeUpperFLAREredFinal'
	RedSkins[2]=FinalBlend'AW-2004Particles.Energy.BeamHitFinal'
	BlueSkins[0]=Texture'ONSstructureTextures.CoreGroup.PowerNodeTEX'
	BlueSkins[1]=FinalBlend'ONSstructureTextures.CoreGroup.powerNodeUpperFLAREblueFinal'
	BlueSkins[2]=FinalBlend'AW-2004Particles.Energy.BeamHitFinal'
	DrawType=8
	StaticMesh=StaticMesh'VMStructures.CoreGroup.BaseNodeSM'
	bStatic=true
	bStasis=true
	bAcceptsProjectors=false
	RemoteRole=0
	DrawScale=2.0000000
	bCollideActors=true
	bBlockActors=true
	bProjTarget=true
}
