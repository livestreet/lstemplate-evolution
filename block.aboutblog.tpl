{if $oTopic}
	{assign var="oBlog" value=$oTopic->getBlog()}
	{if $oBlog->getType()!='personal'}
		{assign var="oUserOwner" value=$oBlog->getOwner()}
        {assign var="oVote" value=$oBlog->getVoteForce()}


		<div class="block about">
            <h2>{$aLang.about_blog}</h2>

            <div class="block-content" id="block_blogsrr_content">
        		<ul class="list">
                    <li class="title">{$aLang.about_blog_title}: <a href="{$oBlog->getUrlFull()}">{$oTopic->getBlog()->getTitle()|escape:'html'}</a><a href="{router page='rss'}blog/{$oBlog->getUrl()}/" class="rss" title="RSS"></a></li>

                    <li class="text">{$oTopic->getBlog()->getDescription()}</li>

                    <li class="info">
                        {if $oTopic->getBlog()->getCountUser()}
            				{$aLang.about_blog_all} <a href="{$oBlog->getUrlFull()}users/">{$oTopic->getBlog()->getCountUser()}</a> {$aLang.about_blog_readers}
            			{else}
            				{$aLang.about_blog_noreaders}
            			{/if}
                    </li>
                    {if $oUserCurrent}
                    <li class="rating">
						<div id="vote_area_blog_{$oBlog->getId()}" class="voting {if $oBlog->getRating()>=0}positive{else}negative{/if} {if !$oUserCurrent || $oBlog->getOwnerId()==$oUserCurrent->getId()}guest{/if} {if $oVote} voted {if $oVote->getDirection()>0}plus{elseif $oVote->getDirection()<0}minus{/if}{/if}">
	                        <span class="bg-plus"><a href="#" class="plus" onclick="return ls.vote.vote({$oTopic->getBlog()->getId()},this,1,'blog');"></a></span>
        					<div id="vote_total_blog_{$oBlog->getId()}" class="total" title="{$aLang.blog_vote_count}: {$oTopic->getBlog()->getCountVote()}">{$oTopic->getBlog()->getRating()}</div>
        					<span class="bg-minus"><a href="#" class="minus" onclick="return ls.vote.vote({$oTopic->getBlog()->getId()},this,-1,'blog');"></a></span>
        					<div class="text2"><span id="vote_count_blog_{$oBlog->getId()}">{$oBlog->getCountVote()}</span> {$aLang.profile_voices}</div>
            	        </div>

                        {if $oUserCurrent and $oUserCurrent->getId()!=$oBlog->getOwnerId() and $oTopic->getBlog()->getType()!='personal'}
					        <div onclick="ls.blog.toggleJoin(this,{$oBlog->getId()}); return false;" class="join {if $oBlog->getUserIsJoin()}active{/if}"></div>
				        {/if}
                    </li>
                    {/if}
                </ul>
        	</div>
        </div>
	{/if}
{/if}