admin = Conta.create!(nome:  "Admin",
             email: "admin@seed.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activo: true,
             tipo: "Backoffice")

Noticia.create!(titulo:"Noticia do dia" , data:DateTime.new(2017,3,7) ,
                    sumario:"Texto muito resumido" , texto:"Texto elquentemente elaborado" ,
                    destaque:true ,activo:true ,conta_id:admin.id,foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))


50.times do |n|
    Noticia.create!(titulo:Faker::Space.planet, data:Faker::Date.between(1.year.ago, Date.today) ,
                        sumario:Faker::ChuckNorris.fact , texto:Faker::ChuckNorris.fact * 5 ,
                        destaque:false ,activo:true ,conta_id:admin.id,foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))
end


#Entidade

actividade = ActividadeProfissional.create!(actividade:"Informatica")
ActividadeProfissional.create!(actividade:"Mecanica")
ActividadeProfissional.create!(actividade:"Farmaceutica")

conta1 = Conta.create!(nome: "Wiremaze",
                      email:"entidade@seed.com",
                      password:              "foobar",
                      password_confirmation: "foobar", activo: true,
                      tipo: "Entidade",
                      newsletter:true, candidatos:true, candidaturas:true)

perfil1 = conta1.create_perfil!(morada:"Rua do Sobe e Desce,150",
                              codigo_postal:"4421-569",
                              localidade:"Baguim do Monte",
                              contacto1: "966698551",
                              pagina: "http://stackoverflow.com/",
                              apresentacao: "Entidade Reguladora de Angulos",
                              foto:  File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))

entidade1 = perfil1.create_entidade!(nif: "123456789", actividade_profissional_id: actividade.id)

#Candidato

AreaProfissional.create!(area: "Designer")

area = AreaProfissional.create!(area: "Programador Web")

NivelHabilitacao.create!(nivel: "9º")
nivel = NivelHabilitacao.create!(nivel: "12º")
NivelHabilitacao.create!(nivel: "Licenciartura")
NivelHabilitacao.create!(nivel: "Mestrado")
NivelHabilitacao.create!(nivel: "Douturamento")

situacao = SituacaoProfissional.create!(situacao: "Desempregado")
SituacaoProfissional.create!(situacao: "Empregado")
SituacaoProfissional.create!(situacao: "Empregado Part-time")
SituacaoProfissional.create!(situacao: "Estudante")

conta2 = Conta.create!(nome: "Miguel Pereira",
                      email:"candidato@seed.com",
                      password:              "foobar",
                      password_confirmation: "foobar", activo: true,
                      tipo: "Candidato",
                      newsletter:true, entidades:true,ofertas:true)

perfil2 = conta2.create_perfil!(morada:"Rua da Curva e Contracurva,999",
                              codigo_postal:"4456-859",
                              localidade:"Praça do Delgaco",
                              contacto1: "215669235",
                              pagina: "https://www.w3schools.com/",
                              apresentacao: "Candidato a Trabalho",
                              foto: File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))

perfil2.create_candidato!(nascimento: DateTime.new(1991,5,1),
                          bi: "11564876",
                          habilitacao: "Incompetente",
                          experiencia: "Nenhuma",
                          area_profissional_id: area.id,
                          nivel_habilitacao_id: nivel.id,
                          situacao_profissional_id: situacao.id,
                          cv: File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))


#Oferta

tipo = TipoContrato.create!(tipo: "Trabalho em termo certo")
TipoContrato.create!(tipo: "Trabalho em termo incerto")
TipoContrato.create!(tipo: "Trabalho sem termo")
TipoContrato.create!(tipo: "Trabalho de muita curta duração")
TipoContrato.create!(tipo: "Trabalho com trabalhador estrangeiro não comunitário ou apátrida")
TipoContrato.create!(tipo: "Trabalho a tempo parcial")
TipoContrato.create!(tipo: "Trabalho com pluralidade de empregadores")
TipoContrato.create!(tipo: "Trabalho intermitente")
TipoContrato.create!(tipo: "Trabalho em comissão de serviço")

Salario.create!(quantia: "500 - 750")
salario = Salario.create!(quantia: "750 - 1000")
Salario.create!(quantia: "1000 - 1250")
Salario.create!(quantia: "1250 - 1500")
Salario.create!(quantia: "1500 - 1750")
Salario.create!(quantia: "1750 - 2000")

Oferta.create!(titulo:"Programação Web",val_inicio: DateTime.new(2017,4,2),
  val_fim: DateTime.new(2019,4,2)  ,descricao:"Procura-se trabalhador com conhecimentos de programação web para contrato de dois anos" ,
  activo: true ,tipo_contrato_id:tipo.id ,salario_id: salario.id ,
  area_profissional_id:area.id, entidade_id: entidade1.id, foto: File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))

  50.times do |n|
    Oferta.create!(titulo:Faker::Job.title,val_inicio: DateTime.new(2017,4,2),
      val_fim: DateTime.new(2019,4,2)  ,descricao:Faker::Lorem.sentence(5) ,
      activo: true ,tipo_contrato_id:tipo.id ,salario_id: salario.id ,
      area_profissional_id:area.id, entidade_id: entidade1.id,foto: File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))
end



50.times do |n|
  nome  = Faker::Company.name
  email = "example-entidade-#{n+1}@seed.org"

  conta = Conta.create!(nome: nome,
              email:email,
              password:              "foobar",
              password_confirmation: "foobar", activo: true,
              tipo: "Entidade",newsletter:true)

  localidade = Faker::Lorem.sentence(5)
  apresentacao = Faker::Lorem.sentence(5)
  contacto = rand(999999999)

  perfil = conta.create_perfil!(morada:"Rua do Sobe e Desce,150",
                              codigo_postal:"4421-569",
                              localidade:localidade,
                              contacto1: "966698551",
                              pagina: "http://stackoverflow.com/",
                              apresentacao: apresentacao,
                              foto: File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))

  nif = rand(999999999)

  perfil.create_entidade!(nif: nif, actividade_profissional_id: rand(1..3))

end

50.times do |n|
  nome  = Faker::Name.name
  email = "example-candidato-#{n+1}@seed.org"

  conta = Conta.create!(nome: nome,
              email:email,
              password:              "foobar",
              password_confirmation: "foobar", activo: true,
              tipo: "Candidato")

  localidade = Faker::Lorem.sentence(5)
  apresentacao = Faker::Lorem.sentence(5)

  perfil = conta.create_perfil!(morada:"Rua do Sobe e Desce,150",
                              codigo_postal:"4421-569",
                              localidade:localidade,
                              contacto1: "966698551",
                              pagina: "http://stackoverflow.com/",
                              apresentacao: apresentacao,
                              foto: File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))


  habilitacao = Faker::Lorem.sentence(5)
  experiencia = Faker::Lorem.sentence(5)
  perfil.create_candidato!(nascimento: DateTime.new(1991,5,1),
                          bi: "11564876",
                          habilitacao: habilitacao,
                          experiencia: experiencia,
                          area_profissional_id: rand(1..2),
                          nivel_habilitacao_id: 1,
                          situacao_profissional_id: 1,
                          cv: File.open(File.join(Rails.root, "/app/assets/images/seed/100x150.png")))


end

# Following relationships
# candidatos = Candidato.all
# entidade  = Entidade.first
# interessantes = candidatos[2..14]
# interessantes.each { |candidato| Perfil.find_by_id(entidade.perfil_id).interesse(Perfil.find_by_id(candidato.perfil_id)) }
#
# entidades = Entidade.all
# candidato  = Candidato.first
# interessantes = entidades[2..14]
# interessantes.each { |entidade| Perfil.find_by_id(candidato.perfil_id).interesse(Perfil.find_by_id(entidade.perfil_id)) }
