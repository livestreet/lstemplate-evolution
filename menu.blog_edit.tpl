<h2>{$aLang.blog_admin}: <a href="{$oBlogEdit->getUrlFull()}">{$oBlogEdit->getTitle()}</a></h2>

<ul class="switcher">
	<li {if $sMenuItemSelect=='profile'}class="active"{/if}><a href="{router page='blog'}edit/{$oBlogEdit->getId()}/">{$aLang.blog_admin_profile}</a><span></span></li>
	<li {if $sMenuItemSelect=='admin'}class="active"{/if}><a href="{router page='blog'}admin/{$oBlogEdit->getId()}/">{$aLang.blog_admin_users}</a><span></span></li>

	{hook run='menu_blog_edit_admin_item'}
</ul>
{hook run='menu_blog_edit'}