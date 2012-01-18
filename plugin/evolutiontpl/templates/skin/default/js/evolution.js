
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


var ls = ls || {};
ls.plugin = ls.plugin || {};

ls.plugin.evolution = (function ($) {

	this.options = {

	};


	this.init = function(){
		$(document).ready(function() {

			$(".signin").click(function(e) {
				e.preventDefault();
				$("#"+e.target.id+'-text').toggle();
				$(".signin").toggleClass("menu-open");
			});

			$(".signin_menu").mouseup(function() {
				return false
			});

			$(document).mouseup(function(e) {
				$(".signin").removeClass("menu-open");
				if(!$(e.target).hasClass("signin")) {
					$(".signin_menu").hide();
				}
			});

			if (window.addthis !== undefined) {
				addthis.button('.share');
			}

			this.initBlocks();
		}.bind(this));


	};

	this.initBlocks = function() {
		ls.blocks.options.type.block_people_item_top = { url: aRouter['ajax']+'people/top/' };
		ls.blocks.options.type.block_people_item_online = { url: aRouter['ajax']+'people/online/' };
		ls.blocks.options.type.block_people_item_new = { url: aRouter['ajax']+'people/new/' };
		ls.blocks.options.type.block_people_item_friends = { url: aRouter['ajax']+'people/friends/' };

		ls.blocks.options.type.block_top_item_week = { url: aRouter['ajax']+'top/week/' };
		ls.blocks.options.type.block_top_item_month = { url: aRouter['ajax']+'top/month/' };
		ls.blocks.options.type.block_top_item_all = { url: aRouter['ajax']+'top/all/' };

		$('[id^="block_people_item"]').click(function(){
			ls.blocks.load(this, 'block_people');
			return false;
		});

		$('[id^="block_top_item"]').click(function(){
			ls.blocks.load(this, 'block_top');
			return false;
		});
	}


	this.init();

	return this;
}).call(ls.plugin.evolution || {},jQuery);