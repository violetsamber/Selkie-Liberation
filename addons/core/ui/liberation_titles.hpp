class CfgSounds {
    sounds[] = {};
    class parasound	{
        name = "parasound";
        sound[] = {"res\c130.ogg", 1.0, 1};
        titles[] = {};
    };
};

class RscTitles {
    class intro1 {
        name = "intro1";
        duration = 4;
        idd = -1;
        movingEnable = QUOTE(false);
        controls[]= {
            QUOTE(GenericLabelShadow), QUOTE(GenericLabel2)
        };
        class GenericLabel2 {
            idc = -1;
            type =  QUOTE(CT_STATIC);
            style = ST_CENTER;
            colorText[] = COLOR_WHITE;
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx =  QUOTE(0.035 * safezoneH);
            x = QUOTE(0.3 * safezoneW + safezoneX);
            w = QUOTE(0.4 * safezoneW);
            y = QUOTE(0.65 * safezoneH + safezoneY);
            h = QUOTE(0.1 * safezoneH);
            text = "[GREUH], [KP], and FatRefrigerator present";
            shadow = 1;
        };
        class GenericLabelShadow: GenericLabel2 {
            shadow = 2;
        };
    };
    class intro2 {
        name = "intro2";
        duration = 7;
        idd = -1;
        movingEnable = QUOTE(false);
        controls[] = {
            QUOTE(VersionLabelShadow), QUOTE(Splash), QUOTE(VersionLabel)
        };
        class Splash {
            idc = -1;
            type =  QUOTE(CT_STATIC);
            style = ST_PICTURE;
            colorText[] = COLOR_WHITE;
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx =  QUOTE(0.1 * safezoneH);
            x = QUOTE(0.325 * safezoneW + safezoneX);
            w = QUOTE(0.35 * safezoneW);
            y = QUOTE(0.2 * safezoneH + safezoneY);
            h = QUOTE(0.6 * safezoneH);
            text = "res\lib.paa";
        };
        class VersionLabel {
            idc = -1;
            type =  QUOTE(CT_STATIC);
            style = ST_CENTER;
            shadow = 1;
            colorText[] = COLOR_WHITE;
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx =  QUOTE(0.035 * safezoneH);
            x = QUOTE(0.45 * safezoneW + safezoneX);
            w = QUOTE(0.3 * safezoneW);
            y = QUOTE(0.65 * safezoneH + safezoneY);
            h = QUOTE(0.1 * safezoneH);
            text = QUOTE($STR_MISSION_VERSION);
        };
        class VersionLabelShadow: VersionLabel {
            shadow = 2;
            font = FontM;
        };
    };
    class fasttravel {
        name = "fasttravel";
        duration = 4;
        idd = -1;
        movingEnable = QUOTE(true);
        controls[] = {
            QUOTE(OuterBackground),QUOTE(GenericLabel111)
        };
        class OuterBackground {
            idc = -1;
            type =  QUOTE(CT_STATIC);
            style = ST_LEFT;
            colorText[] = COLOR_BLACK;
            colorBackground[] = COLOR_BLACK;
            font = FontM;
            sizeEx =  QUOTE(0.023);
            x = -3; y = -3;
            w = 9;  h = 9;
            text = "";
        };
        class GenericLabel111 {
            idc = -1;
            type =  QUOTE(CT_STATIC);
            style = ST_CENTER;
            colorText[] = COLOR_WHITE;
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx =  QUOTE(0.03);
            x = 0; y = QUOTE(0.75);
            w = QUOTE(1.0);  h = QUOTE(0.1);
            text = QUOTE($STR_DEPLOY_IN_PROGRESS);
        };
    };
    class KPLIB_overlay {
        name = "KPLIB_overlay";
        duration = 999999;
        idd = 6666;
        movingEnable = QUOTE(true);
        onLoad = "uiNamespace setVariable ['KPLIB_overlay', _this select 0];";
        controls[] = {
            QUOTE(BGPicture),
            QUOTE(PictureFOBShadow), QUOTE(PictureFOB), QUOTE(LabelFOB),
            QUOTE(PictureSuppliesShadow), QUOTE(PictureSupplies), QUOTE(LabelSupplies),
            QUOTE(PictureAmmoShadow), QUOTE(PictureAmmo), QUOTE(LabelAmmo),
            QUOTE(PictureFuelShadow), QUOTE(PictureFuel), QUOTE(LabelFuel),
            QUOTE(PictureCapShadow), QUOTE(PictureCap), QUOTE(LabelCap),
            QUOTE(PictureHeliShadow), QUOTE(PictureHeli), QUOTE(LabelHeli),
            QUOTE(PicturePlaneShadow), QUOTE(PicturePlane), QUOTE(LabelPlane),
            QUOTE(PictureCombatReadinessShadow), QUOTE(PictureCombatReadiness), QUOTE(LabelCombatReadiness),
            QUOTE(PictureCivRepShadow), QUOTE(PictureCivRep), QUOTE(LabelCivRep),
            QUOTE(PictureIntelShadow), QUOTE(PictureIntel), QUOTE(LabelIntel),
            QUOTE(BGPictureActiveSectors), QUOTE(BGPictureSector),
            QUOTE(CaptureFrame_OPFOR), QUOTE(CaptureFrame_BLUFOR), QUOTE(CaptureFrame),
            QUOTE(LabelPoint), QUOTE(CentralShadow), QUOTE(CentralLabel),
            QUOTE(ActiveSectors), QUOTE(AlertBGPicture), QUOTE(AlertLabel), QUOTE(AlertTimer)
        };
        class BGPicture {
            idc = 758001;
            type =  QUOTE(CT_STATIC);
            style = ST_PICTURE;
            colorText[] = {0.8,0.8,0.8,0.9};
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx =  QUOTE(0.5);
            x = QUOTE(0.95 * safezoneW + safezoneX);
            w = QUOTE(0.075 * safezoneW);
            y = QUOTE(0.395 * safezoneH + safezoneY);
            h = QUOTE(0.255 * safezoneH);
            text = "res\gradient.paa";
        };
        class BGPictureSector: BGPicture {
            idc = 201;
            x = QUOTE(0.9 * safezoneW + safezoneX);
            w = QUOTE(0.15 * safezoneW);
            y = QUOTE(0.33 * safezoneH + safezoneY);
            h = QUOTE(0.05 * safezoneH);
        };
        class GenericLabel69 {
            idc = -1;
            type =  QUOTE(CT_STATIC);
            style = ST_RIGHT;
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx =  QUOTE(0.022 * safezoneH);
            x = QUOTE(0.905 * safezoneW + safezoneX);
            w = QUOTE(0.08 * safezoneW);
            y = QUOTE(0.5225 * safezoneH + safezoneY);
            h = QUOTE(0.04 * safezoneH);
            text = "";
            shadow = 2;
        };
        class CentralLabel: GenericLabel69 {
            idc = 266;
            type = CT_STATIC;
            style = ST_CENTER;
            colorText[] = {1,1,0,1};
            sizeEx =  QUOTE(0.03 * safezoneH);
            x = QUOTE(0 * safezoneW + safezoneX);
            w = QUOTE(1 * safezoneW);
            y = QUOTE(0.2 * safezoneH + safezoneY);
            h = QUOTE(0.05 * safezoneH);
            text = "";
        };
        class CentralShadow: CentralLabel {
            idc = 267;
            shadow = 1;
        };
        class GenericPicture69 {
            idc = -1;
            type =  QUOTE(CT_STATIC);
            style = ST_PICTURE;
            colorText[] = {0.9,0.9,0.9,1};
            colorBackground[] = COLOR_NOALPHA;
            font = FontM;
            sizeEx =  QUOTE(0.5);
            x = QUOTE(0.985 * safezoneW + safezoneX);
            w = QUOTE(0.012 * safezoneW);
            h = QUOTE(0.0213333333 * safezoneH);
        };
        class PictureFOB: GenericPicture69 {
            idc = 758002;
            y = QUOTE((0.4 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY);
            text = "\A3\ui_f\data\map\markers\handdrawn\flag_CA.paa";
        };
        class PictureFOBShadow: PictureFOB {
            idc = 758003;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelFOB: GenericLabel69 {
            idc = 758004;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY);
            colorText[] = {0.8, 0.8, 0.8, 1};
        };
        class PictureSupplies: GenericPicture69 {
            idc = 758005;
            y = QUOTE((0.4 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY);
            text = "res\ui_manpo.paa";
        };
        class PictureSuppliesShadow: PictureSupplies {
            idc = 758006;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelSupplies: GenericLabel69 {
            idc = 758007;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY);
            colorText[] = {0, 0.75, 0, 1};
        };
        class PictureAmmo: GenericPicture69 {
            idc = 758008;
            y = QUOTE((0.4 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY);
            text = "res\ui_ammo.paa";
        };
        class PictureAmmoShadow: PictureAmmo {
            idc = 758009;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelAmmo: GenericLabel69 {
            idc = 758010;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY);
            colorText[] = {0.75, 0, 0, 1};
        };
        class PictureFuel: GenericPicture69 {
            idc = 758011;
            y = QUOTE((0.4 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY);
            text = "res\ui_fuel.paa";
        };
        class PictureFuelShadow: PictureFuel {
            idc = 758012;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelFuel: GenericLabel69 {
            idc = 758013;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY);
            colorText[] = {0.75, 0.75, 0, 1};
        };
        class PictureCap: GenericPicture69 {
            idc = 758014;
            y = QUOTE((0.4 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY);
            text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
        };
        class PictureCapShadow: PictureCap {
            idc = 758015;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelCap: GenericLabel69 {
            idc = 758016;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY);
            colorText[] = {0.8, 0.8, 0.8, 1};
        };
        class PictureHeli: GenericPicture69 {
            idc = 758017;
            y = QUOTE((0.4 + ( ICONE_SPACY * 5 ) ) * safezoneH + safezoneY);
            text = "\A3\air_f_beta\Heli_Transport_01\Data\UI\Map_Heli_Transport_01_base_CA.paa";
        };
        class PictureHeliShadow: PictureHeli {
            idc = 758018;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 5 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelHeli: GenericLabel69 {
            idc = 758019;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 5 ) ) * safezoneH + safezoneY);
            colorText[] = {0.8, 0.8, 0.8, 1};
        };
        class PicturePlane: GenericPicture69 {
            idc = 758020;
            y = QUOTE((0.4 + ( ICONE_SPACY * 6 ) ) * safezoneH + safezoneY);
            text = "\A3\Air_F_EPC\Plane_CAS_01\Data\UI\Map_Plane_CAS_01_CA.paa";
        };
        class PicturePlaneShadow: PicturePlane {
            idc = 758021;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 6 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelPlane: GenericLabel69 {
            idc = 758022;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 6 ) ) * safezoneH + safezoneY);
            colorText[] = {0.8, 0.8, 0.8, 1};
        };
        class PictureCombatReadiness: GenericPicture69 {
            idc = 758023;
            y = QUOTE((0.4 + ( ICONE_SPACY * 7 ) ) * safezoneH + safezoneY);
            text = "\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa";
        };
        class PictureCombatReadinessShadow: PictureCombatReadiness {
            idc = 758024;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 7 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelCombatReadiness: GenericLabel69 {
            idc = 758025;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 7 ) ) * safezoneH + safezoneY);
            colorText[] = {0.8, 0.8, 0.8, 1};
        };
        class PictureCivRep: GenericPicture69 {
            idc = 758026;
            y = QUOTE((0.4 + ( ICONE_SPACY * 8 ) ) * safezoneH + safezoneY);
            text = "\A3\ui_f\data\map\mapcontrol\tourism_CA.paa";
        };
        class PictureCivRepShadow: PictureCivRep {
            idc = 758027;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 8 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelCivRep: GenericLabel69 {
            idc = 758028;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 8 ) ) * safezoneH + safezoneY);
            colorText[] = {0.8, 0.8, 0.8, 1};
        };
        class PictureIntel: GenericPicture69 {
            idc = 758029;
            colorText[] = {0,0.45,0.95,1};
            y = QUOTE((0.4 + ( ICONE_SPACY * 9 ) ) * safezoneH + safezoneY);
            text = "\A3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa";
        };
        class PictureIntelShadow: PictureIntel {
            idc = 758030;
            y = QUOTE((0.4 + SHADOW_Y + ( ICONE_SPACY * 9 ) ) * safezoneH + safezoneY);
            x = QUOTE((0.985 + SHADOW_X) * safezoneW + safezoneX);
            colorText[] = {0,0,0,0.7};
        };
        class LabelIntel: GenericLabel69 {
            idc = 758031;
            text = "";
            y = QUOTE((0.39 + ( ICONE_SPACY * 9 ) ) * safezoneH + safezoneY);
            colorText[] = {0, 0.45, 0.95, 1};
        };
        class CaptureFrameStandard {
            idc = -1;
            type =  QUOTE(CT_STATIC);
            font = FontM;
            sizeEx =  QUOTE(0.023);
            text = "";
        };
        class CaptureFrame: CaptureFrameStandard {
            idc = 202;
            style = ST_FRAME;
            colorText[] = COLOR_BLACK;
            colorBackground[] = COLOR_OPFOR_NOALPHA;
            x = QUOTE(0.9125 * safezoneW + safezoneX);
            w = QUOTE(0.085 * safezoneW);
            y = QUOTE(0.358 * safezoneH + safezoneY);
            h = QUOTE(0.012 * safezoneH);
        };
        class CaptureFrame_OPFOR: CaptureFrameStandard{
            idc = 203;
            style = ST_TYPE;
            colorText[] = {0.6, 0, 0, 1};
            colorBackground[] = {0.6, 0, 0, 1};
            x = QUOTE(0.9125 * safezoneW + safezoneX);
            w = QUOTE(0.084 * safezoneW);
            y = QUOTE(0.358 * safezoneH + safezoneY);
            h = QUOTE(0.011 * safezoneH);
        };
        class CaptureFrame_BLUFOR: CaptureFrameStandard{
            idc = 244;
            style = ST_TYPE;
            colorText[] = {0, 0.2, 0.6, 1};
            colorBackground[] = {0, 0.2, 0.6, 1};
            x = QUOTE(0.9125 * safezoneW + safezoneX);
            w = QUOTE(0.084 * safezoneW);
            y = QUOTE(0.358 * safezoneH + safezoneY);
            h = QUOTE(0.011 * safezoneH);
        };
        class LabelPoint: GenericLabel69 {
            idc = 205;
            text = "";
            style = ST_RIGHT;
            sizeEx =  QUOTE(0.024 * safezoneH);
            x = QUOTE(0.8 * safezoneW + safezoneX);
            w = QUOTE(0.2 * safezoneW);
            y = QUOTE(0.33 * safezoneH + safezoneY);
            h = QUOTE(0.03 * safezoneH);
            colorText[] = {0.7, 0, 0, 1};
        };
        class ActiveSectors	{
            idc = 516;
            type = CT_STRUCTURED_TEXT;
            colorBackground[] = COLOR_NOALPHA;
            style = ST_RIGHT;
            x = QUOTE(0.7 * safezoneW + safezoneX);
            w = QUOTE(0.295 * safezoneW);
            y = QUOTE(0.8 * safezoneH + safezoneY);
            h = QUOTE(0.2 * safezoneH);
            text= "";
            size = QUOTE(0.02 * safezoneH);
            sizeEx =  QUOTE(0.02 * safezoneH);
            shadow = 2;
            font = FontM;
            color = "#e0e000";
            align = "right";
            valign = "top";
        };
        class BGPictureActiveSectors: BGPicture {
            idc = 517;
            x = QUOTE(0.93 * safezoneW + safezoneX);
            w = QUOTE(0.1 * safezoneW);
            y = QUOTE(0.8 * safezoneH + safezoneY);
            h = QUOTE(0.2 * safezoneH);
        };
        class AlertBGPicture: BGPicture {
            idc = 401;
            x = QUOTE(0.9 * safezoneW + safezoneX);
            w = QUOTE(0.15 * safezoneW);
            y = QUOTE(0.27 * safezoneH + safezoneY);
            h = QUOTE(0.05 * safezoneH);
        };
        class AlertLabel: GenericLabel69 {
            idc = 402;
            text = "";
            style = ST_CENTER;
            sizeEx =  QUOTE(0.022 * safezoneH);
            x = QUOTE(0.9 * safezoneW + safezoneX);
            w = QUOTE(0.1 * safezoneW);
            y = QUOTE(0.2675 * safezoneH + safezoneY);
            h = QUOTE(0.03 * safezoneH);
            colorText[] = {0.85, 0, 0, 1};
        };
        class AlertTimer: GenericLabel69 {
            idc = 403;
            text = "";
            style = ST_CENTER;
            sizeEx =  QUOTE(0.026 * safezoneH);
            x = QUOTE(0.9 * safezoneW + safezoneX);
            w = QUOTE(0.1 * safezoneW);
            y = QUOTE(0.29 * safezoneH + safezoneY);
            h = QUOTE(0.03 * safezoneH);
            colorText[] = {0.85, 0, 0, 1};
        };
    };
};
