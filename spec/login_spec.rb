#$('#flash').text(); verificar qual o texto que tem na mensagem quando logada, o flash foi o id que foi dado.

describe "Forms" do
  it "login com sucesso" do
    visit "/login"
    fill_in "userId", with: "stark" #da pra utilizar tanto o name quanto o id (html)
    fill_in "passId", with: "jarvis!" #da pra utilizar tanto o name quanto o id (html)
    click_button "Login"
    #puts find("#flash").visible? //retorna true ou false
    expect(find("#flash").visible?).to be true
    #expect(find("#flash").text).to eql "Olá, Tony Stark. Você acessou a área logada!" pra ver se a mensagem é igual ao que tem no html, aqui contém um x que atrapaplha.
    # puts find("#flash").text
    # puts "Olá, Tony Stark. Você acessou a área logada!"
    #expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!" #perguntando se o valor contém no texto
    expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!" #perguntando se no elemento contém no texto. Se a string contém diretamente no elemento
    #page.save_screenshot("log/login_com_sucesso.png")
  end

  it "senha incorreta" do
    visit "/login"
    fill_in "userId", with: "stark"
    fill_in "password", with: "jarbis"

    click_button "Login"
    expect(find("#flash")).to have_content "Senha é invalida!"
    #page.save_screenshot("log/senha_incorreta.png")
  end

  it "usuario nao cadastrado" do
    visit "/login"
    fill_in "username", with: "hulk"
    fill_in "password", with: "green?"

    click_button "Login"
    expect(find("#flash")).to have_content "O usuário informado não está cadastrado!"
    #page.save_screenshot("log/usuario_nao_cadastrado.png")
  end
end
