using { com.app.businessdb as db} from '../db/schema';

service BusinessDB {
    entity Businesspartner as projection on db.Businesspartner;
    entity States as projection on db.States;
    entity Store as projection on db.Store{
        @UI.Hidden : true
        ID,
        * 
    };
    entity Product as projection on db.Product {
         @UI.Hidden : true
        ID,
        * 
    entity Stockdata as projection on db.Stockdata;
}

annotate BusinessDB.Businesspartner with @odata.draft.enabled;
annotate BusinessDB.Store with @odata.draft.enabled;
annotate BusinessDB.Product with @odata.draft.enabled;
annotate BusinessDB.Stockdata with @odata.draft.enabled;

annotate Market.Business_Partner with {
    pinCode @assert.format: '^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}$';
    Gst_num @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[Z]{1}[0-9]{1}$';
}

annotate BusinessDB.States with @(
    UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: code
    },
    {
        $Type: 'UI.DataField',
        Value: description
    },
],

);

annotate BusinessDB.Businesspartner with @(
    UI.LineItem: [

        {
            Label: 'Bussiness Partner Nimber',
            Value: partnerid
        },
        {
            Label: 'First Name',
            Value: first_name
        },
        
        {
            Label: 'Second Name',
            Value: last_name
        },
        {
            Label: 'Address 1',
            Value: address1
        },
        {
            Label: 'Address 2',
            Value: address2
        },
        {
            Label: 'City',
            Value: city
        },
        {
            Label: 'State',
            Value: state_code
        },
        {
            Label: 'Is_gstn_registered',
            Value: Is_gstn_registered
        },
        {
            Label: 'GSTIN Number',
            Value: gstin_no
        },
    ],
    UI.FieldGroup #BusinessPartner: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Bussiness Partner Number',
                Value: partnerid
            },
            {
                $Type: 'UI.DataField',
                Value: first_name
            },
            {
                $Type: 'UI.DataField',
                Value: last_name
            },
            {
                $Type: 'UI.DataField',
                Value: address1
            },
            {
                $Type: 'UI.DataField',
                Value: address2
            },
            {
                $Type: 'UI.DataField',
                Value: city
            },
            {
                $Type: 'UI.DataField',
                Value: pincode
            },
            {
                $Type: 'UI.DataField',
                Value: state_code
            },
            {
                Value: Is_gstn_registered
            },
            {
                $Type: 'UI.DataField',
                Value: gstin_no
            },
        ],
    },
    UI.Facets               : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'BusinesspartnerFacet',
        Label : 'BusinessPartner',
        Target: '@UI.FieldGroup#BusinessPartner',
    }, ],
);


annotate BusinessDB.Store with @(
    UI.LineItem         : [
        {
            Label: 'Store Id',
            Value: storeid
        },
        {
            Label: 'Store name',
            Value: name
        },
        {
            Label: 'Address 1',
            Value: address1
        },
        {
            Label: 'Address 2',
            Value: address2
        },
        {
            Label: 'City',
            Value: city
        },
        {
            Label: 'State',
            Value: state_code
        },
        {
            Label: 'Pin code',
            Value: Pincode
        },
    ],
    UI.FieldGroup #store: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Store Id',
                Value: storeid
            },
            {
                Label: 'Store name',
                Value: name
            },
            {
                Label: 'Address 1',
                Value: address1
            },
            {
                Label: 'Address 2',
                Value: address2
            },
            {
                Label: 'City',
                Value: city
            },
            {
                Label: 'State',
                Value: state_code
            },
            {
                Label: 'Pin code',
                Value: pincode
            },
        ],
    },
    UI.Facets           : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'storeFacet',
        Label : 'store facets',
        Target: '@UI.FieldGroup#store'
    }, ],
);


annotate BusinessDB.Product with @(
    UI.LineItem           : [
        {
            Label: 'Product id',
            Value: productid
        },
        {
            Label: 'Product Name',
            Value: productid
        },
        {
            Label: 'Product Image URL',
            Value: image_url
        },
        {
            Label: 'Cost Price',
            Value: cost_price
        },
        {
            Label: 'Sell Price',
            Value: sell_price
        },
    ],
    UI.FieldGroup #product: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Product id',
                Value: productid
            },
            {
                Label: 'Product Name',
                Value: productname
            },
            {
                Label: 'Product Image URL',
                Value: image_url
            },
            {
                Label: 'Cost Price',
                Value: cost_price
            },
            {
                Label: 'Sell Price',
                Value: sell_price
            },
        ],
    },
    UI.Facets             : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'productFacet',
        Label : 'product facets',
        Target: '@UI.FieldGroup#product'
    }, ],

);

annotate BusinessDB.Stockdata with @(
    UI.LineItem:[
        {
            Label:'Store Id',
            Value:storeid
        },
         {
            Label:'Product Id',
            Value:product_id
        },
        {
            Label:'Stock Quantity',
            Value:stock_qty
        }
    ],
    UI.FieldGroup #stock :{
        $Type:'UI.FieldGroupType',
        Data:[
             {
            Label:'Store Id',
            Value:storeid
        },
         {
            Label:'Product Id',
            Value:product_id
        },
         {
            Label:'Stock Quantity',
            Value:stock_qty
        }
        ],
    },
      UI.Facets:[
        {
            $Type:'UI.ReferenceFacet',
            ID:'stockdataFacet',
            Label:'stock data facets',
            Target:'@UI.FieldGroup#stockdata'
        },
    ],
);

annotate BusinessDB.Businesspartner with {
    state @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'State',
            CollectionPath: 'States',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: state_code,
                    ValueListProperty: 'code'
                },

                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                },
            ]
        }
    );
};

annotate BusinessDB.Stockdata with {
    storeid @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Store id',
            CollectionPath : 'Store',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : storeid,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
             
            ]
        }
    );
product_id @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product id',
            CollectionPath : 'Product',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_id,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name'
                },
             
            ]
        }
    );
}

