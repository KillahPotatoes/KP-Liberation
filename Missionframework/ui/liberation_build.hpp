class liberation_build {
	idd = 5501;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = {"OuterBG", "RecycleBG", "OuterBG_F", "InnerBG", "InnerBG_F", "Header",
	"ButtonClose","BuildInfantryButton","BuildTransportVehicleButton",
	"BuildCombatVehicleButton","BuildAerialButton","BuildDefenceButton",
	"BuildSupportButton","BuildSquadButton","BuildBuildingButton","BuildInfantryImage",
	"BuildTransportVehicleImage","BuildCombatVehicleImage","BuildAerialImage","ManpowerImageShadow","AmmoImageShadow","FuelImageShadow",
	"BuildDefenceImage","BuildSupportImage","BuildSquadImage","BuildBuildingImage","ListBG","ManpowerImage","AmmoImage","FuelImage",
	"BuildList","BuildButton","LabelManpower","LabelAmmo","LabelFuel","LabelCap","BuildMannedButton","PageLabel", "LinkedSector"

	};

	objects[] = {};

	class RecycleBG : BgPicture {
		x = (0.35 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.3 * safezoneW) + (4 * BORDERSIZE);
		h = (0.6 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG : StdBG{
		colorBackground[] = COLOR_BROWN;
		x = (0.35 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.3 * safezoneW) + (4 * BORDERSIZE);
		h = (0.6 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG_F : OuterBG {
		style = ST_FRAME;
	};
	class InnerBG : OuterBG {
		colorBackground[] = COLOR_GREEN;
		x = (0.35 * safezoneW + safezoneX)  - ( BORDERSIZE);
		y = 0.25 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
		w = (0.3 * safezoneW) +  (2 * BORDERSIZE);
		h = 0.55 * safezoneH  + (3 * BORDERSIZE);
	};
	class InnerBG_F : InnerBG {
		style = ST_FRAME;
	};
	class Header : StdHeader{
		x = 0.35 * safezoneW + safezoneX - (BORDERSIZE);
		y = 0.19 * safezoneH + safezoneY;
		w = 0.3 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_BUILD_TITLE;
	};
	class ButtonClose : StdButton{
		idc = 101;
		x = 0.635 * safezoneW + safezoneX;
		w = 0.015 * safezoneW;
		h = 0.02 * safezoneH;
		y = 0.195 * safezoneH + safezoneY;
		text = "X";
		action = "closeDialog 0";
	};
	class BuildTypeImage {
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {0, 0, 0, 1};
        colorBackground[] = {0, 0, 0, 1};
		font = FontM;
		sizeEx = 0.023;
		y = (0.2525 * safezoneH + safezoneY);
		w = (0.02 * safezoneW);
		h = (0.035 * safezoneH);
		moving = false;
	};
	class BuildTypeButton : StdButton{
		colorBackgroundActive[] = { 0,1,0,0.5 };
		colorFocused[] = { 0, 1, 0, 0.5 };
		y = (0.25 * safezoneH + safezoneY);
		w = (0.023 * safezoneW);
		h = (0.04 * safezoneH);
		text = "";
	};
	class BuildInfantryImage : BuildTypeImage {
		idc = 1025;
		x = (0.402 * safezoneW + safezoneX);
		text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeUnits_ca.paa";
	};
	class BuildInfantryButton : BuildTypeButton{
		idc = 102;
		text = "";
		action = "buildtype=1";
		x = (0.4 * safezoneW + safezoneX);
	};
	class BuildTransportVehicleImage : BuildTypeImage {
		idc = 1035;
		x = (0.427 * safezoneW + safezoneX);
		text = "\A3\ui_f\data\map\vehicleicons\iconCar_ca.paa";
	};
	class BuildTransportVehicleButton : BuildTypeButton{
		idc = 103;
		text = "";
		action = "buildtype=2";
		x = (0.425 * safezoneW + safezoneX);
	};
	class BuildCombatVehicleImage : BuildTypeImage {
		idc = 1045;
		x = (0.452 * safezoneW + safezoneX);
		text = "\A3\ui_f\data\map\vehicleicons\iconTank_ca.paa";
	};
	class BuildCombatVehicleButton : BuildTypeButton{
		idc = 104;
		text = "";
		action = "buildtype=3";
		x = (0.45 * safezoneW + safezoneX);
	};
	class BuildAerialImage : BuildTypeImage {
		idc = 1055;
		x = (0.477 * safezoneW + safezoneX);
		text = "\A3\ui_f\data\map\vehicleicons\iconHelicopter_ca.paa";
	};
	class BuildAerialButton : BuildTypeButton{
		idc = 105;
		text = "";
		action = "buildtype=4";
		x = (0.475 * safezoneW + safezoneX);
	};
	class BuildDefenceImage : BuildTypeImage {
		idc = 11065;
		x = (0.502 * safezoneW + safezoneX);
		text = "\A3\ui_f\data\map\vehicleicons\iconStaticCannon_ca.paa";
	};
	class BuildDefenceButton : BuildTypeButton{
		idc = 1106;
		text = "";
		action = "buildtype=5";
		x = (0.5 * safezoneW + safezoneX);
	};
	class BuildBuildingImage : BuildTypeImage {
		idc = 1095;
		x = (0.527 * safezoneW + safezoneX);
		text = "\A3\ui_f\data\map\mapcontrol\Bunker_CA.paa";
	};
	class BuildBuildingButton : BuildTypeButton{
		idc = 109;
		text = "";
		action = "buildtype=6";
		x = (0.525 * safezoneW + safezoneX);
	};
	class BuildSupportImage : BuildTypeImage {
		idc = 1075;
		x = (0.552 * safezoneW + safezoneX);
		text = "\A3\ui_f\data\map\vehicleicons\iconCrateAmmo_ca.paa";
	};
	class BuildSupportButton : BuildTypeButton{
		idc = 107;
		text = "";
		action = "buildtype=7";
		x = (0.55 * safezoneW + safezoneX);
	};
	class BuildSquadImage : BuildTypeImage {
		idc = 1085;
		x = (0.577 * safezoneW + safezoneX);
		text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
	};
	class BuildSquadButton : BuildTypeButton{
		idc = 108;
		text = "";
		action = "buildtype=8";
		x = (0.575 * safezoneW + safezoneX);
	};

	class IconImage {
		idc = -1;
		type = CT_STATIC;
		style = ST_PICTURE;
		colorText[] = {1, 1, 1, 1};
        colorBackground[] = {0, 0, 0, 1};
		font = FontM;
		sizeEx = 0.023;
		y = (0.32 * safezoneH + safezoneY);
		w = (0.015 * safezoneW);
		h = (0.025 * safezoneH);
		moving = false;
	};
	class ManpowerImage : IconImage {
		x = (0.5475 * safezoneW + safezoneX);
		text = "res\ui_manpo.paa";
	};
	class AmmoImage : IconImage {
		x = (0.5775 * safezoneW + safezoneX);
		text = "res\ui_ammo.paa";
	};
	class FuelImage : IconImage {
		x = (0.6075 * safezoneW + safezoneX);
		text = "res\ui_fuel.paa";
	};
	class ManpowerImageShadow : IconImage {
		x = (0.5475 * safezoneW + safezoneX)  + 0.003;
		text = "res\ui_manpo.paa";
		colorText[] = {0, 0, 0, 1};
		y = (0.32 * safezoneH + safezoneY) + 0.005;
	};
	class AmmoImageShadow : IconImage {
		x = (0.5775 * safezoneW + safezoneX) + 0.003;
		text = "res\ui_ammo.paa";
		colorText[] = {0, 0, 0, 1};
		y = (0.32 * safezoneH + safezoneY) + 0.005;
	};
	class FuelImageShadow : IconImage {
		x = (0.6075 * safezoneW + safezoneX)  + 0.003;
		text = "res\ui_fuel.paa";
		colorText[] = {0, 0, 0, 1};
		y = (0.32 * safezoneH + safezoneY) + 0.005;
	};

	class BuildList : StdListNBox {
		idc = 110;
		x = 0.35 * safezoneW + safezoneX;
		w = 0.3 * safezoneW;
		y = 0.35 * safezoneH + safezoneY;
		h = (0.35 * safezoneH) - (2 * BORDERSIZE);
		columns[] = {
			0,
			0.65,
			0.75,
			0.85
		};
		onLBSelChanged="";
		shadow = 2;
		rowHeight = 1.25 * 0.018 * safezoneH;
		colorPicture[] = {1,1,1,1};
		colorPictureSelected[] = {0,1,0,1};
		colorPictureDisabled[] = {0.4,0.4,0.4,1};
	};
	class ListBG : OuterBG {
		colorBackground[] = COLOR_GREEN;
		x = 0.35 * safezoneW + safezoneX;
		w = 0.3 * safezoneW;
		y = 0.35 * safezoneH + safezoneY;
		h = (0.35 * safezoneH) - (2 * BORDERSIZE);
	};
	class LabelResource : StdText{
		x = (0.35 * safezoneW + safezoneX);
		w = (0.15 * safezoneW);
		h = (0.03 * safezoneH);
	};
	class LabelManpower : LabelResource{
		idc = 131;
		y = (0.7 * safezoneH + safezoneY);
		colorText[] = {0, 0.75, 0, 1};
	};
	class LabelAmmo : LabelResource{
		idc = 132;
		y = (0.72 * safezoneH + safezoneY);
		colorText[] = {0.75, 0, 0, 1};
	};
	class LabelFuel : LabelResource{
		idc = 133;
		y = (0.74 * safezoneH + safezoneY);
		colorText[] = {0.75, 0.75, 0, 1};
	};
	class LabelCap : LabelResource{
		idc = 134;
		type = CT_STRUCTURED_TEXT;
		y = (0.78 * safezoneH + safezoneY);
		size = 0.02 * safezoneH;
		colorText[] = {0.8, 0.8, 0.8, 1};
	};
	class PageLabel : StdText{
		idc = 151;
		x = (0.35 * safezoneW + safezoneX);
		y = (0.3 * safezoneH + safezoneY);
		w = (0.2 * safezoneW);
		h = (0.05 * safezoneH);
		sizeEx = 0.03 * safezoneH;
	};

	class BuildButton : StdButton{
		idc = 120;
		x = (0.55 * safezoneW + safezoneX);
		y = (0.75 * safezoneH + safezoneY);
		w = (0.1 * safezoneW);
		h = (0.045 * safezoneH);
		sizeEx = 0.03 * safezoneH;
		text = $STR_BUILD_BUTTON;
		action = "dobuild = 1;";
	};
	class BuildMannedButton : StdButton{
		idc = 121;
		x = (0.55 * safezoneW + safezoneX);
		y = (0.7 * safezoneH + safezoneY);
		w = (0.1 * safezoneW);
		h = (0.045 * safezoneH);
		sizeEx = 0.02 * safezoneH;
		text = $STR_BUILD_CREW;
		action = "dobuild = 1; manned = true;";
	};
	class LinkedSector{
		idc = 161;
		type = CT_STRUCTURED_TEXT;
		colorBackground[] = COLOR_NOALPHA;
		style = ST_LEFT;
		x = 0.45 * safezoneW + safezoneX;
		w = 0.1 * safezoneW;
		y = 0.725 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
		text= "";
		size = 0.02 * safezoneH;
		sizeEx = 0.02 * safezoneH;
		shadow = 2;
		font = FontM;
		color = "#e0e000";
		align = "right";
		valign = "top";
	};
};
