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
 * Запрещаем напрямую через браузер обращение к этому файлу.
 */
if (!class_exists('Plugin')) {
	die('Hacking attempt!');
}

class PluginEvolutiontpl extends Plugin {
	
	protected $aInherits=array(
		'entity' =>array('ModuleBlog_EntityBlog'),
		'mapper' =>array('ModuleTopic_MapperTopic'),
		'module' =>array('ModuleStream'),
		'action' =>array('ActionAjax'),
	);


	public function __construct() {
		parent::__construct();

		/**
		 * Небольшой хак, который позволяет переопредеить шаблон плагина
		 */
		$this->aDelegates=array(
			'template'  =>array(
				Config::Get('path.root.server').'/plugins/page/templates/skin/default/actions/ActionPage/add.tpl'=>'_actions/ActionPage/add.tpl',
			),
		);

	}

	/**
	 * Активация плагина	 
	 */
	public function Activate() {		
		return true;
	}
	
	/**
	 * Инициализация плагина
	 */
	public function Init() {
		$this->Viewer_AppendScript(Plugin::GetTemplateWebPath(__CLASS__).'js/evolution.js');
		$this->Viewer_AppendScript('http://s7.addthis.com/js/250/addthis_widget.js',array('merge'=>false));
	}
}
?>