{if $oTopic}
	<script language="JavaScript" type="text/javascript">
		var iTopicIdForSimilar={json var=$oTopic->getId()};
	</script>

	<div class="block like">
		<h2>{$aLang.like_block}</h2>

		<a href="#" class="signin" id="signin-topics-like"></a>

		<div class="signin_menu" id="signin-topics-like-text">
			<div class="top"></div>
			<div class="center">{$aLang.like_block_textpopup}</div>
		</div>

		<ul class="switcher">
			<li class="active" id="block_similar_item_more">{$aLang.like_block_more}<span></span></li>
			<li id="block_similar_item_like">{$aLang.like_block_like}<span></span></li>
		</ul>

		<div class="block-content" id="block_similar_content">
			<script type="text/javascript">
				jQuery(function($){
					ls.blocks.load($('#block_similar_item_more'), 'block_similar', { iTopicIdForSimilar: (window.iTopicIdForSimilar === undefined) ? 0 : iTopicIdForSimilar });
				});
			</script>
		</div>

	</div>
{/if}