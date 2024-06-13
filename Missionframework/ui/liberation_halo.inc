class liberation_halo {
    idd = 5203;
    movingEnable = false;
    controlsBackground[] = {};

    controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "InnerBG_F", "Header","JumpButton","CancelButton","DeployMap"};

    objects[] = {};

    class RecycleBG: BgPicture {
        x = (0.2 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
        y = (0.15 * safezoneH + safezoneY) - (3 * BORDERSIZE);
        w = (0.6 * safezoneW) + (4 * BORDERSIZE);
        h = (0.7 * safezoneH) + (6 * BORDERSIZE);
    };
    class DeployMap: kndr_MapControl {
        idc = 251;
        x = (0.2 * safezoneW + safezoneX);
        y = (0.2 * safezoneH + safezoneY);
        w = (0.6 * safezoneW);
        h = (0.6 * safezoneH) - ( 1.5 * BORDERSIZE);
    };
    class OuterBG: StdBG {
        colorBackground[] = COLOR_BROWN;
        x = (0.2 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
        y = (0.15 * safezoneH + safezoneY) - (3 * BORDERSIZE);
        w = (0.6 * safezoneW) + (4 * BORDERSIZE);
        h = (0.7 * safezoneH) + (6 * BORDERSIZE);
    };
    class OuterBG_F: OuterBG {
        style = ST_FRAME;
    };
    class InnerBG: OuterBG {
        colorBackground[] = COLOR_GREEN;
        x = (0.2 * safezoneW + safezoneX)  - ( BORDERSIZE);
        y = 0.2 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
        w = (0.6 * safezoneW) +  (2 * BORDERSIZE);
        h = 0.65 * safezoneH  + (3 * BORDERSIZE);
    };
    class InnerBG_F: InnerBG {
        style = ST_FRAME;
    };
    class Header: StdHeader {
        x = 0.2 * safezoneW + safezoneX - (BORDERSIZE);
        y = 0.14 * safezoneH + safezoneY;
        w = 0.6 * safezoneW + ( 2 * BORDERSIZE);
        h = 0.05 * safezoneH - (BORDERSIZE);
        text = $STR_HALO_TITLE;
    };
    class JumpButton: StdButton {
        idc = 202;
        x = (0.39 * safezoneW + safezoneX);
        y = (0.8 * safezoneH + safezoneY);
        w = (0.1 * safezoneW);
        h = (0.05 * safezoneH);
        sizeEx = 0.025 * safezoneH;
        text = $STR_HALO_PARAM;
        action = "dojump = 1;";
    };
    class CancelButton: StdButton {
        idc = 202;
        x = (0.51 * safezoneW + safezoneX);
        y = (0.8 * safezoneH + safezoneY);
        w = (0.1 * safezoneW);
        h = (0.05 * safezoneH);
        sizeEx = 0.025 * safezoneH;
        text = $STR_RECYCLING_CANCEL;
        action = "closeDialog 0;";
    };
};
