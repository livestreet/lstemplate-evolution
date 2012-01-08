<div id="header">
	{if $oUserCurrent}
		<div class="profile">
			<a href="{$oUserCurrent->getUserWebPath()}"><img src="{$oUserCurrent->getProfileAvatarPath(48)}" alt="{$oUserCurrent->getLogin()}"title="{$oUserCurrent->getLogin()}" class="avatar" /></a>
			<ul>
				<li>
					<a href="{$oUserCurrent->getUserWebPath()}" class="username">{$oUserCurrent->getLogin()}</a>

                    <span class="userrating {if $oUserCurrent->getRating()<0}minus{else}plus{/if}">{if $oUserCurrent->getRating()>0}+{/if}{$oUserCurrent->getRating()}</span>
					| <a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}" class="logout">{$aLang.quit}</a>
				</li>
				<li>
					<a href="{router page='settings'}profile/" class="settings" title="{$aLang.settings}"></a>
					{if $iUserCurrentCountTalkNew}
						<a href="{router page='talk'}" class="new-message" id="new_messages" title="{$aLang.user_privat_messages_new}">{$iUserCurrentCountTalkNew}</a>
					{else}
						<a href="{router page='talk'}" id="new_messages" class="message" title="{$aLang.messages}"></a>
					{/if}
                    <a href="{router page='my'}{$oUserCurrent->getLogin()}/" class="my" title="{$aLang.my_topics}"></a>
				</li>

				{hook run='userbar_item'}
			</ul>
		</div>
	{else}
		<div class="auth">
			<a href="{router page='login'}" id="login_form_show" class="login"></a>
			<a href="{router page='registration'}" class="reg"></a>
		</div>
	{/if}

	<a href="{cfg name='path.root.web'}" class="logo" title="{$aLang.to_main}"></a>

	<ul class="pages">
		<li {if $sMenuHeadItemSelect=='blog'}class="active"{/if}><a href="{cfg name='path.root.web'}">{$aLang.topic_title}</a></li>
		<li {if $sMenuHeadItemSelect=='blogs'}class="active"{/if}><a href="{router page='blogs'}">{$aLang.blogs}</a></li>
		<li {if $sMenuHeadItemSelect=='people'}class="active"{/if}><a href="{router page='people'}">{$aLang.people}</a></li>
		{if $oUserCurrent}
			<li {if $sMenuItemSelect=='stream'}class="active"{/if}>
				<a href="{router page='stream'}">{$aLang.stream_personal_title}</a>
			</li>
		{/if}
						
		{hook run='main_menu'}
	</ul>
</div>