describe "iframes" do
  describe "bom", :good do
    before(:each) do
      visit "/nice_iframe"
    end

    it "adicionar ao carrinho" do
      within_frame("burgerId") do
        sleep 3
        produto = find(".menu-item-info-box", text: "REFRIGERANTE")
        produto.find("a").click
        expect(find("#cart")).to have_content "R$ 4,50"
      end
    end
  end

  describe "ruim", :bad do
    before(:each) do
      visit "/bad_iframe"
    end

    it "carrinho deve estar vazio" do

      #   script = '$(".box-iframe").attr("id", "tempId");'
      #   page.execute_script(script)

      frame = find(".box-iframe")
      within_frame(frame) do #"tempId"
        expect(find("#cart")).to have_content "Seu carrinho está vazio!"
      end
    end
  end
end
