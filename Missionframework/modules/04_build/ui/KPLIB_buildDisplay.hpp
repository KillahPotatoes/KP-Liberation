/*
    KP Liberation build display defines

    File: KPLIB_defines.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-11-28
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Overlay of build camera with all building controls
*/

// Build display
class KPLIB_build {
    idd = -1;
    movingEnable = 0;

    onLoad = "call KPLIB_fnc_build_displayLoad";
    onUnload = "call KPLIB_fnc_build_displayUnload";
    onKeyDown = "['onKeyDown', _this] call KPLIB_fnc_build_handleKeys";
    onKeyUp = "['onKeyUp', _this] call KPLIB_fnc_build_handleKeys";

    class controlsBackground {

        class KPLIB_LogoRightCorner: KPGUI_PRE_LogoRightCorner {};

        class MouseHandler: KPGUI_PRE_ControlsGroupNoScrollbars {
            idc = KPLIB_IDC_MOUSEHANDLER;
            x = safeZoneXAbs;
            y = safeZoneY;
            w = safeZoneWAbs;
            h = safeZoneH;
            onMouseButtonDown = "['onMouseButtonDown', _this] call KPLIB_fnc_build_handleMouse";
            onMouseButtonUp = "['onMouseButtonUp', _this] call KPLIB_fnc_build_handleMouse";
            onMouseZChanged = "['onMouseZChanged', _this] call KPLIB_fnc_build_handleMouse";
            onMouseMoving = "['onMouseMoving', _this] call KPLIB_fnc_build_handleMouse";
            onMouseHolding = "['onMouseHolding', _this] call KPLIB_fnc_build_handleMouse";
        };

        class KPLIB_DialogTitle: KPGUI_PRE_DialogTitle_LeftPanel {
            text = "$STR_KPLIB_DIALOG_BUILD_TITLE";
        };

        class KP_DialogArea: KPGUI_PRE_DialogBackground_LeftPanel {
            idc = KPLIB_IDC_BUILD_DIALOG_AREA;
        };

    };

    class Controls {

        class KPLIB_ModeUnits: KPGUI_PRE_ActivePicture {
            text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_INFANTRY;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,0,8);
            y = KP_GETCY(KP_Y_VAL_LP,KP_HEIGHT_VAL_LP,1,20);
            w = KP_GETW(KP_WIDTH_VAL_LP,8);
            h = KP_GETH(KP_HEIGHT_VAL_LP,20);
        };

        class KPLIB_ModeLight: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconCar_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_LIGHT;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,1,8);
        };

        class KPLIB_ModeHeavy: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconTank_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_HEAVY;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,2,8);
        };

        class KPLIB_ModeAir: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconHelicopter_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_AIR;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,3,8);
        };

        class KPLIB_ModeStatic: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconStaticCannon_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_STATIC;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,4,8);
        };

        class KPLIB_ModeBuilding: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\mapcontrol\Bunker_CA.paa";
            idc = KPLIB_IDC_BUILD_TAB_BUILDING;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,5,8);
        };

        class KPLIB_ModeSupport: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconCrateAmmo_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_SUPPORT;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,6,8);
        };

        class KPLIB_ModeSquad: KPLIB_ModeUnits {
            text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_SQUAD;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,7,8);
        };

        class KPLIB_BuildList: KPGUI_PRE_ListNBox {
            idc = KPLIB_IDC_BUILD_ITEM_LIST;

            x = KP_GETCX(KP_X_VAL_LP,KP_WIDTH_VAL_LP,0,1);
            y = KP_GETCY(KP_Y_VAL_LP,KP_HEIGHT_VAL_LP,2,20);
            w = KP_GETW(KP_WIDTH_VAL_LP,1);
            h = KP_GETH(KP_HEIGHT_VAL_LP,(20/18));

            columns[] = { 0, 0.65, 0.75, 0.85 };

            onMouseZChanged = "['onMouseZChanged_BuildList', _this] call KPLIB_fnc_build_handleMouse";
        };

        class KP_ApplyButton: KPGUI_PRE_DialogButton_LeftPanel {
            idc = KPLIB_IDC_BUILD_CONFIRM;
            text = "$STR_KPLIB_DIALOG_BUTTON_BUILD";

            w = KP_GETWPLAIN(KP_WIDTH_VAL_LP,1);
            onButtonClick = "_this call KPLIB_fnc_build_confirmAll";
        };

        class KPLIB_DialogCross: KPGUI_PRE_DialogCross_LeftPanel {
            action = "call KPLIB_fnc_build_stop";
        };

    };
};
