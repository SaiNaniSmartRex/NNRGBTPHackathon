namespace com.app.businessdb;
using { managed, cuid } from '@sap/cds/common';

@assert.unique:{
    partnerid:[partnerid]
}
entity  Businesspartner {
    key Id:UUID;
    @title: 'Business Partner Number'
    partnerid: String(5) @mandatory;
    @title: 'First Name'
    first_name: String(40) @mandatory;
    @title: 'Last Name'
    last_name: String(40) @mandatory;
    @title: 'Address 1'
    address1: String(100);
    @title: 'Address 2'
    address2: String(100);
    @title: 'City'
    city: String(100);
    @title: 'State'
    state: Association to States;
    @title: 'Pin Code'
    pincode: String(10) @mandatory;
    @title: 'Is_gstn_registered'
    is_gstn_registered: Boolean;
    @title: 'GSTIN Number'
    gstin_no: String(10) @mandatory;
    @title: 'Is_Vendor'
    is_vendor: Boolean;
    @title: 'Is_Coustomer'
    is_coustomer: Boolean;
}

@cds.persistence.skip
entity States:  cuid,managed{
    key ID:UUID;
    @title: 'code'
    key code: String(10);
    @title: 'descrption'
    description: String(10);
}

entity Store:cuid,managed{
    key ID:UUID;
    @title:'Store ID'
    storeid:String(10) @mandatory;
    @title:'Name'
    name:String(20) @mandatory;
    @title:'Address1'
    address1:String(20) @mandatory;
    @title:'Address22'
    address2:String(20) @mandatory;
    @title:'State'
    state:String(2) @mandatory;
    @title:'Pin Code'
    pincode:String(6) @mandatory;
}

entity Product : cuid,managed{
    key ID:UUID;
    @title:'Product ID'
    key productid:String(10) @mandatory;
    @title:'Product_Name'
    productname:String(20) @mandatory;
    @title:'Product Image URL'
    image_url:String(100) @mandatory;
    @title:'product Cost Price'
    cost_price:String(10) @mandatory;
    @title:'product Sell Price'
    sell_price:String(10) @mandatory;
}

entity Stockdata : cuid,managed{
    key ID:UUID;
    @title:'store id'
    storeid:String(10);
    @title:'Product id'
    product_id:String(10);
    @title:'Stock quantity'
    stock_qty:string(10);
}