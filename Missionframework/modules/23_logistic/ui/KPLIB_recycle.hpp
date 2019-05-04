/*
    KP Liberation recycle dialog

    File: KPLIB_recycle.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2019-01-22
    Last Update: 2019-05-04

    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        A small recycle dialog where you can recycle vehicles in FOB range.
*/

class KPLIB_recycle {
    idd = KPLIB_IDC_LOGISTIC_RECYCLE_DIALOG;
    movingEnable = 0;
    onUnload = "KPLIB_logistic_activeCam cameraEffect [""terminate"",""back""]; camDestroy KPLIB_logistic_activeCam;";

    class controlsBackground {

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitleC {
            text = "$STR_KPLIB_DIALOG_RECYCLE_TITLE";
        };

        class KPLIB_DialogArea: KPGUI_PRE_DialogBackgroundC {};

    };

    class controls {

        class KPLIB_ComboVehicles: KPGUI_PRE_Combo {
            idc = KPLIB_IDC_LOGISTIC_RECYCLE_COMBOVEHICLES;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,48);
            w = KP_GETW(KP_WIDTH_VAL_C,(12/11));
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPLIB_DIALOG_RECYCLE_VEHICLE_TT";
            onLBSelChanged = "KPLIB_logistic_activeCam cameraEffect [""terminate"",""back""]; camDestroy KPLIB_logistic_activeCam; [] call KPLIB_fnc_logistic_selectRecycleTarget";
        };

        class KPLIB_RefreshVehicles: KPGUI_PRE_CloseCross {
            text = "KPGUI\res\icon_refresh.paa";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,11,12);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,1,48);
            w = KP_GETW(KP_WIDTH_VAL_C,12);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
            tooltip = "$STR_KPLIB_REFRESH";
            action = "[7580232, 68740] call KPLIB_fnc_logistic_refreshTargets";
        };

        class KPLIB_LabelResources: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_RECYCLE_RESOURCES";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,4,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,16);
        };

        class KPLIB_TextSupply: KPGUI_PRE_InlineTitle {
            text = "$STR_KPLIB_DIALOG_RECYCLE_SUPPLY";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,8,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_TextSupplyState: KPGUI_PRE_Text {
            text = "$STR_KPLIB_DIALOG_RECYCLE_SUPPLYSTATE";
            style = 0;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,10,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_TextSupplyStateValue: KPGUI_PRE_Text {
            idc = KPLIB_IDC_LOGISTIC_RECYCLE_SUPPLYSTATEVALUE;
            text = "---";
            style = 1;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,10,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_TextSupplyRefund: KPGUI_PRE_Text {
            text = "$STR_KPLIB_DIALOG_RECYCLE_REFUND";
            style = 0;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,12,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_TextSupplyRefundValue: KPGUI_PRE_Text {
            idc = KPLIB_IDC_LOGISTIC_RECYCLE_SUPPLYREFUNDVALUE;
            text = "---";
            style = 1;
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,12,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,24);
        };

        class KPLIB_TextAmmo: KPLIB_TextSupply {
            text = "$STR_KPLIB_DIALOG_RECYCLE_AMMO";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,15,48);
        };

        class KPLIB_TextAmmoState: KPLIB_TextSupplyState {
            text = "$STR_KPLIB_DIALOG_RECYCLE_AMMOSTATE";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,17,48);
        };

        class KPLIB_TextAmmoStateValue: KPLIB_TextSupplyStateValue {
            idc = KPLIB_IDC_LOGISTIC_RECYCLE_AMMOSTATEVALUE;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,17,48);
        };

        class KPLIB_TextAmmoRefund: KPLIB_TextSupplyRefund {
            text = "$STR_KPLIB_DIALOG_RECYCLE_REFUND";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,19,48);
        };

        class KPLIB_TextAmmoRefundValue: KPLIB_TextSupplyRefundValue {
            idc = KPLIB_IDC_LOGISTIC_RECYCLE_AMMOREFUNDVALUE;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,19,48);
        };

        class KPLIB_TextFuel: KPLIB_TextSupply {
            text = "$STR_KPLIB_DIALOG_RECYCLE_FUEL";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,22,48);
        };

        class KPLIB_TextFuelState: KPLIB_TextSupplyState {
            text = "$STR_KPLIB_DIALOG_RECYCLE_FUELSTATE";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,24,48);
        };

        class KPLIB_TextFuelStateValue: KPLIB_TextSupplyStateValue {
            idc = KPLIB_IDC_LOGISTIC_RECYCLE_FUELSTATEVALUE;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,24,48);
        };

        class KPLIB_TextFuelRefund: KPLIB_TextSupplyRefund {
            text = "$STR_KPLIB_DIALOG_RECYCLE_REFUND";
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,26,48);
        };

        class KPLIB_TextFuelRefundValue: KPLIB_TextSupplyRefundValue {
            idc = KPLIB_IDC_LOGISTIC_RECYCLE_FUELREFUNDVALUE;
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,26,48);
        };

        class KPLIB_RecycleCam: KPGUI_PRE_Picture {
            text = "#(argb,512,512,1)r2t(rtt,1.333)";
            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_VAL_C,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,31,48);
            w = KP_GETW(KP_WIDTH_VAL_C,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,3);
        };

        class KPLIB_ButtonRecycle: KPGUI_PRE_DialogButtonC {
            idc = KPLIB_IDC_LOGISTIC_RECYCLE_BUTTONRECYCLE;
            text = "$STR_KPLIB_DIALOG_BUTTON_RECYCLE";
            action = "[] call KPLIB_fnc_logistic_recycleTarget";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCrossC {
        };

    };
};
