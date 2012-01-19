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

/**
 * Класс обработки ajax запросов
 *
 */
class PluginEvolutiontpl_ActionAjax extends PluginEvolutiontpl_Inherit_ActionAjax {

	protected function RegisterEvent() {
		parent::RegisterEvent();

		$this->AddEventPreg('/^people/i','/^top/','EventPeopleTop');
		$this->AddEventPreg('/^people/i','/^online/','EventPeopleOnline');
		$this->AddEventPreg('/^people/i','/^new/','EventPeopleNew');
		$this->AddEventPreg('/^people/i','/^friends/','EventPeopleFriends');

		$this->AddEventPreg('/^top/i','/^week/','EventTopWeek');
		$this->AddEventPreg('/^top/i','/^month/','EventTopMonth');
		$this->AddEventPreg('/^top/i','/^all/','EventTopAll');

		$this->AddEventPreg('/^similar/i','/^more/','EventSimilarMore');
		$this->AddEventPreg('/^similar/i','/^like/','EventSimilarLike');
	}

	public function EventPeopleTop() {
		$aResult=$this->User_GetUsersRating('good',1,Config::Get('plugin.evolutiontpl.people_count'));
		$aUsersRating=$aResult['collection'];
		if ($aUsersRating) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aUsers',$aUsersRating);
			$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__)."block.people_items.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		} else {
			$this->Message_AddErrorSingle($this->Lang_Get('system_error'),$this->Lang_Get('error'));
			return;
		}
	}

	public function EventPeopleOnline() {
		$aUsers=$this->User_GetUsersByDateLast(Config::Get('plugin.evolutiontpl.people_count'));
		if ($aUsers) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aUsers',$aUsers);
			$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__)."block.people_items.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		} else {
			$this->Message_AddErrorSingle($this->Lang_Get('system_error'),$this->Lang_Get('error'));
			return;
		}
	}

	public function EventPeopleNew() {
		$aUsers=$this->User_GetUsersByDateRegister(Config::Get('plugin.evolutiontpl.people_count'));
		if ($aUsers) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aUsers',$aUsers);
			$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__)."block.people_items.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		} else {
			$this->Message_AddErrorSingle($this->Lang_Get('system_error'),$this->Lang_Get('error'));
			return;
		}
	}

	public function EventPeopleFriends() {
		if (!$this->oUserCurrent) {
			return;
		}
		$aUsers=$this->User_GetUsersFriend($this->oUserCurrent->getId());
		if ($aUsers) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aUsers',$aUsers);
			$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__)."block.people_items.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		}
	}

	public function EventTopWeek() {
		$this->LoadTopTopicsByPeriod(60*60*24*7);
	}

	public function EventTopMonth() {
		$this->LoadTopTopicsByPeriod(60*60*24*30);
	}

	public function EventTopAll() {
		$this->LoadTopTopicsByPeriod(60*60*24*350*100);
	}

	protected function LoadTopTopicsByPeriod($iTime) {
		$sDate=date("Y-m-d H:00:00",time()-$iTime);
		$aTopics=$this->Topic_GetTopicsRatingByDate($sDate,Config::Get('plugin.evolutiontpl.top_count'));
		if ($aTopics) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aTopics',$aTopics);
			$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__)."block.top_items.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		}
	}


	public function EventSimilarLike() {
		$iTopicId=getRequest('iTopicIdForSimilar');
		if (!($oTopic=$this->Topic_GetTopicById($iTopicId))) {
			return;
		}

		$sTags=$oTopic->getTags();
		$aTags=explode(',',$sTags);
		$aTags=array_map('trim',$aTags);

		$aTopics=$this->PluginEvolutiontpl_Main_GetTopicsByTag($aTags,array($oTopic->getId()),Config::Get('plugin.evolutiontpl.similar_count'));
		if ($aTopics) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aTopics',$aTopics);
			$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__)."block.similar_items.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		}
	}

	public function EventSimilarMore() {
		$iTopicId=getRequest('iTopicIdForSimilar');
		if (!($oTopic=$this->Topic_GetTopicById($iTopicId))) {
			return;
		}

		$aResult=$this->PluginEvolutiontpl_Main_GetTopicsByBlogId($oTopic->getBlogId(),array($oTopic->getId()),1,Config::Get('plugin.evolutiontpl.similar_count'));

		$aTopics=$aResult['collection'];
		if ($aTopics) {
			$oViewer=$this->Viewer_GetLocalViewer();
			$oViewer->Assign('aTopics',$aTopics);
			$sTextResult=$oViewer->Fetch(Plugin::GetTemplatePath(__CLASS__)."block.similar_items.tpl");
			$this->Viewer_AssignAjax('sText',$sTextResult);
		}
	}

}
?>