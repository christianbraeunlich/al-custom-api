codeunit 60000 "Unbound API"
{
    procedure Read(): Text
    begin
        exit('Hello there');
    end;

    procedure Write(input: Text): Text
    begin
        exit(input.ToUpper());
    end;

    procedure CreateHeader(description: Text[512])
    var
        Header: Record Header;
    begin
        Header.Init();
        Header.Description := description;
        Header.Insert();
    end;

}