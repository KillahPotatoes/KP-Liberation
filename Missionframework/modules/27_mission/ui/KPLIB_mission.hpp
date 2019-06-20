/*
    KP Liberation mission dialog

    File: KPLIB_mission.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-06-15
    Last Update: 2019-06-21
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
            text = "KP Liberation Missions";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundS {};

    };

    class controls {

        // Left side of the dialog

        class KPLIB_LabelStart: KPGUI_PRE_InlineTitle {
            text = "Available Missions";
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
        };

        class KPLIB_ButtonStart: KPGUI_PRE_InlineButton {
            text = "Start Mission";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,0,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,30,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
            onButtonClick = "";
        };

        class KPLIB_LabelAbort: KPLIB_LabelStart {
            text = "Running Missions";
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
        };

        class KPLIB_ButtonAbort: KPLIB_ButtonStart {
            text = "Abort Mission";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,46,48);
            onButtonClick = "";
        };

        // Right side of the dialog

        class KPLIB_LabelTitle: KPLIB_LabelStart {
            text = "Missiontitle";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
        };

        class KPLIB_MissionDescription: KPGUI_PRE_Text {
            text = "BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla\nBlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla\nBlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla BlaBla";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,3,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,3);

            style = 16;
        };

        class KPLIB_TextSupply: KPGUI_PRE_Text {
            text = "Supply cost/refund: ";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,21,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);

            style = 1;
        };

        class KPLIB_CostSupply: KPGUI_PRE_Text {
            idc = KPLIB_IDC_MISSION_COSTSUPPLY;
            text = "0";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,3,4);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,21,48);
            w = KP_GETW(KP_WIDTH_VAL_S,4);
            h = KP_GETH(KP_HEIGHT_VAL_S,24);
        };

        class KPLIB_TextAmmo: KPLIB_TextSupply {
            text = "Ammo cost/refund: ";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,23,48);
        };

        class KPLIB_CostAmmo: KPLIB_CostSupply {
            idc = KPLIB_IDC_MISSION_COSTAMMO;
            text = "0";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,23,48);
        };

        class KPLIB_TextFuel: KPLIB_TextSupply {
            text = "Fuel cost/refund: ";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,25,48);
        };

        class KPLIB_CostFuel: KPLIB_CostSupply {
            idc = KPLIB_IDC_MISSION_COSTFUEL;
            text = "0";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,23,48);
        };

        class KPLIB_TextIntel: KPLIB_TextSupply {
            text = "Intel cost/refund: ";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,27,48);
        };

        class KPLIB_CostIntel: KPLIB_CostSupply {
            idc = KPLIB_IDC_MISSION_COSTINTEL;
            text = "0";
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,23,48);
        };

        class KPLIB_MissionLogo: KPGUI_PRE_PictureRatio {
            text = "KPGUI\res\kp512_CA.paa";
            x = KP_GETCX(KP_X_VAL_S,KP_WIDTH_VAL_S,1,2);
            y = KP_GETCY(KP_Y_VAL_S,KP_HEIGHT_VAL_S,31,48);
            w = KP_GETW(KP_WIDTH_VAL_S,2);
            h = KP_GETH(KP_HEIGHT_VAL_S,3);
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossS {};

    };

};
