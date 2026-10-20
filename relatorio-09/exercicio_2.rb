class Instrumentista

    attr_reader :nome, :instrumento
  
    def initialize(nome, instrumento)
      @nome = nome
      @instrumento = instrumento
    end
  
    def interpretar(peca)
      raise NotImplementedError, "A classe deve implementar interpretar"
    end
  end
  
  class Solista < Instrumentista #solista herda de instrumentista

    def interpretar(peca) #como o solista interpreta uma peca
      puts "#{nome}, tocando #{instrumento}, interpreta #{peca} e conduz a melodia principal."
    end
  end

  class Acompanhador < Instrumentista #acompanhador herda de instrumentista
  
    def interpretar(peca) #como o acompanhador interpreta uma peça
      puts "#{nome}, tocando #{instrumento}, interpreta #{peca} e acompanha o ritmo do solista."
    end
  end
  
  class Regente

    def initialize(nome)
      @nome = nome
      @orquestra = []
    end

    def convocar(instrumentista)
      @orquestra << instrumentista
    end

    def reger(peca)
      puts "\nRegente #{@nome} conduz a peça #{peca}."
  
      @orquestra.each do |instrumentista|
        instrumentista.interpretar(peca)
      end
    end

    def escalacao
      @orquestra.map do |instrumentista|
        "#{instrumentista.class}: #{instrumentista.nome}"
      end
    end
  end
  
  #main
  solista = Solista.new("Miyazono", "Violino")
  acompanhador = Acompanhador.new("Arima", "Piano")
  regente = Regente.new("Maestro Saito")
  
  regente.convocar(solista)
  regente.convocar(acompanhador)
  
  regente.reger("Concerto para Violino")
  
  regente.escalacao.each do |texto|
    puts texto
  end
  
  instrumentista = Instrumentista.new("Watari", "Bateria")
  # instrumentista.interpretar("Concerto")
  #a chamada gera NotImplementedError
