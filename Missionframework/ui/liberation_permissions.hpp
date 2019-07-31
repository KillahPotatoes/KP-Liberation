class liberation_permissions {
	idd = 5118;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = { "OuterBG1", "OuterBG_F1", "InnerBG1", "InnerBG_F1", "Header", "ButtonClose", "PermissionsControlGroup", "ButtonSave", "ButtonCancel" };

	objects[] = {};

	class OuterBG1 : StdBG{
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
		x = (0.2 * safezoneW + safezoneX)  - ( BORDERSIZE);
		y = 0.2 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
		w = (0.6 * safezoneW) +  (2 * BORDERSIZE);
		h = 0.55 * safezoneH  + (3 * BORDERSIZE);
	};
	class InnerBG_F1 : InnerBG1 {
		style = ST_FRAME;
	};
	class Header : StdHeader{
		x = 0.2 * safezoneW + safezoneX - (BORDERSIZE);
		y = 0.14 * safezoneH + safezoneY;
		w = 0.6 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_PERMISSIONS_TITLE;
	};

	class ButtonClose : StdButton{
		idc = 750;
		x = 0.785 * safezoneW + safezoneX;
		y = 0.145 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.02 * safezoneH;
		text = "X";
		action = "closeDialog 0";
	};

	class PermissionsControlGroup  {

	 	type = 15;
	 	idc = 9969;
	 	style = 0;
		x = (0.2 * safezoneW + safezoneX)  - ( BORDERSIZE);
		y = 0.2 * safezoneH + safezoneY;
		w = (0.6 * safezoneW) +  (BORDERSIZE);
		h = 0.55 * safezoneH ;
		colorScrollbar[] = COLOR_WHITE;

	 	class VScrollbar
	 	{
	 		color[] = COLOR_WHITE;
	 		width = 0.01 * safezoneW;
			autoScrollSpeed = 5;
			autoScrollDelay = 25;
			autoScrollRewind = 0;
	 	};

	 	class HScrollbar
	 	{
	 		color[] = COLOR_WHITE;
	 		height = 0.012 * safezoneH;
	 	};

	 	class ScrollBar
	 	{
			color[] = COLOR_WHITE;
			colorActive[] = COLOR_WHITE;
			colorDisabled[] = COLOR_WHITE;
			thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
			arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
			arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
			border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	 	};

	 	class Controls {};
	 };

	 class ButtonSave : StdButton{
	 	idc = 751;
		x = 0.4 * safezoneW + safezoneX;
		y = 0.77 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.035 * safezoneH;
		text = $STR_SAVE_CHANGES;
		action = "save_changes = 1";
	};

	class ButtonCancel : StdButton{
		idc = 752;
		x = 0.5 * safezoneW + safezoneX;
		y = 0.77 * safezoneH + safezoneY;
		w = 0.09 * safezoneW;
		h = 0.035 * safezoneH;
		text = $STR_RECYCLING_CANCEL;
		action = "closeDialog 0";
	};
};