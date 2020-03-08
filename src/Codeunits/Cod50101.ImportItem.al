codeunit 50101 "ImportItem" implements ImportFiles
{
    procedure ImportFile(): Boolean;
    var
        csvBuffer: Record "CSV Buffer";
        filename: Text;
        fileInStream: InStream;
        item: Record Item;
    begin
        csvBuffer.DeleteAll();

        if UploadIntoStream('Import Items File', '', 'Text File (*.txt)|*.*', filename, fileInStream) then BEGIN
            csvBuffer.DELETEALL;
            csvBuffer.LoadDataFromStream(fileInStream, ';');
            IF csvBuffer.FINDSET THEN BEGIN
                repeat
                    case csvBuffer."Field No." of
                        1:
                            begin
                                CLEAR(item);
                                item.INIT;
                                item."No." := csvBuffer.Value;
                            end;
                        2:
                            item.Description := csvBuffer.Value;
                        3:
                            begin
                                item."Base Unit of Measure" := csvBuffer.Value;
                                if item.Insert() = false then
                                    item.Modify();
                            end;

                    end;

                until csvBuffer.next = 0;
                exit(true);
            end
            else
                exit(false);
        end else
            exit(false)

    end;
}
