var output;
var sessionusername;
var sessionpassword;
var sessionmoney;
function lval(){
	var x=document.getElementById("usname").value;
	var z = document.signup.Password.value;
	if(sessionpassword!=z||sessionusername!=x){
		 document.getElementById("warning1").innerHTML=sessionusername;
	}
	
}
function username(){
	var x=document.getElementById("usname").value;
	sessionusername=x;
}
function passwordValidation(){
	document.getElementById("warning1").innerHTML="";
	var x = document.getElementById("pwd").value;
	var y = document.getElementById("confirmpwd").value;
	if(x!=y){
	output="*Password and Confirmed Password don't match, please match the passwords!";
		 document.getElementById("warning1").innerHTML=output;
	return false;
	}
	else{
		
	return true;
		sessionpassword=y;
	}
}
function phone_validation(){
	document.getElementById("warning2").innerHTML="";
	var x = document.getElementById("mobphone").value;
if(x==""||isNaN(x))
	{
	document.getElementById("warning2").innerHTML="*Please fill the phone number!";
		return false;
	}
	else if(x.length!=13){
		document.getElementById("warning2").innerHTML="*Phone number supposed to be 13 digits!";
		return false;
	}	
	else{
		return true;
	}

}
function clean(){
	var txt="tyty";
	document.getElementByName("birth").innerHTML=txt;
}

function validate_email()
{
	document.getElementById("warning3").innerHTML="";
	    output="";
		var email = document.getElementById("imel");
		var value=email.value;
		apos=value.indexOf("@");
		dotpos=value.lastIndexOf(".");
		if (apos<1||dotpos-apos<2) 
		  {
			   output="*Email is not correct";
			  document.getElementById("warning3").innerHTML = output
			  return false;
		  }
		else {
			
		    
			return true;
		}

}

function validateDateFormat(thi)  
{  
    var dateStr=thi.value;  
    var expireDateCode = validateYYYYMMDD(dateStr);   
    if(expireDateCode!='success')  
    {  
        alert(getErrorMsg(expireDateCode,'','YYYY-MM-DD'));  
    }  
    else  
    {  
        dateStr=addHRToStr(dateStr);  
        alert(dateStr);  
    }  
}   
  
var success = 'success';         //校验成功  
var failure = 'failure';         //校验失败  
var dateStrNull = 'dateStrNull'; //日期字符串为空  
var formatError = "formatError"; //不符合格式  
var lengthLt8 = "lengthLt8";     //长度小于8  
var monthLT1  = 'monthLT1';    //月份不能小于1  
var monthGT12 = 'monthGT12';   //月份大于12  
var dayGT28 = 'dayGT28';       //日期大于28  
var dayGT29 = 'dayGT29';       //日期大于29  
var dayGT30 = 'dayGT30';       //日期大于30  
var dayGT31 = 'dayGT31';       //日期大于31  
var dayLT1 = 'dayLT1';         //日期小于1  
var hour24System = '24';       //采用24小时制  
var hour12System = '12';       //采用12小时制  
var hourGT23 = 'hourGT23';     //小时大于23  
var hourGT11 = 'hourGT11';     //小时大于11  
var minuteGT59 = 'minuteGT59'; //分钟大于59  
var secondGT59 = 'secondGT59'; //秒钟大于59  
var dateCompare = 'date';   //比较年月日  
var dateTimeCompare = 'dateTime'; //比较年月日或者时分秒或者所有  
var timeCompare = 'time';   //比较年时分秒  
var dateTimeGTNow = 'dateTimeGTNow';  //大于当前年月日或者时分秒或者所有  
var dateTimeLTNow = 'dateTimeLTNow';  //小于当前年月日或者时分秒或者所有  
var equality = 'equality';       //时间相等  
//时间格式的正则表达式  
var YYYYMMDDReg = /[\d]{4}[\/-]{1}[\d]{1,2}[\/-]{1}[\d]{1,2}/g;   
  
/**  
 * 校验是否为YYYY-MM-DD 日期格式  
 * @param dateStr 时间字符串  
 * @returns  
 */  
function validateYYYYMMDD(dateStr){  
    //如果日期字符串为空  
    if(strIsNull(dateStr)){  
        return dateStrNull;  
    }  
      
    if(dateStr.length < 8){  
        return lengthLt8;  
    }  
      
    dateStr = addHRToStr(dateStr);  
      
    var regResult = dateStr.replace(YYYYMMDDReg,'');  
      
    if(regResult==''){  
        var line_one = dateStr.indexOf('-');         
        var line_two = dateStr.lastIndexOf('-');   
      
        var year_str = dateStr.substring(0,line_one); 
        var month_str = dateStr.substring(line_one+1,line_two);  
        var day_str = dateStr.substring(line_two+1); 
          
        var year_num = getIntValue(year_str);  
        var month_num = getIntValue(month_str);  
        var day_num = getIntValue(day_str);  
            
        var monthResult = validateMonth(month_num);  
        if(monthResult!=success){  
            return monthResult;  
        }  
           
        if(day_num<1){  
            return dayLT1;  
        }  
        
        return validateDay(year_num,month_num,day_num);  
    }else{  
        return formatError;  
    }  
    return failure;  
}  
  
/**  
 * 添加横线到日期的格式  
 * @param oldStr  
 * @returns {String}  
 */  
function addHRToStr(oldStr){  
	
    if(oldStr.indexOf('-')>=0 || oldStr.indexOf('/')>=0){  
        return oldStr;  
    }  
      
    if(oldStr.length != 8 ){  
        return oldStr;  
    }  
      
    var idx1 = 4;  
    var idx2 = 6;  
      
    if(oldStr.length == 6){  
        idx2 = 5;  
    }else if(oldStr.length == 7){  
        idx2 = 6;  
    }  
      
    var newStr = oldStr.substring(0,4) + "-" + oldStr.substring(4,idx2) + "-" + oldStr.substring(idx2);  
    return newStr;  
}  
/**  
 * 校验是否大于当前时间(自动检测传入的时间格式)  
 * @param dateStr  
 * @returns  
 */  
function isMorethanNow(dateStr){  
    var result = 'equals';  
    
    if(dateStr.replace(YYYYMMDDReg,'')==''){  
        result = compareNow(dateStr,dateCompare);  
          
    }else if(dateStr.replace(YYYYMMDDHHmmssReg,'')==''){  
        result = compareNow(dateStr,dateTimeCompare);  
          
    }else if(dateStr.replace(YYYYMMDDHHmmReg,'')==''){  
        result = compareNow(dateStr+":59",dateTimeCompare);  
          
    }else if(dateStr.replace(HHmmssReg,'')==''){  
        result = compareNow(dateStr,timeCompare);  
      
    }else if(dateStr.replace(HHmmReg,'')==''){  
        result = compareNow(dateStr+":59",timeCompare);  
    }  
    
    if(result == dateTimeGTNow){  
        return 'true';  
    }else if(result == dateTimeLTNow){  
        return 'false';  
    }else{  
        return 'equals';  
    }  
}  
  
/**  
 * 比较当前的日期或者时间(日期,时间)  
 * @param dateStr  
 * @param compareType 比较方式 date,time,dateTime (默认比较年月日)  
 */  
function compareNow(dateStr,compareType){  
    
	if(strIsNull(compareType)){  
        compareType = dateCompare;  
    }  
  
    var now = new Date();  
    
    if(compareType == dateCompare){  
        var nowDate = new Date(now.getFullYear()+'/'+(now.getMonth()+1)+'/'+now.getDate());  
        var fd_date = new Date(dateStr.replace(/-/g,'/'));  
          
        if(fd_date>nowDate){  
            return dateTimeGTNow;  
        }else if(fd_date<nowDate){  
            return dateTimeLTNow;  
        }else{  
            return equality;  
        }  
    
    }else if(compareType == dateTimeCompare){  
        var fd_date = new Date(dateStr.replace(/-/g,'/'));  
          
        if(fd_date>now){  
            return dateTimeGTNow;  
        }else if(fd_date<now){  
            return dateTimeLTNow;  
        }else{  
            return equality;  
        }  
    
    }else if(compareType == timeCompare){  
        var nowTimeStr = now.getHours()+''+ now.getMinutes()+''+ now.getSeconds();  
        var dateStrNoSpace = dateStr.replace(/:/g,'');  
          
        if(dateStrNoSpace>nowTimeStr){  
            return dateTimeGTNow;  
        }else if(dateStrNoSpace<nowTimeStr){  
            return dateTimeLTNow;  
        }else{  
            return equality;  
        }     
    }  
}  
  
/**  
 * 校验月份是否合法  
 * @param month_num 月份  
 * @returns  
 */  
function validateMonth(month_num){  
    
	if(month_num>12){  
        return monthGT12;  
    }else if(month_num<1){  
        return monthLT1;  
    }  
    return success;  
}  
  
/**  
 * 校验日期是否合法  
 * @param year_num  年份  
 * @param month_num 月份  
 * @param day_num 日期  
 * @returns  
 */  
function validateDay(year_num,month_num,day_num){  
    if(day_num<1){  
        return dayLT1;  
          
    }else if((month_num==1||month_num==3||month_num==5||month_num==7  
            ||month_num==8||month_num==10||month_num==12)&&day_num>31){  
        return dayGT31;  
          
    }else if((month_num==4||month_num==6||month_num==9||month_num==11)  
            &&day_num>30){  
        return dayGT30;  
          
    }else if(month_num==2){  
    
    	if(isLeapYear(year_num)&&day_num>29){  
            return dayGT29;  
        }else if(day_num>28){  
            return dayGT28;  
        }  
    }  
    return success;  
}  
  
/**  
 * 校验是否为闰年  
 * @param year_num  
 * @returns  
 */  
function isLeapYear(year_num){  
  
    return year_num%4==0&&(year_num%100!=0||year_num%400==0);  
}  
  
/**  
 * 校验小时  
 * @param hourSys 小时制  
 * @param hour_num  
 * @returns  
 */  
function validateHour(hour_num,hourSys){  
    
	if(hourSys == hour24System&&hour_num > 23){  
        return hourGT23;  
      
    }else if(hourSys == hour12System&&hour_num > 11){  
        return hourGT11;  
    }  
    return success;  
}  
  
/**  
 * 校验分钟  
 * @param minute_num  
 * @returns  
 */  
function validateMinute(minute_num){  
    
	if(minute_num>59){  
        return minuteGT59;  
    }  
    return success;  
}  
  
/**  
 * 校验秒钟  
 * @param second_num  
 * @returns  
 */  
function validateSecond(second_num){  
    
	if(second_num>59){  
        return secondGT59;  
    }  
    return success;  
}  
  
/**  
 * 根据字符串获取整数值  
 * @param str  
 * @returns  
 */  
function getIntValue(str){  
    if(strIsNull(str)){  
        return 0;  
    }  
      
    return str.replace(/^0+/g,'');  
}  
  
/**  
 * 字符串是否为空  
 * @param dateStr  
 */  
function strIsNull(str){  
    if(str!=null  
            &&str.replace(/(^\s*)|(\s*$)/g,'').length>0){  
        return false;  
    }  
    return true;  
}  
  
/**  
 * 得到错误的提示信息  
 * @param errCode 错误码  
 * @param controlName 控件名  
 * @param format 格式   
 */  
function getErrorMsg(errCode,controlName,format){  
    if(errCode == dateStrNull){  
        return controlName+'Please fill the birthday';  
    }else if(errCode == formatError){  
        return controlName+'Please fill in\''+format+'\'format';  
    }else if(errCode == lengthLt8){  
        return controlName+'Please fill in\'YYYYMMDD\'format';  
    }else if(errCode == monthLT1){  
        return controlName+'Please enter the correct month';  
    }else if(errCode == monthGT12){  
        return controlName+'Month cannot exceed 12';  
    }else if(errCode == dayLT1){  
        return controlName+'Please enter the correct date';  
    }else if(errCode == dayGT28){  
        return controlName+'Please enter the correct date';  
    }else if(errCode == dayGT29){  
        return controlName+'Please enter the correct date';  
    }else if(errCode == dayGT30){  
        return controlName+'Please enter the correct date';  
    }else if(errCode == dayGT31){  
        return controlName+'Please enter the correct date';  
    }else if(errCode == hourGT23){  
        return controlName+'填写的小时有误,24小时制的小时数不能超过23';  
    }else if(errCode == hourGT11){  
        return controlName+'填写的小时有误,12小时制的小时数不能超过11';  
    }else if(errCode == minuteGT59){  
        return controlName+'填写的分有误,分钟数不能超过59';  
    }else if(errCode == secondGT59){  
        return controlName+'填写的秒有误,秒钟数不能超过59';  
    }else if(errCode == dateGTNow){  
        return controlName+'填写日期有误,不能大于当前日期';  
    }else if(errCode == dateLTNow){  
        return controlName+'填写日期有误,不能小于当前日期';  
    }else if(errCode == timeGTNow){  
        return controlName+'填写时间有误,不能大于当前时间';  
    }else if(errCode == timeLTNow){  
        return controlName+'填写时间有误,不能小于当前时间';  
    }else if(errCode == failure ){  
        return controlName+'Input error';  
    }  
}  
