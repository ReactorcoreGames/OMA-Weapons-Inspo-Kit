class IE_MinigunBulletConcrete extends DGVEmitter;

simulated event PostBeginPlay()
{
	// End:0x25
	if(PhysicsVolume.bWaterVolume)
	{
		Emitters[0].Disabled = true;
	}
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	DisableDGV[0]=0
	DisableDGV[1]=1
	bModifyLossRange=false
	Emitters[0]=SpriteEmitter'BallisticProV55.IE_BulletConcrete.SpriteEmitter27'
	Emitters[1]=MeshEmitter'BallisticProV55.IE_BulletConcrete.MeshEmitter14'
	Emitters[2]=SpriteEmitter'BallisticProV55.IE_BulletConcrete.SpriteEmitter3'
	AutoDestroy=true
}
