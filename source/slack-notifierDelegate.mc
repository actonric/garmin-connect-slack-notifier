//
// Copyright 2016 by Garmin Ltd. or its subsidiaries.
// Subject to Garmin SDK License Agreement and Wearables
// Application Developer Agreement.
//

using Toybox.Communications as Comm;
using Toybox.WatchUi as Ui;

class WebRequestDelegate extends Ui.BehaviorDelegate {
    var notify;
    var url = "https://hooks.slack.com/services/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";
    var params = {
    	"channel" => "@richard",
		"username" => "ram-bot",
		"text" => "Hello from Richard's Garmin watch!",
		"icon_emoji" => ":athletic_shoe:"
	};
	var headers = {
		"Content-Type" => Comm.REQUEST_CONTENT_TYPE_JSON,
		"Accept" => "application/json"
	};
	var options = {
		:method => Comm.HTTP_REQUEST_METHOD_POST,
		:headers => headers
	};
	var string = "\nhello world";
	
	
    // Handle menu button press
    function onMenu() {
        makeRequest();
        return true;
    }

    function onSelect() {
        makeRequest();
        return true;
    }

    function makeRequest() {
        notify.invoke("Pinging Slack...");

       Comm.makeWebRequest(url, params, options, method(:onReceive)
		);	
    }

    // Set up the callback to the view
    function initialize(handler) {
        Ui.BehaviorDelegate.initialize();
        notify = handler;
    }

    // Receive the data from the web request
    function onReceive(responseCode, data) {
    	notify.invoke("Message sent!");
        //notify.invoke(responseCode.toString());
        //notify.invoke("Response: " + responseCode.toString());

        //basic structure of notification code, but refer to original project for actual code
        //if (responseCode.toString() == "-400") {
        //    notify.invoke(data["args"]);
        //} else {
        //    notify.invoke("Failed to load\nError: " + responseCode.toString());
        //}
    }
}