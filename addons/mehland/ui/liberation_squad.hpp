class liberation_squad {
    idd = 5155;
    movingEnable = QUOTE(false);
    controlsBackground[] = {};

    controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "InnerBG_F", "OuterCenterPanel","Header","SquadList","DeployMap", "ButtonClose",
        "NameLabel", "ClassLabel", "HealthLabel", "DistanceLabel", "PrimaryLabel", "PrimaryMagsLabel", "SecondaryLabel", "SecondaryMagsLabel", "VehicleLabel",
        "ResupplyButton", "RemoveButton", "ReplaceButton", "ConfirmButton", "CancelButton", "PiPZone"};

    objects[] = {};

    class RecycleBG: BgPicture {
        x = QUOTE((0.2 * safezoneW + safezoneX) - (2 * BORDERSIZE));
        y = QUOTE((0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE));
        w = QUOTE((0.6 * safezoneW) + (4 * BORDERSIZE));
        h = QUOTE((0.6 * safezoneH) + (6 * BORDERSIZE));
    };
    class DeployMap: kndr_MapControl {
        idc = 100;
        x = QUOTE((0.32 * safezoneW + safezoneX)  + BORDERSIZE);
        y = QUOTE((0.6 * safezoneH + safezoneY));
        w = QUOTE((0.12 * safezoneW));
        h = QUOTE((0.2 * safezoneH));
    };
    class OuterBG: StdBG {
        colorBackground[] = COLOR_BROWN;
        x = QUOTE((0.2 * safezoneW + safezoneX) - (2 * BORDERSIZE));
        y = QUOTE((0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE));
        w = QUOTE((0.6 * safezoneW) + (4 * BORDERSIZE));
        h = QUOTE((0.6 * safezoneH) + (6 * BORDERSIZE));
    };
    class OuterBG_F: OuterBG {
        style = ST_FRAME;
    };
    class InnerBG: OuterBG {
        colorBackground[] = COLOR_GREEN;
        x = QUOTE((0.2 * safezoneW + safezoneX) - BORDERSIZE);
        y = QUOTE((0.25 * safezoneH + safezoneY) - (1.5 * BORDERSIZE));
        w = QUOTE((0.6 * safezoneW) + (2 * BORDERSIZE));
        h = QUOTE((0.55 * safezoneH) + (3 * BORDERSIZE));
    };
    class InnerBG_F: InnerBG {
        style = ST_FRAME;
    };
    class OuterCenterPanel: StdBG {
        colorBackground[] = COLOR_GREEN;
        style = ST_FRAME;
        x = QUOTE(0.32 * safezoneW + safezoneX + BORDERSIZE);
        w = QUOTE(0.12 * safezoneW);
        y = QUOTE(0.25 * safezoneH + safezoneY);
        h = QUOTE((0.35 * safezoneH) - (1.5 * BORDERSIZE));
    };
    class Header: StdHeader {
        x = QUOTE(0.2 * safezoneW + safezoneX - (BORDERSIZE));
        y = QUOTE(0.19 * safezoneH + safezoneY);
        w = QUOTE(0.6 * safezoneW + ( 2 * BORDERSIZE));
        h = QUOTE(0.05 * safezoneH - (BORDERSIZE));
        text = QUOTE($STR_SQUAD_MANAGEMENT);
    };
    class SquadList: StdListBox {
        idc = 101;
        x = QUOTE(0.2 * safezoneW + safezoneX);
        w = QUOTE(0.12 * safezoneW);
        y = QUOTE(0.25 * safezoneH + safezoneY);
        h = QUOTE((0.35 * safezoneH) - (1.5 * BORDERSIZE));
        shadow = 2;
        onLBSelChanged="";
    };
    class ResupplyButton: StdButton {
        idc = 210;
        x = QUOTE((0.2 * safezoneW + safezoneX));
        y = QUOTE((0.6 * safezoneH + safezoneY));
        w = QUOTE((0.12 * safezoneW));
        h = QUOTE((0.04 * safezoneH));
        sizeEx =  QUOTE(0.025 * safezoneH);
        text = QUOTE($STR_RESUPPLY);
        tooltip = QUOTE($STR_RESUPPLY_TOOLTIP);
        action = "GRLIB_squadaction = 1";
    };
    class RemoveButton: StdButton {
        idc = 211;
        x = QUOTE((0.2 * safezoneW + safezoneX));
        y = QUOTE((0.65 * safezoneH + safezoneY));
        w = QUOTE((0.12 * safezoneW));
        h = QUOTE((0.04 * safezoneH));
        sizeEx =  QUOTE(0.025 * safezoneH);
        text = QUOTE($STR_REMOVE_MEMBER);
        tooltip = QUOTE($STR_REMOVE_MEMBER_TOOLTIP);
        action = "GRLIB_squadaction = 2";
    };
    class ReplaceButton: StdButton {
        idc = 212;
        x = QUOTE((0.2 * safezoneW + safezoneX));
        y = QUOTE((0.7 * safezoneH + safezoneY) );
        w = QUOTE((0.12 * safezoneW));
        h = QUOTE((0.04 * safezoneH));
        sizeEx =  QUOTE(0.025 * safezoneH);
        text = QUOTE($STR_DEPLOY_ON_MEMBER);
        tooltip = QUOTE($STR_DEPLOY_ON_MEMBER_TOOLTIP);
        action = "GRLIB_squadaction = 3";
    };
    class ConfirmButton: StdButton {
        idc = 213;
        x = QUOTE((0.2 * safezoneW + safezoneX));
        y = QUOTE((0.75 * safezoneH + safezoneY) );
        w = QUOTE((0.055 * safezoneW));
        h = QUOTE((0.04 * safezoneH));
        sizeEx =  QUOTE(0.025 * safezoneH);
        text = QUOTE($STR_CONFIRM);
        action = "GRLIB_squadconfirm = 1";
    };
    class CancelButton: StdButton {
        idc = 214;
        x = QUOTE((0.265 * safezoneW + safezoneX));
        y = QUOTE((0.75 * safezoneH + safezoneY) );
        w = QUOTE((0.055 * safezoneW));
        h = QUOTE((0.04 * safezoneH));
        sizeEx =  QUOTE(0.025 * safezoneH);
        text = QUOTE($STR_RECYCLING_CANCEL);
        action = "GRLIB_squadconfirm = 0";
    };
    class ButtonClose: StdButton {
        x = QUOTE(0.785 * safezoneW + safezoneX);
        w = QUOTE(0.015 * safezoneW);
        h = QUOTE(0.02 * safezoneH);
        y = QUOTE(0.195 * safezoneH + safezoneY);
        text = "X";
        action = "closeDialog 0";
    };
    class StdSquadLabel: StdText {
        x = QUOTE((0.32 * safezoneW + safezoneX)  + (BORDERSIZE));
        w = QUOTE((0.12 * safezoneW) - BORDERSIZE);
        h = QUOTE((0.03 * safezoneH));
        shadow = 2;
        sizeEx =  QUOTE(0.018 * safezoneH);
        text = "";
    };
    class NameLabel: StdSquadLabel {
        idc = 201;
        style = ST_CENTER;
        y = QUOTE(0.25 * safezoneH + safezoneY);
        sizeEx =  QUOTE(0.022 * safezoneH);
    };
    class ClassLabel: StdSquadLabel {
        idc = 202;
        y = QUOTE(0.3 * safezoneH + safezoneY);
    };
    class HealthLabel: StdSquadLabel {
        idc = 203;
        y = QUOTE(0.325 * safezoneH + safezoneY);
    };
    class DistanceLabel: StdSquadLabel {
        idc = 204;
        y = QUOTE(0.35 * safezoneH + safezoneY);
    };
    class PrimaryLabel: StdSquadLabel {
        idc = 205;
        y = QUOTE(0.4 * safezoneH + safezoneY);
    };
    class PrimaryMagsLabel: StdSquadLabel {
        idc = 206;
        y = QUOTE(0.425 * safezoneH + safezoneY);
    };
    class SecondaryLabel: StdSquadLabel {
        idc = 207;
        y = QUOTE(0.475 * safezoneH + safezoneY);
    };
    class SecondaryMagsLabel: StdSquadLabel {
        idc = 208;
        y = QUOTE(0.5 * safezoneH + safezoneY);
    };
    class VehicleLabel: StdSquadLabel {
        idc = 209;
        y = QUOTE(0.55 * safezoneH + safezoneY);
    };
    class PiPZone {
        idc = 333;
        type = CT_STATIC;
        style = ST_PICTURE;
        colorText[] = {1,1,1,1};
        colorBackground[] = {1,1,1,1};
        font = FontM;
        sizeEx =  QUOTE(0.023);
        x = QUOTE(0.44 * safezoneW + safezoneX + ( 2 * BORDERSIZE));
        y = QUOTE((0.25 * safezoneH + safezoneY));
        w = QUOTE((0.36 * safezoneW) - ( 2 * BORDERSIZE) );
        h = QUOTE((0.55 * safezoneH));
        text = "#(argb,512,512,1)r2t(rtt,1.333)";
        moving = QUOTE(false);
    };
};
