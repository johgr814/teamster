
module Tests {

	class ArraysTest {
		
		var mResult = "";
	
		function testFrom() {
			Test.assert("Arrays from treats null as empty array",
				Arrays.from(null).toArray().size() == 0);	
		}
	
	
		function concat(element) {
			mResult = mResult + element;
		}
	
		function testForEach() {
			Arrays.from(["1", "2", "3"]).forEach(method(:concat));
			
			Test.assert("Arrays for each operates on all elements",
				 mResult == "123");	
		}

		function prepare() {  		
			Test.describe("Arrays.from", method(:testFrom));
			Test.describe("Arrays.forEach", method(:testForEach));	
		}	
	}


} 