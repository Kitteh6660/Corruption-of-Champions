package classes.Scenes.Places.TelAdre {
import classes.Scenes.Inventory;

/**
 * Updated strings
 * @ContentAuthor Starglider
 */
public class JewelryShop extends Shop {
	private static var firstEntry:Boolean = true;

    public function JewelryShop() {
	    super("JewelryShop");
        localvars.enter = {firstEntry:firstEntry};
        firstEntry=false;
    }

    protected override function inside():void {
        super.inside();
        addButton(0, "Normal rings", normalRings);
        addButton(1, "Special rings", specialRings);
        addButton(2, "Enchanted rings",enchantedRings);
        addButton(5, "Jewelry box",curry(confirmBuy, null, 500, Inventory.STORAGE_JEWELRY_BOX));
        addButton(14, "Leave", telAdre.telAdreMenu);
    }
    private function normalRings():void {
        clearOutput();
        display("normalRings");
        menu();
        var button:int = 0;
        addButton(button++, jewelries.SILVRNG.shortName, confirmBuy, jewelries.SILVRNG);
        addButton(button++, jewelries.GOLDRNG.shortName, confirmBuy, jewelries.GOLDRNG);
        addButton(button++, jewelries.PLATRNG.shortName, confirmBuy, jewelries.PLATRNG);
        addButton(button++, jewelries.DIAMRNG.shortName, confirmBuy, jewelries.DIAMRNG);
        addButton(14, "Back", inside);
    }
    private function specialRings():void {
        clearOutput();
        display("specialRings");
        menu();
        var button:int = 0;
        addButton(button++, jewelries.LTHCRNG.shortName, confirmBuy, jewelries.LTHCRNG);
        addButton(button++, jewelries.PURERNG.shortName, confirmBuy, jewelries.PURERNG);
        addButton(14, "Back", inside);
    }
    private function enchantedRings():void{
        clearOutput();
        display("enchantedRings");
        menu();
	    addButton(0, "Tier 1 rings", tieredRings, 1);
	
	    if (player.level >= 10 || model.time.days >= 100) {
		    addButton(1, "Tier 2 rings", tieredRings,2);
	    }
	
	    if (player.level >= 20 || model.time.days >= 200) {
		    addButton(2, "Tier 3 rings", tieredRings,3);
	    }
	
	    addButton(14,"Back",inside);
    }
	private function tieredRings(tier:int):void{
		menu();
		var button:int = 0;
		addButton(button++, jewelries["CRIMRN"+tier].shortName, confirmBuy, jewelries["CRIMRN"+tier]);
		addButton(button++, jewelries["FERTRN"+tier].shortName, confirmBuy, jewelries["FERTRN"+tier]);
		addButton(button++, jewelries["ICE_RN"+tier].shortName, confirmBuy, jewelries["ICE_RN"+tier]);
		addButton(button++, jewelries["CRITRN"+tier].shortName, confirmBuy, jewelries["CRITRN"+tier]);
		addButton(button++, jewelries["REGNRN"+tier].shortName, confirmBuy, jewelries["REGNRN"+tier]);
		addButton(button++, jewelries["LIFERN"+tier].shortName, confirmBuy, jewelries["LIFERN"+tier]);
		addButton(button++, jewelries["MYSTRN"+tier].shortName, confirmBuy, jewelries["MYSTRN"+tier]);
		addButton(button++, jewelries["POWRRN"+tier].shortName, confirmBuy, jewelries["POWRRN"+tier]);
		addButton(14, "Back", enchantedRings);
		
	}
}
}
