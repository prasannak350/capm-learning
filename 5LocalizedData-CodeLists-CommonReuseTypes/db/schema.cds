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
        title : localized String(255);
        author: Association to Authors;
        genre : Genre;
        publCountry : Country;
        stock : NoOfBooks;
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
        name : String(100);
        dateOfBirth : Date;
        dateOfDeath : Date;
        epoch : Association to Epochs;
        books : Association to many Books
                    on books.author = $self;
}

entity Epochs : CodeList{
    key ID : Integer;
}