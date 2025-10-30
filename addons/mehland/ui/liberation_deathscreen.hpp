class blackscreen {
  idd = 5651;
  movingEnable = QUOTE(false);
  controls[]= {
    "OuterBackground", "Skull", "GREUH_WoundedLabel"
  };
  class OuterBackground {
    idc = -1;
    type =  QUOTE(CT_STATIC);
    style = ST_LEFT;
    colorText[] = COLOR_BLACK;
    colorBackground[] = COLOR_BLACK;
    font = FontM;
    sizeEx =  QUOTE(0.023);
    x = QUOTE(-3); y = QUOTE(-3);
    w = QUOTE(9);  h = QUOTE(9);
    text = "";
  };
  class Skull {
        idc = 666;
        type =  QUOTE(CT_STATIC);
        style = ST_PICTURE;
        colorText[] = { 1,1,1,0.15 };
        colorBackground[] = COLOR_NOALPHA;
        font = FontM;
        sizeEx =  QUOTE(0.1 * safezoneH);
        x = QUOTE(0.3 * safezoneW + safezoneX);
        w = QUOTE(0.4 * safezoneW);
        y = QUOTE(0.2 * safezoneH + safezoneY);
        h = QUOTE(0.6 * safezoneH);
        text = "res\skull.paa";
      };
   class GREUH_WoundedLabel {
    idc = 4867;
    type =  QUOTE(CT_STATIC);
    style = ST_CENTER;
    colorText[] = COLOR_WHITE;
    colorBackground[] = COLOR_NOALPHA;
    font = FontM;
    sizeEx =  QUOTE(0.07 * safezoneH);
    shadow = 1;
    x = QUOTE(0.3 * safezoneW + safezoneX); 
    y = QUOTE(0.25 * safezoneH + safezoneY);
    w = QUOTE(0.4 * safezoneW); h = QUOTE(0.07 * safezoneH);
    text = QUOTE($STR_REVIVE_LABEL);
  };
};
