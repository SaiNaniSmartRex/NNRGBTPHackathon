using { com.app.businessdb as db} from '../db/schema';

service BusinessDB {
    entity Businesspartner as projection on db.Businesspartner;
    entity States as projection on db.States;
    entity Store as projection on db.Store;
    entity Product as projection on db.Product;
    entity Stockdata as projection on db.Stockdata;
}

annotate BusinessDB.Businesspartner with @odata.draft.enabled;

annotate BusinessDB.Businesspartner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : partnerid
        },
        {
            $Type : 'UI.DataField',
            Value : first_name
        },
        {
            $Type : 'UI.DataField',
            Value : last_name
        },
        {
            $Type : 'UI.DataField',
            Value : address1
        },
        {
            $Type : 'UI.DataField',
            Value : address2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            Value: state.code
        },
        {
            $Type : 'UI.DataField',
            Value : pincode
        },
        {
            $Type : 'UI.DataField',
            Value : is_gstn_registered
        },
        {
            $Type : 'UI.DataField',
            Value : gstin_no
        },
        {
            Value: is_vendor
        },
        {
            Value: Is_coustomer
        }

    ],
    UI.SelectionFields: [ first_name , last_name],    
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : partnerid,
            },
            {
                $Type : 'UI.DataField',
                Value : first_name,
            },
            {
                $Type : 'UI.DataField',
                Value : last_name,
            },
            {
                $Type : 'UI.DataField',
                Value : address1,
            },
            {
                $Type : 'UI.DataField',
                Value : address2,
            },
            {
                $Type: 'UI.DataField',
                Value: city,
            },
            {
                $Type: 'UI.DataField',
                Value: state.code,
            },
            {
                $Type: 'UI.DataField',
                Value: pincode,
            },
            {
                $Type : 'UI.DataField',
                Value : gstin_no
            },            
          
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessPartnerInfoFacet',
            Label : 'Business Partner Information',
            Target : '@UI.FieldGroup#BusinessPartnerInformation',
        },
        
    ],
    
);

annotate BusinessDB.Businesspartner with {
    State @(
        Common.Text: state.code,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'States',
            Parameters     : [
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'code'
                },
                   {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                }
            ]
        }
    )
};


