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

class PluginEvolutiontpl_ModuleMain_MapperMain extends Mapper {

	public function GetTopicsByTag($aTags,$aExcludeBlog,$aExcludeTopic,$iLimit) {
		if (!is_array($aTags)) {
			$aTags=array($aTags);
		}
		if (!is_array($aExcludeTopic)) {
			$aExcludeTopic=array($aExcludeTopic);
		}
		$sql = "
							SELECT
								topic_id
							FROM
								".Config::Get('db.table.topic_tag')."
							WHERE
								topic_tag_text IN (?a)
								{ AND blog_id NOT IN (?a) }
								{ AND topic_id NOT IN (?a) }
                            ORDER BY topic_id DESC
                            LIMIT 0, ?d ";

		$aTopics=array();
		if ($aRows=$this->oDb->select(
			$sql,$aTags,
			(is_array($aExcludeBlog)&&count($aExcludeBlog)) ? $aExcludeBlog : DBSIMPLE_SKIP,
			(is_array($aExcludeTopic)&&count($aExcludeTopic)) ? $aExcludeTopic : DBSIMPLE_SKIP,
			$iLimit
		)
		) {
			foreach ($aRows as $aTopic) {
				$aTopics[]=$aTopic['topic_id'];
			}
		}
		return $aTopics;
	}

}
?>