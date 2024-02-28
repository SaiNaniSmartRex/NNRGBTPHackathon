using { com.app.businessdb as db} from '../db/schema';

service BusinessDB {
    entity Businesspartner as projection on db.Businesspartner;
    entity States as projection on db.States;
    entity Stockdata as projection on db.Stockdata;
    entity Purchase as projection on db.Purchase{
        @UI.Hidden : true
        ID,
        *
    };
    entity Items as projection on db.Items;
    entity Sales as projection on db.Sales;
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
annotate BusinessDB.Purchase with @odata.draft.enabled;
annotate BusinessDB.Sales with @odata.draft.enabled;
annotate BusinessDB.Items with @odata.draft.enabled;

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
            Value:storeid_ID
        },
         {
            Label:'Product Id',
            Value:productid_ID
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
            Value:storeid_ID
        },
         {
            Label:'Product Id',
            Value:productid_ID
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
        Common.Text: storeid.storeid,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'storeid',
            CollectionPath : 'Store',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : storeid_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'storeid'
                },
             
            ]
        }
    );
    productid @(
        Common.Text: productid.productid,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'Product id',
            CollectionPath : 'Product',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : productid_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'productid'
                },
             
            ]
        }
    );
} 

annotate BusinessDB.Purchase with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : purchase_order_number
        },
        {
            $Type : 'UI.DataField',
            Value : bpname_ID
        },
        {
            $Type : 'UI.DataField',
            Value : purchaseorder
        },
    ],
    UI.FieldGroup #purchaseData : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : purchase_order_number
        },
        {
            $Type : 'UI.DataField',
            Value : bpname_ID
        },
        {
            $Type : 'UI.DataField',
            Value : purchaseorder
        },
        ],
},
UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreInfoFacet',
            Label : 'Store Information',
            Target : '@UI.FieldGroup#purchaseData',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ItemsFacet',
            Label : 'Items Information',
            Target : 'Items/@UI.LineItem'
        },
    ],


);

annotate BusinessDB.Purchase with {
    bpname  @(
        Common.Text: bpname.first_name,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'Business Partner Name',
            CollectionPath: 'Businesspartner',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: bpname_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'first_name'
                },

            ]
        }
    );
}

annotate BusinessDB.Purchase.Items with @(
    UI.LineItem         : [
        {
            Label: 'Store Id',
            Value: item_ID
        },
        {
            Label: 'Product Id',
            Value: item_ID
        },
        {
            Label: 'Quantity',
            Value: item_ID
        },
        {
            Label: 'Price',
            Value: item_ID   //item.price=product.sell_price
        },

    ],
    UI.FieldGroup #PurchaseItems: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Store Id',
                Value: item_ID
            },
            {
                Label: 'Product Id',
                Value: item_ID
            },
            {
                Label: 'Quantity',
                Value:item_ID
            },
            {
                Label: 'Price',
                Value: item_ID
            },
        ],
    },
        UI.Facets: [{
            $Type : 'UI.ReferenceFacet',
            ID    : 'puritemsFacet',
            Label : 'purchaseitems',
            Target: '@UI.FieldGroup#PurchaseItems',
        }, ]
    
);

annotate BusinessDB.Items with @(
    UI.LineItem         : [
        {
            Label: 'Store Id',
            Value: storeid.storeid
        },
        {
            Label: 'Product Id',
            Value: productid.productid
        },
        {
            Label: 'Quantity',
            Value: stock_qty_ID
        },
        {
            Label: 'Price',
            Value: price.sell_price   //item.price=product.sell_price
        },

    ],
    UI.FieldGroup #items: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Label: 'Store Id',
                Value: storeid_ID
            },
            {
                Label: 'Product Id',
                Value: productid_ID
            },
            {
                Label: 'Quantity',
                Value: stock_qty_ID
            },
            {
                Label: 'Price',
                Value: price_ID
            },
        ],
    },
    UI.Facets : [
        {
        $Type : 'UI.ReferenceFacet',
        ID    : 'itemsFacet',
        Label : 'items',
        Target: '@UI.FieldGroup#items',
    }, ],
);


annotate BusinessDB.Sales with @(
    UI.LineItem           : [
        {
            Label: 'Sales Ordernumber',
            Value: salesorder
        },
        {
            Label: 'Businesspartner',
            Value: bpname_ID
        },
        {
            Label: 'SalesDate',
            Value: saleDate_ID
        },
    ],
    UI.FieldGroup #sales: {
        $Type: 'UI.FieldGroupType',
        Data : [
        {
            Label: 'Sales Order Number',
            Value: salesorder
        },
        {
            Label: 'Businesspartner',
            Value: bpname_ID
        },
        {
            Label: 'SalesDate',
            Value: saleDate_ID
        },
        ],
    },
    UI.Facets: [ {
        $Type : 'UI.ReferenceFacet',
        ID    : 'salesFacet',
        Label : 'sales facets',
        Target: '@UI.FieldGroup#sales'
    }, ],

);

annotate BusinessDB.Items with {
    storeid  @(
        Common.Text: storeid.storeid,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'Store id',
            CollectionPath: 'Store',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: storeid_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'storeid'
                },

            ]
        }
    );
    productid @(
        Common.Text: productid.productid,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'Product id',
            CollectionPath: 'Product',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: productid_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'productid'
                },

            ]
        }
    );
    stock_qty  @(
        Common.Text: stock_qty_ID.stock_qty_ID,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'Quantity',
            CollectionPath: 'Stockdata',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: stock_qty_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'stock_qty'
                },

            ]
        }
    );
    price     @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            Label         : 'Price',
            CollectionPath: 'Product',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: price_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'sell_price'
                },

            ]
        }
    );
}