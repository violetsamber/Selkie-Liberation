class liberation_halo {
    idd = 5203;
    movingEnable = QUOTE(false);
    controlsBackground[] = {};

    controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "InnerBG_F", "Header","JumpButton","CancelButton","DeployMap"};

    objects[] = {};

    class RecycleBG: BGPicture {
        x = QUOTE((0.2 * safezoneW + safezoneX) - ( 2 * BORDERSIZE));
        y = QUOTE((0.15 * safezoneH + safezoneY) - (3 * BORDERSIZE));
        w = QUOTE((0.6 * safezoneW) + (4 * BORDERSIZE));
        h = QUOTE((0.7 * safezoneH) + (6 * BORDERSIZE));
    };
    class DeployMap: kndr_MapControl {
        idc = 251;
        x = QUOTE((0.2 * safezoneW + safezoneX));
        y = QUOTE((0.2 * safezoneH + safezoneY));
        w = QUOTE((0.6 * safezoneW));
        h = QUOTE((0.6 * safezoneH) - ( 1.5 * BORDERSIZE));
    };
    class OuterBG: StdBG {
        colorBackground[] = COLOR_BROWN;
        x = QUOTE((0.2 * safezoneW + safezoneX) - ( 2 * BORDERSIZE));
        y = QUOTE((0.15 * safezoneH + safezoneY) - (3 * BORDERSIZE));
        w = QUOTE((0.6 * safezoneW) + (4 * BORDERSIZE));
        h = QUOTE((0.7 * safezoneH) + (6 * BORDERSIZE));
    };
    class OuterBG_F: OuterBG {
        style = ST_FRAME;
    };
    class InnerBG: OuterBG {
        colorBackground[] = COLOR_GREEN;
        x = QUOTE((0.2 * safezoneW + safezoneX)  - ( BORDERSIZE));
        y = QUOTE(0.2 * safezoneH + safezoneY - (1.5 * BORDERSIZE));
        w = QUOTE((0.6 * safezoneW) +  (2 * BORDERSIZE));
        h = QUOTE(0.65 * safezoneH  + (3 * BORDERSIZE));
    };
    class InnerBG_F: InnerBG {
        style = ST_FRAME;
    };
    class Header: StdHeader {
        x = QUOTE(0.2 * safezoneW + safezoneX - (BORDERSIZE));
        y = QUOTE(0.14 * safezoneH + safezoneY);
        w = QUOTE(0.6 * safezoneW + ( 2 * BORDERSIZE));
        h = QUOTE(0.05 * safezoneH - (BORDERSIZE));
        text = QUOTE($STR_HALO_TITLE);
    };
    class JumpButton: StdButton {
        idc = 202;
        x = QUOTE((0.39 * safezoneW + safezoneX));
        y = QUOTE((0.8 * safezoneH + safezoneY));
        w = QUOTE((0.1 * safezoneW));
        h = QUOTE((0.05 * safezoneH));
        sizeEx =  QUOTE(0.025 * safezoneH);
        text = QUOTE($STR_HALO_PARAM);
        action = "dojump = 1;";
    };
    class CancelButton: StdButton {
        idc = 202;
        x = QUOTE((0.51 * safezoneW + safezoneX));
        y = QUOTE((0.8 * safezoneH + safezoneY));
        w = QUOTE((0.1 * safezoneW));
        h = QUOTE((0.05 * safezoneH));
        sizeEx =  QUOTE(0.025 * safezoneH);
        text = QUOTE($STR_RECYCLING_CANCEL);
        action = "closeDialog 0;";
    };
};
