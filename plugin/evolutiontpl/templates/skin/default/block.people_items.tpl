<ul class="list">
	{foreach from=$aUsers item=oUser}
		<li><a href="{$oUser->getUserWebPath()}" title="{$oUser->getLogin()}"><img src="{$oUser->getProfileAvatarPath(64)}" /></a></li>
	{/foreach}
</ul>

<div class="bottom">
	<a href="{router page='people'}">{$aLang.block_people_all}</a>
</div>