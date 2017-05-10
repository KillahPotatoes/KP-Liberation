class liberation_logistic {
	idd = 758002;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = {
		"OuterBG1", "OuterBG_F1", "InnerBG1", "InnerBG_F1", "InnerBG2", "InnerBG_F2", "InnerBG3", "InnerBG_F3",
		"Header", "ButtonClose", "LogisticList", 
		"LogisticName",
		"ButtonSaveLogistic",
		"LogisticMap", "ButtonClose2"
	};

	objects[] = {};

	class OuterBG1 : StdBG {
		colorBackground[] = COLOR_BROWN;
		x = (0.2 * safezoneW + safezoneX) - (2 * BORDERSIZE);
		y = (0.15 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.6 * safezoneW) + (4 * BORDERSIZE);
		h = (0.65 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG_F1 : OuterBG1 {
		style = ST_FRAME;
	};

	class InnerBG1 : OuterBG1 {
		colorBackground[] = COLOR_GREEN;
		x = (0.2 * safezoneW + safezoneX) - (BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
		w = (0.12 * safezoneW) + (2 * BORDERSIZE);
		h = (0.55 * safezoneH) + (3 * BORDERSIZE);
	};
	class InnerBG_F1 : InnerBG1 {
		style = ST_FRAME;
	};

	class InnerBG2 : OuterBG1 {
		colorBackground[] = COLOR_GREEN;
		x = (0.338 * safezoneW + safezoneX) - (BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
		w = (0.153 * safezoneW) + (2 * BORDERSIZE);
		h = (0.55 * safezoneH) + (3 * BORDERSIZE);
	};
	class InnerBG_F2 : InnerBG2 {
		style = ST_FRAME;
	};

	class InnerBG3 : OuterBG1 {
		colorBackground[] = COLOR_GREEN;
		x = (0.51 * safezoneW + safezoneX) - (BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
		w = (0.29 * safezoneW) + (2 * BORDERSIZE);
		h = (0.55 * safezoneH) + (3 * BORDERSIZE);
	};
	class InnerBG_F3 : InnerBG3 {
		style = ST_FRAME;
	};

	class Header : StdHeader {
		x = 0.2 * safezoneW + safezoneX - (BORDERSIZE);
		y = 0.14 * safezoneH + safezoneY;
		w = 0.6 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_LOGISTIC_HEADER;
	};

	class ButtonClose : StdButton {
		idc = 75800201;
		x = 0.785 * safezoneW + safezoneX;
		y = 0.145 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.02 * safezoneH;
		text = "X";
		action = "closeDialog 0";
	};

	class LogisticList : StdListBox {
		idc = 75800202;
		x = (0.2 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.12 * safezoneW) + BORDERSIZE;
		h = (0.55 * safezoneH) + (1.5 * BORDERSIZE);
		shadow = 2;
		onLBSelChanged="";
	};

	class LogisticName : StdText {
		idc = 75800203;
		style = ST_CENTER;
		colorBackground[] = COLOR_BLACK_ALPHA;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = "";
	};

	class ButtonSaveLogistic : StdButton {
	 	idc = 75800204;
		sizeEx = 0.026 * safezoneH;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.7128 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.045 * safezoneH);
		text = $STR_CONFIRM;
		action = "saveSectorSetting = 1";
	};

	class LogisticMap : kndr_MapControl {
		idc = 75800205;
		x = (0.51 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.29 * safezoneW) + BORDERSIZE;
		h = (0.55 * safezoneH) + (1.5 * BORDERSIZE);
	};

	 class ButtonClose2 : StdButton {
	 	idc = 75800206;
		x = 0.455 * safezoneW + safezoneX;
		y = 0.77 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.035 * safezoneH;
		text = $STR_CLOSE;
		action = "closeDialog 0";
	};
};