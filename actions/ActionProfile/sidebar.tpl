{if $oUserProfile}
    {if $oUserProfile->getProfileFoto()}
        <div class="block">
            <img src="{$oUserProfile->getProfileFoto()}" alt="photo" />
        </div>
	{/if}
{/if}

<div class="block activnost" id="block_stream">
	<h2>{$aLang.block_activnost}</h2>

	<div class="block-content" id="block_stream_content">
		<ul class="list">
            <li>
                <span class="date">25 октября 2011, 17:41</span><br />
                прокомментировал топик <a href="">Обновление шаблона "Street Spirit" до версии 0.3</a><br />
                «принято к сведению, спасибо»
            </li>
            <li>
                <span class="date">25 октября 2011, 17:41</span><br />
                прокомментировал топик <a href="">Обновление шаблона "Street Spirit" до версии 0.3</a><br />
                «принято к сведению, спасибо»
            </li>
            <li>
                <span class="date">25 октября 2011, 17:41</span><br />
                прокомментировал топик <a href="">Обновление шаблона "Street Spirit" до версии 0.3</a><br />
                «принято к сведению, спасибо»
            </li>
        </ul>
	</div>
</div>