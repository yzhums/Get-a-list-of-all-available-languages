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
                    ConfPersonalizationMgt: Codeunit "Conf./Personalization Mgt.";
                    WindowsLanguage: Record "Windows Language";
                begin
                    WindowsLanguage.Reset();
                    ConfPersonalizationMgt.FilterToInstalledLanguages(WindowsLanguage);
                    Page.Run(Page::"Windows Languages", WindowsLanguage);
                end;
            }
        }
    }
}
