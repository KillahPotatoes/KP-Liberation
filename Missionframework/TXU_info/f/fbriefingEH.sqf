/*
// AUTHOR       : Terox (terox_@hotmail.com)
// MP MACHINE   : all
// Called from  : fn_post_init.sqf
// Called using : TXU_INFO_FrameEHId = addMissionEventHandler ["EachFrame",{[] call TXU_INFO_fbriefingEH}];
// Time Called  : After mission.sqm (Post-Init)
// Description  : Monitors menu actions in the briefing and calls a function to add buttons when required
                  It then removes the EachFrame EH once it has done that
//
// PARAMS : NONE

*/

private ["_display","_diarySubList", "_diaryList" ];

  // displays are 54, 1001, 1002, 1013
  if(Isnil "TXU_INFO_ButtonAdded")then{TXU_INFO_ButtonAdded= FALSE};
  if(Isnil "TXU_INFO_CtrlEHAdded")then{TXU_INFO_CtrlEHAdded= FALSE};

  if(getClientStateNumber < 9)exitwith{};// TOO EARLY, no briefing screen;
  // Buttons will be added when getclientstateNumber is 9 (Briefing screen displaying)
  // AND the **COMMUNITY INFO ** tab is selected
  if(TXU_INFO_ButtonAdded)exitwith
  {
    removeMissionEventHandler ["EachFrame", TXU_INFO_FrameEHId];
    TXU_INFO_ButtonAdded = FALSE;
    TXU_INFO_CtrlEHAdded = FALSE;
  };

  disableSerialization;
  _display = uiNamespace getVariable ["RscDiary","NONE"];
  _diarySubList   = _display displayCtrl 1002;

  _diaryList    = _display displayCtrl 1001;
  if ! (TXU_INFO_CtrlEHAdded)then
  {
    TXU_INFO_CtrlEHAdded = TRUE;
    _diaryList ctrlAddEventHandler [ "LBSelChanged",
    {
      _this spawn TXU_INFO_fctrl_Buttons;
    }];
  };



