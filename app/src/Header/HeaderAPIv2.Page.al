page 60002 "Header API v2"
{
    PageType = API;
    APIPublisher = 'christianbraeunlich';
    APIGroup = 'custom';
    APIVersion = 'v2.0';
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

    var
        DescriptionNotChangedErr: Label 'The description must not be the same after changing.';
        ForbiddenWords: Label 'Dog,Pizza,Sleep,Snake';
        ForbiddenWordErr: Label 'Forbidden word "%1" used.', Comment = '%1 = The forbidden word.';
        Temp: Text;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CheckForbiddenWords();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        CheckForbiddenWords();
        ValidateDescription();
    end;

    local procedure CheckForbiddenWords()
    var
        Words: List of [Text];
        Word: Text;
    begin
        Temp := ForbiddenWords;
        Temp := Temp.ToLower();
        Words := Temp.Split(',');

        foreach Word in Words do begin
            if Rec.Description.Contains(Word) then
                Error(StrSubstNo(ForbiddenWordErr, Word));
        end;
    end;

    local procedure ValidateDescription()
    begin
        if xRec.Description = Rec.Description then
            Error(DescriptionNotChangedErr);
    end;
}