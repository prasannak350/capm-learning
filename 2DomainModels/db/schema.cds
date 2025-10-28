// defining data models 
// domain entities

namespace com.sap.learning;

entity Authors{
    key ID : UUID;
        name : String(100);
        dateOfBirth : Date;
        dateOfDeath : Date;
}

// Custom defined types - derived from one of the built-in types
entity Books{
    key ID : UUID;
        title : String(255);
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