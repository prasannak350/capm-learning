// writing a service definition

using com.sap.learning as db from '../db/schema';

service AdminService @(path : '/admin'){
    entity Books as projection on db.Books;
    entity Authors as projection on db.Authors;
}

// to view the database view, execute this in terminal - cds compile srv/admin-service.cds --to sql
// or right click the file -> CDS Preview -> Preview as sql