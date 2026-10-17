class DollActor extends Actor
	placeable;

var() name StartSequence;
var() float StartFrame;
var() name DollBone;
var() name DollName;

simulated event PostBeginPlay()
{
	local Actor A;

	// End:0x17
	if(StartSequence != 'None')
	{
		PlayAnim(StartSequence);
	}
	FreezeAnimAt(StartFrame);
	// End:0x58
	if(DollName != 'None')
	{
		// End:0x57
		foreach DynamicActors(Class'Engine.Actor', A, DollName)
		{
			AttachToBone(A, DollBone);			
		}		
	}
	//return;	
}

defaultproperties
{
	DrawType=2
	Mesh=SkeletalMesh'Jugg.JuggMaleA'
}
