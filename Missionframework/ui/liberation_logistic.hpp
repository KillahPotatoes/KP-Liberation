class liberation_logistic {
	idd = 75802;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = {
		"OuterBG1", "OuterBG_F1", "InnerBG1", "InnerBG_F1", "InnerBG2", "InnerBG_F2", "InnerBG3", "InnerBG_F3",
		"Header", "ButtonClose", "LogisticList", "ButtonCreateLogisticGroup", "ButtonDeleteLogisticGroup",
		"LogisticName", "StatusLabel", "Status",
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
		idc = 75801;
		x = 0.785 * safezoneW + safezoneX;
		y = 0.145 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.02 * safezoneH;
		text = "X";
		action = "closeDialog 0";
	};

	class LogisticList : StdListBox {
		idc = 75802;
		x = (0.2 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.12 * safezoneW) + BORDERSIZE;
		h = (0.50 * safezoneH) + (1.5 * BORDERSIZE);
		shadow = 2;
		onLBSelChanged="";
	};

	class ButtonCreateLogisticGroup : StdButton {
	 	idc = 75803;
		sizeEx = 0.026 * safezoneH;
		x = (0.2 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.7128 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.055 * safezoneW) + BORDERSIZE;
		h = (0.045 * safezoneH);
		text = $STR_ADD;
		action = "[] remoteExec ['add_logiGroup_remote_call',2]";
	};

	class ButtonDeleteLogisticGroup : StdButton {
	 	idc = 75804;
		sizeEx = 0.026 * safezoneH;
		x = (0.265 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.7128 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.055 * safezoneW) + BORDERSIZE;
		h = (0.045 * safezoneH);
		text = $STR_DEL;
		action = "deleteLogiGroup = 1";
	};

	class LogisticName : StdText {
		idc = 75805;
		style = ST_CENTER;
		colorBackground[] = COLOR_BLACK_ALPHA;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.02 * safezoneH);
		text = "";
	};

	class StatusLabel : StdText {
		idc = 75806;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE) + (2 * ICONE_SPACY);
		w = (0.07 * safezoneW);
		h = (0.02 * safezoneH);
		text = $STR_LOGISTIC_STATUS;
	};
	class Status : StatusLabel {
		idc = 75807;
		style = ST_RIGHT;
		x = (0.4145 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		w = (0.08 * safezoneW);
		text = "";
	};

	class ButtonSaveLogistic : StdButton {
	 	idc = 758080;
		sizeEx = 0.026 * safezoneH;
		x = (0.338 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.7128 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.153 * safezoneW) + BORDERSIZE;
		h = (0.045 * safezoneH);
		text = $STR_CONFIRM;
		action = "saveSectorSetting = 1";
	};

	class LogisticMap : kndr_MapControl {
		idc = 758098;
		x = (0.51 * safezoneW + safezoneX) - (0.5 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (0.75 * BORDERSIZE);
		w = (0.29 * safezoneW) + BORDERSIZE;
		h = (0.55 * safezoneH) + (1.5 * BORDERSIZE);
	};

	 class ButtonClose2 : StdButton {
	 	idc = 758099;
		x = 0.455 * safezoneW + safezoneX;
		y = 0.77 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.035 * safezoneH;
		text = $STR_CLOSE;
		action = "closeDialog 0";
	};
};