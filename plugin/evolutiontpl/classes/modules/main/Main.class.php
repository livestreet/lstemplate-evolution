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

class PluginEvolutiontpl_ModuleMain extends Module {
	protected $oMapper;

	public function Init() {		
		$this->oMapper=Engine::GetMapper(__CLASS__);
		$this->oUserCurrent=$this->User_GetUserCurrent();
	}

	public function GetTopicsByTag($aTags,$aExcludeTopic,$iLimit,$bAddAccessible=true) {
		$aCloseBlogs = ($this->oUserCurrent && $bAddAccessible)
			? $this->Blog_GetInaccessibleBlogsByUser($this->oUserCurrent)
			: $this->Blog_GetInaccessibleBlogsByUser();

		$aRes=$this->oMapper->GetTopicsByTag($aTags,$aCloseBlogs,$aExcludeTopic,$iLimit);
		return $this->Topic_GetTopicsAdditionalData($aRes);
	}

	public function GetTopicsByBlogId($iBlogId,$aTopicIdNot,$iPage,$iPerPage) {
		$aFilter=array(
			'blog_type' => array(
				'personal',
				'open'
			),
			'blog_id' => $iBlogId,
			'topic_publish' => 1,
			'topic_id_not' => $aTopicIdNot,
		);

		/**
		 * Если пользователь авторизирован, то добавляем в выдачу
		 * закрытые блоги в которых он состоит
		 */
		if($this->oUserCurrent) {
			$aOpenBlogs = $this->Blog_GetAccessibleBlogsByUser($this->oUserCurrent);
			if(count($aOpenBlogs)) $aFilter['blog_type']['close'] = $aOpenBlogs;
		}
		return $this->Topic_GetTopicsByFilter($aFilter,$iPage,$iPerPage);
	}



}
?>