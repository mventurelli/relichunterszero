/// @description Clear every 500 frames with no events

if (stepsWithoutEvents == 500 && array_length_1d(removedInstances) > 0) {

	//reset vars
	stepsWithoutEvents = 0;

	//clear arrays
	removedInstances = 0;
	removedInstances = [];
}
