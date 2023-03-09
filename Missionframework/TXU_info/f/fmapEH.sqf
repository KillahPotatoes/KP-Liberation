/*
// AUTHOR       : Terox (terox_@hotmail.com)
// MP MACHINE   : all
// Called from  : fn_post_init.sqf
// Called using : [] spawn{TXU_INFO_MapEHId = addMissionEventHandler ["Map",{ _this spawn TXU_INFO_fmapEH  }];};
// Time Called  : After mission.sqm (Post-Init)
// Description  : Monitors opening the map after the mission has started and calls a function to add buttons when required
//
// PARAMS : Bool to return if the map is open or not

*/
  params[ "_isOpen" ];
  private ["_display","_diarySubList", "_diaryList" ];
  if ( _isOpen ) then
  {
    if(Isnil "TXU_INFO_ButtonAdded1")then{TXU_INFO_ButtonAdded1= FALSE};
    // NB Different Bool "TXU_INFO_CtrlEHAdded1" to the BriefingEH
    if(Isnil "TXU_INFO_CtrlEHAdded1")then{TXU_INFO_CtrlEHAdded1= FALSE};

    if(TXU_INFO_ButtonAdded1)exitwith{};

    disableSerialization;
    _display = uiNamespace getVariable "RscDiary";
    _diaryList = _display displayCtrl 1001;
    _diarySubList   = _display displayCtrl 1002;

    if ! (TXU_INFO_CtrlEHAdded1)then
    {
      TXU_INFO_CtrlEHAdded1 = TRUE;
      _diaryList ctrlAddEventHandler [ "LBSelChanged",
      {
        _this spawn TXU_INFO_fctrl_Buttons;
      }];
    };
  };



