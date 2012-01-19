{if $oUserProfile}
	{if $oUserProfile->getProfileFoto()}
	<div class="block">
		<img src="{$oUserProfile->getProfileFoto()}" alt="photo" />
	</div>
	{/if}

	{if count($evolution_aStreamEvents)}
		<div class="block activnost" id="block_stream">
			<h2>{$aLang.block_activnost}</h2>

			<div class="block-content" id="block_stream_content">
				<ul class="list">

					{foreach from=$evolution_aStreamEvents item=oStreamEvent}
						{assign var=oTarget value=$oStreamEvent->getTarget()}
						<li class="stream-item-type-{$oStreamEvent->getEventType()}">
							<span class="date" title="{date_format date=$oStreamEvent->getDateAdded()}">{date_format date=$oStreamEvent->getDateAdded() hours_back="12" minutes_back="60" now="60" day="day H:i" format="j F Y, H:i"}</span><br />

							{if $oStreamEvent->getEventType() == 'add_topic'}
								{$aLang.stream_list_event_add_topic} <a href="{$oTarget->getUrl()}">{$oTarget->getTitle()|escape:'html'}</a>
							{elseif $oStreamEvent->getEventType() == 'add_comment'}
								{$aLang.stream_list_event_add_comment} <a href="{$oTarget->getTarget()->getUrl()}#comment{$oTarget->getId()}">{$oTarget->getTarget()->getTitle()|escape:'html'}</a>
								<div class="stream-comment-preview">{$oTarget->getText()|strip_tags|truncate:200}</div>
							{elseif $oStreamEvent->getEventType() == 'add_blog'}
								{$aLang.stream_list_event_add_blog} <a href="{$oTarget->getUrlFull()}">{$oTarget->getTitle()|escape:'html'}</a>
							{elseif $oStreamEvent->getEventType() == 'vote_blog'}
								{$aLang.stream_list_event_vote_blog} <a href="{$oTarget->getUrlFull()}">{$oTarget->getTitle()|escape:'html'}</a>
							{elseif $oStreamEvent->getEventType() == 'vote_topic'}
								{$aLang.stream_list_event_vote_topic} <a href="{$oTarget->getUrl()}">{$oTarget->getTitle()|escape:'html'}</a>
							{elseif $oStreamEvent->getEventType() == 'vote_comment'}
								{$aLang.stream_list_event_vote_comment} <a href="{$oTarget->getTarget()->getUrl()}#comment{$oTarget->getId()}">{$oTarget->getTarget()->getTitle()|escape:'html'}</a>
							{elseif $oStreamEvent->getEventType() == 'vote_user'}
								{$aLang.stream_list_event_vote_user} <a href="{$oTarget->getUserWebPath()}">{$oTarget->getLogin()}</a>
							{elseif $oStreamEvent->getEventType() == 'join_blog'}
								{$aLang.stream_list_event_join_blog} <a href="{$oTarget->getUrlFull()}">{$oTarget->getTitle()|escape:'html'}</a>
							{elseif $oStreamEvent->getEventType() == 'add_friend'}
								{$aLang.stream_list_event_add_friend} <a href="{$oTarget->getUserWebPath()}">{$oTarget->getLogin()}</a>
							{else}
								{hook run="stream_list_event_`$oStreamEvent->getEventType()`" oStreamEvent=$oStreamEvent}
							{/if}
						</li>
					{/foreach}

				</ul>
			</div>
		</div>
	{/if}
{/if}
