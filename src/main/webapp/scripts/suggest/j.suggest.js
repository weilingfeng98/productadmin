//当真实值改变时调用回调函数
function suggestCallBack(){
	
}
(function($) {

		$.suggest = function(input, options) {
	
			var $input = $(input).attr("autocomplete", "off");
			var $results;

			var timeout = false;		// hold timeout ID for suggestion results to appear	
			var prevLength = 0;			// last recorded length of $input.val()
			var cache = [];				// cache MRU list
			var cacheSize = 0;			// size of cache in chars (bytes?)
			
			if($.trim($input.val())=='' || $.trim($input.val())==options.tip) $input.val(options.tip).css('color','#aaa');
			if( ! options.attachObject )
				options.attachObject = $(document.createElement("ul")).appendTo('body');

			$("#"+options.attachObject).remove();
			
			var resultsHtml = "<div id=\""+options.attachObject+"\" class=\"ac_results\"></div>";
			$("body").append(resultsHtml);
			$results = $("#"+options.attachObject);
			$results.css("width",($input.width()+2)+"px");
			$results.addClass(options.resultsClass);
			
			if(options.resultStyle!=null){
				$results.attr("style",options.resultStyle);
			}
			
			resetPosition();
			$(window)
				.load(resetPosition)		// just in case user is changing size of page while loading
				.resize(resetPosition)
				.scroll(resetPosition);

			$input.blur(function() {
				
				if($input.val().length > 0){
					if(options.selectTop == 'true' && checkInput($input.val())){
						selectCurrentResult();
					}
				}else{
					$input.val(options.tip).css('color','#aaa');
					clearContainer();
				}
				setTimeout(function() { 
						$results.hide();
						//$('#'+options.frame).hide();
					}, 200);
			});
			
			$input.focus(function(){
				
				if($.trim($(this).val())==options.tip){
					$(this).val('').css('color','#000');
				}
				if($.trim($(this).val())==''){
					suggest();//显示热门城市列表
				}
			});
			$input.click(function(){
				var q=$.trim($(this).val());
				//displayItems(q);
				suggest();
				//$(this).select();
			});
						
			// help IE users if possible
			try {
				$results.bgiframe();
			} catch(e) { }

			$input.keyup(processKey);//
			
			function resetPosition() {
				// requires jquery.dimension plugin
				var offset = $input.offset();
				$results.css({
					top: (offset.top + input.offsetHeight) + 'px',
					left: offset.left + 'px'
				});
			}
			
			function clearContainer(){
				$(options.dataContainer).val('');
				$(options.extendContainer).val('');
				//当真实值改变时调用回调函数
				eval(options.callBack);
			}
			
			function processKey(e) {
				
				// handling up/down/escape requires results to be visible
				// handling enter/tab requires that AND a result to be selected
				if ((/27$|38$|40$/.test(e.keyCode) && $results.is(':visible')) ||
					(/^13$|^9$/.test(e.keyCode) && getCurrentResult())) {

		            if (e.preventDefault)
		                e.preventDefault();
					if (e.stopPropagation)
		                e.stopPropagation();

	                e.cancelBubble = true;
	                e.returnValue = false;
				
					switch(e.keyCode) {
	
						case 38: // up
							prevResult();
							break;
				
						case 40: // down
							nextResult();
							break;
						case 13: // return
							if($input.val().length > prevLength) {
								prevLength = $input.val().length;
								suggest();
								break;
							} else {
								selectCurrentResult();
								break;
							}
						case 27: //	escape
							$results.hide();
							//$('#'+options.frame).hide();
							break;
					}
					
				} else if ($input.val().length != prevLength) {
					
					if (timeout) 
						clearTimeout(timeout);
					timeout = setTimeout(suggest, options.delay);
					prevLength = $input.val().length;
					
				}			
				
			}
			
			function suggest() {
			
				var q = $.trim($input.val());
				
				if(q == ''){
					if(options.isHotPanel == 'false'){//热门城市遍历
						if(options.hot_list.length > 0)
							displayItems('');
						else{
							$.post(options.source, {q: q}, function(result) {
								
								addToCache(q, result, result.length);
								
								displayItems(result);
							});
						}
					}
				}else{
					cached = checkCache(q);
					if(cached){
						displayItems(cached['items']);
					}else{
						$.post(options.source, {q: q}, function(result) {
							
							addToCache(q, result, result.length);
							
							displayItems(result);
						});
					}
				}
				
				//displayItems(q);
			}
			
			function displayItems(result) {
				var html = '';
				clearContainer();
				
				if(result == ''&&options.hot_list.length > 0){
					
					for(var h=0;h<options.hot_list.length;h++){
						if(h != 'remove')
							html+='<li rel="'+options.hot_list[h][0]+'" extend="'+options.hot_list[h][4]+'"><a href="#'+h+'"><span>'+options.hot_list[h][2]+'</span>'+options.hot_list[h][1]+'</a></li>';
					}
					if(options.tip!=''){
						if(options.tip.indexOf('请输入')>-1){
							html='<div class="gray ac_result_tip">'+options.tip+'</div><ul>'+html+'</ul>';
						}else{
							html='<div class="gray ac_result_tip">请输入'+options.tip+'</div><ul>'+html+'</ul>';
						}
						
					}

					show(html);
				}else{
					
					var data = eval('('+result+')');
					for (var i = 0; i < data.length; i++) {
						
						if(data[i].py == null || data[i].py == ""){
							data[i].py = " ";
						}
						var extend = "";
						if(typeof(data[i].extend)!="undefined"){
							extend = data[i].extend;
						}
						html += '<li rel="' + data[i].value + '" extend="'+extend+'" ><a href="#' + i + '"><span>' + data[i].py + '</span>' + data[i].name + '</a></li>';
					}

					if (html == '') {
						suggest_tip = '<div class="gray ac_result_tip">对不起，找不到：' + $.trim($input.val()) + '</div>';
					}else if($.trim($input.val())==''){
						if(options.tip.indexOf('请输入')>-1){
							suggest_tip = '<div class="gray ac_result_tip">'+options.tip+'</div>';
						}else{
							suggest_tip = '<div class="gray ac_result_tip">请输入'+options.tip+'</div>';
						}
						
					}else{
						suggest_tip = '<div class="gray ac_result_tip">' + $.trim($input.val());
						
						if(options.inputTip!=null){
							suggest_tip = suggest_tip +"，"+options.inputTip;
						}
						suggest_tip = suggest_tip +'</div>';
					}
					html = suggest_tip + '<ul>' + html + '</ul>';
					
					show(html);
				}
				
			}
			
			function show(html){
				
				$results.html(html).show();
				$results.bgiframe();
				$results.children('ul').children('li:first-child').addClass(options.selectClass);
				
				$results.children('ul')
					.children('li')
					.mouseover(function() {
						$results.children('ul').children('li').removeClass(options.selectClass);
						$(this).addClass(options.selectClass);
					})
					.click(function(e) {
						e.preventDefault(); 
						e.stopPropagation();
						selectCurrentResult();
					});
				//$('#'+options.frame).height($results.height());
				//$('#'+options.frame).show();
				// 未矫正位置
				resetPosition();
			}
			
			function addToCache(q, items, size) {

				while (cache.length && (cacheSize + size > options.maxCacheSize)) {
					var cached = cache.pop();
					cacheSize -= cached['size'];
				}

				cache.push({
					q: q,
					size: size,
					items: items
					});

				cacheSize += size;

			}
			
			function checkCache(q) {

				for (var i = 0; i < cache.length; i++)
					if (cache[i]['q'] == q) {
						cache.unshift(cache.splice(i, 1)[0]);
						return cache[0];
					}

				return false;

			}
			
			function getCurrentResult() {
			
				if (!$results.is(':visible'))
					return false;
			
				var $currentResult = $results.children('ul').children('li.' + options.selectClass);
				if (!$currentResult.length)
					$currentResult = false;
					
				return $currentResult;

			}
			
			/**
			 * 检查输入的信息是否存在联想信息中
			 * @returns
			 */
			function checkInput(inputValue){
				$currentResult = getCurrentResult();
				if($currentResult!=false){
					$currentResult = $currentResult.children('a');
					var py = $currentResult.children('span').html();
					var displayName = $currentResult.html().replace(/<span>.*?<\/span>/i,'');
					if(displayName==inputValue||py==inputValue){
						return true;
					}
				}
				
				return false;
			}
			
			function selectCurrentResult() {
			
				$currentResult = getCurrentResult();
				if ($currentResult) {
					$input.val($currentResult.children('a').html().replace(/<span>.*?<\/span>/i,''));
					$results.hide();
					//$('#'+options.frame).hide();
					
					if( $(options.dataContainer) ) {
						$(options.dataContainer).val($currentResult.attr('rel'));
						$(options.extendContainer).val($currentResult.attr('extend'));
					}
	
					if (options.onSelect) {
						options.onSelect.apply($input[0]);
					}
					//当真实值改变时调用回调函数
					eval(options.callBack);
					
				}
				
				prevLength = $input.val().length;
			
			}
			
			function nextResult() {
			
				$currentResult = getCurrentResult();
			
				if ($currentResult)
					$currentResult
						.removeClass(options.selectClass)
						.next()
							.addClass(options.selectClass);
				else
					$results.children('ul').children('li:first-child').addClass(options.selectClass);
			
			}
			
			function prevResult() {
			
				$currentResult = getCurrentResult();
			
				if ($currentResult)
					$currentResult
						.removeClass(options.selectClass)
						.prev()
							.addClass(options.selectClass);
				else
					$results.children('ul').children('li:last-child').addClass(options.selectClass);
			
			}
	
		}
		
		$.fn.suggest = function(source, options) {
		
			if (!source)
				return;
		
			options = options || {};
			options.source = source;
			options.hot_list=options.hot_list || [];
			options.delay = options.delay || 0;
			options.resultsClass = options.resultsClass || 'ac_results';
			options.selectClass = options.selectClass || 'ac_over';
			options.matchClass = options.matchClass || 'ac_match';
			options.minchars = options.minchars || 1;
			options.delimiter = options.delimiter || '\n';
			options.onSelect = options.onSelect || false;
			options.callBack = options.callBack || 'suggestCallBack()';
			options.dataDelimiter = options.dataDelimiter || '\t';
			options.dataContainer = options.dataContainer || '#SuggestResult';
			options.extendContainer = options.extendContainer || null;
			options.attachObject = options.attachObject || null;
			options.tip = options.tip || '中文/拼音';
			options.inputTip = options.inputTip||null;
			options.select = options.select || null;
			options.disable = options.disable || 'false';
			options.selectTop = options.selectTop || 'true';
			options.resultStyle = options.resultStyle || null;
			options.isHotPanel = options.isHotPanel || 'false';
			
			//支持选中某个数据项
			if(options.select != null){
				var $input = $(this).attr("autocomplete", "off");

				$.post(options.source, {value: options.select}, function(result) {
					var data = eval('('+result+')');
					for (var i = 0; i < data.length; i++) {
						$(options.dataContainer).val(data[i].value);
						if(typeof(data[i].extend)!=undefined){
							$(options.extendContainer).val(data[i].extend);
						}
						
						$input.val(data[i].name);
					}
				});
			}
			
			//为true时表示只读
			if(options.disable=='false'){
				this.each(function() {
					new $.suggest(this, options);
				});
			}
			
	
			return this;
			
		};
		
		$.fn.bgIframe = $.fn.bgiframe = function(s) {
			if ($.browser.msie && /IE 6.0/.test(navigator.userAgent)) {
				s = $.extend({
					top : 'auto',
					left : 'auto',
					width : 'auto',
					height : 'auto',
					opacity : true,
					src : 'javascript:false;'
				}, s || {});
				var prop = function(n) {
					return n && n.constructor == Number ? n + 'px' : n;
				}, html = '<iframe class="bgiframe"frameborder="0"tabindex="-1"src="'
						+ s.src
						+ '"'
						+ 'style="display:block;position:absolute;z-index:-1;'
						+ (s.opacity !== false ? 'filter:Alpha(Opacity=\'0\');'
								: '')
						+ 'top:'
						+ (s.top == 'auto' ? 'expression(((parseInt(this.parentNode.currentStyle.borderTopWidth)||0)*-1)+\'px\')'
								: prop(s.top))
						+ ';'
						+ 'left:'
						+ (s.left == 'auto' ? 'expression(((parseInt(this.parentNode.currentStyle.borderLeftWidth)||0)*-1)+\'px\')'
								: prop(s.left))
						+ ';'
						+ 'width:'
						+ (s.width == 'auto' ? 'expression(this.parentNode.offsetWidth+\'px\')'
								: prop(s.width))
						+ ';'
						+ 'height:'
						+ (s.height == 'auto' ? 'expression(this.parentNode.offsetHeight+\'px\')'
								: prop(s.height)) + ';' + '"/>';
				return this.each(function() {
					if ($('> iframe.bgiframe', this).length == 0)
						this.insertBefore(document.createElement(html),
								this.firstChild);
				});
			}
			return this;
		};
		
	})(jQuery);