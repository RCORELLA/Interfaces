page 50120 "ManageImports"
{
    Caption = 'Manage Imports';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(Manage)
            {
                field(TypeList; TypeList)
                {
                    ApplicationArea = All;
                }
            }
            group(CustomerData)
            {
                Visible = (TypeList = TypeList::Customers);
                part(CustomerList; SubPageCustomerList)
                {
                    ApplicationArea = All;
                }
            }
            group(ItemData)
            {
                Visible = (TypeList = TypeList::Items);
                part(ItemList; SubPageItems)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ImportFile)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    id: Interface ImportFiles;
                begin
                    id := TypeList;
                    Message('Import result: %1', id.ImportFile());
                end;
            }
        }
    }
    var


        TypeList: Enum TypeOfFile;


}