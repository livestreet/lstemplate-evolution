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



class PluginEvolutiontpl_ModuleBlog_EntityBlog extends PluginEvolutiontpl_Inherit_ModuleBlog_EntityBlog {

	public function getVoteForce() {
		if ($oUserCurrent=$this->User_GetUserCurrent()) {
			return $this->Vote_GetVote($this->getId(),'blog',$oUserCurrent->getId());
		}
		return null;
	}

}
?>