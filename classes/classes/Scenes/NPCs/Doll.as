package classes.Scenes.NPCs
{
	import classes.*;
	import classes.internals.WeightedDrop;
	import classes.GlobalFlags.kFLAGS;
	
	public class Doll extends Monster
	{
		
		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void {
			if (statusEffectv1(StatusEffects.Uber) == 2) {
				player.str += 5;
			}
			game.dollScene.hypnotism();
		}
		
		override public function defeated(hpVictory:Boolean):void {
			if (statusEffectv1(StatusEffects.Uber) == 2) {
				player.str += 5;
			}
			game.dollScene.victory();
		}
		
		
		private function anticipateLust():void {
			if (findStatusEffect(StatusEffects.Uber) < 0) {
				createStatusEffect(StatusEffects.Uber, 1, 0, 0, 0);
				outputText("A pink glow surrounds the doll, turning you on slightly.");
				game.dynStats("lus", (7 + rand(player.sens / 5)));
			}
			else {
				if (flags[kFLAGS.IN_COMBAT_USE_PLAYER_TEASED_FLAG]) {
					outputText("Your actions disrupt the doll's aura, protecting you from its effects!");
				}
				else {
					outputText("Your actions allow a chance for the doll's aura to seep into you, causing your lust to skyrocket!");
					game.dynStats("lus", (35 + rand(player.sens / 5)));
				}
				removeStatusEffect(StatusEffects.Uber);
				outputText("\n\n");
				performCombatAction();
			}
			
			combatRoundOver();
		}
		
		private function anticipateAttack():void {
			if (findStatusEffect(StatusEffects.Uber) < 0) {
				createStatusEffect(StatusEffects.Uber, 2, 0, 0, 0);
				outputText("A deep red glow surrounds the doll, filling you with a sense of dread.");
				player.str -= 5;
			}
			else {
				if (!flags[kFLAGS.IN_COMBAT_USE_PLAYER_TEASED_FLAG] && !flags[kFLAGS.IN_COMBAT_USE_PLAYER_WAITED_FLAG]) {
					outputText("Your actions disrupt the doll's aura, protecting you from its effects!");
				}
				else {
					outputText("Your actions allow a chance for the doll's aura to seep into you, causing your lust to skyrocket!");
					game.dynStats("lus", (35 + rand(player.sens / 5)));
				}
				player.str += 5;
				removeStatusEffect(StatusEffects.Uber);
				outputText("\n\n");
				performCombatAction();
			}
			
			combatRoundOver();
		}
		
		private function anticipateWait():void {
			if (findStatusEffect(StatusEffects.Uber) < 0) {
				createStatusEffect(StatusEffects.Uber, 3, 0, 0, 0);
				outputText("A white glow surrounds the doll, but it doesn't seem to do anything.");
			}
			else {
				if (flags[kFLAGS.IN_COMBAT_USE_PLAYER_WAITED_FLAG]) {
					outputText("Your actions disrupt the doll's aura, protecting you from its effects!");
				}
				else {
					outputText("Your actions allow a chance for the doll's aura to seep into you, causing your lust to skyrocket!");
					game.dynStats("lus", (35 + rand(player.sens / 5)));
				}
				removeStatusEffect(StatusEffects.Uber);
				outputText("\n\n");
				performCombatAction();
			}
			
			combatRoundOver();
		}
		
		override protected function performCombatAction():void
		{
			// Planned
			if (statusEffectv1(StatusEffects.Uber) == 1) {
				anticipateLust();
				return;
			}
			if (statusEffectv1(StatusEffects.Uber) == 2) {
				anticipateAttack();
				return;
			}
			if (statusEffectv1(StatusEffects.Uber) == 3) {
				anticipateWait();
				return;
			}
			
			// Random
			var choice:int = rand(3);
			
			if (choice == 0) {
				anticipateLust();
				return;
			}
			if (choice == 1) {
				anticipateAttack();
				return;
			}
			if (choice == 2) {
				anticipateWait();
				return;
			}
		}
		
		public function Doll()
		{
			this.a = "a ";
			this.short = "doll";
			this.long = "This life-sized doll has a female appearance, and seems quite attached to you - or you to it? You simply can't let go. It exudes a constantly-changing aura. You probably shouldn't let it persist for too long.";
			
			this.createVagina(false, VAGINA_WETNESS_DRY, VAGINA_LOOSENESS_LOOSE);
			createBreastRow(2);
			this.ass.analLooseness = ANAL_LOOSENESS_LOOSE;
			this.ass.analWetness = ANAL_WETNESS_DRY;
			this.tallness = rand(2) + 36;
			this.hipRating = HIP_RATING_AMPLE;
			this.buttRating = BUTT_RATING_AVERAGE;
			this.pronoun1 = "it";
			this.pronoun2 = "it";
			this.pronoun3 = "its";
			initStrTouSpeInte(0, 70, 0, 80);
			initLibSensCor(60, 45, 50);
			this.armorName = "soft fabric";
			this.armorDef = 3;
			this.weaponName = "unlimited cock works";
			this.weaponVerb = "unlimited working cocks";
			this.lust = 10;
			this.lustVuln = 0.60;
			this.level = 4;
			this.gems = rand(5) + 2;
			this.drop = new WeightedDrop().
					add(consumables.HAPPLE,4);
			checkMonster();
		}
		
	}

}