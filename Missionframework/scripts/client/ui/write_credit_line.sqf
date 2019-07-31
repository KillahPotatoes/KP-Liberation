params [
    "_control",
    "_linearray"
];

_linearray = toArray _linearray;
private _caretPosition = 0;

private ["_currentline", "_caretcharacter"];
while {dialog && (_caretPosition <= count _linearray)} do {
    _currentline = [];
    while {count _currentline < _caretPosition} do {
        _currentline pushback (_linearray select (count _currentline));
    };
    _caretcharacter = "";
    if ((_caretPosition % 2 == 0) && (_caretPosition != count _linearray)) then {_caretcharacter = "_"};
    ctrlSetText [_control, format ["%1%2", toString _currentline, _caretcharacter]];
    _caretPosition = _caretPosition + 1;
    sleep 0.04;
};
