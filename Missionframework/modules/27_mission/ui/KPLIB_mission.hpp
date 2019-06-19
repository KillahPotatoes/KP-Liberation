/*
    KP Liberation mission dialog

    File: KPLIB_mission.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-15
    Last Update: 2019-06-20
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html
    Public: No

    Description:
        A lightweight mission dialog to buy and start sidemissions.
*/

class KPLIB_mission {
    idd = KPLIB_IDC_MISSION_DIALOG;
    movingEnable = 0;

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "KP Liberation Missions";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundC {};

    };

    class controls {

        class KPLIB_LabelStart: KPGUI_PRE_InlineTitle {
            text = "Available Missions";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,16);
        };

        class KPLIB_HeaderMissionList: KPGUI_PRE_ListNBox {
            idc = KPLIB_IDC_MISSION_HEADERMISSIONLIST;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,3,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,(24));

            columns[] = {0, 0.4, 0.55, 0.70, 0.85};
        };

        class KPLIB_MissionList: KPGUI_PRE_ListNBox {
            idc = KPLIB_IDC_MISSION_MISSIONLIST;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,5,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,(48/25));

            columns[] = {0, 0.4, 0.55, 0.70, 0.85};
        };

        class KPLIB_ButtonStart: KPGUI_PRE_InlineButton {
            text = "Start Mission";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,30,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            onButtonClick = "";
        };

        class KPLIB_LabelAbort: KPLIB_LabelStart {
            text = "Running Missions";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,32,48);
        };

        class KPLIB_HeaderRunningList: KPLIB_HeaderMissionList {
            idc = KPLIB_IDC_MISSION_HEADERRUNNINGLIST;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,35,48);
        };

        class KPLIB_RunningList: KPLIB_MissionList {
            idc = KPLIB_IDC_MISSION_RUNNINGLIST;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,37,48);
            h = KP_GETH(KP_HEIGHT_VAL_C,(48/9));
        };

        class KPLIB_ButtonAbort: KPLIB_ButtonStart {
            text = "Abort Mission";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,46,48);
            onButtonClick = "";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {};

    };

};
