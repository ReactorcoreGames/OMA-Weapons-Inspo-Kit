class IE_LongHornGrenade extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	bDynamicLight = true;
	SetTimer(0.2000000, false);
	//return;	
}

simulated event PreBeginPlay()
{
	// End:0x2D
	if(int(Level.DetailMode) < int(2))
	{
		Emitters[3].Disabled = true;
	}
	// End:0x6D
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

simulated event Timer()
{
	super(Actor).Timer();
	bDynamicLight = false;
	//return;	
}

defaultproperties
{
	Emitters[0]=SpriteEmitter'BWBP_SKC_Pro.IE_FRAGExplosion.SpriteEmitter6'
	Emitters[1]=SpriteEmitter'BWBP_SKC_Pro.IE_FRAGExplosion.SpriteEmitter7'
	Emitters[2]=SpriteEmitter'BWBP_SKC_Pro.IE_FRAGExplosion.SpriteEmitter8'
	Emitters[3]=SpriteEmitter'BWBP_SKC_Pro.IE_FRAGExplosion.SpriteEmitter34'
	Emitters[4]=SpriteEmitter'BWBP_SKC_Pro.IE_FRAGExplosion.SpriteEmitter0'
	Emitters[5]=SpriteEmitter'BWBP_SKC_Pro.IE_FRAGExplosion.SpriteEmitter19'
	Emitters[6]=SpriteEmitter'BWBP_SKC_Pro.IE_FRAGExplosion.SpriteEmitter20'
	Emitters[7]=SpriteEmitter'BWBP_SKC_Pro.IE_FRAGExplosion.SpriteEmitter21'
	Emitters[8]=SpriteEmitter'BWBP_SKC_Pro.IE_FRAGExplosion.SpriteEmitter22'
	AutoDestroy=true
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=32.0000000
	LightPeriod=3
	bUnlit=false
}
