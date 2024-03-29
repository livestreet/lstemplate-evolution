{assign var="oBlog" value=$oTopic->getBlog()}
{assign var="oUser" value=$oTopic->getUser()}
{assign var="oVote" value=$oTopic->getVote()}

<div class="topic" {if !$bTopicList}style="margin-bottom:30px;"{/if}>
	<h3 class="title">
		{if $oTopic->getPublish()==0}
			<img src="{cfg name='path.static.skin'}/images/draft.png" title="{$aLang.topic_unpublish}" alt="{$aLang.topic_unpublish}" />
		{/if}
		{if $bTopicList}
			<a href="{router page='link'}go/{$oTopic->getId()}/" class="title-topic">{$oTopic->getTitle()|escape:'html'}</a>
		{else}
			{$oTopic->getTitle()|escape:'html'}
		{/if}
        <img src="{cfg name='path.static.skin'}/images/url-link-icon.png" title="{$aLang.topic_linkto}"/>
	</h3>

	<div class="info-top">
        {if $oBlog->getType()=='personal'}
            <li><a href="{router page='personal_blog'}">{$aLang.topic_personal_blog}</a> \</li>
        {else}
            <li><a href="{router page='blog'}">{$aLang.topic_collective_blog}</a> \</li>
        {/if}
		<li><a href="{$oBlog->getUrlFull()}">{$oBlog->getTitle()|escape:'html'}</a> \</li>
        <li>{date_format date=$oTopic->getDateAdd()}</li>

        {if $oUserCurrent and ($oUserCurrent->getId()==$oTopic->getUserId() or $oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getUserIsModerator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
            <li>\ <a href="{cfg name='path.root.web'}/{$oTopic->getType()}/edit/{$oTopic->getId()}/" title="{$aLang.topic_edit}" class="edit">{$aLang.topic_edit}</a></li>
        {/if}
    	{if $oUserCurrent and ($oUserCurrent->isAdministrator() or $oBlog->getUserIsAdministrator() or $oBlog->getOwnerId()==$oUserCurrent->getId())}
    		<li>\ <a href="{router page='topic'}delete/{$oTopic->getId()}/?security_ls_key={$LIVESTREET_SECURITY_KEY}" title="{$aLang.topic_delete}" onclick="return confirm('{$aLang.topic_delete_confirm}');" class="delete">{$aLang.topic_delete}</a></li>
    	{/if}
	</div>

	<div class="content">
		{if $bTopicList}
			{$oTopic->getTextShort()}
			{if $oTopic->getTextShort()!=$oTopic->getText()}
				<a href="{$oTopic->getUrl()}#cut" title="{$aLang.topic_read_more}">
				{if $oTopic->getCutText()}
					{$oTopic->getCutText()}
				{else}
					{$aLang.topic_read_more}
				{/if}                           
				</a>
			{/if}
		{else}
			 {$oTopic->getText()}
		{/if}
	</div>

	<ul class="tags">
		{foreach from=$oTopic->getTagsArray() item=sTag name=tags_list}
			<li><a href="{router page='tag'}{$sTag|escape:'url'}/"><span></span>{$sTag|escape:'html'}</a></li>
		{/foreach}
	</ul>

    <ul class="link-to">
        <li>{$aLang.topic_link_to}: <a href="{router page='link'}go/{$oTopic->getId()}/" title="{$aLang.topic_link_count_jump}: {$oTopic->getLinkCountJump()}">{$oTopic->getLinkUrl(true)}</a></li>
    </ul>
	<ul class="info">
		<li class="avatar"><a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="avatar" title="{$oUser->getLogin()}" /></a></li>
		<li class="username"><span class="userrating {if $oUser->getRating()<0}minus{else}plus{/if}">{if $oUser->getRating()>0}+{/if}{$oUser->getRating()}</span>&nbsp;&nbsp;<a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a></li>
        <li class="view">{$oTopic->getCountRead()}</li>
        {if $bTopicList}
			<li class="comments-link">
				{if $oTopic->getCountComment()>0}
					<a href="{$oTopic->getUrl()}#comments">{$oTopic->getCountComment()}{if $oTopic->getCountCommentNew()}<span> +{$oTopic->getCountCommentNew()}</span>{/if}</a>
				{else}
					<a href="{$oTopic->getUrl()}#comments">{$aLang.topic_comment}</a>
				{/if}
			</li>
		{/if}
        <li class="like">
            <a href="#" onclick="return ls.favourite.toggle({$oTopic->getId()},this,'topic');" title="{$aLang.topic_add_favourite}" class="favourite {if $oUserCurrent && $oTopic->getIsFavourite()}active{/if}"></a>
        </li>

		<li id="vote_area_topic_{$oTopic->getId()}" class="voting {if $oVote || ($oUserCurrent && $oTopic->getUserId()==$oUserCurrent->getId()) || strtotime($oTopic->getDateAdd())<$smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}{if $oTopic->getRating()>0}positive{elseif $oTopic->getRating()<0}negative{/if}{/if} {if !$oUserCurrent || $oTopic->getUserId()==$oUserCurrent->getId() || strtotime($oTopic->getDateAdd())<$smarty.now-$oConfig->GetValue('acl.vote.topic.limit_time')}guest{/if}{if $oVote} voted {if $oVote->getDirection()>0}plus{elseif $oVote->getDirection()<0}minus{/if}{/if}">
			<span class="bg-plus"><a href="#" class="plus" onclick="return ls.vote.vote({$oTopic->getId()},this,1,'topic');"></a></span>
			<span id="vote_total_topic_{$oTopic->getId()}" class="total" title="{$aLang.topic_vote_count}: {$oTopic->getCountVote()}">{if $oTopic->getRating()>0}+{/if}{$oTopic->getRating()}</span>
			<span class="bg-minus"><a href="#" class="minus" onclick="return ls.vote.vote({$oTopic->getId()},this,-1,'topic');"></a></span>
		</li>

		{if !$bTopicList}
			<li class="share"><a href="/">{$aLang.topic_share_link}</a></li>
		{/if}

		{hook run='topic_show_info' topic=$oTopic}
	</ul>
	{if !$bTopicList}
		{hook run='topic_show_end' topic=$oTopic}
	{/if}
</div>