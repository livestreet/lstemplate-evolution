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
 * Настройки
 */

$config['people_count']=18;
$config['top_count']=5;
$config['similar_count']=5;
$config['stream_count']=10;

$aBlock = array(
	'path' => array(
		'___path.root.web___/blog$',
		'___path.root.web___/blog/*$',
		'___path.root.web___/blog/*/page\d+$',
		'___path.root.web___/blog/*/*\.html$',
		'___path.root.web___/blog/*\.html$',
		'___path.root.web___/top(|(/.+))$',
	),
	'action'  => array(
		'index', 'new'
	),
	'blocks'  => array(
		'right' => array(
			'top'=>array('priority'=>85,'params'=>array('plugin'=>'evolutiontpl')),
			'people'=>array('priority'=>80,'params'=>array('plugin'=>'evolutiontpl')),
		)
	),
	'clear' => false,
);
Config::Set('block.rule_evolution_blob',$aBlock);

/**
 * Блоки на странице топика
 */
$aBlock = array(
	'path' => array(
		'___path.root.web___/blog/*/*\.html$',
		'___path.root.web___/blog/*\.html$',
	),
	'blocks'  => array(
		'right' => array(
			'similar'=>array('priority'=>150,'params'=>array('plugin'=>'evolutiontpl')),
			'block.aboutblog.tpl'=>array('priority'=>200),
		)
	),
	'clear' => false,
);
Config::Set('block.rule_evolution_topic',$aBlock);

$aBlock = array(
	'action'  => array( 'my','profile' ),
	'blocks'  => array( 'right' => array('userSidebar'=>array('priority'=>100,'params'=>array('plugin'=>'evolutiontpl'))) ),
);
Config::Set('block.rule_evolution_profile',$aBlock);
/**
 * Убираем стандартный блок в сайдбаре в профиле пользователя
 */
$aBlocks=Config::Get('block');
unset($aBlocks['rule_profile']);
Config::Set('block',$aBlocks);

return $config;
?>