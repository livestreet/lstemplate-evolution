
{assign var="oSession" value=$oUserProfile->getSession()}
{assign var="oVote" value=$oUserProfile->getVote()}

<div class="user-profile">
    <img src="{$oUserProfile->getProfileAvatarPath(100)}" alt="avatar" class="avatar" />

    <div class="about-profile">
    	<div class="top-profile">
            <h3>{$oUserProfile->getLogin()}{if $oUserProfile->getProfileName()} {$aLang.profile_line} <span>{$oUserProfile->getProfileName()|escape:'html'}</span>{/if}</h3>
        </div>
    	<div class="btm-profile">
            <div class="rating">
                <div id="vote_area_user_{$oUserProfile->getId()}" class="voting {if $oUserProfile->getRating()>=0}positive{else}negative{/if} {if !$oUserCurrent || $oUserProfile->getId()==$oUserCurrent->getId()}guest{/if} {if $oVote} voted {if $oVote->getDirection()>0}plus{elseif $oVote->getDirection()<0}minus{/if}{/if}">
            		<div class="text">{$aLang.blog_rating}</div>
            		<span class="bg-plus"><a href="#" class="plus" onclick="return ls.vote.vote({$oUserProfile->getId()},this,1,'user');"></a></span>
            		<div id="vote_total_user_{$oUserProfile->getId()}" class="total" title="{$aLang.user_vote_count}: {$oUserProfile->getCountVote()}">{$oUserProfile->getRating()}</div>
            		<span class="bg-minus"><a href="#" class="minus" onclick="return ls.vote.vote({$oUserProfile->getId()},this,-1,'user');"></a></span>
            		<div class="text2"><span id="vote_count_user_{$oUserProfile->getId()}">{$oUserProfile->getCountVote()}</span> {$aLang.profile_voices}</div>
            	</div>

                <div class="strength">
		            <div class="text">{$aLang.user_skill}</div>
		            <div class="total" id="user_skill_{$oUserProfile->getId()}">{$oUserProfile->getSkill()}</div>
	            </div>
            </div>
            {if $oUserProfile}
            {if $oUserCurrent && $oUserCurrent->getId()!=$oUserProfile->getId()}
                <div class="friend">
                    {include file='actions/ActionProfile/friend_item.tpl' oUserFriend=$oUserProfile->getUserFriend()}
                    <a href="{router page='talk'}add/?talk_users={$oUserProfile->getLogin()}" class="send-message"></a>
                </div>
            {/if}
            {/if}
            <div class="info">
                <b>{$aLang.profile_registration}:</b><br />
                {date_format date=$oUserProfile->getDateRegister()}

                {if $oSession}
                <br /><br />
                <b>{$aLang.profile_lastvisit}:</b><br />
                {date_format date=$oSession->getDateLast()}
                {/if}
            </div>
        </div>
    </div>
</div>

<br />

<ul class="switcher">
    <li {if $sAction=='profile' and ($aParams[0]=='whois' or $aParams[0]=='')}class="active"{/if}><a href="{$oUserProfile->getUserWebPath()}">{$aLang.profile_personal}</a><span></span></li>
    <li {if $sAction=='profile' and ($aParams[0]=='favourites' and ($aParams[1]=='' or $aParams[1]=='comments'))}class="active"{/if}><a href="{router page='profile'}{$oUserProfile->getLogin()}/favourites/">{$aLang.profile_favourite}</a><span></span></li>
    <li {if $sAction=='my' and ($aParams[0]=='blog' or $aParams[0]=='')}class="active"{/if}><a href="{router page='my'}{$oUserProfile->getLogin()}/">{$aLang.profile_topics}{if $iCountTopicUser} ({$iCountTopicUser}){/if}</a><span></span></li>
    <li {if $sAction=='my' and $aParams[0]=='comment'}class="active"{/if}><a href="{router page='my'}{$oUserProfile->getLogin()}/comment/">{$aLang.user_menu_publication_comment}{if $iCountCommentUser} ({$iCountCommentUser}){/if}</a><span></span></li>
</ul>