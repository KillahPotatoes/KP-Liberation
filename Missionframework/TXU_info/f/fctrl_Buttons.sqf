//url = "https://forums.bohemia.net/forums/topic/169501-link-to-website-in-briefing/";


disableSerialization;
params[ "_ctrl", "_index" ];
private["_display", "_ctrl","_diarySubList","_diaryEntry","_btnHeight","_contentHtml" ];
_display = ctrlParent _ctrl;
_diarySubList = _display displayCtrl 1002;

waitUntil{ ctrlShown _diarySubList };

_diaryEntry = _display displayCtrl 1013;

if ( _diarySubList lbText ( lbCurSel _diarySubList ) == "Downloads & Links" )
then
{
	if ( isNull ( _diaryEntry controlsGroupCtrl 10001 ) )
	then
	{
		_btnHeight = 0.02 * safeZoneH;

		//Hide diary entry html
		_contentHtml = _diaryEntry controlsGroupCtrl 1003;
		_contentHtml ctrlSetFade 1;
		_contentHtml ctrlCommit 0;

		//Inject button
		ctrlPosition _diaryEntry params[ "_entryX", "_entryY", "_entryW", "_entryH" ];
		_ctrl = _display ctrlCreate [ "TXU_TS_INFOBUTTON1", 10001, _diaryEntry ];
		//_ctrl ctrlSetPosition[ 0, 0, _entryW / 3, _btnHeight ];
		_ctrl ctrlSetPosition[ 0.02, 0.01, _entryW/2, _btnHeight ];
		_ctrl ctrlCommit 0;
		ctrlSetFocus _ctrl;
		_ctrl = _display ctrlCreate [ "TXU_TS_INFOBUTTON2", 10002, _diaryEntry ];
		_ctrl ctrlSetPosition[ 0.02, 0.05, _entryW / 2, _btnHeight ];
		_ctrl ctrlCommit 0;

		_ctrl = _display ctrlCreate [ "TXU_TS_INFOBUTTON3", 10003, _diaryEntry ];
		_ctrl ctrlSetPosition[ 0.02, 0.09, _entryW / 2, _btnHeight ];
		_ctrl ctrlCommit 0;
		_ctrl = _display ctrlCreate [ "TXU_TS_INFOBUTTON4", 10004, _diaryEntry ];
		_ctrl ctrlSetPosition[ 0.02, 0.13, _entryW / 2, _btnHeight ];
		_ctrl ctrlCommit 0;
		_ctrl = _display ctrlCreate [ "TXU_TS_INFOBUTTON5", 10005, _diaryEntry ];
		_ctrl ctrlSetPosition[ 0.02, 0.17, _entryW / 2, _btnHeight ];
		_ctrl ctrlCommit 0;

		TXU_INFO_ButtonAdded=TRUE;
	};
}
else
{
	//If its not the mod info entry
	//AND the injected button exists
	if !( isNull ( _diaryEntry controlsGroupCtrl 10001 ) )
	then
	{
		//Delete injected button
		{ctrlDelete ( _diaryEntry controlsGroupCtrl _x)}foreach[10001, 10002,10003,10004,10005];
		//Unhide entry html
		_contentHtml = _diaryEntry controlsGroupCtrl 1003;
		_contentHtml ctrlSetFade 0;
		_contentHtml ctrlCommit 0;
		TXU_INFO_ButtonAdded=FALSE;
		TXU_INFO_ButtonAdded1=FALSE;
	};
};
