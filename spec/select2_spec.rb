describe "Select 2", :select2 do
  describe("Single", :single) do
    before(:each) do
      visit "/apps/select2/single.html"
    end

    it "seleciona ator por nome" do
      find(".select2-selection--single").click
      #sleep 1
      find(".select2-results__option", text: "Adam Sandler").click
      #sleep 5
      expect(page).to have_content "Ator selecionado: 1"
    end

    it "busca e clica no ator" do
      find(".select2-selection--single").click
      #sleep 1
      find(".select2-search__field").set "Chris Rock"
      #sleep 1
      find(".select2-results__option").click
      #sleep 1

      page.has_css?(".select2-search__field", text: "Chris Rock")
    end
  end

  describe("Multiple", :multi) do
    before(:each) do
      visit "/apps/select2/multi.html"
    end

    def seleciona(ator)
      find(".select2-selection--multiple").click
      find(".select2-search__field").set ator
      find(".select2-results__options").click
    end

    it "seleciona atores - cada um" do
      seleciona("Jim Carrey")
      seleciona("Owen Wilson")
      #sleep 3
    end

    it "seleciona atores - array" do
      atores = ["Jim Carrey", "Owen Wilson", "Kevin James"]
      atores.each do |a|
        seleciona(a)
      end
      #sleep 3
    end
  end
end
