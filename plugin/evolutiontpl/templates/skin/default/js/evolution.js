
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

		});
	};


	this.init();

	return this;
}).call(ls.plugin.evolution || {},jQuery);