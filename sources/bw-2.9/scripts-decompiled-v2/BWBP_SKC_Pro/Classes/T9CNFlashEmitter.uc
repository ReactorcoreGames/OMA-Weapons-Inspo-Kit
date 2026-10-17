class T9CNFlashEmitter extends BallisticEmitter;

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
	Emitters[0]=MeshEmitter'BallisticProV55.XK2FlashEmitter.MeshEmitter4'
	Emitters[1]=SpriteEmitter'BallisticProV55.XK2FlashEmitter.SpriteEmitter5'
}
