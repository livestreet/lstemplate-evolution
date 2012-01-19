<ul class="menu">
	<li {if $sAction=='profile' or $sAction=='my'}class="active"{/if}>
		<a href="{$oUserProfile->getUserWebPath()}">{$aLang.user_menu_profile}</a>

	</li>

	{hook run='menu_profile'}
</ul>