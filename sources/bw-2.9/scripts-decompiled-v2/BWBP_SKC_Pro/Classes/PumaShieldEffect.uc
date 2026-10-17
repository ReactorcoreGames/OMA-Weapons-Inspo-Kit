class PumaShieldEffect extends Actor
	notplaceable;

var float Brightness;
var float DesiredBrightness;
var() Material MatShot;
var() Material MatDam;
var bool bDamaged;

function Flash(int Drain, int ShieldPower)
{
	Brightness = FMin(Brightness + float(Drain / 2), 250.0000000);
	Skins[0] = MatShot;
	// End:0x43
	if(ShieldPower < 40)
	{
		bDamaged = true;		
	}
	else
	{
		bDamaged = false;
	}
	SetTimer(0.2000000, false);
	//return;	
}

function Timer()
{
	// End:0x19
	if(bDamaged)
	{
		Skins[0] = MatDam;		
	}
	else
	{
		Skins[0] = default.Skins[0];
	}
	//return;	
}

function SetBrightness(int B)
{
	DesiredBrightness = FMin(50.0000000 + float(B * 2), 250.0000000);
	//return;	
}

defaultproperties
{
	Brightness=250.0000000
	DesiredBrightness=250.0000000
	MatShot=Shader'BWBP_SKC_Tex.PUMA.PUMA-ShieldSDO'
	MatDam=Shader'BWBP_SKC_Tex.PUMA.PUMA-ShieldSDR'
	DrawType=8
	StaticMesh=StaticMesh'BWBP_SKC_Static.PUMA.PumaShield'
	bHidden=true
	bOnlyOwnerSee=true
	RemoteRole=0
	Skins[0]=Shader'BWBP_SKC_Tex.PUMA.PUMA-ShieldSD'
	AmbientGlow=250
	bUnlit=true
}
