<?php
/*-------------------------------------------------------
*
*   LiveStreet Engine Social Networking
*   Copyright © 2008 Mzhelskiy Maxim
*
*--------------------------------------------------------
*
*   Official site: www.livestreet.ru
*   Contact e-mail: rus.engine@gmail.com
*
*   GNU General Public License, version 2:
*   http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
*
---------------------------------------------------------
*/
/**
 * Настройки для локального сервера.
 * Для использования - переименовать файл в config.local.php
 */

/**
 * Настройка базы данных
 */
$config['head']['default']['css'] = array(
	"___path.static.skin___/css/reset.css",
	"___path.root.engine_lib___/external/jquery/markitup/skins/simple/style.css",
	"___path.root.engine_lib___/external/jquery/markitup/sets/default/style.css",
	"___path.root.engine_lib___/external/prettify/prettify.css",
	"___path.static.skin___/css/main.css",
	"___path.static.skin___/css/grid.css",
	"___path.static.skin___/css/common.css",
	"___path.static.skin___/css/forms.css",
	"___path.static.skin___/css/popups.css",
	"___path.static.skin___/css/topic.css",
	"___path.static.skin___/css/comments.css",
	"___path.static.skin___/css/blocks.css",
	"___path.static.skin___/css/jquery.jqmodal.css",
	"___path.static.skin___/css/jquery.notifier.css",
   /*	"___path.static.skin___/css/purple.css", */
);
return $config;
?>