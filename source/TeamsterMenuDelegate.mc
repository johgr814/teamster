using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Communications as Comm;

class TeamsterMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

	function onJsonResponse(responseCode, data) {
		Sys.println(responseCode);
		Sys.println(data);
		var confirmation = new Ui.Confirmation("Distance:" + data[0].get("distance"));
		Ui.pushView(confirmation, new InfoPopup(), Ui.SLIDE_DOWN);
	}

    function onMenuItem(item) {
        if (item == :item_1) {
	        Comm.makeJsonRequest(
	        	"https://intense-river-8745.herokuapp.com/api/v1/race/johan",
	        	{
	        		"nickName" => "jgd",
	        		"distance" => 1234
	        	},
	        	{
	        		:method => Comm.HTTP_REQUEST_METHOD_POST,
	        		:headers => {
	        			"Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON
	        		} 
	        	},
	        	method(:onJsonResponse)
	        );
        } else if (item == :item_2) {
            Sys.println("item 2");
        }
    }

}