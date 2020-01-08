describe "Caixa de opcoes", :dropdown do #para executar somente um cenário, o que eu quero colocar uma tag, neste caso a tag é dropdown, depois de :
  it "item especifico simples" do
    visit "/dropdown"
    select("Loki", from: "dropdown")
    #sleep 3 #temporário
  end

  it "item especifico com o find" do
    visit "/dropdown"
    drop = find(".avenger-list") #variável drop guarda a classe do elemento
    drop.find("option", text: "Scott Lang").select_option #fazer uma busca exclusiva dentro do elemento
    #sleep 3 #temporário
  end

  it "qualquer item", :sample do
    visit "/dropdown"
    drop = find(".avenger-list")
    drop.all("option").sample.select_option #sample = dentro de um array, sorteie uma opção
  end
end
