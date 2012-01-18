<div class="block blogs" id="block_blogs">
	<h2>{$aLang.block_blogs}</h2>

    <a href="#" class="signin" id="signin-blogs"></a>

    <div class="signin_menu"  id="signin-blogs-text">
        <div class="top"></div>
        <div class="center">{$aLang.block_blogs_textpopup}</div>
    </div>
	
	<ul class="switcher">
		<li id="block_blogs_item_top" class="active">{$aLang.block_blogs_top}<span></span></li>
		{if $oUserCurrent}
			<li id="block_blogs_item_join">{$aLang.block_blogs_join}<span></span></li>
			<li id="block_blogs_item_self">{$aLang.block_blogs_self}<span></span></li>
		{/if}
	</ul>
	
	<div class="block-content" id="block_blogs_content">
		{$sBlogsTop}
	</div>

	<div class="bottom">
		<a href="{router page='blogs'}">{$aLang.block_blogs_all}</a>
	</div>
</div>
