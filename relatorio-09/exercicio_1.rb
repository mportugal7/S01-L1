class CoquetelAfterlife

    attr_reader :nome
  
    def initialize(nome, preco)
      @nome = nome
      @_preco = preco
    end
  
    #GETTER manual
    def preco
      @_preco
    end
  
    #SETTER manual
    def preco=(valor)
      if valor >= 5 && valor <= 200
        @_preco = valor
      else
        puts "Preço inválido!"
      end
    end
  
    def ficha
      "Drink: #{nome} | Preço: R$ #{preco}"
    end
  end
  
  class DrinkDeLenda < CoquetelAfterlife
  
    attr_reader :lenda
  
    def initialize(nome, preco, lenda)
      super(nome, preco)
      @lenda = lenda
    end
  
    def ficha
      "#{super} | Homenagem a: #{lenda}"
    end
  end
  
  #main
  drink1 = CoquetelAfterlife.new("Cerveja de Night City", 10)
  
  drink2 = DrinkDeLenda.new("Johnny Silverhand", 80, "Johnny Silverhand")
  
  drink3 = DrinkDeLenda.new("Jackie Welles", 60, "Jackie Welles")
  
  drinks = [drink1, drink2, drink3]
  
  drinks.each do |drink|
    puts drink.ficha
  end
  
  puts "\nAlterando o preço de Johnny Silverhand:"
  
  drink2.preco = 500
  drink2.preco = 80
  
  puts drink2.ficha
  # drink2.nome = "Novo nome"
  #nome não pode ser alterado de fora.
