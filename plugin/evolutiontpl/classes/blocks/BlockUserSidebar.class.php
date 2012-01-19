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


class PluginEvolutiontpl_BlockUserSidebar extends Block {
	public function Exec() {
		$oSmarty=$this->Viewer_GetSmartyObject();
		$oUserProfile=$oSmarty->getTemplateVars('oUserProfile');
		if ($oUserProfile) {
			$aEvents=$this->Stream_ReadStreamByUserId($oUserProfile->getId(),Config::Get('plugin.evolutiontpl.stream_count'));

			$this->Viewer_Assign('evolution_aStreamEvents',$aEvents);
		}

	}
}
?>