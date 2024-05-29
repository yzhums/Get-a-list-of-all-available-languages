pageextension 50217 CustomerListExt extends "Customer List"
{
    actions
    {
        addafter("Co&mments")
        {
            action(GetAvailableLanguages)
            {
                ApplicationArea = All;
                Caption = 'Get Available Languages';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = TestFile;

                trigger OnAction()
                var
                    Language: Codeunit Language;
                    TempWindowsLanguage: Record "Windows Language" temporary;
                begin
                    GetApplicationLanguages(TempWindowsLanguage);
                    Page.Run(Page::"Windows Languages", TempWindowsLanguage);
                end;
            }
        }
    }
    procedure GetApplicationLanguages(var TempWindowsLanguage: Record "Windows Language" temporary)
    var
        WindowsLanguage: Record "Windows Language";
    begin
        WindowsLanguage.SetRange("Localization Exist", true);
        WindowsLanguage.SetRange("Globally Enabled", true);

        if WindowsLanguage.FindSet() then
            repeat
                TempWindowsLanguage := WindowsLanguage;
                TempWindowsLanguage.Insert();
            until WindowsLanguage.Next() = 0;
    end;
}
