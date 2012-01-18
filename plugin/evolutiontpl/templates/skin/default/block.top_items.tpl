<ul class="list">
	{foreach from=$aTopics item=oTopic}
		<li><a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a><span class="comments"><a href="{$oTopic->getUrl()}#comments">{$oTopic->getCountComment()}</a> {if $oTopic->getCountCommentNew()}+{$oTopic->getCountCommentNew()}{/if}</span></li>
	{/foreach}
</ul>