/*
    KP Liberation redeploy dialog defines

    File: KPLIB_defines.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2017-10-28
    Last Update: 2018-01-05
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    Redeploy dialog after respawn or select redeploy from a FOB or mobile spawn.
*/

class KPLIB_redeploy {
    idd = 75801;
    movingEnable = false;
    controlsBackground[] = {};

    controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "InnerBG_F", "Header","DeployList","DeployButton","DeployMap", "LoadoutsCombo", "LabelDeploy", "LabelLoadout", "MapButton"};

    objects[] = {};

    class RecycleBG: BgPicture {
        idc = 758011;
        x = (0.15 * safezoneW + safezoneX) - (2 * BORDERSIZE);
        y = (0.12 * safezoneH + safezoneY) - (3 * BORDERSIZE);
        w = (0.15 * safezoneW) + (4 * BORDERSIZE);
        h = (0.75 * safezoneH) + (6 * BORDERSIZE);
    };
    class DeployMap: kndr_MapControl {
        idc = 758012;
        x = (0.15 * safezoneW + safezoneX);
        y = (0.57 * safezoneH + safezoneY);
        w = (0.15 * safezoneW);
        h = (0.25 * safezoneH) - (1.5 * BORDERSIZE);
    };

    class OuterBG: StdBG {
        idc = -1;
        colorBackground[] = COLOR_BROWN;
        x = (0.15 * safezoneW + safezoneX) - (2 * BORDERSIZE);
        y = (0.12 * safezoneH + safezoneY) - (3 * BORDERSIZE);
        w = (0.15 * safezoneW) + (4 * BORDERSIZE);
        h = (0.75 * safezoneH) + (6 * BORDERSIZE);
    };
    class OuterBG_F: OuterBG {
        idc = -1;
        style = ST_FRAME;
    };
    class InnerBG: OuterBG {
        idc = -1;
        colorBackground[] = COLOR_GREEN;
        x = (0.15 * safezoneW + safezoneX) - (BORDERSIZE);
        y = 0.17 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
        w = (0.15 * safezoneW) + (2 * BORDERSIZE);
        h = 0.7 * safezoneH  + (3 * BORDERSIZE);
    };
    class InnerBG_F: InnerBG {
        idc = -1;
        style = ST_FRAME;
    };
    class Header: StdHeader {
        idc = -1;
        x = 0.15 * safezoneW + safezoneX - (BORDERSIZE);
        y = 0.11 * safezoneH + safezoneY;
        w = 0.15 * safezoneW + (2 * BORDERSIZE);
        h = 0.05 * safezoneH - (BORDERSIZE);
        text = $STR_DEPLOY_TITLE;
    };
    class LabelDeploy: StdText {
        idc = -1;
        x = (0.15 * safezoneW + safezoneX);
        w = (0.15 * safezoneW);
        h = (0.03 * safezoneH);
        y = 0.23 * safezoneH + safezoneY;
        sizeEx = 0.018 * safezoneH;
        text = $STR_DEPLOY_SPAWNLIST;
    };
    class DeployList: StdListBox {
        idc = 758013;
        x = 0.15 * safezoneW + safezoneX;
        w = 0.15 * safezoneW;
        y = 0.26 * safezoneH + safezoneY;
        h = (0.31 * safezoneH) - (1.5 * BORDERSIZE);
        shadow = 2;
        onLBSelChanged="";
    };

    class LabelLoadout: StdText {
        idc = -1;
        x = (0.15 * safezoneW + safezoneX);
        w = (0.15 * safezoneW);
        h = (0.03 * safezoneH);
        y = 0.16 * safezoneH + safezoneY;
        sizeEx = 0.018 * safezoneH;
        text = $STR_DEPLOY_LOADOUTLIST;
    };
    class LoadoutsCombo: StdCombo {
        idc = 758014;
        x = (0.15 * safezoneW + safezoneX);
        w = 0.15 * safezoneW;
        y = 0.19 * safezoneH + safezoneY;
        h = 0.03 * safezoneH;
        sizeEx = 0.018 * safezoneH;
      };
    class DeployButton: StdButton {
        idc = 758015;
        x = (0.15 * safezoneW + safezoneX);
        y = (0.82 * safezoneH + safezoneY);
        w = (0.15 * safezoneW);
        h = (0.05 * safezoneH);
        sizeEx = 0.05 * safezoneH;
        text = $STR_DEPLOY_BUTTON;
        action = "KPLIB_dialog_deploy = 1";
    };
    class MapButton: StdButton {
        idc = 758016;
        x = (0.285 * safezoneW + safezoneX);
        y = (0.56 * safezoneH + safezoneY);
        w = (0.015 * safezoneW);
        h = (0.025 * safezoneH);
        sizeEx = 0.018 * safezoneH;
        text = "<>";
        action = "KPLIB_dialog_mapTrigger = KPLIB_dialog_mapTrigger + 1;";
    };
};
