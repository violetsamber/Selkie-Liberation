// fn_getRandomPointInCircle.sqf

params [
    ["_center", 0],
	["_radius", 0]
];

_center getPos [_radius * sqrt random 1, random 360];