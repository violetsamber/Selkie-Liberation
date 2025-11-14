/*
    File: fn_getAttackSizeName.sqf
    Authors: 
    Date: 2025-11-13
    Last Update: 2025-11-13
    License: GNU GENERAL PUBLIC LICENSE - https://www.gnu.org/licenses/gpl-3.0.en.html
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
*/

params [
    ["_size", 0, []]
];

private _name = "";
switch (_size) do {
    case 0: {
        _name = localize 'STR_NOTIFICATION_BATTLEGROUP_SIZE_TEXT_0';
    };
    case 1: {
        _name = localize 'STR_NOTIFICATION_BATTLEGROUP_SIZE_TEXT_1';
    };
    case 2: {
        _name = localize 'STR_NOTIFICATION_BATTLEGROUP_SIZE_TEXT_2';
    };
    case 3: {
        _name = localize 'STR_NOTIFICATION_BATTLEGROUP_SIZE_TEXT_3';
    };
    case 4: {
        _name = localize 'STR_NOTIFICATION_BATTLEGROUP_SIZE_TEXT_4';
    };
};

_name
