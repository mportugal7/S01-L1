class PhoneWave
  def enviar_dmail(mensagem)
    puts "Mensagem enviada para o passado: #{mensagem}"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Membro #{@membros.last.numero} - #{@membros.last.nome} admitido no laboratorio."
  end

  def experimento(mensagem)
    puts "\nMembros presentes no experimento:"

    @membros.each do |membro|
      puts "Lab Mem #{membro.numero}: #{membro.nome}"
    end

    @phonewave.enviar_dmail(mensagem)
  end
end

#main
membro1 = MembroDoLab.new(1, "Okabe Rintaro")
membro2 = MembroDoLab.new(2, "Makise Kurisu")

laboratorio = LaboratorioDeGadgets.new

laboratorio.admitir(membro1)
laboratorio.admitir(membro2)

laboratorio.experimento("O micro-ondas enviou uma mensagem para ontem!")

#composicao: o laboratorio cria o PhoneWave dentro do seu proprio initialize

#agregacao: Okabe e Kurisu sao criados antes do laboratorio e continuam podendo existir mesmo fora dele.O laboratorio apenas os recebe pelo metodo admitir.
