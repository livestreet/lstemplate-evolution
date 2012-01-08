<div id="nav">
		{if $oUserCurrent and ($sAction=='blog' or $sAction=='index' or $sAction=='new' or $sAction=='personal_blog' or $sAction=='feed' or $sAction=='top')}
			<a href="{router page='topic'}add/" class="button-publish"><span>{$aLang.add_topic}</span></a>
		{/if}
	
		{if $menu}
			{if in_array($menu,$aMenuContainers)}{$aMenuFetch.$menu}{else}{include file="menu.$menu.tpl"}{/if}
		{/if}
		
		<form action="{router page='search'}topics/" method="GET" class="search">
            <img src="{cfg name='path.static.skin'}/images/search-icon.gif" class="search-icon" />
			<input class="text" type="text" onblur="if (!value) value=defaultValue" onclick="if (value==defaultValue) value=''" value="{$aLang.nav_search}" name="q" />
		</form>
</div>
