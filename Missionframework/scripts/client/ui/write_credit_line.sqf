private [ "_control", "_caretPosition", "_linearray", "_currentline", "_caretcharacter" ];

_control = _this select 0;
_linearray = toArray (_this select 1);
_caretPosition = 0;

while { dialog && (_caretPosition <= count _linearray) } do {
	_currentline = [];
	while { count _currentline < _caretPosition } do {
		_currentline pushback (_linearray select (count _currentline));
	};
	_caretcharacter = "";
	if ( ( _caretPosition % 2 == 0 ) && ( _caretPosition != count _linearray ) ) then { _caretcharacter = "_" };
	ctrlSetText [ _control, format [ "%1%2", toString _currentline, _caretcharacter ] ];
	_caretPosition = _caretPosition + 1;
	sleep 0.04;
};