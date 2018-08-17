///Button Action
event_inherited();

if (executeAction)
{
    //Action executed by Plus and Minus buttons
}

if (myVariable == lang_english) {   global.language = lang_english;     myValueString = "EN";   }
if (myVariable == lang_ptbr)    {   global.language = lang_ptbr;        myValueString = "PT";   }
if (myVariable == lang_huebr)   {   global.language = lang_huebr;       myValueString = "HUE";  }
if (myVariable == lang_russian) {   global.language = lang_russian;     myValueString = "RU";   }
if (myVariable == lang_japanese){   global.language = lang_japanese;    myValueString = "JP";   }
if (myVariable == lang_german)  {     global.language = lang_german;    myValueString = "DE";   }
if (myVariable == lang_french)  {     global.language = lang_french;    myValueString = "FR";   }
if (myVariable == lang_spanish)  {     global.language = lang_spanish;    myValueString = "ES";   }
if (myVariable == lang_czech)  {     global.language = lang_czech;    myValueString = "CZ";   }
if (myVariable == lang_korean)  {     global.language = lang_korean;    myValueString = "KR";   }
if (myVariable == lang_dutch)  {     global.language = lang_dutch;    myValueString = "DU";   }
if (myVariable == lang_italian)  {     global.language = lang_italian;    myValueString = "IT";   }
if (myVariable == lang_chineseTr)  {     global.language = lang_chineseTr;    myValueString = "CHT";   }
if (myVariable == lang_chineseSp)  {     global.language = lang_chineseSp;    myValueString = "CHS";   }



if (arrowClicked)
{
    arrowClicked = false;
    loc_init();
    with (class_menu_button)
    {
        oldHorizontal = selectionOrderHorizontal;
        oldVertical = selectionOrderVertical;
        oldGridX = buttonGridX;
        oldGridY = buttonGridY;
        
        event_perform(ev_create,0);
        
        selectionOrderVertical = oldVertical;
        selectionOrderHorizontal = oldHorizontal;
        buttonGridX = oldGridX;
        buttonGridY = oldGridY;
    }
}

