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

class PluginEvolutiontpl_HookEvolution extends Hook {

    public function RegisterHook() {
		$this->AddHook('topic_show','TopicShow');
	}


	/**
	 * Увеличиваем число просмотра топиков при его открытии
	 */
    public function TopicShow($aParams) {
    	$oTopic=$aParams['oTopic'];
    	$oTopic->setCountRead($oTopic->getCountRead()+1);
    	$this->Topic_UpdateTopic($oTopic);
    }



}
?>