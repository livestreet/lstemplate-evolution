<ul class="list">
	{foreach from=$aComments item=oComment name="cmt"}
		{assign var="oUser" value=$oComment->getUser()}
		{assign var="oTopic" value=$oComment->getTarget()}
		{assign var="oBlog" value=$oTopic->getBlog()}
		
		<li {if $smarty.foreach.cmt.iteration % 2 == 1}class="even"{/if}>
            <div class="avatar"><a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="avatar"/></a></div>
            <div class="information">
                <i>&laquo;{$oComment->getText()|strip_tags|truncate:50:'...'}&raquo;</i><br />
			    <a href="{if $oConfig->GetValue('module.comment.nested_per_page')}{router page='comments'}{else}{$oTopic->getUrl()}#comment{/if}{$oComment->getId()}" class="topic-title">{$oTopic->getTitle()|escape:'html'}</a>
			    <span class="stream-comment-icon">{$oTopic->getCountComment()}</span>
			</div>
		</li>
	{/foreach}
</ul>

<div class="bottom">
    <a href="{router page='comments'}">{$aLang.block_comments_all}</a>
</div>

