/**
 *	작성자 : 김경남 (knkim)
 *	최초 작성일 : 2016-08-19
 *	페이지명 : imax api 공통 함수 모음
 *	페이지 내용 : 다양하게 활용 가능한 기능 함수 모음
 */
var imaxFunc = {
	
	/**
	 * javascript 페이지 활성시 최초 실행 함수
	 * 이전 페이지의 parameter를 parsing 하여 json 형태로 페이지의 최초 실행 함수에 전달하여 준다
	 */
	initPage : function(){
		
	},

	
	/**
	 * 현재 페이지의 이름을 반환
	 * 반환형식 : string
	 * 호출방식 : 
	 * <pre>imaxFunc.thisPageName();</pre>
	 * 응용 : 각 업무 페이지에서 param값에 담겨 있는 이전페이지 전달 데이터를 가져올 때
	 * var previousData = eval("param." + imaxFunc.thisPageName());
	 * 
	 */

	thisPageName : function (inType){
		if(inType=="full"){
			var locationHref = location.href;
			var urlCutArray = locationHref.split('/');
			var urlFixList = [];
			$.each(urlCutArray.reverse(), function(index, value){
				imaxFunc.log("each >>>> index ["+index+"],  value ["+value+"]");
				if("clients"==value) return false;
				urlFixList.push(value);
			});
			var urlFix = urlFixList.reverse().join("/");
			urlFix = urlFix.replace(/\.html/g,''); //.html 문자 제거
			
			return urlFix; 
		}else{
			var thisPageURL = window.location.href;
			
			var slicedURL = thisPageURL.split("/");
			
			var pageNameURL = slicedURL[slicedURL.length-1].split(".");
			
			var pageNameIs = pageNameURL[0]
			
			console.log("현재 페이지 이름 : " + pageNameIs);

			return pageNameIs; 
		}
	},

	
	
	/**
	 * 파라미터 값이 비어있는 값인지 체크하여 비어있으면 true, 값이 있으면 false 를 반환 
	 * 
	 * <pre>
	 * imaxFunc.isEmpty(objForCheck);
	 * objForCheck : 체크할 파라미터
	 * </pre>
	 * 
	 * @param objForCheck
	 * @returns boolean
	 */
	isEmpty : function (objForCheck){
	    for(var prop in objForCheck){
	        if(objForCheck.hasOwnProperty(prop))
	            return false;
	    }    
	    return true;
	},
	
	
	/**
	 * 문자열의 총 바이트 계산 결과를 반환
	 * 
	 * <pre>
	 * <b>returnByte(str, size);</b>
	 * str : 계산할 문자열
	 * size : 한글 바이트 치환 기준 (예 : 2, 또는 3) 	
	 * </pre>
	 *  
	 * @param str 
	 * @param size 
	 * @returns {Number}
	 */
	returnByte: function(str, size) {
		var str_len = str.length;
		
		var rbyte = 0;
		var rlen = 0;
		var one_char = "";
		var str2 = "";
		
		for (var i = 0; i < str_len; i++) {
			one_char = str.charAt(i);
			if (escape(one_char).length > 4) {
				rbyte += size; //한글2Byte(프린트 영수증은 모두 2Byte로 계산)
//				rbyte += 3; //한글3Byte Oracle
			} else {
				rbyte++; //영문 등 나머지 1Byte
			}
		}
		
		//console.log("스트링 바이트 수 : "+rbyte);
		return rbyte;
	},
	
	
	/**
	 * 데이터가 <b>"null", undefined, null, ""</b> 인지 체크하고, 
	 * 만약 이에 해당된다면 주어진 형식으로 반환하고, 
	 * 해당되지 않는다면 원본 데이터의 문자열과 숫자형 또는 객체로 반환한다.
	 * 
	 * <pre>
	 * <b>isNull(checkData, defaultResult);</b>
	 * checkData : 확인 할 문자열 데이터 혹은 숫자형 데이터
	 * defaultResult : null에 해당할 때 기본 반환 형식 (예 : 0 또는 "")
	 * </pre>
	 * 
	 * checkData값이 숫자 0인경우 == "" 과 동일시 되기 때문에 해당 부분 수정
	 * 
	 * @param checkData
	 * @param defaultResult
	 * @returns
	 */
	isNull : function (checkData, dft){
		var defaultResult = imaxFunc.isEmpty(dft) ? '' : dft;
		var isNum = typeof checkData;
		if(isNum == "number") { //checkData가 숫자
			if(checkData == "null" || checkData == undefined || checkData == null || checkData==="" ){
				return defaultResult;
			} else {
				return parseInt(checkData);
			}
			
		} else if(isNum == "string") { //checkData가 문자
			if(checkData == "null" || checkData == undefined || checkData == null ){
				return defaultResult;
			} else {
				return checkData;
			}
			
		} else if(isNum == "object") { //checkData가 객체
			if(JSON.stringify(checkData) == "{}"){
			//if(Object.keys(checkData).length == 0){
				return defaultResult;
			} else {
				if(checkData == "null" || checkData == undefined || checkData == null ){
					return defaultResult;
				} else {
					return checkData;
				}
			}
			
		} else if(isNum == "undefined"){
			return defaultResult;
		} else {
			imaxFunc.log("[ 경고 ] : 주어진 (" + checkData + ") 데이터가 숫자도 문자도 객체도 아닙니다. null 여부를 체크할 수 없습니다!!");
			return checkData;
		}
	},
	
	
	
	/**
	 * 콘솔창 로그 출력 함수
	 * <pre>
	 * 테스트 모드의 여부에 따라 콘솔창에 로그를 출력/미출력
	 * </pre>
	 * 
	 * @param message
	 */
	log : function(){
		if(config.isTestMode()){
			if(arguments.length==1)
				console.log(arguments[0]);
			else{
				var args = [];
				for(var i=0; i<arguments.length; i++){
					args.push(arguments[i]);
				}
				console.log(args);
			}	
		}
	},
	
	
	/**
	 * 현재 날짜와 시간을 구함.
	 * date format : yyyy-mm-dd hh:mi:ss
	 */
	getDate : function(format){
		Date.prototype.format = function(f) {
		    if (!this.valueOf()) return " ";
		 
		    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
		    var d = this;
		     
		    return f.replace(/(yyyy|yy|mm|dd|e|24h|hh|mi|sss|ss|a\/p)/gi, function($1) {
		        switch ($1) {
		            case "yyyy": return d.getFullYear();
		            case "yy": return (d.getFullYear() % 1000).zf(2);
		            case "mm": return (d.getMonth() + 1).zf(2);
		            case "dd": return d.getDate().zf(2);
		            case "e": return weekName[d.getDay()];
		            case "24h": return d.getHours().zf(2);
		            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
		            case "mi": return d.getMinutes().zf(2);
		            case "sss": return d.getMilliseconds().zf(3);
		            case "ss": return d.getSeconds().zf(2);
		            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
		            default: return $1;
		        }
		    });
		};
		 
		String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
		String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
		Number.prototype.zf = function(len){return this.toString().zf(len);};
		return new Date().format(format);
	},

	
	/**
	 * 날짜 형식 변환
	 */
	dateFormat : function(date, format){
		if(imaxFunc.isEmpty(date)){
			return "";
		}else{
			Date.prototype.format = function(f) {
				if (!this.valueOf()) return " ";
				
				var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
				var d = this;
				
				return f.replace(/(yyyy|yy|mm|dd|e|24h|hh|mi|sss|ss|a\/p)/gi, function($1) {
					switch ($1) {
					case "yyyy": return d.getFullYear();
					case "yy": return (d.getFullYear() % 1000).zf(2);
					case "mm": return (d.getMonth() + 1).zf(2);
					case "dd": return d.getDate().zf(2);
					case "e": return weekName[d.getDay()];
					case "24h": return d.getHours().zf(2);
					case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
					case "mi": return d.getMinutes().zf(2);
					case "sss": return d.getMilliseconds().zf(3);
					case "ss": return d.getSeconds().zf(2);
					case "a/p": return d.getHours() < 12 ? "오전" : "오후";
					default: return $1;
					}
				});
			};
			
			// 날짜 형식에 맞게끔 변환
			date = imaxFunc.dateToHyphen(imaxFunc.isNull(date, ''));
			
			String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
			String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
			Number.prototype.zf = function(len){return this.toString().zf(len);};
			
			return new Date(date).format(format);
		}
	},
	
	
	/**
	 * 날짜 변환 (yyyymmdd > yyyy-mm-dd)
	 */
	dateToHyphen : function(date){
		date = imaxFunc.isNull(date, '').replace(/-/g, '').replace(/:/g, '').replace(/ /g, '');
		if(date.length == 6){
			return date.replace(/([0-9]{4})([0-9]{2})/, '$1-$2');
		} else if(date.length == 8){
			return date.replace(/([0-9]{4})([0-9]{2})([0-9]{2})/, '$1-$2-$3');
		} else if(date.length == 10){
			return date.replace(/([0-9]{4})([0-9]{2})([0-9]{2})([0-9]{2})/, '$1-$2-$3 $4');
		} else if(date.length == 12){
			return date.replace(/([0-9]{4})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})/, '$1-$2-$3 $4:$5');
		} else if(date.length == 14){
			return date.replace(/([0-9]{4})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})([0-9]{2})/, '$1-$2-$3 $4:$5:$6');
		} else {
			return date;
		}
	},
	
	/**
	 * 하이픈 제거
	 * 날짜 변환 (yyyy-mm-dd > yyyymmdd)
	 */
	delHyphen : function(data){
		return imaxFunc.isNull(data, '').replace(/-/gi, '');
	},
	
	/**
	 * 3자리수 마다 , (콤마) 넣어서 구분
	 * 숫자로 이루어진 문자열 또는 숫자가 아닌 경우 오류메시지 출력
	 * null값인 경우 "" 출력
	 */
	comma:function(data) {
		if($.isNumeric(imaxFunc.delComma(data))){
			str = String(imaxFunc.delComma(data));			
//			alert(data+" : 숫자다 변환하자");
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		} else if(!$.isNumeric(data)){
			return data;
		} else {
			return "";
		}
			
	},
	
	/**
	 * 콤마 제거
	 */
	delComma:function(data){
		var str = String(data);
		return str.replace(/,/g,'');
	},
	
	/**
	 * 휴대폰번호 유효성 체크
	 */
	phoneNumberCheck : function(inStr) {
		if(!imaxFunc.isEmpty(inStr)){
			var regExp = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
			if (!regExp.test(imaxFunc.delPhoneNumber(inStr))) {
				return false;
			}else{
				return true;
			}
		}else{
			return false;
		}
	},
	
	/**
	 * 전화번호 형식 변환
	 */
	phoneNumber : function phoneFomatter(num){
		num = imaxFunc.delPhoneNumber(num);
	    var formatNum = '';
	    
    	if(num.length==12){
    		formatNum = num.replace(/(\d{4})(\d{4})(\d{4})/, '$1-$2-$3');
    	}else if(num.length==11){
            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    	}else if(num.length==9){
    		formatNum = num.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
	    }else if(num.length==8){
	        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
	    }else if(num.length==7){
	    	formatNum = num.replace(/(\d{3})(\d{4})/, '$1-$2');
	    }else{
	        if(num.substring(0,2) == '02'){
	        	if(num.length==9){
	        		formatNum = num.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
	        	} else {
	        		formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
	        	}
	        }else{
                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
	        }
	    }
	    return formatNum;
	},
	
	

	
	/**
	 * 전화번호 형식 제거
	 */
	delPhoneNumber : function(num){
		var str = String(num);
		return str.replace(/-/g,'');
	},
	
	/**
	 * 현재 브라우저 종류 값 반환
	 */
	getBrowser : function(){
		var agent = navigator.userAgent.toLowerCase();
		var browser = '';
		if (Number(agent.indexOf('iphone')) > -1) {
	        browser = 'IOS';
	    } else if (Number(agent.indexOf('ipad')) > -1) {
	        browser = 'IOS';
	    } else if (Number(agent.indexOf('ipod')) > -1) {
			browser = 'IOS';
	    } else if (Number(agent.indexOf('android')) > -1) {
	        browser = 'ANDROID';
	    } else if (Number(agent.indexOf('windows phone')) > -1) {
	        browser = 'WINDOWSPHONE';
		} else {
			browser = 'BROWSER';
		}
		
		return browser;
	},
	
	/**
	 * 문자열 함축 
	 */
	cutString : function(inStr, cutSize){
		var cutStr = inStr;
		if(inStr.length > cutSize){
			cutStr = inStr.substr(0, cutSize) + '...';
		}
		return cutStr;
	},
	
	/**
	 * 부가세 계산
	 */
	getSurtax : function(price){
		if($.isNumeric(price)){
			return Math.round(price / 11);
		} else {
			return 'NOT CALCULATE'; 
		}
	},
	
	// 리스트에서 조건에 맞는 값 출력 (단일data)
	getListToData : function(option, list, resultKey){
		function condition(target){
			var t = '';
			Object.getOwnPropertyNames(option).forEach(function(val, index){
				if(index > 0){
					t += " && ";
				}
				t += 'target.' + val + ' == option.' + val;
			});
			return eval(t);
		};
		try {
			if(!imaxFunc.isEmpty(resultKey)){
				return eval('imaxFunc.isNull(list.find(condition).' + resultKey + ', "")');
			} else {
				return eval('imaxFunc.isNull(list.find(condition), "")');
			}
		} catch (e) {
			return '';
		}
	},
	
	// 리스트에서 조건에 맞는 값 출력 (다중data)
	getListToList : function(option, list, resultKey){
		function condition(target){
			var t = '';
			Object.getOwnPropertyNames(option).forEach(function(val, index){
				if(index > 0){
					t += " && ";
				}
				t += 'target.' + val + ' == option.' + val;
			});
			return eval(t);
		};
		try {
			return eval('imaxFunc.isNull(list.filter(condition), [])');
		} catch (e) {
			return '';
		}
	},
	
	// 리스트에서 조건에 맞는 값 출력 (단일data)
	getListToIndex : function(option, list){
		function condition(target){
			var t = '';
			Object.getOwnPropertyNames(option).forEach(function(val, index){
				if(index > 0){
					t += " && ";
				}
				t += 'target.' + val + ' == option.' + val;
			});
			return eval(t);
		};
		try {
			return eval('imaxFunc.isNull(list.findIndex(condition), "")');
		} catch (e) {
			return '';
		}
	},
	
	/**
	 * 두자릿수 수에서 숫자가 한자리 인겨우 앞에 0을 붙여준다. (예 : 2 => 02 )
	 * @param i
	 * @returns {String}
	 */
	checkTime : function (i) {
        if (i < 10) {
            i= "0" + i;
        }
        i += "";
        return i;
    },
    
    
    /**
     * 로컬 또는 세션에 저장
	 * @param inType 로컬스토리지 "L", 셔센스토리지 "S"
	 * @param inObjName 스토리지에 저장할 JSON 객체 이름
	 * @param inObj 저장할 JSON 객체
     */
    setStorageJson : function (inType, inObjName, inObj){
		var retrunStorage = false;
		
    	if(inType=="L"){
    		localStorage.setItem(inObjName, JSON.stringify(inObj));
    		retrunStorage = true;
		}else{
			sessionStorage.setItem(inObjName, JSON.stringify(inObj));
			retrunStorage = true;
		}
    	
    	return retrunStorage;
    },
    
    
    /**
     * 로컬 또는 세션 가져오기
	 * @param inType 로컬스토리지 "L", 셔센스토리지 "S"
	 * @param inObjName 스토리지에서 가져올 JSON 객체 이름
     */
    getStorageJson : function (inType, inObjName){
    	var retrunStorage = null;

    	if(inType=="L"){
    		if(imaxFunc.isNull(localStorage.getItem(inObjName)) != ''){
                retrunStorage = JSON.parse(localStorage.getItem(inObjName));
            }
		}else{
            if(imaxFunc.isNull(sessionStorage.getItem(inObjName)) != ''){
                retrunStorage = JSON.parse(sessionStorage.getItem(inObjName));
            }
		}
    	
    	return retrunStorage;
    },

    
    /**
     * 로컬 또는 세션 삭제
	 * @param inType 로컬스토리지 "L", 셔센스토리지 "S"
	 * @param inObjName 스토리지 삭제할 JSON 객체 이름
     */
    removeStorageJson : function (inType, inObjName){
    	var retrunStorage = false;
		
    	if(inType=="L"){
    		localStorage.removeItem(inObjName);
    		retrunStorage = true;
		}else{
			sessionStorage.removeItem(inObjName);
			retrunStorage = true;
		}
    	
    	return retrunStorage;
    },
    
    
    /**
	 * 로컬 또는 세션에 저장된 원하는 JSON의 특정 키의 값을 설정한 값으로 변경 후 다시 세션설정
	 * @param inType 로컬스토리지 "L", 셔센스토리지 "S"
	 * @param inObjName 셔센스토리지에 있는 JSON 객체 이름
	 * @param inKey 대상 키
	 * @param inValue 변경할 값
	 */
	setStorageJsonKey : function (inType, inObjName, inKey, inValue){
		var copyObject = "";
		if(inType=="L"){
			copyObject = JSON.parse(localStorage.getItem(inObjName));
		}else{
			copyObject = JSON.parse(sessionStorage.getItem(inObjName));
		}
		
		if(imaxFunc.isNull(copyObject, null)!=null){ //스토리지의 null이 스트링의 null이니 주의
			copyObject[inKey] = inValue;
			
			if(inType=="L"){
				localStorage.setItem(inObjName, JSON.stringify(copyObject));
			}else{
				sessionStorage.setItem(inObjName, JSON.stringify(copyObject));
			}
			return true;
		}else{
			imaxFunc.log('재구성할 오브젝트가 스토리지에 없습니다');
			return false;
		}
	},
    
	
	/**
	 * 세션에 저장된 원하는 JSON의 특정 키의 값을 가져온다
	 * @param inType 로컬스토리지 "L", 셔센스토리지 "S"
	 * @param inObjName 셔센스토리지에 있는 JSON 객체 이름
	 * @param inKey 대상 키
	 */
	getStorageJsonKey : function (inType, inObjName, inKey){
		var copyObject = "";
		if(inType=="L"){
			copyObject = JSON.parse(localStorage.getItem(inObjName));
		}else{
			copyObject = JSON.parse(sessionStorage.getItem(inObjName));
		}
		
		var getKeyValue = null;
		if(imaxFunc.isNull(copyObject, null)!=null){ //스토리지의 null이 스트링의 null이니 주의
			getKeyValue = copyObject[inKey];
			if(imaxFunc.isNull(getKeyValue, null)!=null){
				return getKeyValue;
			}else{
				return null;
			}
		}else{
			imaxFunc.log('재구성할 오브젝트가 스토리지에 없습니다');
			return null;
		}
	},
	
	
	/**
	 * JSON에 빈값을 가지는 키값 검사
	 */
	checkVal : function(inData){
		if(inData==""||inData=="null"||inData==null||inData==undefined){
			alert("키갑 검사 대상이 빈값입니다");
			return false;
		}else if(typeof inData != "object"){
			alert("키갑 검사 대상이 빈값입니다");
			return false;
		}
			
		var reKey = true;
		var reMsg = "";
		$.each(inData, function(key, val) {
			if((val===""||val==="null"||val===null||val===undefined) && key!="printData"){
				reKey = false;
				reMsg = "["+key+"] 키의 값이 없습니다";
			}
		}); 
		
		if(!reKey) alert(reMsg);
		return reKey;
	},
	
	
	/**
	 * 파라미터의 자료형식을 알려준다
	 * 
	 * privateFunc.whatIsIt2(null)
	 *   ㄴ "null"
	 * privateFunc.whatIsIt2("null")
	 *   ㄴ "string"
	 * privateFunc.whatIsIt2(234)
	 *   ㄴ "number"
	 * privateFunc.whatIsIt2(true)
	 *   ㄴ "boolean"
	 * privateFunc.whatIsIt2({})
	 *   ㄴ "Object"
	 * privateFunc.whatIsIt2(function(){})
	 *   ㄴ "function"
	 * privateFunc.whatIsIt2([])
	 *   ㄴ "array"
	 * privateFunc.whatIsIt2([1,2,3,4,5,])
	 *   ㄴ "array"
	 * privateFunc.whatIsIt2({"aa":"bb"})
	 *   ㄴ "json"
	 * privateFunc.whatIsIt2(undefined)
	 *   ㄴ "undefined"  
	 */
	whatIsIt : function (object) {
		if (object === null) return "null";

		var arrayConstructor = [].constructor;
		var typeofParam = typeof object;
		if(typeofParam == "object"){
			if(object.constructor === arrayConstructor){
				return "array"
			}else if(Object.keys(object).length>0){
				return "json"
			}else{
				return "object"
			}
		}else{
			return typeofParam;
		}
	},
	
	/**
	 * 문자열에 2번째자리의 문자를 *로 바꾼다.
	 * securitySecond("1234567") ==> 1*34567
	 * @param String 문자열
	 * @param Number 자릿수
	 * @returns String
	 */
	securitySecond : function (str){
		str = $.trim(str);
		var str1 = str.substr(0, 1);
		return str1+"*"+str.substr(2);
	},
	
	/**
	 * 문자열에 n자리 이후에 있는 모든 문자를 *로 바꾼다.
	 * securityStr("1234567", 3) ==> 123****
	 * @param String 문자열
	 * @param Number 자릿수
	 * @returns String
	 */
	securityStr : function (str, size){
		str = $.trim(str);
		var str1 = str.substr(0, size);
		var str2 = str.substr(size);
		var securityIcon = "";

		for (var int = 0; int < String(str2).length; int++) {
			securityIcon = securityIcon+"*";
		}
		return str1+securityIcon;

		//참고용
		//"12345".substring("12345".length-4, "12345".length)
		//"12345678".substring(0, "12345678".length-4)
	},
	
	/**
	 * 문자열 뒤에서 5글자를 * 처리
	 * securityStr("1234567", 3) ==> 1234***
	 * @param String 문자열
	 * @param Number 자릿수
	 * @returns String
	 */
	securityStrFive : function (str){
		str = $.trim(str);
		var pattern = /.{5}$/; // 정규식
		return str.replace(pattern, "*****"); 
//		return str.replace(/[a-z0-9_-]/gi, "*"); 전부
	},
	
	/**
	 * 문자열에 첫글자와 끝글자 중앙 글자를 모두 *로 바꾼다.
	 * securityCenter("1234567") ==> 1*****7
	 * @param String 문자열
	 * @param Number 자릿수
	 * @returns String
	 */
	securityCenter : function (str){
		str = $.trim(str);
		var str1 = str.substr(0, 1);
		var str2 = str.substr(String(str).length-1);
		var securityIcon = "";

		for (var int = 0; int < String(str).length-2; int++) {
			securityIcon = securityIcon+"*";
		}
		return str1+securityIcon+str2;
	},
	
	
	
	
	
	// 숫자 3자리 콤마 추가, 제거(string)
	// null 체크 (string, defaultResult)		--isNull
	// null 체크 (int, defaultResult)			--isNull
	// 날짜 형식 변환(string, format)
	// 숫자 to 문자(int, string, defaultResult)	
	// 문자 to 숫자(string)	
	// 브라우저 체크
	// 테스트 모드 체크
	// 전화번호 형식 변환(string)
	// 전화번호 유효성체크(string, type)
	// byte 길이 계산(string, byteLength)
	// date 반환(format)					--returnByte
	// 날짜 계산(fromDate, toDate)	
	// 워킹데이 산출(fromDate, day)
	// 문자 유효성 검사(string, type)
	// 오늘 날짜 반환(string, format)
	// 특정 문자 치환(string, replace)
	// 카드 번호 비밀화(string)
	// 전화 번호 비밀화(string)
	// 페이지 오픈(session storage사용)
	// history 관리
	// 버전관리
	// 주소(address, loadAddress) 클릭 이벤트에 따른 스위칭
	// 로그인 정보
	// 스와이핑 기능 포맷
	// 안드로이드 백키 설정
	// 로컬 스토리지 관리 : 스토리지 리스트, 저장, 읽기, 삭제
	// 세션 스토리지 관리 : 스토리지 리스트, 저장, 읽기, 삭제
	
	/**
	 * 조건에 따른 입력값 세팅 함수 : 숫자만 세팅한다
	 * 
	 * 아래 함수를 사용하기 위해서는 keyObj 키보드 입력 제한 전용으로 사용 될 객체 변수가 있어야 한다.
	 * 그 이유는 input number type일 경우 '333-', '333.' 과 같이 입력하는 경우 현재 값을 가져오게 되면 빈값이 오기 때문에
	 * 이전 값을 다시 세팅해줄 수가 없다.
	 */
	reInputSetOnlyNum : function (that, keyCode){
		var thatId = $(that).attr("id");
		var oldVal = imaxFunc.keyObj[thatId]; //이전값을 가져온다
		imaxFunc.log("thatId : ["+thatId+"], oldVal : ["+oldVal+"]");
		
		var thisVal = $(that).val();
		var thisValStr = String(thisVal);
		imaxFunc.log("that ID : ["+$(that).attr("id")+"]");
		imaxFunc.log("thisVal : ["+thisVal+"], thisValStr : ["+thisValStr+"]");

		/* 백스페이스 키코드는 8이다
		 * 백스페이스의 경우엔 이전 값을 세팅해주는 부분을 제외해야 한다. 
		 * 왜냐하면 마지막 글자까지 다 지운경우 이전값이 세팅되는 오류가 발생하기 때문이다.
		 * replace를 하지 않는 이유는 이전값은 숫자만 이루어졌을 것이라는 가정하여 진행하였다 */
		if(keyCode!='8'){
			/* '.' 찍고 아래 다시 세팅을 해준다고 해도 값이 똑같으면
			 * '.'이 사라지지 않기 때문에 리셋을 먼저 해준다 */
			$(that).val("");
			
			if(imaxFunc.isNull(thisValStr, "")!="" && $.isNumeric(thisValStr)){
				var reVal = Number(thisValStr.replace(/[^0-9]/g,''));
				imaxFunc.log("dd : ["+reVal+"]");
				imaxFunc.keyObj[thatId] = reVal;
				$(that).val(reVal);
			}else{
				imaxFunc.log("ff");
				$(that).val(imaxFunc.isNull(oldVal, ""));
			}
		}else{
			imaxFunc.keyObj[thatId] = thisVal;
		}
	},
	
	/*
	 * reInputSetOnlyNum 과 동일하되, 리턴시 숫자화(Number) 처리 없이 리턴 (0 입력 가능) 
	 * */
	reInputSetOnlyNumStr : function (that, keyCode){
		var thatId = $(that).attr("id");
		var oldVal = imaxFunc.keyObj[thatId]; //이전값을 가져온다
		imaxFunc.log("thatId : ["+thatId+"], oldVal : ["+oldVal+"]");
		
		var thisVal = $(that).val();
		var thisValStr = String(thisVal);
		imaxFunc.log("that ID : ["+$(that).attr("id")+"]");
		imaxFunc.log("thisVal : ["+thisVal+"], thisValStr : ["+thisValStr+"]");

		/* 백스페이스 키코드는 8이다
		 * 백스페이스의 경우엔 이전 값을 세팅해주는 부분을 제외해야 한다. 
		 * 왜냐하면 마지막 글자까지 다 지운경우 이전값이 세팅되는 오류가 발생하기 때문이다.
		 * replace를 하지 않는 이유는 이전값은 숫자만 이루어졌을 것이라는 가정하여 진행하였다 */
		if(keyCode!='8'){
			/* '.' 찍고 아래 다시 세팅을 해준다고 해도 값이 똑같으면
			 * '.'이 사라지지 않기 때문에 리셋을 먼저 해준다 */
			$(that).val("");
			
			if(imaxFunc.isNull(thisValStr, "")!="" && $.isNumeric(thisValStr)){
				//var reVal = Number(thisValStr.replace(/[^0-9]/g,''));
				var reVal = thisValStr.replace(/[^0-9]/g,'');
				imaxFunc.log("dd : ["+reVal+"]");
				imaxFunc.keyObj[thatId] = reVal;
				$(that).val(reVal);
			}else{
				imaxFunc.log("ff");
				$(that).val(imaxFunc.isNull(oldVal, ""));
			}
		}else{
			imaxFunc.keyObj[thatId] = thisVal;
		}
	},

	/**
	 * 키보드 키 입력제한에 사용되는 전용 객체 변수
	 */
	keyObj : {},
	
	/**
	 * 기기의 세션을 mFinity에서 체크받음.
	 */
	getCheckSession : function(){
		imaxFunc.log('>> getCheckSession function started!!');
		if(config.getSessionCheckFlag()){
			config.setSessionCheckFlag(false);
			imaxFunc.log('>> config.getSessionCheckFlag : ' + config.getSessionCheckFlag());
			mfnp.getCheckSession('imaxFunc.getCheckSessionCB', 'getCheckSession');
		}
	},
	
	/**
	 * 기기의 세션 체크 콜백 함수
	 */
	getCheckSessionCB : function(userSpec, result){
		console.log('>> imaxFunc.getCheckSessionCB function started!!');
//		console.log('>> imaxFunc.getCheckSessionCB userSpec : ' + userSpec);
		console.log('>> imaxFunc.getCheckSessionCB result : ' + result);
		
		if (result != null)
		{
			switch (decodeURIComponent(userSpec)){
			case 'getCheckSession':
				result  = JSON.parse(decodeURIComponent(result) );
				if(result.V0 == "True"){ 
					console.log(" >> 세션 인증 성공");
				}
				else if(result.V0 == "False"){
					imaxUI.showNewPopup({
						header: "세션종료",
						body: "세션이 종료 되었습니다. 앱을 종료합니다.",
						callback: function(result){
                            // mfnp.executeExitWebBrowser();
                            mfnp.executeLogout();
				        },
					}, 'alert');
//					alert('세션인증이 실패하였습니다. 앱을 종료합니다.');
				}
				//result.V0 == "None"
				else{
					console.log(" >> 통신 실패.");
				}		
			}
		}
		config.setSessionCheckFlag(true);
	},
	
	/**
	 * 자동 자리수 채움
	 * @param val 기준값
	 * @param length 채워넣을 길이
	 * @param addVal 채워넣을 값, default : '0'
	 * @param order 좌(LPAD).우(RPAD) 채워넣을 방향, default : 'LPAD'
	 */
	prependText : function(val, length, addVal, order) {
		var addText = !imaxFunc.isEmpty(addVal) ? addVal : '0';
		var direction;
		if(order == 'RPAD' || order == 'LPAD' || imaxFunc.isEmpty(order)){
			direction = order == 'RPAD' ? order : 'LPAD';
		} else {
			throw new Error('"order" parameter is "LPAD" or "RPAD"');
		}
		
		var len;
		if(!imaxFunc.isEmpty(length) && /^[0-9]*$/.test(length)){
			len = Number(length);
		} else {
			throw new Error('"length" parameter is only number type');
		}
		
		while(val.toString().length < len) {
			val = direction == 'LPAD' ? addText + val : val + addText;
		}
		
		return val;
	},
}