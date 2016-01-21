
module Arrays {

	class Wrapper {
		
		hidden var mArray;
		
		function initialize(array) {
			mArray = array == null ? new [0] : array;			
		}
		
		function forEach(cb) {
			
			for ( var i = 0; i < mArray.size(); i++ ) {
				cb.invoke(mArray[i]);
			}
			
			return new Wrapper(mArray);
		}
		
		function toArray() {
			return mArray;
		}
	}

	function from(array) {
		return new Wrapper(array);
	}


}