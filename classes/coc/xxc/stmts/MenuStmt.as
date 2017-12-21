/**
 * Coded by aimozg on 06.12.2017.
 */
package coc.xxc.stmts {
import classes.internals.Utils;

import coc.script.Eval;
import coc.xlogic.ExecContext;
import coc.xlogic.StmtList;
import coc.xxc.StoryContext;

public class MenuStmt extends StmtList{
	
	public var backfn:Eval;
	public var backref:String;
	public function MenuStmt() {
	}
	private function onclickback(context:StoryContext):void {
		if (this.backfn) {
			this.backfn.vcall(context.scopes);
		} else if (this.backref) {
			context.display(backref);
		}
	}
	override public function execute(context:ExecContext):void {
		var ctx:StoryContext = (context as StoryContext);
		ctx.game.menu();
		ctx.currentButtons.clear();
		super.execute(context);
		ctx.game.submenu(
				ctx.currentButtons,
				(backfn || backref) ? Utils.curry(onclickback,ctx.clone()) : null
		);
	}
}
}
