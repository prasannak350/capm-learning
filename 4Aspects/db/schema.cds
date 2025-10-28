// aspects

namespace com.sap.learning;

using{
    cuid,
    managed
}from '@sap/cds/common';

entity Books : cuid,managed{
        title : String(255);
        author: Association to Authors;
        genre : Genre;
        publCountry : String(3);
        stock : NoOfBooks;
        price : Price;
        isHardCover : Boolean;
}


// 1) Simple types
type NoOfBooks : Integer;

// 2) Structured types

type Price {
    amount   : Decimal;
    currency : String(3);
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
        books : Association to many Books
                    on books.author = $self;
}