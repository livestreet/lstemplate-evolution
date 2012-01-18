<?php
/*-------------------------------------------------------
*
*   LiveStreet Engine Social Networking
*   Copyright © 2008 Mzhelskiy Maxim
*
*--------------------------------------------------------
*
*   Official site: www.livestreet.ru
*   Contact e-mail: rus.engine@gmail.com
*
*   GNU General Public License, version 2:
*   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
*
---------------------------------------------------------
*/


class PluginEvolutiontpl_BlockPeople extends Block {
	public function Exec() {
		$aResult=$this->User_GetUsersRating('good',1,Config::Get('plugin.evolutiontpl.people_count'));
		$aUsersRating=$aResult['collection'];
		if ($aUsersRating) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aUsers',$aUsersRating);
			$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__)."block.people_items.tpl");
			$this->Viewer_Assign('evolution_sPeopleTop',$sTextResult);
		}
	}
}
?>