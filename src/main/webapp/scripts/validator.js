/**
 * 实时计算剩余汉字数
 * @param obj
 * @param totalCount
 * @param showCountId
 */
function changeMemo(obj, totalCount, showCountId) {
	var text = obj.value;
	var total = totalCount;
	var count = total-text.length;
	if(count<=0) {
		count = 0;
		obj.value = text.substring(0,totalCount);
		obj.scrollTop = obj.scrollHeight;
	}
	$("#"+showCountId).html("您还可以输入<span style='color:red'>"+count+"字</span>");
}
function cleanHtml(obj, totalCount, hidCountId){
	changeMemo(obj, totalCount, hidCountId);
	$("#"+hidCountId).empty();
}
//把字符型数字转换成可以计算的数字
function numberFormat(value){
	return Number($.trim(value));
}