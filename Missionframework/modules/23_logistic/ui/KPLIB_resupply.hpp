/*
    KP Liberation resupply dialog

    File: KPLIB_resupply.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-02-21
    Last Update: 2019-02-21
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        A small resupply dialog where you can resupply vehicles in FOB range.
*/

class KPLIB_resupply {
    idd = 7580233;
    movingEnable = 0;
    onUnload = "KPLIB_logi_activeCam cameraEffect [""terminate"",""back""]; camDestroy KPLIB_logi_activeCam;";

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_RESUPPLY_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundC {};
    };

    class controls {

        class KPLIB_ComboVehicles: KPGUI_PRE_Combo {
            idc = 68740;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,48);
            w = KP_GETW(KP_WIDTH_VAL_C,(12/11));
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPLIB_DIALOG_RESUPPLY_VEHICLE_TT";
            //onLBSelChanged = "KPLIB_logi_activeCam cameraEffect [""terminate"",""back""]; camDestroy KPLIB_logi_activeCam; [] spawn KPLIB_fnc_logi_selectRecycleTarget";
        };

        class KPLIB_RefreshVehicles: KPGUI_PRE_CloseCross {
            text = "KPGUI\res\icon_refresh.paa";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,11,12);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,48);
            w = KP_GETW(KP_WIDTH_VAL_C,12);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPLIB_DIALOG_RESUPPLY_REFRESH_TT";
            action = "[7580232, 68740] call KPLIB_fnc_logi_refreshTargets";
        };

        class KPLIB_ResupplyCam: KPGUI_PRE_Picture {
            text = "#(argb,512,512,1)r2t(rtt,1.333)";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,31,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,3);
        }

        class KPLIB_ButtonResupply: KPGUI_PRE_DialogButtonC {
            idc = 68747;
            text = "$STR_KPLIB_DIALOG_BUTTON_RESUPPLY";
            action = "";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {
        };

    };
};
