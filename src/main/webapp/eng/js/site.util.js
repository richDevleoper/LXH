//left padding
function leftPad(str, size, padChar) {
	var zero = '';
	str = str.toString();

	if (str.length < size) {
		for (var i = 0; i < size - str.length; i++)
			zero += padChar;
	}
	return zero + str;
}

//콤마 추가
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//콤마 제거
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

//글자수 체크
function getByteSize(reqValue) {
    var text = reqValue;
    var textSize = text.length;
    
    var nByte = 0;
    var chr = '';
 
    for (var i = 0; i < textSize; i++) {
        chr = text.charAt(i);
 
        if(escape(chr).length > 4) {
            nByte += 2; //한글2Byte
        }else{
            nByte += 1; //영문 등 나머지 1Byte
        }
    }
    
    return nByte;
}

//글자수 제한을 위한 정보
function substrInfo(reqValue, maxByteSize) {
	var rtnVal = {isExceed:false, rtnSize:0, rtnText:"" };
	
    var maxByte = maxByteSize; //최대 입력 바이트 수
    var text = reqValue;
    var textSize = text.length;
    
    var isExceed = false;
    var nByte = 0;
    var nSize = 0;
    var chr = '';
 
    for (var i = 0; i < textSize; i++) {
        chr = text.charAt(i);
 
        if(escape(chr).length > 4) {
            nByte += 2; //한글2Byte
        }else{
            nByte += 1; //영문 등 나머지 1Byte
        }
 
        if(nByte < maxByte) {
            nSize = i + 1; //return할 문자열 갯수
        }else{
        	isExceed = true;
        	break;
        }
    }
    
    rtnVal.isExceed = isExceed;
    rtnVal.rtnSize = nByte;
    rtnVal.rtnText = text.substr(0, nSize);
    
    return rtnVal;
}