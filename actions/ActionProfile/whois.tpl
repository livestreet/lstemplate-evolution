{include file='header.tpl' menu="profile"}

{include file='actions/ActionProfile/top_whois.tpl'}  
{if $oUserProfile->getProfileSex()!='other' || $oUserProfile->getProfileBirthday() || ($oUserProfile->getProfileCountry() || $oUserProfile->getProfileRegion() || $oUserProfile->getProfileCity()) || $oUserProfile->getProfileAbout() || $oUserProfile->getProfileSite() || count($aUserFields)}
	<table class="user-profile-table">
		{if $oUserProfile->getProfileSex()!='other'}
			<tr>
				<td class="var">{$aLang.profile_sex}:</td>
				<td>
					{if $oUserProfile->getProfileSex()=='man'}
						{$aLang.profile_sex_man}
					{else}
						{$aLang.profile_sex_woman}
					{/if}
				</td>
			</tr>
		{/if}

		{if $oUserProfile->getProfileBirthday()}
			<tr>
				<td class="var">{$aLang.profile_birthday}:</td>
				<td>{date_format date=$oUserProfile->getProfileBirthday() format="j F Y"}</td>
			</tr>
		{/if}

		{if ($oUserProfile->getProfileCountry()|| $oUserProfile->getProfileRegion() || $oUserProfile->getProfileCity())}
			<tr>
				<td class="var">{$aLang.profile_place}:</td>
				<td>
				{if $oUserProfile->getProfileCountry()}
					<a href="{router page='people'}country/{$oUserProfile->getProfileCountry()|escape:'html'}/">{$oUserProfile->getProfileCountry()|escape:'html'}</a>{if $oUserProfile->getProfileCity()},{/if}
				{/if}
				{if $oUserProfile->getProfileCity()}
					<a href="{router page='people'}city/{$oUserProfile->getProfileCity()|escape:'html'}/">{$oUserProfile->getProfileCity()|escape:'html'}</a>
				{/if}
				</td>
			</tr>
		{/if}

		{if $oUserProfile->getProfileAbout()}
			<tr>
				<td class="var">{$aLang.profile_about}:</td>
				<td>{$oUserProfile->getProfileAbout()|escape:'html'}</td>
			</tr>
		{/if}

		{if $oUserProfile->getProfileSite()}
			<tr>
				<td class="var">{$aLang.profile_site}:</td>
				<td>
					<a href="{$oUserProfile->getProfileSite(true)|escape:'html'}" rel="nofollow">
						{if $oUserProfile->getProfileSiteName()}
							{$oUserProfile->getProfileSiteName()|escape:'html'}
						{else}
							{$oUserProfile->getProfileSite()|escape:'html'}
						{/if}
					</a>
				</td>
			</tr>
		{/if}

        {if $oUserProfile->getProfileIcq()}
			<tr>
				<td class="var">{$aLang.profile_contacts}:</td>
				<td class="icq"><a href="http://www.icq.com/people/about_me.php?uin={$oUserProfile->getProfileIcq()|escape:'html'}" target="_blank">{$oUserProfile->getProfileIcq()}</a></td>
			</tr>
        {/if}
                {if count($aUserFields)}
                    {foreach from=$aUserFields item=oField}
                        <tr>
                            <td class="var">{$oField->getTitle()|escape:'html'}:</td>
                            <td>{$oField->getValue(true,true)}</td>
                        </tr>
                    {/foreach}
                {/if}
		{hook run='profile_whois_privat_item' oUserProfile=$oUserProfile}
	</table>
{/if}

{hook run='profile_whois_item' oUserProfile=$oUserProfile}
<br />
<br />
<table class="user-profile-table">
	{if $aUsersFriend}
		<tr>
			<td class="var">{$aLang.profile_friends}:</td>
			<td>
				{foreach from=$aUsersFriend item=oUser}
					<a href="{$oUser->getUserWebPath()}" class="user">{$oUser->getLogin()}</a>
				{/foreach}
			</td>
		</tr>
	{/if}

	{if $oConfig->GetValue('general.reg.invite') and $oUserInviteFrom}
		<tr>
			<td class="var">{$aLang.profile_invite_from}:</td>
			<td>
				<a href="{$oUserInviteFrom->getUserWebPath()}">{$oUserInviteFrom->getLogin()}</a>&nbsp;
			</td>
		</tr>
	{/if}

	{if $oConfig->GetValue('general.reg.invite') and $aUsersInvite}
		<tr>
			<td class="var">{$aLang.profile_invite_to}:</td>
			<td>
				{foreach from=$aUsersInvite item=oUserInvite}
					<a href="{$oUserInvite->getUserWebPath()}">{$oUserInvite->getLogin()}</a>&nbsp;
				{/foreach}
			</td>
		</tr>
	{/if}

	{if $aBlogsOwner}
		<tr>
			<td class="var">{$aLang.profile_blogs_self}:</td>
			<td>
				{foreach from=$aBlogsOwner item=oBlog name=blog_owner}
					<a href="{router page='blog'}{$oBlog->getUrl()}/">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_owner.last}, {/if}
				{/foreach}
			</td>
		</tr>
	{/if}

	{if $aBlogAdministrators}
		<tr>
			<td class="var">{$aLang.profile_blogs_administration}:</td>
			<td>
				{foreach from=$aBlogAdministrators item=oBlogUser name=blog_user}
					{assign var="oBlog" value=$oBlogUser->getBlog()}
					<a href="{router page='blog'}{$oBlog->getUrl()}/">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_user.last}, {/if}
				{/foreach}
			</td>
		</tr>
	{/if}

	{if $aBlogModerators}
		<tr>
			<td class="var">{$aLang.profile_blogs_moderation}:</td>
			<td>
				{foreach from=$aBlogModerators item=oBlogUser name=blog_user}
					{assign var="oBlog" value=$oBlogUser->getBlog()}
					<a href="{router page='blog'}{$oBlog->getUrl()}/">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_user.last}, {/if}
				{/foreach}
			</td>
		</tr>
	{/if}

	{if $aBlogUsers}
		<tr>
			<td class="var">{$aLang.profile_blogs_join}:</td>
			<td>
				{foreach from=$aBlogUsers item=oBlogUser name=blog_user}
					{assign var="oBlog" value=$oBlogUser->getBlog()}
					<a href="{router page='blog'}{$oBlog->getUrl()}/">{$oBlog->getTitle()|escape:'html'}</a>{if !$smarty.foreach.blog_user.last}, {/if}
				{/foreach}
			</td>
		</tr>
	{/if}

	{hook run='profile_whois_activity_item' oUserProfile=$oUserProfile}

	<tr>
		<td class="var">{$aLang.profile_date_registration}:</td>
		<td>{date_format date=$oUserProfile->getDateRegister()}</td>
	</tr>

	{if $oSession}
		<tr>
			<td class="var">{$aLang.profile_date_last}:</td>
			<td>{date_format date=$oSession->getDateLast()}</td>
		</tr>
	{/if}
</table>


{include file='footer.tpl'}