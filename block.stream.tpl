<div class="block stream" id="block_stream">
	<h2>{$aLang.block_stream}</h2>

    <a href="#" class="signin"></a>

    <ul id="signin_menu">
        <div class="top"></div>
        <div class="center">{$aLang.block_stream_textpopup}</div>
    </ul>

	<ul class="switcher">
		<li id="block_stream_item_comment" class="active">{$aLang.block_stream_comments}<span></span></li>
		<li id="block_stream_item_topic">{$aLang.block_stream_topics}<span></span></li>
		<li>{$aLang.block_stream_lenta}<span></span></li>

		{hook run='block_stream_nav_item'}
	</ul>					
	
	
	<div class="block-content" id="block_stream_content">
		{$sStreamComments}
	</div>
</div>

{if $sAction=='index'}
    {include file='block.people.tpl'}
    {include file='block.top.tpl'}
{/if}
