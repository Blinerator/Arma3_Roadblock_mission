//civ_gun, civ_melee

private _eastGroup = createGroup east; 
_group1 = group civ_gun;
_group2 = group civ_melee;
{[_x] joinSilent _eastGroup;}forEach units _group1;
{[_x] joinSilent _eastGroup;}forEach units _group2;