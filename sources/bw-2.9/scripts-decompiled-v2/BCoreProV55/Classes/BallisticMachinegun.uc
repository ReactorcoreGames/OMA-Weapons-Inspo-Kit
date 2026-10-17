class BallisticMachinegun extends BallisticWeapon
	abstract
	config(BallisticProV55);

var() array<name> BeltBones;
var() int BeltLength;
var() name BoxBone;
var bool bNoBox;
var() FullSound BoxOnSound;
var() FullSound BoxOffSound;
var() FullSound FlapUpSound;
var() FullSound FlapDownSound;
var() Sound HandleOnSound;
var() Sound HandleOffSound;

simulated function BringUp(optional Weapon PrevWeapon)
{
	super.BringUp(PrevWeapon);
	SetBeltVisibility(MagAmmo);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x50
	if((Channel == 0) && (int(ReloadState) == int(2)) || int(ReloadState) == int(1))
	{
		PlayReloadFinish();
		return;		
	}
	else
	{
		// End:0x91
		if((Anim == FireMode[0].FireAnim) || Anim == bFireMode[0].AimedFireAnim)
		{
			SetBeltVisibility(MagAmmo);
		}
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function PlayReload()
{
	// End:0x45
	if(bNoBox)
	{
		// End:0x2D
		if(MagAmmo < 2)
		{
			PlayAnim('ReloadStartNone', ReloadAnimRate,, int(0.2500000));			
		}
		else
		{
			PlayAnim('ReloadStartShell', ReloadAnimRate,, int(0.2500000));
		}		
	}
	else
	{
		// End:0x69
		if(MagAmmo < 2)
		{
			PlayAnim('ReloadStartBox', ReloadAnimRate,, int(0.2500000));			
		}
		else
		{
			// End:0x8D
			if(MagAmmo < 12)
			{
				PlayAnim('ReloadStartFew', ReloadAnimRate,, int(0.2500000));				
			}
			else
			{
				PlayAnim('ReloadStart', ReloadAnimRate,, int(0.2500000));
			}
		}
	}
	//return;	
}

simulated function PlayReloadFinish()
{
	SetBoxVisibility();
	SetBeltVisibility((Ammo[0].AmmoAmount + MagAmmo) + 1);
	// End:0x5C
	if((Ammo[0].AmmoAmount + MagAmmo) < (BeltLength + 1))
	{
		PlayAnim('ReloadFinishFew', ReloadAnimRate,, 0);		
	}
	else
	{
		PlayAnim('ReloadFinish', ReloadAnimRate,, 0);
	}
	//return;	
}

simulated function PlayIdle()
{
	IdleAnim = default.IdleAnim;
	super.PlayIdle();
	//return;	
}

simulated function SetBoxVisibility()
{
	bNoBox = (Ammo[0].AmmoAmount + MagAmmo) < (BeltLength + 1);
	// End:0x45
	if(bNoBox)
	{
		SetBoneScale(1, 0.0000000, BoxBone);		
	}
	else
	{
		SetBoneScale(1, 1.0000000, BoxBone);
	}
	//return;	
}

simulated function SetBeltVisibility(int Amount)
{
	// End:0x2F
	if(Amount < BeltLength)
	{
		SetBoneScale(0, 0.0000000, BeltBones[Max(0, Amount - 1)]);		
	}
	else
	{
		SetBoneScale(0, 1.0000000, BeltBones[0]);
	}
	//return;	
}

simulated function Notify_M353GoToHandle()
{
	// End:0x1E
	if(bNeedCock && MagAmmo > 0)
	{
		CommonCockGun(2);
	}
	//return;	
}

simulated function Notify_CockGoToHandle()
{
	//return;	
}

simulated function Notify_M353Open()
{
	// End:0x6A
	if(int(Level.NetMode) != int(NM_Client))
	{
		PlayOwnedSound(FlapUpSound.Sound, FlapUpSound.Slot, FlapUpSound.Volume, FlapUpSound.bNoOverride, FlapUpSound.Radius, FlapUpSound.Pitch, FlapUpSound.bAtten);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, FlapUpSound);
	}
	//return;	
}

simulated function Notify_M353Close()
{
	// End:0x6A
	if(int(Level.NetMode) != int(NM_Client))
	{
		PlayOwnedSound(FlapDownSound.Sound, FlapDownSound.Slot, FlapDownSound.Volume, FlapDownSound.bNoOverride, FlapDownSound.Radius, FlapDownSound.Pitch, FlapDownSound.bAtten);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, FlapDownSound);
	}
	//return;	
}

simulated function Notify_M353BoxOff()
{
	// End:0x6A
	if(int(Level.NetMode) != int(NM_Client))
	{
		PlayOwnedSound(BoxOffSound.Sound, BoxOffSound.Slot, BoxOffSound.Volume, BoxOffSound.bNoOverride, BoxOffSound.Radius, BoxOffSound.Pitch, BoxOffSound.bAtten);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, BoxOffSound);
	}
	//return;	
}

simulated function Notify_M353BoxOn()
{
	// End:0x6A
	if(int(Level.NetMode) != int(NM_Client))
	{
		PlayOwnedSound(BoxOnSound.Sound, BoxOnSound.Slot, BoxOnSound.Volume, BoxOnSound.bNoOverride, BoxOnSound.Radius, BoxOnSound.Pitch, BoxOnSound.bAtten);		
	}
	else
	{
		Class'BCoreProV55.BUtil'.static.PlayFullSound(self, BoxOnSound);
	}
	//return;	
}

simulated function bool HasAmmo()
{
	// End:0x38
	if((!bNoMag && FireMode[0] != none) && MagAmmo >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	// End:0x7D
	if(((Ammo[0] != none) && FireMode[0] != none) && Ammo[0].AmmoAmount >= FireMode[0].AmmoPerFire)
	{
		return true;
	}
	return false;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

function float GetAIRating()
{
	local Bot B;
	local float Result, dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	// End:0x41
	if((B == none) || B.Enemy == none)
	{
		return super.GetAIRating();
	}
	Dir = B.Enemy.Location - Instigator.Location;
	dist = VSize(Dir);
	Result = super.GetAIRating();
	// End:0xB6
	if(dist > float(1000))
	{
		Result -= ((dist - float(1000)) / float(3000));
	}
	// End:0x108
	if((B.Enemy.Weapon != none) && B.Enemy.Weapon.bMeleeWeapon)
	{
		Result += 0.2000000;		
	}
	else
	{
		// End:0x16A
		if(((B.Enemy.Weapon != none) && B.Enemy.Weapon.bSniping) && dist > float(500))
		{
			Result -= 0.4000000;
		}
	}
	return Result;
	//return;	
}

function float SuggestAttackStyle()
{
	return 0.5000000;
	//return;	
}

function float SuggestDefenseStyle()
{
	return 0.8000000;
	//return;	
}

defaultproperties
{
	BeltBones[0]="Bullet1"
	BeltBones[1]="Bullet2"
	BeltBones[2]="Bullet3"
	BeltBones[3]="Bullet4"
	BeltBones[4]="Bullet5"
	BeltBones[5]="Bullet6"
	BeltBones[6]="Bullet7"
	BeltBones[7]="Bullet8"
	BeltBones[8]="Bullet9"
	BeltBones[9]="Bullet10"
	BeltLength=11
	BoxBone="AmmoBox"
	BoxOnSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	BoxOffSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapUpSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	FlapDownSound=(Sound=none,Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=false)
	IdleTweenTime=0.0000000
}
