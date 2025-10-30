class liberation_deploy {
    idd = 5201;
    movingEnable = QUOTE(false);
    controlsBackground[] = {};

    controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "InnerBG_F", "Header","DeployList","DeployButton","DeployMap", "LoadoutsCombo", "LabelDeploy", "LabelLoadout", "MapButton"};

    objects[] = {};

    class RecycleBG: BGPicture {
        idc = 198;
        x = QUOTE((0.15 * safezoneW + safezoneX) - ( 2 * BORDERSIZE));
        y = QUOTE((0.12 * safezoneH + safezoneY) - (3 * BORDERSIZE));
        w = QUOTE((0.15 * safezoneW) + (4 * BORDERSIZE));
        h = QUOTE((0.75 * safezoneH) + (6 * BORDERSIZE));
    };
    class DeployMap: kndr_MapControl {
        idc = 251;
        x = QUOTE((0.15 * safezoneW + safezoneX));
        y = QUOTE((0.57 * safezoneH + safezoneY));
        w = QUOTE((0.15 * safezoneW));
        h = QUOTE((0.25 * safezoneH) - ( 1.5 * BORDERSIZE));
    };

    class OuterBG: StdBG {
        colorBackground[] = COLOR_BROWN;
        x = QUOTE((0.15 * safezoneW + safezoneX) - ( 2 * BORDERSIZE));
        y = QUOTE((0.12 * safezoneH + safezoneY) - (3 * BORDERSIZE));
        w = QUOTE((0.15 * safezoneW) + (4 * BORDERSIZE));
        h = QUOTE((0.75 * safezoneH) + (6 * BORDERSIZE));
    };
    class OuterBG_F: OuterBG {
        style = ST_FRAME;
    };
    class InnerBG: OuterBG {
        colorBackground[] = COLOR_GREEN;
        x = QUOTE((0.15 * safezoneW + safezoneX)  - ( BORDERSIZE));
        y = QUOTE(0.17 * safezoneH + safezoneY - (1.5 * BORDERSIZE));
        w = QUOTE((0.15 * safezoneW) +  (2 * BORDERSIZE));
        h = QUOTE(0.7 * safezoneH  + (3 * BORDERSIZE));
    };
    class InnerBG_F: InnerBG {
        style = ST_FRAME;
    };
    class Header: StdHeader {
        x = QUOTE(0.15 * safezoneW + safezoneX - (BORDERSIZE));
        y = QUOTE(0.11 * safezoneH + safezoneY);
        w = QUOTE(0.15 * safezoneW + ( 2 * BORDERSIZE));
        h = QUOTE(0.05 * safezoneH - (BORDERSIZE));
        text = QUOTE($STR_DEPLOY_TITLE);
    };
    class LabelDeploy: StdText {
        x = QUOTE((0.15 * safezoneW + safezoneX));
        w = QUOTE((0.15 * safezoneW));
        h = QUOTE((0.03 * safezoneH));
        y = QUOTE(0.23 * safezoneH + safezoneY);
        sizeEx =  QUOTE(0.018 * safezoneH);
        text = QUOTE($STR_SPAWN_POINT);
    };
    class DeployList: StdListBox {
        idc = 201;
        x = QUOTE(0.15 * safezoneW + safezoneX);
        w = QUOTE(0.15 * safezoneW);
        y = QUOTE(0.26 * safezoneH + safezoneY);
        h = QUOTE((0.31 * safezoneH) - (1.5 * BORDERSIZE));
        shadow = 2;
        onLBSelChanged="";
    };
    class LabelLoadout: StdText {
        x = QUOTE((0.15 * safezoneW + safezoneX));
        w = QUOTE((0.15 * safezoneW));
        h = QUOTE((0.03 * safezoneH));
        y = QUOTE(0.16 * safezoneH + safezoneY);
        sizeEx =  QUOTE(0.018 * safezoneH);
        text = QUOTE($STR_LOADOUT);
    };
    class LoadoutsCombo: StdCombo {
        idc = 203;
        x = QUOTE((0.15 * safezoneW + safezoneX));
        w = QUOTE(0.15 * safezoneW);
        y = QUOTE(0.19 * safezoneH + safezoneY);
        h = QUOTE(0.03 * safezoneH);
        sizeEx =  QUOTE(0.018 * safezoneH);
      };
    class DeployButton: StdButton {
        idc = 202;
        x = QUOTE((0.15 * safezoneW + safezoneX));
        y = QUOTE((0.82 * safezoneH + safezoneY));
        w = QUOTE((0.15 * safezoneW));
        h = QUOTE((0.05 * safezoneH));
        sizeEx =  QUOTE(0.05 * safezoneH);
        text = QUOTE($STR_DEPLOY_BUTTON);
        action = "deploy = 1";
    };
    class MapButton: StdButton {
        idc = 202;
        x = QUOTE((0.285 * safezoneW + safezoneX));
        y = QUOTE((0.56 * safezoneH + safezoneY));
        w = QUOTE((0.015 * safezoneW));
        h = QUOTE((0.025 * safezoneH));
        sizeEx =  QUOTE(0.018 * safezoneH);
        text = "<>";
        action = "fullmap = fullmap + 1;";
    };
};
