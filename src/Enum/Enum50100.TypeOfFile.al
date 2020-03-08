enum 50100 "TypeOfFile" implements ImportFiles
{
    Extensible = true;
    value(0; Customers)
    {
        Caption = 'Customers';
        Implementation = Importfiles = ImportCustomers;
    }
    value(1; Items)
    {
        Caption = 'Items';
        Implementation = Importfiles = importItem;
    }
}