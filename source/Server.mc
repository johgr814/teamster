using Toybox.Communications as Comm;

module Server  {

	const SERVER_URL = "https://intense-river-8745.herokuapp.com";

    function reportAndFetchDistances(distance, cb) {
        Comm.makeJsonRequest(
        	SERVER_URL + "/api/v1/race/johan",
        	{
        		"nickName" => "jgd",
        		"distance" => distance
        	},
        	{
        		:method => Comm.HTTP_REQUEST_METHOD_POST,
        		:headers => {
        			"Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON
        		} 
        	},
        	cb
        );
    }

}