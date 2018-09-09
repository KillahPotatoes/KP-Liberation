/*
    KP Liberation build display defines

    File: KPLIB_defines.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-07-01
    Last Update: 2018-07-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Overlay of build camera with all building controls
*/

// Build display
class KPLIB_build {
    idd = -1;
    movingEnable = 0;

    onLoad = "['onLoad', _this] call KPLIB_fnc_build_displayScript";
    onUnload = "['onUnload', _this] call KPLIB_fnc_build_displayScript";

    class controlsBackground {

        class KPLIB_DialogTitle: KP_DialogTitleC {
            text = "$STR_BUILD";
            w = KP_GETWPLAIN(KP_WIDTH_BUILD,1);
        };

        class KP_DialogArea: KP_DialogBackgroundC {
            w = KP_GETWPLAIN(KP_WIDTH_BUILD,1);
        };

    };

    class Controls {

        class KPLIB_ModeUnits: KP_ActivePicture {
            text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_INFANTRY;

            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_BUILD,0,8);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,0,16);
            w = KP_GETW(KP_WIDTH_BUILD,8);
            h = KP_GETH(KP_HEIGHT_VAL_C,16);
        };

        class KPLIB_ModeLight: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconCar_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_LIGHT;

            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_BUILD,1,8);
        };

        class KPLIB_ModeHeavy: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconTank_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_HEAVY;

            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_BUILD,2,8);
        };

        class KPLIB_ModeAir: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconHelicopter_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_AIR;

            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_BUILD,3,8);
        };

        class KPLIB_ModeStatic: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconStaticCannon_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_STATIC;

            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_BUILD,4,8);
        };

        class KPLIB_ModeBuilding: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\mapcontrol\Bunker_CA.paa";
            idc = KPLIB_IDC_BUILD_TAB_BUILDING;

            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_BUILD,5,8);
        };

        class KPLIB_ModeSupport: KPLIB_ModeUnits {
            text = "\A3\ui_f\data\map\vehicleicons\iconCrateAmmo_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_SUPPORT;

            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_BUILD,6,8);
        };

        class KPLIB_ModeSquad: KPLIB_ModeUnits {
            text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
            idc = KPLIB_IDC_BUILD_TAB_SQUAD;

            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_BUILD,7,8);
        };

        class KPLIB_BuildList: KP_ListNBox {
            idc = KPLIB_IDC_BUILD_ITEM_LIST;

            x = KP_GETCX(KP_X_VAL_C,KP_WIDTH_BUILD,0,1);
            y = KP_GETCY(KP_Y_VAL_C,KP_HEIGHT_VAL_C,2,16);
            w = KP_GETW(KP_WIDTH_BUILD,1);
            h = KP_GETH(KP_HEIGHT_VAL_C,16) * 15;

            columns[] = { 0, 0.65, 0.75, 0.85 };
        };

        class KP_ApplyButton: KP_DialogButtonC {
            idc = KPLIB_IDC_BUILD_CONFIRM;
            text = "$STR_BUILD";

            w = KP_GETWPLAIN(KP_WIDTH_BUILD,1);
            onButtonClick = "['build', _this] call KPLIB_fnc_build_displayScript";
        };

        class KPLIB_DialogCross: KP_DialogCrossC {
            action = "call KPLIB_fnc_build_camClose;";
            x = safeZoneX + safeZoneW * (KP_X_VAL_C + KP_WIDTH_BUILD - 0.02);
        };

    };
};
