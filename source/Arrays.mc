
module Arrays {

	function forEach(array, cb) {
		for( var i = 0; i < array.size(); i++ ) {
			cb.invoke(array[i]);
		}
	}

}