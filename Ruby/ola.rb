# A classe Saudação
class Anfitriao
  def initialize(nome = "mundo")
    @nome = nome.capitalize
  end

  def ola
    puts "Ola #{@nome}!"
  end
  
  def adeus
    puts "Adeus #{@nome}"
  end

end

# Criar um novo objecto
anf = Anfitriao.new("mundo!")

# Saída: "Olá Mundo!"
anf.ola
