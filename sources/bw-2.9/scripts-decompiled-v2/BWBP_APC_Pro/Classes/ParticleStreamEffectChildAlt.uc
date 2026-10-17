class ParticleStreamEffectChildAlt extends ParticleStreamEffectChild;

simulated function SetColor()
{
	// End:0x1B
	if(!bAltColor)
	{
		Skins[0] = TexPanner'BWBP_OP_Tex.ProtonPack.ProtonPurplePanner';		
	}
	else
	{
		Skins[0] = TexPanner'BWBP_OP_Tex.ProtonPack.ProtonGreenPanner';
	}
	//return;	
}

defaultproperties
{
	Skins[0]=TexPanner'BWBP_OP_Tex.ProtonPack.ProtonPurplePanner'
}
