var arr = [
		["1","2","3","4","5","6","7","8","9","10","11"],
		["A","B","C","D","E","F","G","H","I","J","K"],
];

function encode (arr) {
	var keys = arr[0];
	
	var newArr = arr.slice(1,arr.length);
	
	var formatted = [];
	data = newArr,
	cols = keys,
	l = cols.length;
	
	for(var i = 0; i < data.length; i++){
		var d = data[i],
		    o = {};
		for (var j = 0; j < l; j++)
		    o[cols[j]] = d[j];
		formatted.push(o);
	}
	return formatted;
}

function decode (formatted) {
	var dec = [];
	for (var key in formatted) {
        var value = formatted[key];
        if (typeof value === 'string') {
            dec[key] = value;
        } else {
            dec[key] = decode(value);
        }
    }
    return dec;
}

var dec = decode (formatted);
console.log(dec);

