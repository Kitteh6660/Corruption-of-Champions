package classes.Scenes.Places.TelAdre {
import classes.GlobalFlags.kGAMECLASS;
import classes.ItemType;

import coc.xxc.BoundStory;

public class Shop extends TelAdreAbstractContent {
	//TODO rename Shop to AbstractShop? Because thats what it is.
	protected var sprite:Object = -1;
    protected var story:BoundStory;
    protected var localvars:Object = {};
    private static var _baseStory:BoundStory;
    protected function get baseStory():BoundStory{
        if(!_baseStory){
            _baseStory = kGAMECLASS.rootStory.locate("teladreshops").bind(kGAMECLASS.context);
        }
        return _baseStory;
    }
	
	/**
     * An XXC based shop.
     *
	 * @param storyName the name of the lib inside teladreshops.xml which contains the the shop's text
	 * @param spriteObj the sprite to display for this shop. Defaults to none.
	 */
    public function Shop(storyName:String="",spriteObj:Object=-1){
        if(storyName !== ""){story = baseStory.locate(storyName);}
        sprite = spriteObj;
    }
    
	/**
     * This method is called when the player enters the shop.
     * Requires a text named 'enter' in the shop lib, otherwise goes directly to inide
	 */
	public function enter():void {
        clearOutput();
        menu();
        spriteSelect(sprite);
        if(display("enter",localvars.enter)){
            doNext(inside);
            return;
        }
        inside();
    }
	
	/**
     * This method is where the actual shop menu is displayed.
     * Note: The subclass should currently override to add menu buttons
	 */
	protected function inside():void {
        clearOutput();
        menu();
        display("inside",localvars.inside);
        doNext(telAdre.telAdreMenu);
    }

    protected function debit(itype:ItemType = null, priceOverride:int = -1, keyItem:String = ""):void {
        clearOutput();
        menu();
        if(localvars.debit == undefined){localvars.debit = {};}
        localvars.debit.itype = itype;
        localvars.debit.priceOverride = priceOverride;
        localvars.debit.keyItem = keyItem;
        display("debit",localvars.debit);player.gems -= priceOverride >= 0 ? priceOverride : itype.value;
        statScreenRefresh();
        if (keyItem !== "") {
            player.createKeyItem(keyItem, 0, 0, 0, 0);
            doNext(inside);
        } else {
            inventory.takeItem(itype, inside);
        }
    }

    protected function confirmBuy(itype:ItemType = null, priceOverride:int = -1, keyItem:String = ""):void {
        clearOutput();
        menu();
        if(keyItem !== "" && player.hasKeyItem(keyItem)>=0){
            var i:int = keyItem.indexOf("-");
            if(i>=0){keyItem = keyItem.substr(i+2);}
            keyItem=keyItem.toLowerCase();
            outputText("<b>You already own a "+keyItem+"!</b>");
            doNext(inside);
            return;
        }

        if(localvars.confirmBuy == undefined){localvars.confirmBuy = {};}
        localvars.confirmBuy.itype = itype;
        localvars.confirmBuy.keyItem = keyItem;
        localvars.confirmBuy.priceOverride = priceOverride;
        display("confirmBuy",localvars.confirmBuy);if (player.gems < priceOverride || (itype &&player.gems < itype.value)) {
            outputText("\n\nYou count out your gems and realize it's beyond your price range.");
            //Goto shop main menu
            doNext(inside);
            return;
        } else {
            outputText("\n\nDo you buy it?\n\n");
        }
        doYesNo(curry(debit, itype, priceOverride, keyItem), curry(noBuyOption, itype, keyItem));
    }

    protected function noBuyOption(itype:ItemType = null, keyItem:String = ""):void {
        if(localvars.noBuyOption == undefined){localvars.noBuyOption = {};}
        localvars.noBuyOption.itype = itype;
        localvars.noBuyOption.keyItem = keyItem;
        if(display("noBuyOption",localvars.noBuyOption)){doNext(inside);}
        else inside();
    }
    protected function display(ref:String,locals:Object=null):Boolean{
        if(!story) return false;
        try {
            story.display(ref,locals);
            return true;
        } catch (e:Error){
            trace(e.message + " with locals "+locals);
        }
        return false;
    }
}
}
