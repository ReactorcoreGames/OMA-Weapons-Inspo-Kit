class A73FlashEmitter extends DGVEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x2A
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[2].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	DisableDGV[0]=1
	DisableDGV[1]=0
	DisableDGV[2]=1
	bAutoInit=false
	Emitters[0]=MeshEmitter'BallisticProV55.A73FlashEmitter.MeshEmitter1'
	Emitters[1]=SpriteEmitter'BallisticProV55.A73FlashEmitter.SpriteEmitter6'
	Emitters[2]=SpriteEmitter'BallisticProV55.A73FlashEmitter.SpriteEmitter9'
}
