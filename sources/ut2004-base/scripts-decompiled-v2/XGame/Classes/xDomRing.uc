class xDomRing extends Decoration;

var() Material RedTeamShader;
var() Material BlueTeamShader;
var() Material NeutralShader;

defaultproperties
{
	RedTeamShader=Shader'XGameTextures.SuperPickups.DOMRedS'
	BlueTeamShader=Shader'XGameTextures.SuperPickups.DOMBlueS'
	NeutralShader=Shader'XGameTextures.SuperPickups.DOMGreyS'
	DrawType=8
	StaticMesh=StaticMesh'XGame_rc.DomRing'
	bStatic=false
	bStasis=false
	Physics=5
	DrawScale=0.2500000
	Skins[0]=Shader'XGameTextures.SuperPickups.DOMGreyS'
	bNetNotify=true
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=-16000,Roll=48000)
}
