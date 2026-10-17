class GASCFlashEmitter extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(Weapon(Owner) == none)
	{
		Emitters[1].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	Emitters[0]=MeshEmitter'BallisticProV55.XMV850FlashEmitter.MeshEmitter4'
	Emitters[1]=SpriteEmitter'BallisticProV55.XMV850FlashEmitter.SpriteEmitter5'
}
