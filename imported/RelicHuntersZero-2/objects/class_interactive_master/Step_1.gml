///Reset my own activation before Player checks

if (!instance_exists_fast(activationClient)) activationClient = noone;

if (!activationOverride){
    activationClient = noone;
    wantToActivate = false;
    in_range = false;
}

///Release Client Lock (bug-proofing)

if (isClientLocked)
{
    if (clientLockReleaseCurrent < clientLockRelease) clientLockReleaseCurrent += delta_time;
    else isClientLocked = false;
}
else 
{
	clientLockReleaseCurrent = 0;
}
