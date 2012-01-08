<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html lang="ru">
<head>
	{hook run='html_head_begin'}

	<title>{$sHtmlTitle}</title>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="description" content="{$sHtmlDescription}" />
	<meta name="keywords" content="{$sHtmlKeywords}" />

	{$aHtmlHeadFiles.css}

	<link href="{cfg name='path.static.skin'}/images/favicon.ico" rel="shortcut icon" />
	<link rel="search" type="application/opensearchdescription+xml" href="{router page='search'}opensearch/" title="{cfg name='view.name'}" />

	{if $aHtmlRssAlternate}
		<link rel="alternate" type="application/rss+xml" href="{$aHtmlRssAlternate.url}" title="{$aHtmlRssAlternate.title}">
	{/if}

	{if $bRefreshToHome}
		<meta  HTTP-EQUIV="Refresh" CONTENT="3; URL={cfg name='path.root.web'}/">
	{/if}

	<script language="JavaScript" type="text/javascript">
	var DIR_WEB_ROOT 			= '{cfg name="path.root.web"}';
	var DIR_STATIC_SKIN 		= '{cfg name="path.static.skin"}';
	var DIR_ROOT_ENGINE_LIB     = '{cfg name="path.root.engine_lib"}';
	var LIVESTREET_SECURITY_KEY = '{$LIVESTREET_SECURITY_KEY}';
	var SESSION_ID              = '{$_sPhpSessionId}';
	var BLOG_USE_TINYMCE		= '{cfg name="view.tinymce"}';

	var TINYMCE_LANG='en';
	{if $oConfig->GetValue('lang.current')=='russian'}
		TINYMCE_LANG='ru';
	{/if}

	var aRouter = new Array();
	{foreach from=$aRouter key=sPage item=sPath}
		aRouter['{$sPage}'] = '{$sPath}';
	{/foreach}
	</script>

	{$aHtmlHeadFiles.js}

	<script language="JavaScript" type="text/javascript">
		var tinyMCE=false;
		ls.lang.load({json var=$aLangJs});
	</script>

    {literal}
    <script type="text/javascript">
        $(document).ready(function() {
		$(".signin").click(function(e) {
			e.preventDefault();
			$("ul#signin_menu").toggle();
			$(".signin").toggleClass("menu-open");
		});

		$("ul#signin_menu").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if($(e.target).parent(".signin").length==0) {
				$(".signin").removeClass("menu-open");
				$("ul#signin_menu").hide();
			}
		});
	});
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
		$("a.signin2").click(function(e) {
			e.preventDefault();
			$("div#signin_menu2").toggle();
			$("a.signin2").toggleClass("menu-open");
		});

		$("div#signin_menu2").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if($(e.target).parent("a.signin2").length==0) {
				$("a.signin2").removeClass("menu-open");
				$("div#signin_menu2").hide();
			}
		});
	});
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
		$("a.signin3").click(function(e) {
			e.preventDefault();
			$("div#signin_menu3").toggle();
			$("a.signin3").toggleClass("menu-open");
		});

		$("div#signin_menu3").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if($(e.target).parent("a.signin3").length==0) {
				$("a.signin3").removeClass("menu-open");
				$("div#signin_menu3").hide();
			}
		});
	});
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
		$("a.signin4").click(function(e) {
			e.preventDefault();
			$("div#signin_menu4").toggle();
			$("a.signin4").toggleClass("menu-open");
		});

		$("div#signin_menu4").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if($(e.target).parent("a.signin4").length==0) {
				$("a.signin4").removeClass("menu-open");
				$("div#signin_menu4").hide();
			}
		});
	});
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
		$("a.signin5").click(function(e) {
			e.preventDefault();
			$("div#signin_menu5").toggle();
			$("a.signin5").toggleClass("menu-open");
		});

		$("div#signin_menu5").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if($(e.target).parent("a.signin5").length==0) {
				$("a.signin5").removeClass("menu-open");
				$("div#signin_menu5").hide();
			}
		});
	});
    </script>
    {/literal}

	{hook run='html_head_end'}
</head>


<body onload="prettyPrint()">
	{hook run='body_begin'}

	<div id="container">

	    {include file='header_top.tpl'}
	    {include file='nav.tpl'}

		<div id="wrapper">
			<div id="content">
					{include file='window_login.tpl'}
					{include file='system_message.tpl'}

					{hook run='content_begin'}