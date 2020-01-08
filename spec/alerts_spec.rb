describe "Alertas de JS", :alerts do
  before(:each) do
    visit "/javascript_alerts"
  end

  it "alerta", :alerta do
    click_button "Alerta"
    msg = page.driver.browser.switch_to.alert.text
    #browser = quero trabalhar com o navegador, switch_to.alert = fazer um switch com o alert do js, text = dar o texto do alerta
    #puts msg
    expect(msg).to eql "Isto é uma mensagem de alerta"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Você ativou um alerta JS"
    #sleep 3
  end

  it "sim confirma" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"
    #sleep 1

    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Mensagem confirmada"
  end

  it "nao confirma" do
    click_button "Confirma"

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql "E ai confirma?"
    #sleep 1

    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_content "Mensagem não confirmada"
  end

  it "acccept prompt", :accept_prompt do
    accept_prompt(with: "Daniella") do
      click_button "Prompt"
      #sleep 2
    end

    expect(page).to have_content "Olá, Daniella"
    #sleep 2
  end

  it "dismiss prompt", :dismiss_prompt do
    #Quando eu não aceito este prompt
    #Então a mesangem deve ser Olá, null
    dismiss_prompt() do
      click_button "Prompt"
      #sleep 3
    end

    expect(page).to have_content "Olá, null"
    sleep 3
  end
end
