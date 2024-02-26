sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'stockdata/test/integration/FirstJourney',
		'stockdata/test/integration/pages/StockdataList',
		'stockdata/test/integration/pages/StockdataObjectPage'
    ],
    function(JourneyRunner, opaJourney, StockdataList, StockdataObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('stockdata') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStockdataList: StockdataList,
					onTheStockdataObjectPage: StockdataObjectPage
                }
            },
            opaJourney.run
        );
    }
);