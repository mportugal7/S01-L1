module Depoente
    def depor
      raise NotImplementedError
    end
  end
  
  module Detivel
    def ser_detido
      puts "#{nome} foi levado pela Scotland Yard."
    end
  end
  
  class Envolvido
    attr_reader :nome
  
    def initialize(nome)
      @nome = nome
    end
  end
  
  class TestemunhaOcular < Envolvido
    include Depoente
  
    def depor
      puts "#{nome}: Eu vi um homem saindo da casa as 22 horas."
    end
  end
  
  class SuspeitoDoCrime < Envolvido
    include Depoente
    include Detivel
  
    def depor
      puts "#{nome}: Eu estava em casa naquela noite."
    end
  end
  
  class Investigacao
    def initialize(caso)
      @caso = caso
      @envolvidos = []
    end
  
    def registrar(envolvido)
      @envolvidos << envolvido
    end
  
    def ouvir_todos
      puts "Investigacao do caso: #{@caso}"
  
      @envolvidos.each do |envolvido|
        envolvido.depor
      end
    end
  
    def acionar_scotland_yard
      detidos = @envolvidos.select do |envolvido|
        envolvido.respond_to?(:ser_detido)
      end
  
      detidos.each do |envolvido|
        envolvido.ser_detido
      end
    end
  end
  
  #main
  testemunha = TestemunhaOcular.new("Irene Adler")
  suspeito1 = SuspeitoDoCrime.new("Sebastian Moran")
  suspeito2 = SuspeitoDoCrime.new("Henry Baskerville")
  
  investigacao = Investigacao.new("O misterio da mansao abandonada")
  
  investigacao.registrar(testemunha)
  investigacao.registrar(suspeito1)
  investigacao.registrar(suspeito2)
  
  investigacao.ouvir_todos
  
  puts "\nAcionando a Scotland Yard:"
  investigacao.acionar_scotland_yard
