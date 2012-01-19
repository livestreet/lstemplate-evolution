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



class PluginEvolutiontpl_ModuleStream extends PluginEvolutiontpl_Inherit_ModuleStream {


	/**
	 * Чтение активности конкретного пользователя
	 *
	 * @param unknown_type $iCount
	 * @param unknown_type $iUserId
	 * @return unknown
	 */
	public function ReadStreamByUserId($iUserId,$iCount=null) {
		if (!$iCount) $iCount = Config::Get('module.stream.count_default');

		/**
		 * Получаем типы событий
		 */
		$aEventTypes=$this->getEventTypes();
		$aEventTypes=array_keys($aEventTypes);
		if (Config::Get('module.stream.disable_vote_events')) {
			foreach ($aEventTypes as $i => $sType) {
				if (substr($sType, 0, 4) == 'vote') {
					unset ($aEventTypes[$i]);
				}
			}
		}
		if (!count($aEventTypes)) return array();
		/**
		 * Получаем список тех на кого подписан
		 */
		$aUsersList = array($iUserId);
		/**
		 * Получаем список событий
		 */
		$aEvents = $this->oMapper->Read($aEventTypes, $aUsersList, $iCount, null);
		/**
		 * Составляем список объектов для загрузки
		 */
		$aNeedObjects=array();
		foreach ($aEvents as $oEvent) {
			if (isset($this->aEventTypes[$oEvent->getEventType()]['related'])) {
				$aNeedObjects[$this->aEventTypes[$oEvent->getEventType()]['related']][]=$oEvent->getTargetId();
			}
			$aNeedObjects['user'][]=$oEvent->getUserId();
		}
		/**
		 * Получаем объекты
		 */
		$aObjects=array();
		foreach ($aNeedObjects as $sType => $aListId) {
			if (count($aListId)) {
				$aListId=array_unique($aListId);
				$sMethod = 'loadRelated' . ucfirst($sType);
				if (method_exists($this, $sMethod)) {
					if ($aRes=$this->$sMethod($aListId)) {
						foreach ($aRes as $oObject) {
							$aObjects[$sType][$oObject->getId()]=$oObject;
						}
					}
				}
			}
		}
		/**
		 * Формируем результирующий поток
		 */
		foreach ($aEvents as $key => $oEvent) {
			/**
			 * Жестко вытаскиваем автора события
			 */
			if (isset($aObjects['user'][$oEvent->getUserId()])) {
				$oEvent->setUser($aObjects['user'][$oEvent->getUserId()]);
				/**
				 * Аттачим объекты
				 */
				if (isset($this->aEventTypes[$oEvent->getEventType()]['related'])) {
					$sTypeObject=$this->aEventTypes[$oEvent->getEventType()]['related'];
					if (isset($aObjects[$sTypeObject][$oEvent->getTargetId()])) {
						$oEvent->setTarget($aObjects[$sTypeObject][$oEvent->getTargetId()]);
					} else {
						unset($aEvents[$key]);
					}
				} else {
					unset($aEvents[$key]);
				}
			} else {
				unset($aEvents[$key]);
			}
		}
		return $aEvents;
	}

}
?>