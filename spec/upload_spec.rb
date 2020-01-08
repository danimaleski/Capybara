describe "Upload", :upload do
  before(:each) do
    visit "/upload"
    @arquivo = Dir.pwd + "/spec/fixtures/texto.txt" #pwd metodo que retornar o caminho no qual eu tenho o diretorio de execução do meu projeto
    @imagem = Dir.pwd + "/spec/fixtures/qa.png"
  end

  it "upload com arquivo texto" do
    attach_file("file-upload", @arquivo)
    click_button "Upload"

    div_arquivo = find("#uploaded-file")
    expect(div_arquivo.text).to eql "texto.txt"
  end

  it "upload de imagem", :upload_imagem do
    attach_file("file-upload", @imagem)
    click_button "Upload"

    #puts Capybara.default_max_wait_time #por padrão é 2

    sleep 5
    img = find("#new-image")
    expect(img[:src]).to include "/uploads/qa.png"
  end

  after(:each) do
    sleep 3
  end
end
