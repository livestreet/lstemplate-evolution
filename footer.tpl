			{hook run='content_end'}
		</div><!-- /content -->

		{if !$noSidebar}
			{include file='sidebar.tpl'}
		{/if}
	</div><!-- /wrapper -->

    <div class="hFooter"></div>
</div><!-- /container -->

<div id="footer">
    <div class="inner">
        <div class="right">
            <a href="/">О проекте</a> •
            <a href="/">Скачать</a> •
            <a href="/">Модули</a> •
            <a href="/">Помощь</a> •
            <a href="/">Реклама</a>
        </div>

        {hook run='copyright'} • Design by <a href="/">Internetologia</a>
	{hook run='footer_end'}
    </div>
</div>

{hook run='body_end'}

</body>
</html>