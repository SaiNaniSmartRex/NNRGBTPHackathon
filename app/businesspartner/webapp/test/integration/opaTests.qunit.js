sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'businesspartner/test/integration/FirstJourney',
		'businesspartner/test/integration/pages/BusinesspartnerList',
		'businesspartner/test/integration/pages/BusinesspartnerObjectPage'
    ],
    function(JourneyRunner, opaJourney, BusinesspartnerList, BusinesspartnerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('businesspartner') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBusinesspartnerList: BusinesspartnerList,
					onTheBusinesspartnerObjectPage: BusinesspartnerObjectPage
                }
            },
            opaJourney.run
        );
    }
);