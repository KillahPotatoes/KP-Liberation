/*
    KP Liberation mission dialog

    File: KPLIB_mission.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-15
    Last Update: 2019-06-23
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        A lightweight mission dialog to buy and start sidemissions.
*/

class KPLIB_mission {
    idd = KPLIB_IDC_MISSION_DIALOG;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleS {
            text = "$STR_KPLIB_DIALOG_MISSION_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundS {};

    };

    class controls {

        // Left side of the dialog

        class KPLIB_LabelStart: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_MISSION_TITLESTART";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,0,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,16);
        };

        class KPLIB_HeaderMissionList: KPGUI_PRE_ListNBox {
            idc = KPLIB_IDC_MISSION_HEADERMISSIONLIST;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,(24));

            columns[] = {0, 0.4, 0.55, 0.70, 0.85};
        };

        class KPLIB_MissionList: KPGUI_PRE_ListNBox {
            idc = KPLIB_IDC_MISSION_MISSIONLIST;
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,5,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/25));

            columns[] = {0, 0.4, 0.55, 0.70, 0.85};
            onLBSelChanged = "[] call KPLIB_fnc_mission_preCheck";
        };

        class KPLIB_ButtonStart: KPGUI_PRE_InlineButton {
            idc = KPLIB_IDC_MISSION_MISSIONBUTTON;
            text = "$STR_KPLIB_DIALOG_MISSION_BUTTONSTART";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,30,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            onButtonClick = "[_this select 0] call KPLIB_fnc_mission_buttonClick";
        };

        class KPLIB_LabelAbort: KPLIB_LabelStart {
            text = "$STR_KPLIB_DIALOG_MISSION_TITLEABORT";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,32,48);
        };

        class KPLIB_HeaderRunningList: KPLIB_HeaderMissionList {
            idc = KPLIB_IDC_MISSION_HEADERRUNNINGLIST;
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,35,48);
        };

        class KPLIB_RunningList: KPLIB_MissionList {
            idc = KPLIB_IDC_MISSION_RUNNINGLIST;
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,37,48);
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/9));

            onLBSelChanged = "[[_this select 0, _this select 1] call KPLIB_fnc_mission_readData] call KPLIB_fnc_mission_displayMission";
        };

        class KPLIB_ButtonAbort: KPLIB_ButtonStart {
            idc = KPLIB_IDC_MISSION_RUNNINGBUTTON;
            text = "$STR_KPLIB_DIALOG_MISSION_BUTTONABORT";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,46,48);
            onButtonClick = "[_this select 0] call KPLIB_fnc_mission_buttonClick";
        };

        // Right side of the dialog

        class KPLIB_LabelDescription: KPLIB_LabelStart {
            idc = KPLIB_IDC_MISSION_TITLE;
            text = "";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
        };

        class KPLIB_MissionDescription: KPGUI_PRE_Text {
            idc = KPLIB_IDC_MISSION_DESCRIPTION;
            text = "";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,4);

            style = 16;
        };

        class KPLIB_LabelVictory: KPLIB_LabelDescription {
            text = "$STR_KPLIB_DIALOG_MISSION_TITLEREWARD";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,15,48);
        };

        class KPLIB_VictoryReward: KPLIB_MissionDescription {
            idc = KPLIB_IDC_MISSION_REWARD;
            text = "";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,18,48);
            h = KP_GETH(KP_HEIGHT_VAL_S,(48/4));
        };

        class KPLIB_LabelDefeat: KPLIB_LabelVictory {
            text = "$STR_KPLIB_DIALOG_MISSION_TITLEPENALTY";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,23,48);
        };

        class KPLIB_DefeatPenalty: KPLIB_VictoryReward {
            idc = KPLIB_IDC_MISSION_PENALTY;
            text = "";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,26,48);
        };

        class KPLIB_MissionLogo: KPGUI_PRE_PictureRatio {
            idc = KPLIB_IDC_MISSION_PICTURE;
            text = "KPGUI\res\kp512_CA.paa";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,31,48);
            h = KP_GETH(KP_HEIGHT_VAL_S,3);
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossS {};

    };

};
