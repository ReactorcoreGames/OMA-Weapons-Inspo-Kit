class Brass_ShotgunFlechette extends BWBrass_Default
	config(BallisticProV55);

var Emitter Trail;

simulated function PostBeginPlay()
{
	super(BallisticBrass).PostBeginPlay();
	// End:0x63
	if((int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		Trail = Spawn(Class'BallisticProV55.ShotgunBrassTrail',,, Location + ((Vector(Rotation) * float(19)) * DrawScale));
	}
	// End:0x94
	if(Trail != none)
	{
		Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Trail, DrawScale);
		Trail.SetBase(self);
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Trail != none)
	{
		Trail.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

defaultproperties
{
	HitSounds[0]=SoundGroup'BW_Core_WeaponSound.Brass.ShellConcrete'
	HitSounds[1]=SoundGroup'BW_Core_WeaponSound.Brass.ShellConcrete'
	HitSounds[2]=SoundGroup'BW_Core_WeaponSound.Brass.ShellConcrete'
	HitSounds[3]=SoundGroup'BW_Core_WeaponSound.Brass.ShellMetal'
	HitSounds[4]=SoundGroup'BW_Core_WeaponSound.Brass.ShellWood'
	HitSounds[5]=SoundGroup'BW_Core_WeaponSound.Brass.ShellWood'
	HitSounds[6]=SoundGroup'BW_Core_WeaponSound.Brass.ShellConcrete'
	HitSounds[7]=SoundGroup'BW_Core_WeaponSound.Brass.ShellConcrete'
	HitSounds[8]=SoundGroup'BW_Core_WeaponSound.Brass.ShellConcrete'
	HitSounds[9]=SoundGroup'BW_Core_WeaponSound.Brass.ShellConcrete'
	HitSounds[10]=SoundGroup'BW_Core_WeaponSound.Brass.ShellConcrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Brass.EmptyShell'
	DrawScale=0.1100000
	Skins[0]=Texture'BWBP_SKC_Tex.M1014.Cart_ShotgunF'
}
