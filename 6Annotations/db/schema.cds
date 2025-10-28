namespace com.sap.learning;

using{
    cuid,
    managed,
    Currency,
    Country,
    sap.common.CodeList
}from '@sap/cds/common'; 

// do command and click on sap/cds/common and learn how country and currency types can be used 

entity Books : cuid,managed{
        title : localized String(255) @mandatory;
        author: Association to Authors @mandatory @assert.target;
        genre : Genre @assert.range : true;
        publCountry : Country;
        stock : NoOfBooks default 0;
        price : Price;
        isHardCover : Boolean;
}


// 1) Simple types
type NoOfBooks : Integer;

// 2) Structured types

type Price {
    amount   : Decimal;
    currency : Currency;
}

// Enumerations (enums) - used to make code more readable and self explanatory, as they allow to replace cryptic values with symbols in the application logic
type Genre : Integer enum{
    fiction = 1;
    non_fiction = 2;
}

entity Authors : cuid,managed{
        name : String(100) @mandatory;
        dateOfBirth : Date;
        dateOfDeath : Date;
        epoch : Association to Epochs @assert.target;
        books : Association to many Books
                    on books.author = $self;
}

entity Epochs : CodeList{
    key ID : Integer;
}


// Etags{}
annotate Books with{
    modifiedAt @odata.etag
}

annotate Authors with{
    modifiedAt @odata.etag
}