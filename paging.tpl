{if $aPaging and $aPaging.iCountPage>1}
	<div class="pagination">
		<ul>
			{if $aPaging.iPrevPage}
				<li><a href="{$aPaging.sBaseUrl}/page{$aPaging.iPrevPage}/{$aPaging.sGetParams}">&laquo;</a></li>
			{/if}
			{foreach from=$aPaging.aPagesLeft item=iPage}
				<li><a href="{$aPaging.sBaseUrl}/page{$iPage}/{$aPaging.sGetParams}">{$iPage}</a></li>
			{/foreach}
			<li class="active">{$aPaging.iCurrentPage}</li>
			{foreach from=$aPaging.aPagesRight item=iPage}
				<li><a href="{$aPaging.sBaseUrl}/page{$iPage}/{$aPaging.sGetParams}">{$iPage}</a></li>
			{/foreach}
			{if $aPaging.iNextPage}
				<li><a href="{$aPaging.sBaseUrl}/page{$aPaging.iNextPage}/{$aPaging.sGetParams}">&raquo;</a></li>
			{/if}
			{if $aPaging.iCurrentPage<$aPaging.iCountPage}
				<li><a href="{$aPaging.sBaseUrl}/page{$aPaging.iCountPage}/{$aPaging.sGetParams}">последняя</a></li>
			{/if}					
		</ul>
	</div>
{/if}