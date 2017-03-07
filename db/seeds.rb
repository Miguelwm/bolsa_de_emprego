admin = Conta.create!(nome:  "Admin",
             email: "admin@seed.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activo: true)

Noticia.create!(titulo:"Noticia do dia" , data:DateTime.new(2017,3,7) ,
                    sumario:"Texto muito resumido" , texto:"Texto elquentemente elaborado" ,
                    destaque:true ,activo:true ,conta_id:admin.id)


#Entidade

actividade = ActividadeProfissional.create!(actividade:"Informatica")

ActividadeProfissional.create!(actividade:"Mecanica")

conta1 = Conta.create!(nome: "Entidade",
                      email:"entidade@seed.com",
                      password:              "foobar",
                      password_confirmation: "foobar")

perfil1 = conta1.create_perfil!(morada:"Rua do Sobe e Desce,150",
                              codigo_postal:"4421-569",
                              localidade:"Baguim do Monte",
                              contacto1: "966698551",
                              pagina: "http://stackoverflow.com/",
                              apresentacao: "Entidade Reguladora de Angulos")

entidade1 = perfil1.create_entidade!(nif: "123456789", actividade_profissional_id: actividade.id)

#Candidato

AreaProfissional.create!(area: "Designer")

area = AreaProfissional.create!(area: "Programador Web")

nivel = NivelHabilitacao.create!(nivel: "12º")

situacao = SituacaoProfissional.create!(situacao: "Desempregado")

conta2 = Conta.create!(nome: "Candidato",
                      email:"candidato@seed.com",
                      password:              "foobar",
                      password_confirmation: "foobar")

perfil2 = conta2.create_perfil!(morada:"Rua da Curva e Contracurva,999",
                              codigo_postal:"4456-859",
                              localidade:"Praça do Delgaco",
                              contacto1: "215669235",
                              pagina: "https://www.w3schools.com/",
                              apresentacao: "Candidato a Trabalho")

perfil2.create_candidato!(nascimento: DateTime.new(1991,5,1),
                          bi: "11564876",
                          habilitacao: "Incompetente",
                          experiencia: "Nenhuma",
                          area_profissional_id: area.id,
                          nivel_habilitacao_id: nivel.id,
                          situacao_profissional_id: situacao.id)


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
  area_profissional_id:area.id, entidade_id: entidade1.id)




