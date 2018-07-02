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
    movingEnable = false;

    onLoad = "['onLoad', _this] call KPLIB_fnc_build_displayScript";

    class ControlsBackground {

        class KPLIB_ItemsTitle: KPLIB_Title {
            text = "$STR_BUILD";
            x = KPLIB_GUI_POS_X_CORNER;
            y = KPLIB_GUI_POS_Y_CORNER;
            w = KPLIB_GUI_WIDTH_CORNER;
        };
        class KPLIB_ItemsArea: KPLIB_AreaBackground {
            x = KPLIB_GUI_POS_X_AREA_CORNER;
            y = KPLIB_GUI_POS_Y_AREA_CORNER;
            w = KPLIB_GUI_WIDTH_AREA_CORNER;
            h = KPLIB_GUI_HEIGHT_AREA_CORNER;
        };

    };

    class Controls {

        class KPLIB_CloseDisplay: KPLIB_CloseCross {
            x = KPLIB_GUI_POS_X_CROSS_CORNER;
            y = KPLIB_GUI_POS_Y_CROSS_CORNER;
            // Close whole build camera
            action = "call KPLIB_fnc_build_camera_close";
        };

        class KPLIB_BuildTabsGroup: KPLIB_ControlsGroupNoScrollbars {
            x = KPLIB_GUI_POS_X_AREA_CORNER;
            y = KPLIB_GUI_POS_Y_AREA_CORNER;
            w = KPLIB_GUI_WIDTH_AREA_CORNER;
            h = KPLIB_BUILD_TAB_WIDTH + KPLIB_BUILD_TAB_Y_OFFSET;

            class Controls {

                class KPLIB_ModeUnits: KPLIB_ActivePicture {
                    text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";

                    x = KPLIB_BUILD_TAB_WIDTH * 0;
                    y = 0;

                    w = KPLIB_BUILD_TAB_WIDTH;
                    h = KPLIB_BUILD_TAB_WIDTH;

                    idc = KPLIB_IDC_BUILD_TAB_INFANTRY;
                };

                class KPLIB_ModeLight: KPLIB_ModeUnits {
                    text = "\A3\ui_f\data\map\vehicleicons\iconCar_ca.paa";

                    x = KPLIB_BUILD_TAB_WIDTH * 1;
                    y = 0;

                    idc = KPLIB_IDC_BUILD_TAB_LIGHT;
                };

                class KPLIB_ModeHeavy: KPLIB_ModeUnits {
                    text = "\A3\ui_f\data\map\vehicleicons\iconTank_ca.paa";

                    x = KPLIB_BUILD_TAB_WIDTH * 2;
                    y = 0;

                    idc = KPLIB_IDC_BUILD_TAB_HEAVY;
                };

                class KPLIB_ModeAir: KPLIB_ModeUnits {
                    text = "\A3\ui_f\data\map\vehicleicons\iconHelicopter_ca.paa";

                    x = KPLIB_BUILD_TAB_WIDTH * 3;
                    y = 0;

                    idc = KPLIB_IDC_BUILD_TAB_AIR;
                };

                class KPLIB_ModeStatic: KPLIB_ModeUnits {
                    text = "\A3\ui_f\data\map\vehicleicons\iconStaticCannon_ca.paa";

                    x = KPLIB_BUILD_TAB_WIDTH * 4;
                    y = 0;

                    idc = KPLIB_IDC_BUILD_TAB_STATIC;
                };

                class KPLIB_ModeBuilding: KPLIB_ModeUnits {
                    text = "\A3\ui_f\data\map\mapcontrol\Bunker_CA.paa";

                    x = KPLIB_BUILD_TAB_WIDTH * 5;
                    y = 0;

                    idc = KPLIB_IDC_BUILD_TAB_BUILDING;
                };

                class KPLIB_ModeSupport: KPLIB_ModeUnits {
                    text = "\A3\ui_f\data\map\vehicleicons\iconCrateAmmo_ca.paa";

                    x = KPLIB_BUILD_TAB_WIDTH * 6;
                    y = 0;

                    idc = KPLIB_IDC_BUILD_TAB_SUPPORT;
                };

                class KPLIB_ModeSquad: KPLIB_ModeUnits {
                    text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";

                    x = KPLIB_BUILD_TAB_WIDTH * 7;
                    y = 0;

                    idc = KPLIB_IDC_BUILD_TAB_SQUAD;
                };

            };
        };

        class KPLIB_BuildList: KPLIB_ListNBox {
            idc = 201;

            x = KPLIB_GUI_POS_X_AREA_CORNER;
            y = KPLIB_GUI_POS_Y_AREA_CORNER + KPLIB_BUILD_TAB_WIDTH + KPLIB_BUILD_TAB_Y_OFFSET;
            w = KPLIB_GUI_WIDTH_AREA_CORNER;
            h = KPLIB_GUI_HEIGHT_AREA_CORNER - KPLIB_BUILD_TAB_WIDTH - KPLIB_BUILD_TAB_Y_OFFSET;

            columns[] = { 0, 0.65, 0.75, 0.85 };
        };

        class KPLIB_BuildConfirm: KPLIB_ButtonMenu {
            idc = KPLIB_IDC_BUILD_CONFIRM;

            x = KPLIB_GUI_POS_X_AREA_CORNER + KPLIB_GUI_WIDTH_AREA_CORNER * (1 - 0.3);
            // TODO improve positioning
            y = (KPLIB_GUI_POS_Y_AREA_CORNER + KPLIB_BUILD_TAB_WIDTH + KPLIB_BUILD_TAB_Y_OFFSET) + (KPLIB_GUI_HEIGHT_AREA_CORNER - KPLIB_BUILD_TAB_WIDTH - KPLIB_BUILD_TAB_Y_OFFSET);

            w = KPLIB_GUI_WIDTH_AREA_CORNER * 0.3;
            h = GUI_GRID_H * 1;

            text = "$STR_BUILD";
        };

    };
};
