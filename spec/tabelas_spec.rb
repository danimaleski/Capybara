describe "Tabelas", :tables do
  before(:each) do
    visit "/tables"
  end

  #find retorna apenas um elemento
  #all retorna todos os elementos

  it "deve exibir o salario do stark" do
    atores = all("table tbody tr")
    stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") }
    #puts stark.text

    expect(stark.text).to include "10.000.000"
  end

  it "deve exibir o salario do vin diesel" do
    diesel = find("table tbody tr", text: "Vin Diesel")
    expect(diesel).to have_content "10.000.000"
    #puts diesel.text
  end

  it "deve exibir o filme velozes e furiosos" do
    diesel = find("table tbody tr", text: "Vin Diesel")
    movie = diesel.all("td")[2].text
    expect(movie).to eql "Velozes e Furiosos"
  end

  it "deve exibir o insta do Chris Evans" do
    evans = find("table tbody tr", text: "Chris Evans")
    insta = evans.all("td")[4].text

    expect(insta).to eql "@teamcevans"
  end

  it "deve selecionar Chris Pratt para remocao" do
    pratt = find("table tbody tr", text: "Chris Pratt")
    pratt.find("a", text: "delete").click

    alert = page.driver.browser.switch_to.alert.text
    expect(alert).to eql "Chris Pratt foi selecionado para remoção!"
  end

  it "deve selecionar Chris Pratt para edicao" do
    pratt = find("table tbody tr", text: "Chris Pratt")
    pratt.find("a", text: "edit").click

    alert = page.driver.browser.switch_to.alert.text
    expect(alert).to eql "Chris Pratt foi selecionado para edição!"
  end
end
