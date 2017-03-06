class liberation_endscreen {
	idd = 5651;
	movingEnable = false;
	controls[] = { "Title", "SubTitle", "SubSubTitle", "Line1", "Line2", "Line3", "Line4", "Line5", "Line6"  };
	objects[] = {};	
	
	class EndText : StdText {
		shadow = 2;
		sizeEx = 0.03 * safezoneH;
		style = ST_LEFT;
		x = (0.15 * safezoneW + safezoneX);
		w = (0.8 * safezoneW);  
		h = (0.05 * safezoneH);
	};
	
	class Title : EndText {
		style = ST_CENTER;
		sizeEx = 0.1 * safezoneH;
		x = (0.2 * safezoneW + safezoneX);
		y = (0.17 * safezoneH + safezoneY);
		w = (0.6 * safezoneW);  
		h = (0.1 * safezoneH);
		text = $STR_VICTORY_TITLE;

	};
	class SubTitle : Title {
		sizeEx = 0.04 * safezoneH;
		y = (0.24 * safezoneH + safezoneY);
		text = $STR_VICTORY_TEXT;
	};
	class SubSubTitle : Title {
		idc = 690;
		sizeEx = 0.035 * safezoneH;
		y = (0.28 * safezoneH + safezoneY);
		text = "";
	};
	class Line1 : EndText {
		idc = 691;
		y = (0.45 * safezoneH + safezoneY);
		text = "";
	};
	class Line2 : EndText {
		idc = 692;
		y = (0.48 * safezoneH + safezoneY);
		text = "";
	};
	class Line3 : EndText {
		idc = 693;
		y = (0.51 * safezoneH + safezoneY);
		text = "";
	};
	class Line4 : EndText {
		idc = 694;
		y = (0.54 * safezoneH + safezoneY);
		text = "";
	};
	class Line5 : EndText {
		idc = 695;
		y = (0.57 * safezoneH + safezoneY);
		text = "";
	};
	class Line6 : EndText {
		idc = 696;
		y = (0.6 * safezoneH + safezoneY);
		text = "";
	};
};