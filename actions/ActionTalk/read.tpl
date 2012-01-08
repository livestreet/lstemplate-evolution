{include file='header.tpl' menu='talk' showUpdateButton=true}

{assign var="oUser" value=$oTalk->getUser()}


<div class="topic"style="margin-bottom:30px;">
	<h3 class="title">{$oTalk->getTitle()|escape:'html'}</h3>

    <div class="info-top">
        <li>{date_format date=$oTalk->getDateAdd()} \</li>
        <li><a href="{router page='talk'}delete/{$oTalk->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" onclick="return confirm('{$aLang.talk_inbox_delete_confirm}');" class="delete">{$aLang.talk_inbox_delete}</a></li>
	</div>

	<div class="content">
		{$oTalk->getText()}
	</div>

	<ul class="info">
		<li class="avatar"><a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="avatar" title="{$oUser->getLogin()}" /></a></li>
		<li class="username"><span class="userrating {if $oUser->getRating()<0}minus{else}plus{/if}">{if $oUser->getRating()<0}-{else}+{/if}{$oUser->getRating()}</span>&nbsp;&nbsp;<a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
		<li><a href="#" onclick="return ls.favourite.toggle({$oTalk->getId()},this,'talk');" class="favourite {if $oTalk->getIsFavourite()}active{/if}"></a></li>
	</ul>
</div>

{assign var="oTalkUser" value=$oTalk->getTalkUser()}

{if !$bNoComments}
{include
	file='comment_tree.tpl'
	iTargetId=$oTalk->getId()
	sTargetType='talk'
	iCountComment=$oTalk->getCountComment()
	sDateReadLast=$oTalkUser->getDateLast()
	sNoticeCommentAdd=$aLang.topic_comment_add
	bNoCommentFavourites=true}
{/if}
			
			
{include file='footer.tpl'}