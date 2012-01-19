<ul class="list">
	{foreach from=$aTopics item=oTopic}
		<li>{date_format date=$oTopic->getDateAdd()} - <a href="{$oTopic->getUrl()}">{$oTopic->getTitle()|escape:'html'}</a></li>
	{/foreach}
</ul>