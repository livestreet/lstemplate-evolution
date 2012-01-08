<ul class="list">
	{foreach from=$oTopics item=oTopic name="cmt"}
		{assign var="oUser" value=$oTopic->getUser()}							
		{assign var="oBlog" value=$oTopic->getBlog()}
		
		<li {if $smarty.foreach.cmt.iteration % 2 == 1}class="even"{/if}>
            <div class="avatar"><a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(24)}" alt="avatar"/></a></div>
            <div class="information">
                <i>&laquo;{$oTopic->getText()|strip_tags|truncate:50:'...'}&raquo;</i><br />
			    <a href="{$oTopic->getUrl()}" class="topic-title">{$oTopic->getTitle()|escape:'html'}</a>
			    <span class="stream-comment-icon">{$oTopic->getCountComment()}</span>
			</div>
		</li>						
	{/foreach}
</ul>

<div class="bottom">
    <a href="{router page='new'}">{$aLang.block_topics_all}</a>
</div>
