/*
    KP Liberation recycle dialog

    File: KPLIB_recycle.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-22
    Last Update: 2019-02-08
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        A small recycle dialog where you can recycle vehicles in FOB range.
*/

class KPLIB_recycle {
    idd = 7580232;
    movingEnable = 0;
    onUnload = "KPLIB_logi_activeCam cameraEffect [""terminate"",""back""]; camDestroy KPLIB_logi_activeCam;";

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_RECYCLE_TITLE";
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
            tooltip = "$STR_KPLIB_DIALOG_RECYCLE_VEHICLE_TT";
            onLBSelChanged = "KPLIB_logi_activeCam cameraEffect [""terminate"",""back""]; camDestroy KPLIB_logi_activeCam; [] spawn KPLIB_fnc_logi_selectRecycleTarget";
        };

        class KPLIB_RefreshVehicles: KPGUI_PRE_CloseCross {
            text = "KPGUI\res\icon_refresh.paa";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,11,12);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,48);
            w = KP_GETW(KP_WIDTH_VAL_C,12);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPLIB_DIALOG_RECYCLE_REFRESH_TT";
            action = "[] call KPLIB_fnc_logi_refreshVehicles";
        };

        class KPLIB_LabelResources: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_RECYCLE_RESOURCES";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,4,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,16);
        };

        class KPLIB_TextSupply: KPGUI_PRE_Text {
            text = "$STR_KPLIB_DIALOG_RECYCLE_SUPPLY";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,8,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_TextSupplyRefund: KPGUI_PRE_Text {
            idc = 68741;
            text = "---";
            style = 1;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,8,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_TextAmmo: KPLIB_TextSupply {
            text = "$STR_KPLIB_DIALOG_RECYCLE_AMMO";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,11,48);
        };

        class KPLIB_TextAmmoRefund: KPLIB_TextSupplyRefund {
            idc = 68742;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,11,48);
        };

        class KPLIB_TextFuel: KPLIB_TextSupply {
            text = "$STR_KPLIB_DIALOG_RECYCLE_FUEL";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,14,48);
        };

        class KPLIB_TextFuelRefund: KPLIB_TextSupplyRefund {
            idc = 68743;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,14,48);
        };

        class KPLIB_RecycleCam: KPGUI_PRE_Picture {
            idc = 68744;
            text = "KPGUI\res\kp512_CA.paa";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,24,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,2);
        }

        class KPLIB_ButtonRecycle: KPGUI_PRE_DialogButtonC {
            idc = 68745;
            text = "$STR_KPLIB_DIALOG_BUTTON_RECYCLE";
            action = "[] call KPLIB_fnc_logi_recycleTarget"
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {
        };

    };
};
