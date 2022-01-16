table 60005 Header
{
    fields
    {
        field(1; "No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'No.';
            DataClassification = SystemMetadata;
        }
        field(5; Description; Text[512])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(10; Picture; MediaSet)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
        }
        field(25; Data; Blob)
        {
            Caption = 'Data';
            DataClassification = CustomerContent;
        }
        field(50; LineCount; Integer)
        {
            Caption = 'Line Count';
            CalcFormula = count(Line where("No." = field("No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
}