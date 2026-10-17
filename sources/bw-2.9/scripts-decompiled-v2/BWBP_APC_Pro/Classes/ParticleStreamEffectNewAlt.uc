class ParticleStreamEffectNewAlt extends ParticleStreamEffectNew;

simulated function SetColor()
{
	// End:0x1B
	if(!bAltColor)
	{
		Skins[0] = TexPanner'BWBP_OP_Tex.ProtonPack.ProtonGreenPanner';		
	}
	else
	{
		Skins[0] = TexPanner'BWBP_OP_Tex.ProtonPack.ProtonPurplePanner';
	}
	//return;	
}

defaultproperties
{
	Skins[0]=TexPanner'BWBP_OP_Tex.ProtonPack.ProtonGreenPanner'
}
