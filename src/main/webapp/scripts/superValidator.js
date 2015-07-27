//***********************************************************
//���ԭ����֤��ܽ��иĽ�
//ʹ��ʱ����Ҫ��Ҫ������֤�ı�ǩ����check����
//��check="1"��ʱ��,����¼��Ϊ��,���������ݾͰ�reg���԰󶨵������������֤.
//��check="2"��ʱ��,��ֱ�Ӱ���reg�󶨵�������ʽ������֤.
//������ϣ����ҽ�����,лл֧�� QQ6997467
//***********************************************************
//���������Ҫ��֤�ı�ǩ
var vlct; //��֤����
(function($){
	$(document).ready(function(){
		$('select[tip],select[check],input[tip],input[check],textarea[tip],textarea[check]').tooltip();
	});
})(jQuery);

(function($) {
    $.fn.tooltip = function(options){
		var getthis = this;
		vlct = getthis;
        var opts = $.extend({}, $.fn.tooltip.defaults, options);
		//������ʾ��
        //$('body').append('<table id="tipTable" class="tableTip"><tr><td class="leftImage"></td> <td class="contenImage" align="left"></td> <td class="rightImage"></td></tr></table>');
        $('body').append('<table id="tipTable" style="DISPLAY: none; FILTER: alpha(opacity=90); OVERFLOW: hidden; POSITION: absolute; BORDER-COLLAPSE: collapse; empty-cells: hide; opacity: 0.9">'
        				 +'<tr><td class="leftImage"></td> <td class="contenImage" align="left"></td> <td class="rightImage"></td></tr></table>');
		//�ƶ�������ظմ�������ʾ��
        $(document).mouseout(function(){$('#tipTable').hide()});
		
        this.each(function(){
            if($(this).attr('tip') != '')
            {
                $(this).hover(function(){//mouseover�޸�Ϊhover
                    $('#tipTable').css({left:$.getLeft(this)+'px',top:$.getTop(this)+'px'});
                    $('.contenImage').html($(this).attr('tip'));
                    $('#tipTable').fadeIn("fast");
                },
                function(){
                    $('#tipTable').hide();
                });
            }
            if($(this).attr('check') != '')
            {
                $(this).focus(function()
				{
                    $(this).removeClass('tooltipinputerr');
                }).blur(function(){
                    if($(this).attr('toupper') == 'true')
                    {
                        this.value = this.value.toUpperCase();
                    }
					if($(this).attr('check') != '')
					{
						if($(this).attr('check')=="1")
						{
							if($(this).attr('value')==null || $(this).attr('value')=='')
							{
								$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
							}else
							{
								var thisReg = new RegExp($(this).attr('reg'));
								if(thisReg.test(this.value))
								{
									$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
								}
								else
								{
									$(this).removeClass('tooltipinputok').addClass('tooltipinputerr');
								}
								
							}
						}
						if($(this).attr('check')=="2")
						{
							var thisReg = new RegExp($(this).attr('reg'));
								if(thisReg.test(this.value))
								{
									$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
								}
								else
								{
									$(this).removeClass('tooltipinputok').addClass('tooltipinputerr');
								}
						}			
					}
                    
                });
            }
        });
        //���ǵ��Ƕ����ҳ���submit���?���ʺ��ں�iframe���ύģʽ���˷�ʽ����ʽģʽ�����
        if(opts.onsubmit){}
    };

    $.extend({
        getWidth : function(object) {
            return object.offsetWidth;
        },

        getLeft : function(object) {
            var go = object;
            var oParent,oLeft = go.offsetLeft;
            while(go.offsetParent!=null) {
                oParent = go.offsetParent;
                oLeft += oParent.offsetLeft;
                go = oParent;
            }
            return oLeft;
        },

        getTop : function(object) {
            var go = object;
            var oParent,oTop = go.offsetTop;
            while(go.offsetParent!=null) {
                oParent = go.offsetParent;
                oTop += oParent.offsetTop;
                go = oParent;
            }
            return oTop + $(object).height()+ 5;
        },
        
        onsubmit : false
    });
    $.fn.tooltip.defaults = { onsubmit: false };
})(jQuery);


//ͨ����ʾ�������º�����������������֤
function btnSubmit(){
    var isSubmit = true;    
    vlct.each(function(){
	if($(this).attr('check')=="1")
	{
		if($(this).attr('value')==null || $(this).attr('value')=='')
		{	
			$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
		}else
		{
			var thisReg = new RegExp($(this).attr('reg'));
			if(thisReg.test(this.value))
			{
				$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
			}
			else
			{
				$(this).removeClass('tooltipinputok').addClass('tooltipinputerr');
				isSubmit = false;
			}
			
		}
	}
    if($(this).attr('check')=="2")
	{
		var thisReg = new RegExp($(this).attr('reg'));
		if(thisReg.test(this.value))
		{
			
			$(this).removeClass('tooltipinputerr').addClass('tooltipinputok');
		}
		else
		{
			$(this).removeClass('tooltipinputok').addClass('tooltipinputerr');
			isSubmit = false;
		}
	}
	});
	return isSubmit;
}


//***************************************************************************************************************************************************
//����JQuery���ܶԱ�ǩ�������ñ��ʽ
//����ı�ǩID�����Ϊ"name1:name2:name3"�м���':'�ָ�.


//��������Ҫ������֤�ı�ǩ��������������ʽ
function setIntegeCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^[1-9]\\d*$");
		}
	}
}

//��������Ҫ�����֤�ı�ǩ��������������ʽ
function setMoneyCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^(-)?(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$");
		}
	}
}

//��������Ҫ�����֤�ı�ǩ��������������ʽ
function setFloatCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^[0-9]+\\.[0-9]+$");
		}
	}
}

//��������Ҫ�����ʼ���֤�ı�ǩ��������������ʽ
function setMailCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$");
		}
	}
}

//��������Ҫ�ʱ���֤�ı�ǩ��������������ʽ
function setZipcodeCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^\\d{6}$");
		}
	}
}

//��������Ҫ�ֻ���֤�ı�ǩ��������������ʽ
function setMobileCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^(13|15|18)[0-9]{9}$");
		}
	}
}

//��������Ҫ���֤��֤�ı�ǩ��������������ʽ
function setIDCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^[1-9]([0-9]{14}|[0-9]{17})$");
		}
	}
}

//��������Ҫ��¼�ʺ���֤�ı�ǩ��������������ʽ
function setUserIDCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^\\w+$");
		}
	}
}

//��������Ҫ�ǿ���֤�ı�ǩ��������������ʽ
function setEmptyCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg",'.*\\S.*');
		}
	}
}

//��������Ҫ������֤�ı�ǩ��������������ʽ
function setChineseCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^[\\u4E00-\\u9FA5\\uF900-\\uFA2D]+$");
		}
	}
}

//��������ҪURL��֤�ı�ǩ��������������ʽ
function setURLCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+([\\w-./?%&=]*)?$");
		}
	}
}
//ƥ����ڵ绰����(0511-4405222 �� 021-87888822) 
function setTell(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","\\d{3}-\\d{8}|\\d{4}-\\d{7}");
		}
	}
} 
//ƥ����ڵ绰����(0511-4405222 �� 021-87888822) 
function setPhoneCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","/(^[0-9]{3,4}\-[0-9]{3,8}$)|(^[0-9]{3,8}$)|(^\([0-9]{3,4}\)[0-9]{3,8}$)|(^0{0,1}13[0-9]{9}$)/");
		}
	}
}  
//ƥ����ڵ绰����(0511-4405222 �� 021-87888822) 
function setPhoneAreaCheck(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^[0-9]{2,4}$");
		}
	}
}  
//�ж��Ƿ�Ϊ��,numΪָ������λ��
function setCharNumCheck(validatorString,num)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg",'^.{' + num +'}$');
		}
	}
}

////��ʱ������ڸ�ʽ�ж�
//var reg = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\d):[0-5]?\d:[0-5]?\d$/; 
function setDateTime(validatorString)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg","^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$");
		}
	}
}

/*function vlDateTime(strId){
	var strid=strId;
	var thisReg=new RegExp('^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$');

	if($("#"+strid).val()=='') 
	{
		alert('����ʱ�䲻��Ϊ��');
		$("#"+strid).focus();
		return false;
	}
	else if(!thisReg.test($("#"+strid).val())){
		alert('����ʱ���ʽ����ȷ,����!����2012-12-12 12:12');
		$("#"+strid).focus();
		return false;	
	}
}*/
function vlDateTime(validatorString){
	if(validatorString!="")
	{
		$("#"+validatorStrings[i]).attr("reg","^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$");
	}
}

/**
 * �ж��Ƿ�Ϊ��,numΪָ������λ��
 * @add by Lrain
 */ 
function setCharNumCheck(validatorString,num)
{
	var validatorStrings="";
	if(validatorString!="")
	{
		validatorStrings=validatorString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("reg",'^.{' + num +'}$');
		}
	}
}

/**
 * ����tip���� 
 * ����ı�ǩvalidatorString�����Ϊ"name1:name2:name3"�м���':'
 * ����ı�ǩtipString�����Ϊ"tip1:tip2:tip3"�м���':'
 * @add by Lrain
 */
function setTipAttr(validatorString,tipString){
	var validatorStrings="";
	var tipStrings="";
	if(validatorString!="")
	{
		filterEnpName(validatorString);
		validatorStrings=validatorString.split(":");
		tipStrings=tipString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("tip",tipStrings[i]);
		}
	}
}

/**
 * ����check���� 
 * ����ı�ǩvalidatorString�����Ϊ"name1:name2:name3"�м���':'
 * ����ı�ǩcheckString�����Ϊ"1:2:2"�м���':'
 * @add by Lrain
 */
function setCheckAttr(validatorString,checkString){
	var validatorStrings="";
	var checkValueStrings="";
	if(validatorString!="")
	{
		filterEnpName(validatorString);
		validatorStrings=validatorString.split(":");
		checkValueStrings=checkString.split(":");
		for(i=0;i<validatorStrings.length;i++)
		{
			$("#"+validatorStrings[i]).attr("check",checkValueStrings[i]);
		}
	}
}

function filterEnpName(validatorString){
	if(validatorString.indexOf("companyName") > -1|| validatorString.indexOf("companyId")> -1){
		$("#companyName").val('');
	}
}
//***************************************************************************************************************************************************