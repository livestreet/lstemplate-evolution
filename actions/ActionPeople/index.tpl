{include file='header.tpl' menu='people'}

	
<h2>{$aLang.user_list}</h2>

<ul class="switcher" style="border-bottom:0px; margin-bottom:0px">
	<li {if $sEvent=='good'}class="active"{/if}><a href="{router page='people'}good/">{$aLang.user_good}</a><span></span></li>
	<li {if $sEvent=='bad'}class="active"{/if}><a href="{router page='people'}bad/">{$aLang.user_bad}</a><span></span></li>
</ul>

{if $aUsersRating}
	<table class="table table-people">
		<thead>
			<tr>
				<td>{$aLang.user}</td>
				<td align="center" width="60">{$aLang.user_skill}</td>
				<td align="center" width="80">{$aLang.user_rating}</td>
			</tr>
		</thead>

		<tbody>
		{foreach from=$aUsersRating item=oUser}
			<tr>
				<td><a href="{$oUser->getUserWebPath()}" class="username">{$oUser->getLogin()}</a></td>
				<td align="center" class="strength">{$oUser->getSkill()}</td>
				<td align="center" class="rating"><strong {if $oUser->getRating()<0}class="bad"{/if}>{$oUser->getRating()}</strong></td>
			</tr>
		{/foreach}
		</tbody>
	</table>
{else}
    <table class="table table-people">
		<thead>
			<tr>
				<td>{$aLang.user}</td>
				<td align="center" width="60">{$aLang.user_skill}</td>
				<td align="center" width="80">{$aLang.user_rating}</td>
			</tr>
		</thead>

        <tbody>
	        <tr><td>{$aLang.user_empty}</td><td></td><td></td></tr>
		</tbody>
	</table>
{/if}


{include file='paging.tpl' aPaging="$aPaging"}
{include file='footer.tpl'}