{include file='header.tpl' menu="profile"}

{include file='actions/ActionProfile/top_whois.tpl'}
<ul class="switcher-down">
    <li {if $aParams[0]=='favourites' and $aParams[1]==''}class="active"{/if}><a href="{router page='profile'}{$oUserProfile->getLogin()}/favourites/">{$aLang.user_menu_profile_favourites}{if $iCountTopicFavourite} ({$iCountTopicFavourite}){/if}</a></li>
	<li {if $sAction=='profile' and $aParams[1]=='comments'}class="active"{/if}><a href="{router page='profile'}{$oUserProfile->getLogin()}/favourites/comments/">{$aLang.user_menu_profile_favourites_comments}{if $iCountCommentFavourite} ({$iCountCommentFavourite}){/if}</a></li>
    {hook run='menu_profile_profile_item'}
</ul>

{include file='comment_list.tpl'}
{include file='footer.tpl'}