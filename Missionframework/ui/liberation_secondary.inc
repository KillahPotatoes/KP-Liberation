class liberation_secondary {
    idd = 6842;
    movingEnable = false;
    controlsBackground[] = {
        "CamoBG",
        "OuterBG",
        "OuterBG_F",
        "InnerBG",
        "InnerBG_F",
        "MissionBriefingFrame"
    };

    controls[] = {
      "Header",
      "MissionsList",
      "MissionImage",
      "ButtonClose",
      "MissionBriefing",
      "StartButton",
      "CancelButton",
      "LabelIntel"
    };

    objects[] = {};

    class CamoBG: BgPicture {
        x = (0.2 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE);
        w = (0.6 * safezoneW) + (4 * BORDERSIZE);
        h = (0.6 * safezoneH) + (6 * BORDERSIZE);

    };
    class OuterBG: StdBG {
        colorBackground[] = COLOR_BROWN;
        x = (0.2 * safezoneW + safezoneX) - (2 * BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE);
        w = (0.6 * safezoneW) + (4 * BORDERSIZE);
        h = (0.6 * safezoneH) + (6 * BORDERSIZE);
    };
    class OuterBG_F: OuterBG {
        style = ST_FRAME;
    };
    class InnerBG: OuterBG {
        colorBackground[] = COLOR_GREEN;
        x = (0.2 * safezoneW + safezoneX)  - ( BORDERSIZE);
        y = 0.25 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
        w = (0.6 * safezoneW) +  (2 * BORDERSIZE);
        h = 0.55 * safezoneH  + (3 * BORDERSIZE);
    };
    class InnerBG_F: InnerBG {
        style = ST_FRAME;
    };
    class MissionBriefingFrame: StdBG {
        style = ST_FRAME;
        colorBackground[] = COLOR_GREEN;
        x = (0.35 * safezoneW + safezoneX) + BORDERSIZE;
        y = 0.25 * safezoneH + safezoneY;
        w = (0.45 * safezoneW) - BORDERSIZE;
        h = (0.5 * safezoneH) - BORDERSIZE;
    };
    class MissionImage: BgPicture {
        idc = 106;
        x = (0.2 * safezoneW + safezoneX);
        y = (0.25 * safezoneH + safezoneY);
        w = (0.15 * safezoneW);
        h = (0.2 * safezoneH);
        colorText[] = {1.0, 1.0, 1.0, 1.0};
        text = "";
    };
    class Header: StdHeader {
        x = 0.2 * safezoneW + safezoneX - (BORDERSIZE);
        y = 0.19 * safezoneH + safezoneY;
        w = 0.6 * safezoneW + ( 2 * BORDERSIZE);
        h = 0.05 * safezoneH - (BORDERSIZE);
        text = $STR_SECONDARY_OBJECTIVES_TITLE;
    };
    class MissionsList: StdListBox {
        idc = 101;
        x = 0.2 * safezoneW + safezoneX;
        w = 0.15 * safezoneW;
        y = 0.45 * safezoneH + safezoneY + BORDERSIZE;
        h = (0.3 * safezoneH) - BORDERSIZE;
        shadow = 2;
        onLBSelChanged="";
    };
    class ButtonClose: StdButton {
        idc = 105;
        x = 0.785 * safezoneW + safezoneX;
        w = 0.015 * safezoneW;
        h = 0.02 * safezoneH;
        y = 0.197 * safezoneH + safezoneY;
        text = "X";
        action = "closeDialog 0";
    };
    class LabelIntel: StdText {
        idc = 107;
        x = (0.2 * safezoneW + safezoneX);
        w = (0.15 * safezoneW);
        h = (0.04 * safezoneH);
        y = (0.755 * safezoneH + safezoneY);
        colorText[] = {0, 0.7, 1.0, 1.0};
        sizeEx = 0.03 * safezoneH;
        style = ST_CENTER;
    };
    class MissionBriefing {
        type = 15;
        idc = -1;
        style = 0;
        x = (0.35 * safezoneW + safezoneX) + BORDERSIZE;
        y = 0.25 * safezoneH + safezoneY;
        w = (0.45 * safezoneW) - BORDERSIZE;
        h = (0.5 * safezoneH) - BORDERSIZE;
        colorScrollbar[] = COLOR_WHITE;
        class VScrollbar {
            color[] = COLOR_WHITE;
            width = 0.01 * safezoneW;
        autoScrollSpeed = -1;
        autoScrollDelay = 5;
        autoScrollRewind = 0;
        };
        class HScrollbar {
            color[] = COLOR_WHITE;
            height = 0.012 * safezoneH;
        };
        class ScrollBar {
        color[] = COLOR_WHITE;
        colorActive[] = COLOR_WHITE;
        colorDisabled[] = COLOR_WHITE;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        };
        class Controls {
            class MissionBriefingText {
                idc = 102;
                type = CT_STRUCTURED_TEXT;
                colorBackground[] = COLOR_NOALPHA;
                style = ST_LEFT;
                x = 0;
                y = 0;
                w = (0.45 * safezoneW) - (2 * BORDERSIZE);
                h = (0.5 * safezoneH) - BORDERSIZE ;
                text= "AAA";
                size = 0.02 * safezoneH;
                sizeEx = 0.02 * safezoneH;
                shadow = 2;
                font = FontM;
                color = "#e0e0e0";
                align = "left";
                valign = "top";
            };
        };
     };
     class StartButton: StdButton {
        idc = 103;
        x = (0.46 * safezoneW + safezoneX);
        y = (0.75 * safezoneH + safezoneY);
        w = (0.1 * safezoneW);
        h = (0.05 * safezoneH);
        sizeEx = 0.025 * safezoneH;
        text = $STR_SECONDARY_OBJECTIVES_START;
        action = "dostartsecondary = 1;";
    };
    class CancelButton: StdButton {
        idc = 104;
        x = (0.565 * safezoneW + safezoneX);
        y = (0.75 * safezoneH + safezoneY);
        w = (0.1 * safezoneW);
        h = (0.05 * safezoneH);
        sizeEx = 0.025 * safezoneH;
        text = $STR_RECYCLING_CANCEL;
        action = "closeDialog 0;";
    };
};
