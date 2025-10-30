class liberation_repackage_fob {
    idd = 5755;
    movingEnable = false;
    controlsBackground[] = { "OuterBG", "RecycleBG", "OuterBG_F", "InnerBG", "InnerBG_F" };
    controls[] = { "Header", "ButtonClose", "Infotext","TruckButton","BoxButton","CancelButton"};
    objects[] = {};

    class RecycleBG: BgPicture {
        x = QUOTE((0.35 * safezoneW + safezoneX) - ( 2 * BORDERSIZE));
        y = QUOTE((0.4 * safezoneH + safezoneY) - (3 * BORDERSIZE));
        w = QUOTE((0.3 * safezoneW) + (4 * BORDERSIZE));
        h = QUOTE((0.2 * safezoneH) + (6 * BORDERSIZE));
    };
    class OuterBG: StdBG {
        colorBackground[] = COLOR_BROWN;
        x = QUOTE((0.35 * safezoneW + safezoneX) - ( 2 * BORDERSIZE));
        y = QUOTE((0.4 * safezoneH + safezoneY) - (3 * BORDERSIZE));
        w = QUOTE((0.3 * safezoneW) + (4 * BORDERSIZE));
        h = QUOTE((0.2 * safezoneH) + (6 * BORDERSIZE));
    };
    class OuterBG_F: OuterBG {
        style = ST_FRAME;
    };
    class InnerBG: OuterBG {
        colorBackground[] = COLOR_GREEN;
        x = QUOTE((0.35 * safezoneW + safezoneX)  - ( BORDERSIZE));
        y = QUOTE(0.45 * safezoneH + safezoneY - (1.5 * BORDERSIZE));
        w = QUOTE((0.3 * safezoneW) +  (2 * BORDERSIZE));
        h = QUOTE(0.15 * safezoneH  + (3 * BORDERSIZE));
    };
    class InnerBG_F: InnerBG {
        style = ST_FRAME;
    };
    class Header: StdHeader {
        x = QUOTE(0.35 * safezoneW + safezoneX - (BORDERSIZE));
        y = QUOTE(0.39 * safezoneH + safezoneY);
        w = QUOTE(0.3 * safezoneW + ( 2 * BORDERSIZE));
        h = QUOTE(0.05 * safezoneH - (BORDERSIZE));
        text = QUOTE($STR_FOB_REPACKAGE_TITLE);
    };
    class ButtonClose: StdButton {
        idc = 101;
        x = QUOTE(0.632 * safezoneW + safezoneX);
        w = QUOTE(0.015 * safezoneW);
        h = QUOTE(0.02 * safezoneH);
        y = QUOTE(0.402 * safezoneH + safezoneY);
        text = "X";
        action = "closeDialog 0";
    };
    class Infotext: StdText {
        idc = -1;
        style = ST_CENTER;
        x = QUOTE((0.35 * safezoneW + safezoneX));
        w = QUOTE((0.3 * safezoneW));
        h = QUOTE((0.03 * safezoneH));
        y = QUOTE((0.45 * safezoneH + safezoneY));
        colorText[] = {0.9, 0.9, 0.9, 1};
        text = QUOTE($STR_FOB_REPACKAGE_CONFIRM);
    };
    class BoxButton: StdButton {
        idc = 120;
        x = QUOTE((0.38 * safezoneW + safezoneX) - (BORDERSIZE));
        y = QUOTE((0.55 * safezoneH + safezoneY));
        w = QUOTE((0.08 * safezoneW) - (BORDERSIZE));
        h = QUOTE((0.045 * safezoneH));
        sizeEx = 0.023 * safezoneH;
        text = QUOTE($STR_FOBBOX);
        action = "dorepackage = 1;";
    };
    class TruckButton: StdButton {
        idc = 120;
        x = QUOTE((0.46 * safezoneW + safezoneX));
        y = QUOTE((0.55 * safezoneH + safezoneY));
        w = QUOTE((0.08 * safezoneW) - (BORDERSIZE));
        h = QUOTE((0.045 * safezoneH));
        sizeEx = 0.023 * safezoneH;
        text = QUOTE($STR_FOBTRUCK);
        action = "dorepackage = 2;";
    };
    class CancelButton: StdButton {
        idc = 121;
        x = QUOTE((0.54 * safezoneW + safezoneX) + (BORDERSIZE));
        y = QUOTE((0.55 * safezoneH + safezoneY));
        w = QUOTE((0.08 * safezoneW));
        h = QUOTE((0.045 * safezoneH));
        sizeEx = 0.023 * safezoneH;
        text = QUOTE($STR_RECYCLING_CANCEL);
        action = "closeDialog 0";
    };
};
