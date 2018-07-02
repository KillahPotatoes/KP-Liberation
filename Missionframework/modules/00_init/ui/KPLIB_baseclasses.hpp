/*
    KP Liberation basic ui classes

    File: KPLIB_baseclasses.hpp
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-06-15
    Last Update: 2018-07-01
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
    The basic ui classes for KP Liberation.
*/

class KPLIB_ScrollBar {
    color[] = {1, 1, 1, 0.6};
    colorActive[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 0;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

class KPLIB_Object {
    access = 0;
    type = CT_OBJECT;
    scale = 1;
    direction[] = {0, 0, 1};
    up[] = {0, 1, 0};
    shadow = 0;
};

class KPLIB_Text {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_STATIC;
    idc = -1;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    text = "";
    fixedWidth = 0;
    colorShadow[] = {0, 0, 0, 0.5};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    style = ST_LEFT;
    shadow = 1;
    font = "RobotoCondensed";
    SizeEx = GUI_TEXT_SIZE_MEDIUM;
    linespacing = 1;
};

class KPLIB_Frame {
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    type = CT_STATIC;
    idc = -1;
    deletable = 0;
    style = ST_FRAME;
    shadow = 2;
    font = "RobotoCondensed";
    sizeEx = 0.02;
    text = "";
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.3;
};

class KPLIB_Line: KPLIB_Text
{
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    idc = -1;
    style = ST_MULTI + ST_TITLE_BAR + ST_HUD_BACKGROUND;
    x = 0.17;
    y = 0.48;
    w = 0.66;
    h = 0;
    text = "";
};

class KPLIB_Progress {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_PROGRESS;
    style = ST_HORIZONTAL;
    colorFrame[] = {0, 0, 0, 0};
    colorBar[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
    };
    x = 0.344;
    y = 0.619;
    w = 0.313726;
    h = 0.0261438;
    shadow = 2;
    texture = "#(argb,8,8,3)color(1,1,1,1)";
};

class KPLIB_Picture {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_STATIC;
    idc = -1;
    style = ST_MULTI + ST_TITLE_BAR;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    font = "TahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};

class KPLIB_PictureKeepAspect: KPLIB_Picture {
    style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};

class KPLIB_Video: KPLIB_Picture {
    autoplay = 1;
    loops = 1;
};

class KPLIB_HTML {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_HTML;
    idc = -1;
    style = ST_LEFT;
    filename = "";
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {1, 1, 1, 1};
    colorBold[] = {1, 1, 1, 1};
    colorLink[] = {1, 1, 1, 0.75};
    colorLinkActive[] = {1, 1, 1, 1};
    colorPicture[] = {1, 1, 1, 1};
    colorPictureLink[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictureBorder[] = {0, 0, 0, 0};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    class H1 {
        font = "RobotoCondensed";
        fontBold = "RobotoCondensedBold";
        sizeEx = GUI_TEXT_SIZE_LARGE;
        align = "left";
    };
    class H2 {
        font = "RobotoCondensed";
        fontBold = "RobotoCondensedBold";
        sizeEx = GUI_TEXT_SIZE_MEDIUM;
        align = "right";
    };
    class H3 {
        font = "RobotoCondensed";
        fontBold = "RobotoCondensedBold";
        sizeEx = GUI_TEXT_SIZE_MEDIUM;
        align = "left";
    };
    class H4 {
        font = "RobotoCondensed";
        fontBold = "RobotoCondensedBold";
        sizeEx = GUI_TEXT_SIZE_MEDIUM;
        align = "left";
    };
    class H5 {
        font = "RobotoCondensed";
        fontBold = "RobotoCondensedBold";
        sizeEx = GUI_TEXT_SIZE_MEDIUM;
        align = "left";
    };
    class H6 {
        font = "RobotoCondensed";
        fontBold = "RobotoCondensedBold";
        sizeEx = GUI_TEXT_SIZE_MEDIUM;
        align = "left";
    };
    class P {
        font = "RobotoCondensed";
        fontBold = "RobotoCondensedBold";
        sizeEx = GUI_TEXT_SIZE_MEDIUM;
        align = "left";
    };
    x = 0;
    y = 0;
    w = 0.1;
    h = 0.1;
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    prevPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_left_ca.paa";
    nextPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa";
    shadow = 2;
};

class KPLIB_Button {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorBackground[] = {0, 0, 0, 0.5};
    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
    colorBackgroundActive[] = {0, 0, 0, 1};
    colorFocused[] = {0, 0, 0, 1};
    colorShadow[] = {0, 0, 0, 0};
    colorBorder[] = {0, 0, 0, 1};
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
    idc = -1;
    style = ST_CENTER;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "RobotoCondensed";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    url = "";
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    borderSize = 0;
};

class KPLIB_ShortcutButton {
    deletable = 0;
    fade = 0;
    type = CT_SHORTCUTBUTTON;
    x = 0.1;
    y = 0.1;
    class HitZone {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class ShortcutPos {
        left = 0;
        top = ((GUI_GRID_HAbs / 20) - GUI_TEXT_SIZE_MEDIUM) / 2;
        w = GUI_TEXT_SIZE_MEDIUM * (3/4);
        h = GUI_TEXT_SIZE_MEDIUM;
    };
    class TextPos {
        left = GUI_TEXT_SIZE_MEDIUM * (3/4);
        top = ((GUI_GRID_HAbs / 20) - GUI_TEXT_SIZE_MEDIUM) / 2;
        right = 0.005;
        bottom = 0;
    };
    shortcuts[] = {};
    textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
    color[] = {1, 1, 1, 1};
    colorFocused[] = {1, 1, 1, 1};
    color2[] = {0.95, 0.95, 0.95, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        1
    };
    colorBackgroundFocused[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        1
    };
    colorBackground2[] = {1, 1, 1, 1};
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
    class Attributes {
        font = "RobotoCondensed";
        color = "#E5E5E5";
        align = "left";
        shadow = "true";
    };
    colorSecondary[] = {1, 1, 1, 1};
    colorFocusedSecondary[] = {1, 1, 1, 1};
    color2Secondary[] = {0.95, 0.95, 0.95, 1};
    colorDisabledSecondary[] = {1, 1, 1, 0.25};
    class AttributesImage {
        font = "RobotoCondensed";
        color = "#E5E5E5";
        align = "left";
    };
    idc = -1;
    style = ST_LEFT;
    default = 0;
    shadow = 1;
    w = 0.183825;
    h = (GUI_GRID_HAbs / 20);
    textSecondary = "";
    sizeExSecondary = GUI_TEXT_SIZE_MEDIUM;
    fontSecondary = "RobotoCondensed";
    animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
    animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
    animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
    periodFocus = 1.2;
    periodOver = 0.8;
    period = 0.4;
    font = "RobotoCondensed";
    size = GUI_TEXT_SIZE_MEDIUM;
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    text = "";
    url = "";
    action = "";
};

class KPLIB_Edit {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_EDIT;
    x = 0;
    y = 0;
    h = 0.04;
    w = 0.2;
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {0.95, 0.95, 0.95, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorSelection[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        1
    };
    autocomplete = "";
    text = "";
    size = 0.2;
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    style = ST_FRAME;
    font = "RobotoCondensed";
    shadow = 2;
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    canModify = 1;
};

class KPLIB_Combo {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_COMBO;
    colorSelect[] = {0, 0, 0, 1};
    colorText[] = {1, 1, 1, 1};
    colorBackground[] = {0, 0, 0, 1};
    colorScrollbar[] = {1, 0, 0, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictureDisabled[] = {1, 1, 1, 0.25};
    colorPictureRight[] = {1, 1, 1, 1};
    colorPictureRightSelected[] = {1, 1, 1, 1};
    colorPictureRightDisabled[] = {1, 1, 1, 0.25};
    colorTextRight[] = {1, 1, 1, 1};
    colorSelectRight[] = {0, 0, 0, 1};
    colorSelect2Right[] = {0, 0, 0, 1};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    soundSelect[] = {
        "\A3\ui_f\data\sound\RscCombo\soundSelect",
        0.1,
        1
    };
    soundExpand[] = {
        "\A3\ui_f\data\sound\RscCombo\soundExpand",
        0.1,
        1
    };
    soundCollapse[] = {
        "\A3\ui_f\data\sound\RscCombo\soundCollapse",
        0.1,
        1
    };
    maxHistoryDelay = 1;
    class ComboScrollBar: KPLIB_ScrollBar {
        color[] = {1,1,1,1};
    };
    colorSelectBackground[] = {1, 1, 1, 0.7};
    colorActive[] = {1, 0, 0, 1};
    style = ST_MULTI + ST_NO_RECT;
    font = "RobotoCondensed";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.12;
    h = 0.035;
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    wholeHeight = 0.45;
};

class KPLIB_ListBox {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_LISTBOX;
    rowHeight = 0;
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorScrollbar[] = {1, 0, 0, 0};
    colorSelect[] = {0, 0, 0, 1};
    colorSelect2[] = {0, 0, 0, 1};
    colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
    colorSelectBackground2[] = {1, 1, 1, 0.5};
    colorBackground[] = {0, 0, 0, 0.3};
    soundSelect[] = {
        "\A3\ui_f\data\sound\RscListbox\soundSelect",
        0.09,
        1
    };
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictureDisabled[] = {1, 1, 1, 0.25};
    colorPictureRight[] = {1, 1, 1, 1};
    colorPictureRightSelected[] = {1, 1, 1, 1};
    colorPictureRightDisabled[] = {1, 1, 1, 0.25};
    colorTextRight[] = {1, 1, 1, 1};
    colorSelectRight[] = {0, 0, 0, 1};
    colorSelect2Right[] = {0, 0, 0, 1};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    class ListScrollBar: KPLIB_ScrollBar {
        color[] = {1, 1, 1, 1};
        autoScrollEnabled = 1;
    };
    colorShadow[] = {0, 0, 0, 0.5};
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.3;
    style = LB_TEXTURES;
    font = "RobotoCondensed";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    shadow = 0;
    period = 1.2;
    maxHistoryDelay = 1;
};

class KPLIB_ListNBox {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_LISTNBOX;
    rowHeight = 0;
    colorText[] = {1, 1, 1, 1};
    colorScrollbar[] = {0.95, 0.95, 0.95, 1};
    colorSelect[] = {0, 0, 0, 1};
    colorSelect2[] = {0, 0, 0, 1};
    colorSelectBackground[] = {0.95, 0.95, 0.95, 1};
    colorSelectBackground2[] = {1, 1, 1, 0.5};
    colorBackground[] = {0, 0, 0, 1};
    maxHistoryDelay = 1;
    soundSelect[] = {
        "",
        0.1,
        1
    };
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1, 1, 1, 1)";
    drawSideArrows = 0;
    columns[] = {0.3, 0.6, 0.7};
    idcLeft = -1;
    idcRight = -1;
    class ListScrollBar: KPLIB_ScrollBar {
    };
    color[] = {0.95, 0.95, 0.95, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictureDisabled[] = {1, 1, 1, 1};
    class ScrollBar: KPLIB_ScrollBar {
    };
    style = ST_MULTI;
    shadow = 0;
    font = "RobotoCondensed";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    period = 1.2;
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.3;
};

class KPLIB_XListBox {
    deletable = 0;
    fade = 0;
    idc = -1;
    type = CT_XLISTBOX;
    x = 0.1;
    y = 0.1;
    color[] = {1, 1, 1, 0.6};
    colorActive[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorSelect[] = {0.95, 0.95, 0.95, 1};
    colorText[] = {1, 1, 1, 1};
    soundSelect[] = {
        "\A3\ui_f\data\sound\RscListbox\soundSelect",
        0.09,
        1
    };
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {1, 1, 1, 1};
    colorPictureDisabled[] = {1, 1, 1, 0.25};
    colorPictureRight[] = {1, 1, 1, 1};
    colorPictureRightSelected[] = {1, 1, 1, 1};
    colorPictureRightDisabled[] = {1, 1, 1, 0.25};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    style = ST_CENTER + LB_TEXTURES + SL_HORZ;
    shadow = 2;
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    w = 0.14706;
    h = 0.039216;
    font = "RobotoCondensed";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
};

class KPLIB_Tree {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_TREE;
    colorBackground[] = {0, 0, 0, 0};
    colorSelect[] = {1, 1, 1, 0.7};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorText[] = {1, 1, 1, 1};
    colorSelectText[] = {0, 0, 0, 1};
    colorBorder[] = {0, 0, 0, 0};
    colorSearch[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
    };
    colorMarked[] = {0.2, 0.3, 0.7, 1};
    colorMarkedText[] = {0, 0, 0, 1};
    colorMarkedSelected[] = {0, 0.5, 0.5, 1};
    multiselectEnabled = 0;
    colorPicture[] = {1, 1, 1, 1};
    colorPictureSelected[] = {0, 0, 0, 1};
    colorPictureDisabled[] = {1, 1, 1, 0.25};
    colorPictureRight[] = {1, 1, 1, 1};
    colorPictureRightSelected[] = {0, 0, 0, 1};
    colorPictureRightDisabled[] = {1, 1, 1, 0.25};
    colorArrow[] = {1, 1, 1, 1};
    maxHistoryDelay = 1;
    shadow = 0;
    colorSelectBackground[] = {0, 0, 0, 0.5};
    colorLines[] = {0, 0, 0, 0};
    class ScrollBar: KPLIB_ScrollBar {
    };
    style = ST_LEFT;
    font = "RobotoCondensed";
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    expandedTexture = "A3\ui_f\data\gui\rsccommon\rsctree\expandedTexture_ca.paa";
    hiddenTexture = "A3\ui_f\data\gui\rsccommon\rsctree\hiddenTexture_ca.paa";
    x = 0;
    y = 0;
    w = 0.1;
    h = 0.2;
    rowHeight = 0.0439091;
    borderSize = 0;
    expandOnDoubleclick = 1;
};

class KPLIB_Slider {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_SLIDER;
    style = SL_HORZ;
    color[] = {1, 1, 1, 0.8};
    colorActive[] = {1, 1, 1, 1};
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.025;
};

class KPLIB_XSliderH {
    deletable = 0;
    fade = 0;
    type = CT_XSLIDER;
    color[] = {1, 1, 1, 0.6};
    colorActive[] = {1, 1, 1, 1};
    colorDisable[] = {1, 1, 1, 0.4};
    colorDisabled[] = {1, 1, 1, 0.2};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    style = SL_TEXTURES + SL_HORZ;
    shadow = 0;
    x = 0;
    y = 0;
    h = 0.029412;
    w = 0.4;
    arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
    thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

class KPLIB_ActiveText {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_ACTIVETEXT;
    style = ST_CENTER;
    color[] = {0, 0, 0, 1};
    colorActive[] = {0.3, 0.4, 0, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    soundEnter[] = {
        "",
        0.1,
        1
    };
    soundPush[] = {
        "",
        0.1,
        1
    };
    soundClick[] = {
        "",
        0.1,
        1
    };
    soundEscape[] = {
        "",
        0.1,
        1
    };
    text = "";
    default = 0;
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    idc = -1;
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.035;
    font = "RobotoCondensed";
    shadow = 2;
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
    url = "";
};

class KPLIB_ActivePicture: KPLIB_ActiveText {
    color[] = {1, 1, 1, 0.5};
    colorActive[] = {1, 1, 1, 1};
    style = ST_MULTI + ST_TITLE_BAR;
};

class KPLIB_ActivePictureKeepAspect: KPLIB_ActivePicture {
    style = ST_MULTI + ST_TITLE_BAR + ST_KEEP_ASPECT_RATIO;
};

class KPLIB_StructuredText {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_STRUCTURED_TEXT;
    idc = -1;
    style = ST_LEFT;
    colorText[] = {1, 1, 1, 1};
    class Attributes {
        font = "RobotoCondensed";
        color = "#ffffff";
        colorLink = "#D09B43";
        align = "left";
        shadow = 1;
    };
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = GUI_TEXT_SIZE_MEDIUM;
    shadow = 1;
};

class KPLIB_Toolbox {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_TOOLBOX;
    style = ST_CENTER;
    colorText[] = {0.95, 0.95, 0.95, 1};
    color[] = {0.95, 0.95, 0.95, 1};
    colorTextSelect[] = {0.95, 0.95, 0.95, 1};
    colorSelect[] = {0.95, 0.95, 0.95, 1};
    colorTextDisable[] = {0.4, 0.4, 0.4, 1};
    colorDisable[] = {0.4, 0.4, 0.4, 1};
    colorSelectedBg[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        0.5
    };
    shadow = 0;
    strings[] = {
        "",
        ""
    };
    x = 0;
    y = 0;
    w = 0.3;
    h = 0.025;
    rows = 1;
    columns = 2;
    font = "RobotoCondensed";
    sizeEx = GUI_TEXT_SIZE_SMALL;
};

class KPLIB_ControlsGroup {
    deletable = 0;
    fade = 0;
    class VScrollbar: KPLIB_ScrollBar {
        color[] = {1, 1, 1, 1};
        width = 0.021;
        autoScrollEnabled = 1;
    };
    class HScrollbar: KPLIB_ScrollBar {
        color[] = {1, 1, 1, 1};
        height = 0.028;
    };
    class Controls {
    };
    type = CT_CONTROLS_GROUP;
    idc = -1;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    shadow = 0;
    style = ST_MULTI;
};

class KPLIB_ControlsGroupNoScrollbars: KPLIB_ControlsGroup {
    class VScrollbar: VScrollbar {
        width = 0;
    };
    class HScrollbar: HScrollbar {
        height = 0;
    };
};

class KPLIB_ControlsGroupNoHScrollbars: KPLIB_ControlsGroup {
    class HScrollbar: HScrollbar {
        height = 0;
    };
};

class KPLIB_ControlsGroupNoVScrollbars: KPLIB_ControlsGroup {
    class VScrollbar: VScrollbar {
        width = 0;
    };
};

class KPLIB_ButtonTextOnly: KPLIB_Button {
    colorBackground[] = {1, 1, 1, 0};
    colorBackgroundActive[] = {1, 1, 1, 0};
    colorBackgroundDisabled[] = {1, 1, 1, 0};
    colorFocused[] = {1, 1, 1, 0};
    colorShadow[] = {1, 1, 1, 0};
    SizeEx = GUI_TEXT_SIZE_SMALL;
    borderSize = 0;
};

class KPLIB_ButtonMenu: KPLIB_ShortcutButton {
    colorBackground[] = {0, 0, 0, 0.8};
    colorBackgroundFocused[] = {1, 1, 1, 1};
    colorBackground2[] = {0.75, 0.75, 0.75, 1};
    color[] = {1, 1, 1, 1};
    colorFocused[] = {0, 0, 0, 1};
    color2[] = {0, 0, 0, 1};
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    colorSecondary[] = {1, 1, 1, 1};
    colorFocusedSecondary[] = {0, 0, 0, 1};
    color2Secondary[] = {0, 0, 0, 1};
    colorDisabledSecondary[] = {1, 1, 1, 0.25};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    class TextPos {
        left = 0.25 * GUI_GRID_W;
        top = (GUI_GRID_H - GUI_TEXT_SIZE_MEDIUM) / 2;
        right = 0.005;
        bottom = 0;
    };
    class Attributes {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "left";
        shadow = "false";
    };
    class ShortcutPos {
        left = 5.25 * GUI_GRID_W;
        top = 0;
        w = 1 * GUI_GRID_W;
        h = 1 * GUI_GRID_H;
    };
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButtonMenu\soundPush",
        0.09,
        1
    };
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButtonMenu\soundClick",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
        0.09,
        1
    };
    idc = -1;
    type = CT_SHORTCUTBUTTON;
    style = ST_CENTER + ST_FRAME + ST_HUD_BACKGROUND;
    default = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    textSecondary = "";
    sizeExSecondary = GUI_TEXT_SIZE_MEDIUM;
    fontSecondary = "PuristaLight";
    period = 1.2;
    periodFocus = 1.2;
    periodOver = 1.2;
    size = GUI_TEXT_SIZE_MEDIUM;
    sizeEx = GUI_TEXT_SIZE_MEDIUM;
};

class KPLIB_ButtonMenuOK: KPLIB_ButtonMenu {
    shortcuts[] = {
        "0x00050000 + 0",
        28,
        57,
        156
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
        0.09,
        1
    };
    idc = 1;
    default = 1;
    text = "OK";
};

class KPLIB_ButtonMenuCancel: KPLIB_ButtonMenu {
    shortcuts[] = {
        "0x00050000 + 1"
    };
    idc = 2;
    text = "Abbrechen";
};

class KPLIB_MapControl {
    deletable = 0;
    fade = 0;
    access = 0;
    type = CT_MAP_MAIN;
    idc = 51;
    style = ST_MULTI + ST_TITLE_BAR;
    colorBackground[] = {0.969, 0.957, 0.949, 1};
    colorOutside[] = {0, 0, 0, 1};
    colorText[] = {0, 0, 0, 1};
    font = "TahomaB";
    sizeEx = 0.04;
    colorSea[] = {0.467, 0.631, 0.851, 0.5};
    colorForest[] = {0.624, 0.78, 0.388, 0.5};
    colorRocks[] = {0, 0, 0, 0.3};
    colorCountlines[] = {0.572, 0.354, 0.188, 0.25};
    colorMainCountlines[] = {0.572, 0.354, 0.188, 0.5};
    colorCountlinesWater[] = {0.491, 0.577, 0.702, 0.3};
    colorMainCountlinesWater[] = {0.491, 0.577, 0.702, 0.6};
    colorForestBorder[] = {0, 0, 0, 0};
    colorRocksBorder[] = {0, 0, 0, 0};
    colorPowerLines[] = {0.1, 0.1, 0.1, 1};
    colorRailWay[] = {0.8, 0.2, 0, 1};
    colorNames[] = {0.1, 0.1, 0.1, 0.9};
    colorInactive[] = {1, 1, 1, 0.5};
    colorLevels[] = {0.286, 0.177, 0.094, 0.5};
    colorTracks[] = {0.84, 0.76, 0.65, 0.15};
    colorRoads[] = {0.7, 0.7, 0.7, 1};
    colorMainRoads[] = {0.9, 0.5, 0.3, 1};
    colorTracksFill[] = {0.84, 0.76, 0.65, 1};
    colorRoadsFill[] = {1, 1, 1, 1};
    colorMainRoadsFill[] = {1, 0.6, 0.4, 1};
    colorGrid[] = {0.1, 0.1, 0.1, 0.6};
    colorGridMap[] = {0.1, 0.1, 0.1, 0.6};
    stickX[] = {0.2, ["Gamma", 1, 1.5]};
    stickY[] = {0.2, ["Gamma", 1, 1.5]};
    class Legend {
        colorBackground[] = {1, 1, 1, 0.5};
        color[] = {0,0,0,1};
        x = SafeZoneX + GUI_GRID_W;
        y = SafeZoneY + safezoneH - 4.5 * GUI_GRID_H;
        w = 10 * GUI_GRID_W;
        h = 3.5 * GUI_GRID_H;
        font = "RobotoCondensed";
        sizeEx = GUI_TEXT_SIZE_SMALL;
    };
    class ActiveMarker {
        color[] = {0.3, 0.1, 0.9, 1};
        size = 50;
    };
    class Command {
        color[] = {1, 1, 1, 1};
        icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Task {
        taskNone = "#(argb,8,8,3)color(0,0,0,0)";
        taskCreated = "#(argb,8,8,3)color(0,0,0,1)";
        taskAssigned = "#(argb,8,8,3)color(1,1,1,1)";
        taskSucceeded = "#(argb,8,8,3)color(0,1,0,1)";
        taskFailed = "#(argb,8,8,3)color(1,0,0,1)";
        taskCanceled = "#(argb,8,8,3)color(1,0.5,0,1)";
        colorCreated[] = {1, 1, 1, 1};
        colorCanceled[] = {0.7, 0.7, 0.7, 1};
        colorDone[] = {0.7, 1, 0.3, 1};
        colorFailed[] = {1, 0.3, 0.2, 1};
        color[] = {
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
            "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
        };
        icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        size = 27;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class CustomMark {
        color[] = {1, 1, 1, 1};
        icon = "\a3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Tree {
        color[] = {0.45, 0.64, 0.33, 0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.9 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class SmallTree {
        color[] = {0.45, 0.64, 0.33, 0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = 12;
        importance = "0.6 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bush {
        color[] = {0.45, 0.64, 0.33, 0.4};
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        size = "14/2";
        importance = "0.2 * 14 * 0.05 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Church {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Chapel {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Cross {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Rock {
        color[] = {0.1, 0.1, 0.1, 0.8};
        icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        size = 12;
        importance = "0.5 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Bunker {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 14;
        importance = "1.5 * 14 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fortress {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Fountain {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        size = 11;
        importance = "1 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class ViewTower {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.5;
        coefMax = 4;
    };
    class Lighthouse {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Quay {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Fuelstation {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Hospital {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class BusStop {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class LineMarker {
        textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
        lineWidthThin = 0.008;
        lineWidthThick = 0.014;
        lineDistanceMin = 3e-005;
        lineLengthMin = 5;
    };
    class Transmitter {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Stack {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.4;
        coefMax = 2;
    };
    class Ruin {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        size = 16;
        importance = "1.2 * 16 * 0.05";
        coefMin = 1;
        coefMax = 4;
    };
    class Tourism {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.7;
        coefMax = 4;
    };
    class Watertower {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Waypoint {
        color[] = {1, 1, 1, 1};
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
    };
    class WaypointCompleted {
        color[] = {1, 1, 1, 1};
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        icon = "\a3\ui_f\data\map\mapcontrol\waypointcompleted_ca.paa";
        size = 18;
    };
    colorTrails[] = {0.84, 0.76, 0.65, 0.15};
    colorTrailsFill[] = {0.84, 0.76, 0.65, 0.65};
    class power {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class powersolar {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class powerwave {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class powerwind {
        color[] = {1, 1, 1, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    class Shipwreck {
        color[] = {0, 0, 0, 1};
        icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1;
    };
    moveOnEdges = 1;
    x = "SafeZoneXAbs";
    y = SafeZoneY + 1.5 * GUI_GRID_H;
    w = "SafeZoneWAbs";
    h = SafeZoneH - 1.5 * GUI_GRID_H;
    shadow = 0;
    ptsPerSquareSea = 5;
    ptsPerSquareTxt = 20;
    ptsPerSquareCLn = 10;
    ptsPerSquareExp = 10;
    ptsPerSquareCost = 10;
    ptsPerSquareFor = 9;
    ptsPerSquareForEdge = 9;
    ptsPerSquareRoad = 6;
    ptsPerSquareObj = 9;
    showCountourInterval = 0;
    scaleMin = 0.001;
    scaleMax = 1;
    scaleDefault = 0.16;
    maxSatelliteAlpha = 0.85;
    alphaFadeStartScale = 2;
    alphaFadeEndScale = 2;
    fontLabel = "RobotoCondensed";
    sizeExLabel = GUI_TEXT_SIZE_SMALL;
    fontGrid = "TahomaB";
    sizeExGrid = 0.02;
    fontUnits = "TahomaB";
    sizeExUnits = GUI_TEXT_SIZE_SMALL;
    fontNames = "EtelkaNarrowMediumPro";
    sizeExNames = GUI_TEXT_SIZE_SMALL * 2;
    fontInfo = "RobotoCondensed";
    sizeExInfo = GUI_TEXT_SIZE_SMALL;
    fontLevel = "TahomaB";
    sizeExLevel = 0.02;
    text = "#(argb,8,8,3)color(1,1,1,1)";
    idcMarkerColor = -1;
    idcMarkerIcon = -1;
    textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
    showMarkers = 1;
};

class KPLIB_CheckBox {
    color[] = {1, 1, 1, 0.7};
    colorFocused[] = {1, 1, 1, 1};
    colorHover[] = {1, 1, 1, 1};
    colorPressed[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.2};
    colorBackground[] = {0, 0, 0, 0};
    colorBackgroundFocused[] = {0, 0, 0, 0};
    colorBackgroundHover[] = {0, 0, 0, 0};
    colorBackgroundPressed[] = {0, 0, 0, 0};
    colorBackgroundDisabled[] = {0, 0, 0, 0};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {1, 1, 1, 1};
    tooltipColorShade[] = {0, 0, 0, 0.65};
    soundEnter[] = {
        "",
        0.1,
        1
    };
    soundPush[] = {
        "",
        0.1,
        1
    };
    soundClick[] = {
        "",
        0.1,
        1
    };
    soundEscape[] = {
        "",
        0.1,
        1
    };
    idc = -1;
    type = CT_CHECKBOX;
    deletable = 0;
    style = ST_LEFT;
    checked = 0;
    x = "0.375 * safezoneW + safezoneX";
    y = "0.36 * safezoneH + safezoneY";
    w = "0.025 * safezoneW";
    h = "0.04 * safezoneH";
    textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
};
