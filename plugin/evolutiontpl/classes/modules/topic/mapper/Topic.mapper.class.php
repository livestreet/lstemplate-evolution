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



class PluginEvolutiontpl_ModuleTopic_MapperTopic extends PluginEvolutiontpl_Inherit_ModuleTopic_MapperTopic {

	protected function buildFilter($aFilter) {
		$sWhere=parent::buildFilter($aFilter);

		if (isset($aFilter['topic_id_not'])) {
			if(!is_array($aFilter['topic_id_not'])) {
				$aFilter['topic_id_not']=array($aFilter['topic_id_not']);
			}
			if (count($aFilter['topic_id_not'])) {
				$sWhere.=" AND t.topic_id NOT IN ('".join("','",$aFilter['topic_id_not'])."')";
			}
		}
		return $sWhere;
	}

}
?>