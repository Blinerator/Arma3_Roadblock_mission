while{true}do{
	if(ar_frnt < 0)then{
		ar_frnt = 0;
		publicVariable "ar_frnt";
	};
	if(ar_frnt > 100)then{
		ar_frnt = 100;
		publicVariable "ar_frnt";
	};

	if(ar_back < 0)then{
		ar_back = 0;
		publicVariable "ar_back";	
	};
	if(ar_back > 100)then{
		ar_back = 100;
		publicVariable "ar_back";
	};

	if(civilian_rating < 0)then{
		civilian_rating = 0;
		publicVariable "civilian_rating";	
	};
	if(civilian_rating > 100)then{
		civilian_rating = 100;
		publicVariable "civilian_rating";
	};
	sleep 0.25;
};