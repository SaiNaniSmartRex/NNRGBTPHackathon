using { com.app.businessdb as db} from '../db/schema';

service BusinessDB {
    entity Businesspartner as projection on db.Businesspartner;
    entity States as projection on db.States;
    entity Stockdata as projection on db.Stockdata;
    entity Store as projection on db.Store{
        @UI.Hidden : true
        ID,
        *
    };
    entity Product as projection on db.Product {
         @UI.Hidden : true
        ID,
        * 
    };
}

annotate BusinessDB.Businesspartner with @odata.draft.enabled;
annotate BusinessDB.Store with @odata.draft.enabled;
annotate BusinessDB.Product with @odata.draft.enabled;
annotate BusinessDB.Stockdata with @odata.draft.enabled;
// annotate BusinessDB.State with @odata.draft.enabled;

annotate BusinessDB.Businesspartner with {
    pincode @assert.format: '^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}$';
    gstin_no @assert.format: '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[Z]{1}[0-9]{1}$';
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
            Label: 'Bussiness Partner Number',
            Value: partnerid
        },
        {
            Label: 'First Name',
            Value: first_name
        },
        
        {
            Label: 'Last Name',
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
            Value: is_gstn_registered
        },
        {
            Label: 'GSTIN Number',
            Value: gstin_no
        },
    ],
    UI.FieldGroup #Businesspartner: {
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
                Value: is_gstn_registered
            },
            {
                $Type: 'UI.DataField',
                Value: gstin_no
            },
            {
                Value: is_vendor
            },
            {
                Value: is_coustomer
            }
        ],
    },
    UI.Facets               : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'BusinesspartnerFacet',
        Label : 'Businesspartner',
        Target: '@UI.FieldGroup#Businesspartner',
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
            Label: 'State',
            Value: state_code
        },
        {
            Label: 'Pin code',
            Value: pincode
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
        Label : 'store Details',
        Target: '@UI.FieldGroup#store'
    }, ],
);


annotate BusinessDB.Product with {
    @Common.Text : '{Product}'
    @Core.IsURL : true
    @Core.MediaType : 'image/jpg'
    image_url
};


annotate BusinessDB.Product with @(
    UI.LineItem           : [
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
    UI.Facets: [ {
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
            Value:productid
        },
        {
            Label:'Stock Quantity',
            Value:stock_qty
        }
    ],
    UI.FieldGroup #stockdata :{
        $Type:'UI.FieldGroupType',
        Data:[
             {
            Label:'Store Id',
            Value:storeid
        },
         {
            Label:'Product Id',
            Value:productid
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
            Label:'Stock Data Information',
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

annotate BusinessDB.Store with {
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
            Label: 'storeid',
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
    productid @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product id',
            CollectionPath : 'Products',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : productid,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'productname'
                },
             
            ]
        }
    );
}