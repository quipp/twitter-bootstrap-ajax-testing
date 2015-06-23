# twitter-bootstrap-ajax-testing
Toying with responsive design - Twitter Bootstrap, Telerik, and AJAX.  

## Page descriptions
* The Lists folder is looking at using Repeater, RadList, and RadGrid - testing responsive functionality.
* The Comparison folder is comparing fake AJAX (RadAjaxManager / RadAjaxPanel) to real AJAX (JavaScript / Page Methods).  Goals was to see view differences in data payload.  

## Requirements
* Used Visual Studio 2015 Release Candidate (should work with VS 2013 no problem).
* .NET 4.5.2
* **Requires** Telerik AJAX web controls (used 2015 Q1) - Telerik.Web.Design.dll, Telerik.Web.UI.dll, and Telerik.Web.UI.Skins.dll.  Not included in source control because **requires license**.  Should be easy to switch to standard ASP.NET controls.

## Notes
* AJAX Manager provided trivial page size reduction compared to wrapping entire page in AJAX Panel (using compression).
* Using page methods and JavaScript to minimize data transfer provide major reductions in data transmission.  The key wasn't just avoiding excess ViewState & HTML transmission, but ability to be more selective/tricky with data sent/recieved.  I.e.  The Save button only requires the Motorcycle ID's to be sent and doesn't need to send back more than confirmation of success => major payload reduction.
* To test page size, use Fiddler and check both the upload and download (they both affect network transmission time).  The Size column in Chrome's Dev Tools Network tab actually only shows download size (not upload size).
* Use Chrome's network throtteling feature to see how important upload/download size is for poor network connections.
