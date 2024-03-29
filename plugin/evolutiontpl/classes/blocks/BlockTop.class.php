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


class PluginEvolutiontpl_BlockTop extends Block {
	public function Exec() {
		$sDate=date("Y-m-d H:00:00",time()-60*60*24*7);
		$aTopics=$this->Topic_GetTopicsRatingByDate($sDate,Config::Get('plugin.evolutiontpl.top_count'));
		if ($aTopics) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aTopics',$aTopics);
			$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__)."block.top_items.tpl");
			$this->Viewer_Assign('evolution_sTopWeek',$sTextResult);
		}
	}
}
?>