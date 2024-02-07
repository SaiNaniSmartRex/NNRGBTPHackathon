namespace com.app.businessdb;
using { cuid } from '@sap/cds/common';

@assert.unique:{
    partnerid:[partnerid]
}
entity  Businesspartner : cuid {
    @title: 'Business Partner Number'
    partnerid: String(10) @mandatory;
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
    is_gstn_registered: Boolean default false;
    @title: 'GSTIN Number'
    gstin_no: String(10) @mandatory;
    @title: 'Is_Vendor'
    is_vendor: Boolean default false;
    @title: 'Is_Coustomer'
    is_coustomer: Boolean default false;
}

entity Store {
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
    state: Association to States;
    @title:'Pin Code'
    pincode:String(6) @mandatory;
}

entity Product {
    key ID: UUID;
    @title:'Product ID'
    productid:String(10) @mandatory;
    @title:'Product_Name'
    productname:String(20) @mandatory;
    @title:'Product Image URL'
    image_url:String(100) @mandatory;
    @title:'product Cost Price'
    cost_price:String(10) @mandatory;
    @title:'product Sell Price'
    sell_price:String(10) @mandatory;
}

entity Stockdata {
    key ID: UUID;
    @title:'store id'
    storeid: Association to Store;
    @title:'Product id'
    product_id: Association to Product;
    @title:'Stock quantity'
    stock_qty : Integer;
}

@cds.persistence.skip
entity States {
    @title: 'code'
    key code: String(10);
    @title: 'description'
    description: String(10);
}
