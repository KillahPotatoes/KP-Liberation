class liberation_deploy {
	idd = 5201;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "InnerBG_F", "Header","DeployList","DeployButton","DeployMap", "LoadoutsCombo", "LabelDeploy", "LabelLoadout", "MapButton"};

	objects[] = {};

	class RecycleBG : BgPicture {
		idc = 198;
		x = (0.15 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.12 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.15 * safezoneW) + (4 * BORDERSIZE);
		h = (0.75 * safezoneH) + (6 * BORDERSIZE);
	};
	class DeployMap : kndr_MapControl {
		idc = 251;
		x = (0.15 * safezoneW + safezoneX);
		y = (0.57 * safezoneH + safezoneY);
		w = (0.15 * safezoneW);
		h = (0.25 * safezoneH) - ( 1.5 * BORDERSIZE);
	};

	class OuterBG : StdBG{
		colorBackground[] = COLOR_BROWN;
		x = (0.15 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.12 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.15 * safezoneW) + (4 * BORDERSIZE);
		h = (0.75 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG_F : OuterBG {
		style = ST_FRAME;
	};
	class InnerBG : OuterBG {
		colorBackground[] = COLOR_GREEN;
		x = (0.15 * safezoneW + safezoneX)  - ( BORDERSIZE);
		y = 0.17 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
		w = (0.15 * safezoneW) +  (2 * BORDERSIZE);
		h = 0.7 * safezoneH  + (3 * BORDERSIZE);
	};
	class InnerBG_F : InnerBG {
		style = ST_FRAME;
	};
	class Header : StdHeader{
		x = 0.15 * safezoneW + safezoneX - (BORDERSIZE);
		y = 0.11 * safezoneH + safezoneY;
		w = 0.15 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_DEPLOY_TITLE;
	};
	class LabelDeploy : StdText{
		x = (0.15 * safezoneW + safezoneX);
		w = (0.15 * safezoneW);
		h = (0.03 * safezoneH);
		y = 0.23 * safezoneH + safezoneY;
		sizeEx = 0.018 * safezoneH;
		text = $STR_SPAWN_POINT;
	};
	class DeployList : StdListBox {
		idc = 201;
		x = 0.15 * safezoneW + safezoneX;
		w = 0.15 * safezoneW;
		y = 0.26 * safezoneH + safezoneY;
		h = (0.31 * safezoneH) - (1.5 * BORDERSIZE);
		shadow = 2;
		onLBSelChanged="";
	};

	class LabelLoadout : StdText{
		x = (0.15 * safezoneW + safezoneX);
		w = (0.15 * safezoneW);
		h = (0.03 * safezoneH);
		y = 0.16 * safezoneH + safezoneY;
		sizeEx = 0.018 * safezoneH;
		text = $STR_LOADOUT;
	};
	class LoadoutsCombo : StdCombo{
		idc = 203;
		x = (0.15 * safezoneW + safezoneX);
		w = 0.15 * safezoneW;
		y = 0.19 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		sizeEx = 0.018 * safezoneH;
	  };
	class DeployButton : StdButton{
		idc = 202;
		x = (0.15 * safezoneW + safezoneX);
		y = (0.82 * safezoneH + safezoneY);
		w = (0.15 * safezoneW);
		h = (0.05 * safezoneH);
		sizeEx = 0.05 * safezoneH;
		text = $STR_DEPLOY_BUTTON;
		action = "deploy = 1";
	};
	class MapButton : StdButton{
		idc = 202;
		x = (0.285 * safezoneW + safezoneX);
		y = (0.56 * safezoneH + safezoneY);
		w = (0.015 * safezoneW);
		h = (0.025 * safezoneH);
		sizeEx = 0.018 * safezoneH;
		text = "<>";
		action = "fullmap = fullmap + 1;";
	};
};