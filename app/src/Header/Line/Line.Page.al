page 60018 Line
{
    PageType = ListPart;
    Caption = 'Line';
    SourceTable = Line;
    DelayedInsert = true;
    AutoSplitKey = true;
    PopulateAllFields = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(lines)
            {
                field(id; Rec.SystemId) { }
                field(headerNumber; Rec."Header No.") { }
                field(number; Rec."No.") { }
                field(name; Rec.Name) { }
                field(lastModifiedDateTime; Rec.SystemModifiedAt) { }
            }
        }
    }
}