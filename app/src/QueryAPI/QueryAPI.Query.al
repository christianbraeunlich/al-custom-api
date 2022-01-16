query 60000 "Query API"
{
    QueryType = API;
    APIPublisher = 'christianbraeunlich';
    APIGroup = 'custom';
    APIVersion = 'v1.0';
    EntitySetName = 'queryHeaders';
    EntityName = 'queryHeader';

    elements
    {
        dataitem(Header; Header)
        {
            column(id; SystemId) { }
            column(itemNumber; "No.") { }
            column(description; Description) { }
            column(headerModifiedAt; SystemModifiedAt) { }
            dataitem(lines; Line)
            {
                DataItemLink = "Header No." = Header."No.";
                column(lineId; SystemId) { }
                column(headerNumber; "Header No.") { }
                column(name; Name) { }
                column(lineModifiedAt; SystemModifiedAt) { }
            }
        }
    }
}


