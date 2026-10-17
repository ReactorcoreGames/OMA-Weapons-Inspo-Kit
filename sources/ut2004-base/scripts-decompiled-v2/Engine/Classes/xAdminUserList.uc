class xAdminUserList extends XAdminBase;

var private array<xAdminUser> Users;

function int Count()
{
	return Users.Length;
	//return;	
}

function xAdminUser Create(string Username, string Password, string Privileges)
{
	local xAdminUser NewUser;

	NewUser = new (none) Class'Engine.xAdminUser';
	// End:0x38
	if(NewUser != none)
	{
		NewUser.Init(Username, Password, Privileges);
	}
	return NewUser;
	//return;	
}

function Add(xAdminUser NewUser)
{
	// End:0x42
	if((NewUser != none) && !Contains(NewUser))
	{
		Users.Length = Users.Length + 1;
		Users[Users.Length - 1] = NewUser;
	}
	//return;	
}

function xAdminUser Get(int i)
{
	return Users[i];
	//return;	
}

function Remove(xAdminUser User)
{
	local int i;

	// End:0x4F
	if(User != none)
	{
		i = 0;
		J0x12:

		// End:0x4F [Loop If]
		if(i < Users.Length)
		{
			// End:0x45
			if(Users[i] == User)
			{
				Users.Remove(i, 1);
				return;
			}
			i++;
			// [Loop Continue]
			goto J0x12;
		}
	}
	//return;	
}

function Clear()
{
	Users.Length = 0;
	//return;	
}

function bool Contains(xAdminUser User)
{
	local int i;

	// End:0x43
	if(User != none)
	{
		i = 0;
		J0x12:

		// End:0x43 [Loop If]
		if(i < Users.Length)
		{
			// End:0x39
			if(Users[i] == User)
			{
				return true;
			}
			i++;
			// [Loop Continue]
			goto J0x12;
		}
	}
	return false;
	//return;	
}

function xAdminUser FindByName(string Username)
{
	local int i;

	// End:0x57
	if(Username != "")
	{
		i = 0;
		J0x13:

		// End:0x57 [Loop If]
		if(i < Users.Length)
		{
			// End:0x4D
			if(Users[i].Username == Username)
			{
				return Users[i];
			}
			i++;
			// [Loop Continue]
			goto J0x13;
		}
	}
	return none;
	//return;	
}

