using Toybox.WatchUi as Ui;
using Toybox.System as Sys;
using Toybox.Communications as Comm;

class teamsterMenuDelegate extends Ui.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }


	function onJsonResponse(responseCode, data) {
		Sys.println(responseCode);
		Sys.println(data);
	}

    function onMenuItem(item) {
        if (item == :item_1) {
        
        Comm.makeJsonRequest(
        	"https://httpbin.org/get", 
        	null,
        	{
        		method => Comm.HTTP_REQUEST_METHOD_GET 				       		
        	},
        	method(:onJsonResponse)
        );
        	
            Sys.println("item 1");
        } else if (item == :item_2) {
            Sys.println("item 2");
        }
    }

}