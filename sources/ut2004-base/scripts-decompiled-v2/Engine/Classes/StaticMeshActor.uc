class StaticMeshActor extends Actor
	native
	placeable;

var() bool bExactProjectileCollision;

defaultproperties
{
	bExactProjectileCollision=true
	DrawType=8
	bUseDynamicLights=true
	bStatic=true
	bWorldGeometry=true
	bShadowCast=true
	bStaticLighting=true
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bCollideActors=true
	bBlockActors=true
	bBlockKarma=true
	bEdShouldSnap=true
}
