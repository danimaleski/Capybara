describe "Teclado", :key do
  before(:each) do
    visit "/key_presses"
  end

  it "enviando teclas" do
    find("#campo-id").send_keys :space
    expect(page).to have_content "You entered: SPACE"
    find("#campo-id").send_keys :tab
    expect(page).to have_content "You entered: TAB"
    #sleep 3
  end

  it "array de simbolos" do
    teclas = %i[tab escape space enter shift control alt] #array de simbolos é com %i

    teclas.each do |t|
      find("#campo-id").send_keys t
      expect(page).to have_content "You entered: " + t.to_s.upcase #upcase pra ficar em caixa alta, to_s pra transformar em string
      #sleep 1
    end
  end

  it "enviando letras" do
    letras = %w[a s d f g h j k l] #array de string %w

    letras.each do |l|
      find("#campo-id").send_keys l
      expect(page).to have_content "You entered: " + l.to_s.upcase
      #sleep 1
    end
  end
end
