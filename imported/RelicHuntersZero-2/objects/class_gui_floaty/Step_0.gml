///Float Up
if (visible == true) {
	if (lockToOwner)
	{
	    if (instance_exists_fast(owner))
	    {
	        x = owner.x;
	        y = owner.y;
	        offsetY -= floatSpeed;
	    }
	    else y -= floatSpeed;
	}
	else
	{
	    y -= bounceSpeed;
	    bounceSpeed -= bounceGravity;
	    if (bounceSpeed) < (-1*bounceAbsoluteLimit) bounceSpeed = (-1*bounceAbsoluteLimit);

	    x += bounceHorizontalSpeed * bounceHorizontalDirection;
	    if (bounceHorizontalSpeed) bounceHorizontalSpeed -= bounceHorizontalFriction;
	    else bounceHorizontalSpeed = 0;
	}
}
