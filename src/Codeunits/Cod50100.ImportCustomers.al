
codeunit 50100 "ImportCustomers" implements ImportFiles
{
    procedure ImportFile(): Boolean;
    var
        csvBuffer: Record "CSV Buffer";
        filename: Text;
        fileInStream: InStream;
        cust: Record Customer;
    begin
        csvBuffer.DeleteAll();

        if UploadIntoStream('Import Customer File', '', 'Text File (*.txt)|*.*', filename, fileInStream) then BEGIN
            csvBuffer.DELETEALL;
            csvBuffer.LoadDataFromStream(fileInStream, ';');
            IF csvBuffer.FINDSET THEN BEGIN
                repeat
                    case csvBuffer."Field No." of
                        1:
                            begin
                                CLEAR(Cust);
                                Cust.INIT;
                                cust."No." := csvBuffer.Value;
                            end;
                        2:
                            cust.Name := csvBuffer.Value;
                        3:
                            begin
                                cust."E-Mail" := csvBuffer.Value;
                                if cust.Insert() = false then
                                    cust.Modify();
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





