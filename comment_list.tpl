<div class="comments comment-list">
	{foreach from=$aComments item=oComment}
		{assign var="oUser" value=$oComment->getUser()}
		{assign var="oTopic" value=$oComment->getTarget()}
		{assign var="oBlog" value=$oTopic->getBlog()}
        <div class="comment">
        <div class="avatar">
            <a href="{$oUser->getUserWebPath()}"><img src="{$oUser->getProfileAvatarPath(48)}" alt="avatar" title="{$oUser->getLogin()}" /></a>
        <p class="online">{$aLang.comment_online_user}</p>
        </div>

        <div class="information">

            <div class="info-top">
                <a href="{$oUser->getUserWebPath()}" class="username"><span class="{if $oUser->getRating()<0}minus{else}plus{/if}">{if $oUser->getRating()>0}+{/if}{$oUser->getRating()}</span>&nbsp;{$oUser->getLogin()}</a>
                {if $oUser->getProfileCity()}&mdash; {$oUser->getProfileCity()}{/if}
            </div>

        	<div class="content">
				{if $oComment->isBad()}
					<div style="color: #aaa;">{$oComment->getText()}</div>
				{else}
					{$oComment->getText()}
				{/if}
			</div>

        	<ul class="info">
                <li style="color:#999">{date_format date=$oComment->getDate()}</li>
        		<li><a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="reply-link">{$aLang.comment_link_to}</a></li>
                {hook run='comment_action' comment=$oComment}
        	</ul>
        </div>
        </div>

	{/foreach}
</div>

{include file='paging.tpl' aPaging="$aPaging"}