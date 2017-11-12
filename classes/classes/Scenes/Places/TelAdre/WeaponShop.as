package classes.Scenes.Places.TelAdre {
import classes.GlobalFlags.kFLAGS;
import classes.display.SpriteDb;

public class WeaponShop extends Shop {
    public function WeaponShop() {
	    super("WeaponShop",SpriteDb.s_weaponsmith);
    }
	
    override protected function inside():void {
        super.inside();
        addButton(0, consumables.W_STICK.shortName, confirmBuy, consumables.W_STICK);
        addButton(1, weapons.CLAYMOR.shortName, confirmBuy, weapons.CLAYMOR);
        addButton(2, weapons.WARHAMR.shortName, confirmBuy, weapons.WARHAMR);
        addButton(3, weapons.KATANA.shortName, confirmBuy, weapons.KATANA);
        addButton(4, weapons.SPEAR.shortName, confirmBuy, weapons.SPEAR);
        addButton(5, weapons.WHIP.shortName, confirmBuy, weapons.WHIP);
        addButton(6, weapons.W_STAFF.shortName, confirmBuy, weapons.W_STAFF);
        addButton(7, weapons.S_GAUNT.shortName, confirmBuy, weapons.S_GAUNT);
        addButton(8, weapons.DAGGER.shortName, confirmBuy, weapons.DAGGER);
        addButton(9, weapons.SCIMITR.shortName, confirmBuy, weapons.SCIMITR);
        addButton(10, weapons.MACE.shortName, confirmBuy, weapons.MACE);
        addButton(11, weapons.FLAIL.shortName, confirmBuy, weapons.FLAIL);
		if (player.hasKeyItem("Sheila's Lethicite") >= 0 || flags[kFLAGS.SHEILA_LETHICITE_FORGE_DAY] > 0) {
			addButton(13, "ScarBlade", forgeScarredBlade);
		}
        if (player.hasKeyItem("Sheila's Lethicite") >= 0 || flags[kFLAGS.SHEILA_LETHICITE_FORGE_DAY] > 0) {
            addButton(13, "ScarBlade", forgeScarredBlade);
        }
        addButton(14, "Leave", telAdre.telAdreMenu);
    }

    private function forgeScarredBlade():void {
        clearOutput();
        doNext(inside);
        if (player.hasKeyItem("Sheila's Lethicite") >= 0) {
            //remove Sheila's Lethicite key item, set sheilacite = 3, start sheilaforge timer, increment once per day at 0:00
            display("scarredBlade/start");
            flags[kFLAGS.SHEILA_LETHICITE_FORGE_DAY] = model.time.days;
            player.removeKeyItem("Sheila's Lethicite");
        }
        else if (model.time.days - flags[kFLAGS.SHEILA_LETHICITE_FORGE_DAY] < 14) {
            display("scarredBlade/middle");
        }
        else if (model.time.days - flags[kFLAGS.SHEILA_LETHICITE_FORGE_DAY] >= 14) {
            display("scarredBlade/end");
            inventory.takeItem(weapons.SCARBLD, finishTakingScarredBlade, inside);
        }
        output.flush();
        function finishTakingScarredBlade():void {
            flags[kFLAGS.SHEILA_LETHICITE_FORGE_DAY] = -1;
            inside();
        }
    }
}
}
