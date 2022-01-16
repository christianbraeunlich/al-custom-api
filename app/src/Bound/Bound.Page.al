page 60001 Bound
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Header;
    ODataKeyFields = "No.";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(number; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    [ServiceEnabled]
    procedure ClearDescription(var actionContext: WebServiceActionContext)
    begin
        Rec.Description := '';
        Rec.Modify();

        actionContext.SetResultCode(WebServiceActionResultCode::Updated);
    end;

}