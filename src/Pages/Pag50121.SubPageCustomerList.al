page 50121 "SubPageCustomerList"
{
    Caption = '';
    PageType = ListPart;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Customer;

    SourceTableView = sorting("No.") order(ascending)
           where("No." = filter('CUST*'));

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Name)
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; "E-Mail")
                {
                    ApplicationArea = All;
                }

            }
        }

    }


}