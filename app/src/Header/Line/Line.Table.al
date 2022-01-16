table 60006 Line
{
    fields
    {
        field(1; "Header No."; Integer)
        {
            Caption = 'Header No.';
            DataClassification = SystemMetadata;
            TableRelation = Header."No.";
        }
        field(2; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = SystemMetadata;
        }
        field(10; Name; Text[32])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Header No.", "No.")
        {
            Clustered = true;
        }
    }
}