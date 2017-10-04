class kndr_MapControl
{
	idc = 10023;
	type = CT_MAP_MAIN;
	style = ST_PICTURE;
	x = 0.05; y = 0.05;
	w = 0.90; h = 0.90;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {0, 0, 0, 0};
	colorSea[] = {0.1, 0.3, 0.5, 0.25};
	colorForest[] = {0.10, 0.50, 0.10, 0.50};
	colorRocks[] = {0.50, 0.50, 0.50, 1};
	colorCountlines[] = {0.65, 0.45, 0.27, 0.50};
	colorMainCountlines[] = {0.65, 0.45, 0.27, 1.00};
	colorCountlinesWater[] = {0.00, 0.53, 1.00, 0.3};
	colorMainCountlinesWater[] = {0.00, 0.53, 1.00, 0.6};
	colorForestBorder[] = {0.40, 0.80, 0.00, 1.00};
	colorRocksBorder[] = {0.50, 0.50, 0.50, 1.00};
	colorPowerLines[] = {0.00, 0.00, 0.00, 1.00};
	colorNames[] = {0.00, 0.00, 0.00, 1.00};
	colorInactive[] = {1, 0.3, 0.5, 1};
	colorLevels[] = {0.00, 0.00, 0.00, 1.00};
	colorOutside[] = {0.1, 0.3, 0.5, 0.5};
	colorRailWay[] = {1, 0, 0.5, 1};
	colorTracks[] = {0.8, 0.6, 0.6, 1};
	colorTracksFill[] = {0.7, 0.5, 0.5, 1};
	colorRoads[] = {0.8, 0.8, 0.8, 1};
	colorRoadsFill[] = {0.7, 0.7, 0.7, 1};
	colorMainRoads[] = {1, 1, 1, 1};
	colorMainRoadsFill[] = {0.9, 0.9, 0.9, 1};
	colorGrid[] = {0, 0, 0, 0.5};
	colorGridMap[] = {0, 0, 0, 0.5};
	alphaFadeStartScale = 5;
	alphaFadeEndScale = 5;
	font = FontM;
	sizeEx = 0.075;
	fontLabel = FontM;
	sizeExLabel = 0.075;
	fontGrid = FontM;
	sizeExGrid = 0.02;
	fontUnits = FontM;
	sizeExUnits = 0.075;
	fontNames = FontM;
	sizeExNames = 0.075;
	fontInfo = FontM;
	sizeExInfo = 0.075;
	fontLevel = FontM;
	sizeExLevel = 0.02;
	stickX[] = {0.20, {"Gamma", 1.00, 1.50} };
	stickY[] = {0.20, {"Gamma", 1.00, 1.50} };
	ptsPerSquareSea = 6;
	ptsPerSquareTxt = 8;
	ptsPerSquareCLn = 8;
	ptsPerSquareExp = 8;
	ptsPerSquareCost = 8;
	ptsPerSquareFor = "4.0f";
	ptsPerSquareForEdge = "10.0f";
	ptsPerSquareRoad = 2;
	ptsPerSquareObj = 10;
	maxSatelliteAlpha = 0.9;
	text = "";
	showCountourInterval=2;
	scaleDefault = 0.1;
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	scaleMin = 0.05;
	scaleMax = 3;

	class ActiveMarker {
		color[] = {0.30, 0.10, 0.90, 1.00};
		size = 50;
	};
	class Bunker {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4.00;
	};
	class Bush {
		icon = "";
		color[] = {0.55, 0.64, 0.43, 1.00};
		size = 14;
		importance = "0.2 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4.00;
	};
	class BusStop {
		icon = "";
		color[] = {0.00, 0.00, 1.00, 1.00};
		size = 10;
		importance = "1 * 10 * 0.05";
		coefMin = 0.25;
		coefMax = 4.00;
	};
	class Command {
		icon = "#(argb,8,8,3)color(1,1,1,1)";
		color[] = {0.00, 0.00, 0.00, 1.00};
		size = 18;
		importance = 1.00;
		coefMin = 1.00;
		coefMax = 1.00;
	};
	class Cross {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 16;
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4.00;
	};
	class Chapel {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.90;
		coefMax = 4.00;
	};
	class Church {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.90;
		coefMax = 4.00;
	};
	class CustomMark {
		icon = "";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4.00;
	};
	class Fuelstation {
		icon = "";
		color[] = {1.00, 0.35, 0.35, 1.00};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.75;
		coefMax = 4.00;
	};
	class Fountain {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 12;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4.00;
	};
	class Hospital {
		icon = "";
		color[] = {0.78, 0.00, 0.05, 1.00};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.50;
		coefMax = 4;
	};
	class Lighthouse {
		icon = "";
		color[] = {0.78, 0.00, 0.05, 1.00};
		size = 20;
		importance = "3 * 16 * 0.05";
		coefMin = 0.90;
		coefMax = 4.00;
	};
	class Quay {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.50;
		coefMax = 4.00;
	};
	class Rock {
		icon = "";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 12;
		importance = 0.5 * 12 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
	};
	class Ruin {
		icon = "";
		color[] = {0.78, 0, 0.05, 1};
		size = 16;
		importance = 1.2 * 16 * 0.05;
		coefMin = 1;
		coefMax = 4;
	};
	class Stack {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.90;
		coefMax = 4.00;
	};
	class Tree {
		icon = "";
		color[] = {0.55, 0.64, 0.43, 1.00};
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4.00;
	};
	class SmallTree {
		icon = "";
		color[] = {0.55, 0.64, 0.43, 1.00};
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4.00;
	};
	class Task {
		icon = "";
		color[] = {0.55, 0.64, 0.43, 1};
		size = 16;
		importance = 0.7 * 16 * 0.05;
		coefMin = 0.25;
		coefMax = 4;
		iconCreated = "#(argb,8,8,3)color(1,1,1,1)";
		iconCanceled = "#(argb,8,8,3)color(0,0,1,1)";
		iconDone = "#(argb,8,8,3)color(0,0,0,1)";
		iconFailed = "#(argb,8,8,3)color(1,0,0,1)";
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {1,1,1,1};
		colorDone[] = {1,1,1,1};
		colorFailed[] = {1,1,1,1};
	};
	class Tourism {
		icon = "";
		color[] = {0.78, 0.00, 0.05, 1.00};
		size = 16; importance = "1 * 16 * 0.05";
		coefMin = 0.70;
		coefMax = 4.00;
	};
	class ShipWreck {
		icon = "";
		color[] = {0.78, 0.00, 0.05, 1.00};
		size = 16; importance = "1 * 16 * 0.05";
		coefMin = 0.70;
		coefMax = 4.00;
	};
	class Transmitter {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.90;
		coefMax = 4.00;
	};
	class PowerSolar {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.90;
		coefMax = 4.00;
	};
	class PowerWave {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.90;
		coefMax = 4.00;
	};
	class LineMarker {
		icon = "";
		color[] = {0,0,0,0};
		size = 0;
		importance = "2 * 16 * 0.05";
		coefMin = 0;
		coefMax = 0;
		lineWidthThin = 0;
		lineWidthThick = 0;
		lineDistanceMin = 0;
		lineDistanceMax = 0;
		lineLengthMin = 0;
		linelengthMax = 0;
	};
	class PowerWind {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.90;
		coefMax = 4.00;
	};
	class ViewTower {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.50;
		coefMax = 4.00;
	};
	class Watertower {
		icon = "";
		color[] = {0.00, 0.35, 0.70, 1.00};
		size = 32;
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.90;
		coefMax = 4.00;
	};
	class Waypoint {
		icon = "";
		color[] = {0.00, 0.00, 0.00, 1.00};
		size = 24;
		importance = 1.00;
		coefMin = 1.00;
		coefMax = 1.00;
	};
	class WaypointCompleted {
		icon = "";
		color[] = {0.00, 0.00, 0.00, 1.00};
		size = 24;
		importance = 1.00;
		coefMin = 1.00;
		coefMax = 1.00;
	};
};

class RscText
{
        type = CT_STATIC;
        idc = -1;
        style = ST_LEFT;
        colorBackground[] = {0, 0, 0, 0};
        colorText[] = {1, 1, 1, 1};
        font = "Bitstream";
        sizeEx = 0.04;
};


class StdText {
    idc = -1;
	type =  CT_STATIC;
	style = ST_LEFT;
	colorText[] = COLOR_WHITE;
	colorBackground[] = COLOR_NOALPHA;
	font = FontM;
	sizeEx = 0.02 * safezoneH;
    shadow = 2;
	text = "";
};

class StdHeader : StdText {
  	style = ST_CENTER;
    sizeEx = 0.03 * safezoneH;
	colorBackground[] = COLOR_LIGHTGRAY;
};

class StdButton {
  	idc = -1;
	type = CT_BUTTON;
	style = ST_CENTER;
	default = false;
	font = FontM;
	sizeEx = 0.018 * safezoneH;
	colorText[] = { 0, 0, 0, 1 };
	colorFocused[] = { 1, 1, 1, 1 };
	colorDisabled[] = { 0.2, 0.2, 0.2, 0.7 };
	colorBackground[] = { 0.8, 0.8, 0.8, 0.8 };
	colorBackgroundDisabled[] = { 0.5, 0.5, 0.5, 0.5 };
	colorBackgroundActive[] = { 1, 1, 1, 1 };
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	colorShadow[] = { 0, 0, 0, 0.5 };
	colorBorder[] = { 0, 0, 0, 1 };
	borderSize = 0;
	soundEnter[] = { "", 0, 1 };  // no sound
	soundPush[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.891251, 1};
	soundClick[] = { "", 0, 1 };  // no sound
	soundEscape[] = { "", 0, 1 };  // no sound
	x = 0.4 * safezoneW + safezoneX;
	w = 0.2 * safezoneW; h = 0.03 * safezoneH;
	text = "";
	action = "";
	shadow = 1;
  };

class StdBG {
		idc = -1;
		type =  CT_STATIC;
		style = ST_SINGLE;
		colorText[] = COLOR_BLACK;
		font = FontM;
		sizeEx = 0.023;
		text = "";
};

class StdListBox {
	idc = -1;
	type = 5;
	style = 0 + 0x10;
	font = FontM;
	sizeEx = 0.018 * safezoneH;
    rowHeight = 0.018 * safezoneH * 1.25;
	color[] = COLOR_LIGHTGRAY;
	colorText[] = COLOR_WHITE;
	colorScrollbar[] = COLOR_BRIGHTGREEN;
	colorSelect[] = COLOR_BRIGHTGREEN;
	colorSelect2[] = COLOR_BRIGHTGREEN;
	colorSelectBackground[] = COLOR_LIGHTGRAY;
	colorSelectBackground2[] = COLOR_LIGHTGRAY;
	colorActive[] = COLOR_BRIGHTGREEN;
	colorDisabled[] = COLOR_GREEN;
	columns[] = {0.1, 0.9};
	period = 0.3;
	colorBackground[] = COLOR_GREEN;
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.09, 1};

	class ListScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class StdListNBox : StdListBox {
	idc = -1;
	type = CT_List_N_Box;
	drawSideArrows = 0;
	idcLeft = -10;
	idcRight = -11;
	period = 0.3;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";

	class Scrollbar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};

	colorBackground[] = COLOR_GREEN;
};

class BgPicture {

	idc = -1;
	type = CT_STATIC;
	style = ST_PICTURE;
	colorText[] = {0.5, 0.4, 0.25, 0.6};
	colorBackground[] = {0, 0, 0, 1};
	font = FontM;
	sizeEx = 0.023;
	moving = false;
	text = "res\camo03.jpg";
};

class StdCombo {
	idc = -1;
	type = 4;
	style = 1;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.035;
	colorSelect[] = COLOR_BRIGHTGREEN;
	colorText[] = COLOR_WHITE;
	colorBackground[] = COLOR_GREEN_NOALPHA;
	colorSelectBackground[] = COLOR_LIGHTGRAY;
	colorScrollbar[] = COLOR_BRIGHTGREEN;
	arrowEmpty ="\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
	wholeHeight = 0.45;
	color[] = COLOR_LIGHTGRAY;
	colorActive[] = COLOR_BRIGHTGREEN;
	colorDisabled[] = COLOR_GREEN;
	font = FontM;
	sizeEx = 0.031;
	soundSelect[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.09, 1};
	soundExpand[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.09, 1};
	soundCollapse[] = {"\a3\Ui_f\data\Sound\CfgIngameUI\hintExpand", 0.09, 1};
	maxHistoryDelay = 1.0;

	class ComboScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class StdEdit {
	idc = -1;
	type = CT_EDIT;
	style = ST_RIGHT+ST_FRAME;
	default = false;
	font = FontM;
	sizeEx = 0.018 * safezoneH;
	colorText[] = COLOR_WHITE;
	colorSelection[] = COLOR_LIGHTGRAY;
	colorDisabled[] = COLOR_LIGHTGRAY;
	colorBackground[] = COLOR_GREEN_NOALPHA;
	colorBackgroundDisabled[] = COLOR_GREEN;
	colorBackgroundActive[] = COLOR_GREEN_NOALPHA;
	x = 0;
	y = 0;
	w = 0.3;
	h = (0.02 * safezoneH);
	text = "";
	autocomplete = "";
	shadow = 0;
};