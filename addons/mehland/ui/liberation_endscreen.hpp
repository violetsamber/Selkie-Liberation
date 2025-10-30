class liberation_endscreen {
    idd = 5651;
    movingEnable = QUOTE(false);
    controls[] = { "Title", "SubTitle", "SubSubTitle", "Line1", "Line2", "Line3", "Line4", "Line5", "Line6"  };
    objects[] = {};

    class EndText: StdText {
        shadow = 2;
        sizeEx =  QUOTE(0.03 * safezoneH);
        style = ST_LEFT;
        x = QUOTE((0.15 * safezoneW + safezoneX));
        w = QUOTE((0.8 * safezoneW));
        h = QUOTE((0.05 * safezoneH));
    };
    class Title: EndText {
        style = ST_CENTER;
        sizeEx =  QUOTE(0.1 * safezoneH);
        x = QUOTE((0.2 * safezoneW + safezoneX));
        y = QUOTE((0.17 * safezoneH + safezoneY));
        w = QUOTE((0.6 * safezoneW));
        h = QUOTE((0.1 * safezoneH));
        text = QUOTE($STR_VICTORY_TITLE);
    };
    class SubTitle: Title {
        sizeEx =  QUOTE(0.04 * safezoneH);
        y = QUOTE((0.24 * safezoneH + safezoneY));
        text = QUOTE($STR_VICTORY_TEXT);
    };
    class SubSubTitle: Title {
        idc = 690;
        sizeEx =  QUOTE(0.035 * safezoneH);
        y = QUOTE((0.28 * safezoneH + safezoneY));
        text = "";
    };
    class Line1: EndText {
        idc = 691;
        y = QUOTE((0.45 * safezoneH + safezoneY));
        text = "";
    };
    class Line2: EndText {
        idc = 692;
        y = QUOTE((0.48 * safezoneH + safezoneY));
        text = "";
    };
    class Line3: EndText {
        idc = 693;
        y = QUOTE((0.51 * safezoneH + safezoneY));
        text = "";
    };
    class Line4: EndText {
        idc = 694;
        y = QUOTE((0.54 * safezoneH + safezoneY));
        text = "";
    };
    class Line5: EndText {
        idc = 695;
        y = QUOTE((0.57 * safezoneH + safezoneY));
        text = "";
    };
    class Line6: EndText {
        idc = 696;
        y = QUOTE((0.6 * safezoneH + safezoneY));
        text = "";
    };
};
