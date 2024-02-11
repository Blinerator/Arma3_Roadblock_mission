_vehicle = _this select 0;
sleep 2;
for[{ _i = 0 }, { _i < 10 }, { _i = _i + 1 }] do {
	driver _vehicle forceWeaponFire ["CMFlareLauncher", "Burst"];  // or AIBurst
	sleep 0.25;
};
sleep 2;
for[{ _i = 0 }, { _i < 40 }, { _i = _i + 1 }] do {
	driver _vehicle forceWeaponFire ["CMFlareLauncher", "Burst"];  // or AIBurst
	sleep 0.25;
};
//rhsusf_ANPVS_14