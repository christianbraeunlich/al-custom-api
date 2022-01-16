page 60000 Log
{
    PageType = CardPart;
    Caption = 'Log';
    SourceTable = Log;
    DelayedInsert = true;
    AutoSplitKey = true;
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
                field(message; Rec.Message) { }
                field(lastModifiedDateTime; Rec.SystemModifiedAt) { }
            }
        }
    }
}