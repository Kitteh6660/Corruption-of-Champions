package classes.Perks
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.GlobalFlags.kGAMECLASS;
	import classes.StatusEffects;

	public class EnlightenedPerk extends PerkType
	{

		override public function desc(params:PerkClass = null):String
		{
			if (player.hasStatusEffect(StatusEffects.PerksDisabled)) {
				return "DISABLED! Your perks are currently disabled and have no effect!";
			}
			if (player.cor >= (10 + player.corruptionTolerance())) return "<b>DISABLED</b> - Corruption too high!";
			else return super.desc(params);
		}

		public function EnlightenedPerk()
		{
			super("Enlightened", "Enlightened", "Jojo’s tutelage has given you a master’s focus and you can feel the universe in all its glory spread out before you. You’ve finally surpassed your teacher.");
		}
	}
}
