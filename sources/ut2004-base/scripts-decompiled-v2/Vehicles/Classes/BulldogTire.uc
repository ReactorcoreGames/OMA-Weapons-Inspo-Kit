class BulldogTire extends KTire;

defaultproperties
{
	StaticMesh=StaticMesh'BulldogMeshes.Simple.S_RearWheel'
	DrawScale=0.4000000
	CollisionRadius=34.0000000
	CollisionHeight=34.0000000
	// Reference: KarmaParamsRBFull'Vehicles.BulldogTire.KParams0'
	begin object name="KParams0" class=Engine.KarmaParamsRBFull
		KInertiaTensor[0]=1.8000000
		KInertiaTensor[3]=1.8000000
		KInertiaTensor[5]=1.8000000
		KLinearDamping=0.0000000
		KAngularDamping=0.0000000
		bHighDetailOnly=false
		bClientOnly=false
		bKDoubleTickRate=true
	end object
	KParams=KParams0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParamsRBFull'Vehicles.BulldogTire.KParams0'
begin object name="KParams0" class=Engine.KarmaParamsRBFull
	KInertiaTensor[0]=1.8000000
	KInertiaTensor[3]=1.8000000
	KInertiaTensor[5]=1.8000000
	KLinearDamping=0.0000000
	KAngularDamping=0.0000000
	bHighDetailOnly=false
	bClientOnly=false
	bKDoubleTickRate=true
end object
