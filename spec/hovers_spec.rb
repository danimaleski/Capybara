describe "Mouse Hover", :hovers do
  before(:each) do
    visit "/hovers"
  end

  it "quando passo o mouse sobre o blade" do
    card = find("img[alt*=Blade]") #o asterisco é para demonstrar que "contem" tal palavra
    card.hover

    expect(page).to have_content "Nome: Blade"
  end

  it "quando passo o mouse sobre o pantera negra" do
    card = find("img[alt^=Pantera]") #"Pantera Negra" string, o chapeuzinho demonstra que eu quero achar uma palavra que começa com aquilo que estou dando.
    card.hover

    expect(page).to have_content "Nome: Pantera Negra"
  end

  it "quando passo o mouse sobre o homem aranha" do
    card = find("img[alt$=Aranha]") #o dolar é para achar algo que termina com esta palavra
    card.hover

    expect(page).to have_content "Nome: Homem Aranha"
  end

  after(:each) do
    sleep 0.5
  end
end
