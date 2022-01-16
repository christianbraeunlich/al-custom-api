page 60017 "Header API"
{
    PageType = API;
    APIPublisher = 'christianbraeunlich';
    APIGroup = 'custom';
    APIVersion = 'v1.0';
    EntitySetName = 'headers';
    EntityName = 'header';
    SourceTable = Header;
    DelayedInsert = true;
    PopulateAllFields = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(records)
            {
                field(id; Rec.SystemId) { }
                field(number; Rec."No.") { }
                field(description; Rec.Description) { }
                field(data; Rec.Data) { }
                field(picture; Rec.Picture) { }
                field(activityCount; Rec.LineCount) { }
                field(lastModifiedDateTime; Rec.SystemModifiedAt) { }
                part(lines; Line)
                {
                    Multiplicity = Many;
                    EntitySetName = 'lines';
                    EntityName = 'line';
                    SubPageLink = SystemId = field(SystemId);
                }
                part(log; Log)
                {
                    Multiplicity = ZeroOrOne;
                    EntitySetName = 'logs';
                    EntityName = 'log';
                    SubPageLink = SystemId = field(SystemId);
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