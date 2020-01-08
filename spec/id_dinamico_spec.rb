describe "IDs dinamicos", :id_dinamicos do
  before(:each) do
    visit "/access"
  end

  it "cadastro com id dinamico" do
    find("#PortalTheme_wt10_block_wtcontent_holder_wt8_wtUsernameInput").set "daniella"
    find("#PasswordInput_wt11_PortalTheme_wt7_block_wtcontent_holder_wt8_wt").set "123"
    find("#PortalTheme_wt4_block_wtGetStartedButton_wtcontent_holder_OSCore_wt3_block").click

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end

  #$ => termina com
  #^ => começa com
  #* => contem

  it "cadastro com id dinamico atualizado" do
    find("input[id$=UsernameInput]").set "daniella"
    find("input[id^=PasswordInput]").set "123"
    find("a[id*=GetStartedButton]").click

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
