class XM20ShieldEffect extends Actor
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
	bDamaged = ShieldPower < 40;
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
		Skins[0] = MatShot;
	}
	//return;	
}

function SetRedSkin()
{
	MatDam = FinalBlend'BWBP_SKC_Tex.AIMS.AIMSShield3rdFB';
	MatShot = FinalBlend'BWBP_SKC_Tex.AIMS.AIMSShield3rdFB';
	Skins[0] = MatShot;
	Skins[1] = MatShot;
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
	MatShot=Shader'BWBP_SKC_Tex.PUMA.PUMA-ShieldSD'
	MatDam=Shader'BWBP_SKC_Tex.PUMA.PUMA-ShieldSD'
	DrawType=8
	StaticMesh=StaticMesh'BWBP_SKC_Static.PUMA.PumaShield'
	bHidden=true
	bOnlyOwnerSee=true
	RemoteRole=0
	Skins[0]=FinalBlend'BWBP_SKC_Tex.PUMA.PUMAShield3rdFB'
	AmbientGlow=250
	bUnlit=true
}
