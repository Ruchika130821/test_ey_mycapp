sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ey/ruchika/purchaseorderapp/test/integration/FirstJourney',
		'ey/ruchika/purchaseorderapp/test/integration/pages/POsList',
		'ey/ruchika/purchaseorderapp/test/integration/pages/POsObjectPage',
		'ey/ruchika/purchaseorderapp/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ey/ruchika/purchaseorderapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);