class liberation_tutorial {
    idd = 5353;
    movingEnable = false;
    controlsBackground[] = {};

    controls[] = { "OuterBG2", "OuterBG_F2", "OuterBG1", "OuterBG_F1", "InnerBG1", "InnerBG_F1", "InnerBG2", "InnerBG_F2",
      "Header","HeaderTuto",  "TutorialList", "CloseButton", "TutoControlGroup"};

    objects[] = {};

    class OuterBG1: StdBG {
        colorBackground[] = COLOR_BROWN;
        x = (0.2 * safezoneW + safezoneX) - (2 * BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE);
        w = (0.15 * safezoneW) + (4 * BORDERSIZE);
        h = (0.6 * safezoneH) + (6 * BORDERSIZE);
    };
    class OuterBG_F1: OuterBG1 {
        style = ST_FRAME;
    };
    class OuterBG2: StdBG {
        colorBackground[] = COLOR_BROWN;
        x = (0.35 * safezoneW + safezoneX) + (3 * BORDERSIZE);
        y = (0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE);
        w = (0.45 * safezoneW);
        h = (0.6 * safezoneH) + (6 * BORDERSIZE);
    };
    class OuterBG_F2: OuterBG2 {
        style = ST_FRAME;
    };
    class InnerBG1: OuterBG1 {
        colorBackground[] = COLOR_GREEN;
        x = (0.2 * safezoneW + safezoneX)  - ( BORDERSIZE);
        y = 0.25 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
        w = (0.15 * safezoneW) +  (2 * BORDERSIZE);
        h = 0.55 * safezoneH  + (3 * BORDERSIZE);
    };
    class InnerBG_F1: InnerBG1 {
        style = ST_FRAME;
    };
    class InnerBG2: OuterBG2 {
        colorBackground[] = COLOR_GREEN_ALPHA;
        x = (0.35 * safezoneW + safezoneX) + (4 * BORDERSIZE);
        y = 0.25 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
        w = (0.45 * safezoneW) - (2 * BORDERSIZE ) ;
        h = 0.55 * safezoneH  + (3 * BORDERSIZE);
    };
    class InnerBG_F2: InnerBG2 {
        style = ST_FRAME;
    };
    class Header: StdHeader {
        x = 0.2 * safezoneW + safezoneX - (BORDERSIZE);
        y = 0.19 * safezoneH + safezoneY;
        w = 0.15 * safezoneW + ( 2 * BORDERSIZE);
        h = 0.05 * safezoneH - (BORDERSIZE);
        text = $STR_TUTO_TITLE;
    };
    class HeaderTuto: Header {
        idc = 514;
        x = (0.35 * safezoneW + safezoneX) + ( 4 * BORDERSIZE);
        w = (0.45 * safezoneW) - (2 * BORDERSIZE);
        text = "1. Introduction";
    };
    class TutorialList: StdListBox {
        idc = 513;
        x = 0.2 * safezoneW + safezoneX;
        w = 0.15 * safezoneW;
        y = 0.25 * safezoneH + safezoneY;
        h = (0.5 * safezoneH) - (1.5 * BORDERSIZE);
        shadow = 2;
        onLBSelChanged="";
    };
    class CloseButton: StdButton {
        idc = 512;
        x = (0.2 * safezoneW + safezoneX);
        y = (0.75 * safezoneH + safezoneY);
        w = (0.15 * safezoneW);
        h = (0.05 * safezoneH);
        sizeEx = 0.05 * safezoneH;
        text = $STR_TUTO_GOTIT;
        action = "howtoplay = 0";
    };
    class TutoControlGroup {
        type = 15;
        idc = -1;
        style = 0;
        x = (0.35 * safezoneW + safezoneX) + (4 * BORDERSIZE);
        y = 0.25 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
        w = (0.45 * safezoneW) - (2 * BORDERSIZE ) ;
        h = 0.55 * safezoneH  + (3 * BORDERSIZE);
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
            class TutoStructuredText {
                idc = 515;
                type = CT_STRUCTURED_TEXT;
                colorBackground[] = COLOR_NOALPHA;
                style = ST_LEFT;
                x = 0;
                y = 0;
                w = (0.45 * safezoneW) - (2 * BORDERSIZE);
                h = 0.5 * safezoneH;
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
};
