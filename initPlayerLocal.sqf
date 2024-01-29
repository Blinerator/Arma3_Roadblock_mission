sleep 2;
display_warning_message = false;
while{true} do{
	if(display_warning_message) then {
		hint "Keep the road clear!";
		display_warning_message = false;
		publicVariable "display_warning_message";
		sleep 1;
	};
};