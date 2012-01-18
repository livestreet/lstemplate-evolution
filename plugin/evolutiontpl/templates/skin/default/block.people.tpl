
<div class="block people">
	<h2>{$aLang.block_people}</h2>

    <a href="#" class="signin" id="signin-people"></a>

    <div class="signin_menu" id="signin-people-text">
        <div class="top"></div>
        <div class="center">{$aLang.block_people_textpopup}</div>
    </div>

	<ul class="switcher">
		<li class="active" id="block_people_item_top">{$aLang.block_people_top}<span></span></li>
		<li id="block_people_item_online">{$aLang.block_people_online}<span></span></li>
		<li id="block_people_item_new">{$aLang.block_people_new}<span></span></li>
		{if $oUserCurrent}
			<li id="block_people_item_friends">{$aLang.block_people_friends}<span></span></li>
		{/if}
	</ul>

	<div class="block-content" id="block_people_content">
	{$evolution_sPeopleTop}
	</div>
</div>
