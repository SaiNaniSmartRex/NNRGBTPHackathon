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
    image_url:String(100) default'https://www.google.com/imgres?imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F51HCHFclmmL.jpg&tbnid=zY4UP_cFKTAGhM&vet=12ahUKEwjZwabZt8uEAxVNS2wGHRwFCnEQMygQegUIARCZAQ..i&imgrefurl=https%3A%2F%2Fwww.amazon.in%2F&docid=a5LOTjWnazn6QM&w=500&h=500&q=image%20amozon&ved=2ahUKEwjZwabZt8uEAxVNS2wGHRwFCnEQMygQegUIARCZAQ';
    @title:'product Cost Price'
    cost_price:String(10) @mandatory; //mrp
    @title:'product Sell Price'
    sell_price:String(10) @mandatory;  //selling price
}

entity Stockdata {
    key ID: UUID;
    @title:'store id'
    storeid: Association to Store;
    @title:'Product id'
    productid: Association to Product;
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

entity Purchase : cuid {
    key ID: UUID;
    @title:'Purchase Order Number'
    purchase_order_number:String(10);
    @title:'Business Partner Name'
    bpname :Association to Businesspartner;
    @title:'Purchase Order Date'
    purchaseorder :Date;
    @title: 'Items'
    Items:Composition of many{
        key ID : UUID;
        item : Association to Items;
    }
}

entity Items {
    key ID :UUID;
    @title: 'Store ID'
    storeid : Association to Store;
    @title: 'Stock Quantity'
    stock_qty : Association to Stockdata;
    @title: 'Product ID'
    productid : Association to Product;
    @title: 'Price'
    price : Association to Product;
}   


entity Sales {
    key ID :UUID;
    @title: 'Sales Ordernumber'
    salesorder : Integer;
    @title: 'Businesspartner'
    bpname : Association to Businesspartner;
    @title: 'SalesDate'
    saleDate : Association to Purchase;
     @title: 'Items'
     Items:Composition of many{
        key ID : UUID;
        item : Association to Items;
    }
}