using Toybox.System as Sys;

module Test {

	hidden var gContext = {};
	hidden var gAssertions;

	function describe(description, body) {		
		var assertions = {};
		gContext.put(description, assertions);
		gAssertions = assertions;
		body.invoke();
	}
	
	function assert(description, expression) {		
		gAssertions.put(description, expression);
	}


	function runAssertions(assertions) {

		var descriptions = assertions.keys();
		for (var i = 0; i < descriptions.size(); i++) {
			var description = descriptions[i];
			var result = assertions[description];
			if (result) {
				Sys.println("-->  OK       " + description);	 
			} else {
				Sys.println("--> *FAILURE* " + description);
			}
		} 
	
	}

	function run() {
		var descriptions = gContext.keys();
		for (var i = 0; i < descriptions.size(); i++) {
			var description = descriptions[i];
			Sys.println("-->" + description);
			Sys.println("-->----------------------------");
			runAssertions(gContext[description]);
			Sys.println("-->");
		} 
	}

}