sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'businesspartner',
            componentId: 'BusinesspartnerObjectPage',
            contextPath: '/Businesspartner'
        },
        CustomPageDefinitions
    );
});