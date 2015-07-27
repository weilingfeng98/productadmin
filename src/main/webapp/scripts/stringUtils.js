function StringBuffer() {
	this._things_ = new Array();
};
/**
 * JS 实现 类似 java StringBuffer 的append 方法
 * 
 * @param str
 * @return
 */
StringBuffer.prototype.append = function(str) {
	this._things_.push(str);
	return this;
};
/**
 * JS 实现 类似 java StringBuffer 的toString 方法
 * 
 * @return
 */
StringBuffer.prototype.toString = function() {
	return this._things_.join("");
};

String.prototype.startWith = function(str) {
	var reg = new RegExp("^" + str);
	return reg.test(this);
};
/**
 * 判断字符串是不是以str结尾
 * 
 * @param str
 * @return
 */
String.prototype.endWith = function(str) {
	var reg = new RegExp(str + "$");
	return reg.test(this);
};
/**
 * js中String 没有去掉空格的函数 因此必须自己定义 去掉String 两边的空格,(不去除字符串中间存在的空格)
 * 
 * @return String
 */

String.prototype.trim = function() {
	return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
};

/**
 * 去掉 String 左边的空格
 * 
 * @return String
 */

String.prototype.leftTrim = function() {
	return this.replace(/(^\s*)/g, "");
};

/**
 * 去掉 String 右边的空格
 * 
 * @return String
 */
String.prototype.rightTrim = function() {
	return this.replace(/(\s*$)/g, "");
};
/**
 * 
 * @param {}
 *            s1
 * @param {}
 *            s2
 * @return {}
 */
String.prototype.replaceAll = function(s1, s2) {
	return this.replace(new RegExp(s1, "gm"), s2);
}
/**
 * 是否为null,ture:null
 * 
 * @param {}
 *            str
 * @return {Boolean}
 */
function isNull(str) {
	if (null == str || "" == str.trim()) {
		return true;
	}
	return false;
};
String.prototype.strToJson = function(){
	if(isNull(this)){
		return null;
	}else{
		return eval( '('+this+')' );
	}
}
/**
 * 判断是否为数字
 * 
 * @param input
 * @returns {Boolean}
 */
function isNum(input) {
	var re = /^[0-9]+.?[0-9]*$/; // 判断字符串是否为数字
	if (!re.test(input)) {
		// alert("请输入数字(例:0.02)");
		return false;
	}
	return true;
};

/**
 * 判断是否是正整数
 * 
 * @param str
 * @return true :是，false 否
 */

function isPositiveInteger(str) {
	var res = /^[0-9]*[1-9][0-9]*$/;// 正整数
	if (res.test(str)) {
		return true;
	} else {
		return false;
	}
};
/**
 * 判断是否是大于等于0的整数()
 * 
 * @param str
 * @return true :是，false 否
 */
function isPositiveIntegerAnd0(str) {
	if( isNull(str) ){
		return false;
	}
	if(isNaN(str)){
		return false;
	}
	if(stopDay.split('.').length > 1){
		return false;
	}
	if(parseInt(stopDay) < 0){
		return false;
	}
	return true;
}
/**
 * 数组中不能有重复的元素
 * @param {} array1
 * 		数组1
 * @param {} array2
 * 		数组2
 * @param {} flag
 * 		true：数组下标对应的标识必须相同,false：具有相同的元素
 */
function arrayIsEquals(array1,array2,flag){
	if(array1==null && array2==null)
		return true;
	if(array1== undefined && array2== undefined)
		return true;
	if(array1.length!=array2.length)
		return false;
	if(flag){
		for(var i=0;i<array1.length;i++){
			if(array1[i]!=array2[i])
				return false;
		}
		return true;
	}else{
		var staticValue = '-';
		var map1 = new Map();		
		var map2 = new Map();
		for(var i=0;i<array1.length;i++){
			map1.put(array1[i],staticValue);
			map2.put(array2[i],staticValue);
		}
		if(map1.size()!=map2.size())
			return false;
		var temp = map1.keyArray();
		for(var i=0;i<temp.length;i++){
			if(map2.get(temp[i])!=staticValue)
				return false;
		}
		return true;
	}
}
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).format("yyyy-M-d h:m:s.S") ==> 2006-7-2 8:9:4.18
Date.prototype.format = function(fmt) { // author: meizz
	var o = {
		"M+" : this.getMonth() + 1, // 月份
		"d+" : this.getDate(), // 日
		"h+" : this.getHours(), // 小时
		"m+" : this.getMinutes(), // 分
		"s+" : this.getSeconds(), // 秒
		"q+" : Math.floor((this.getMonth() + 3) / 3), // 季度
		"S" : this.getMilliseconds()
		// 毫秒
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4
						- RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1)
							? (o[k])
							: (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}
