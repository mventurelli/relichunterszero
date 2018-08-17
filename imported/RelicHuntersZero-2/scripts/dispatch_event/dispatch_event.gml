/// @description every added event resets stepsWithoutEvents counter

var type = argument0;
var value = argument1;

switch (type)
{
	case EVENT_INSTANCE_REMOVED:
		with (global.eventManager) {
			removedInstances[array_length_1d(removedInstances)] = value;
			stepsWithoutEvents = 0;
		}
		break;
	default: ;
}
