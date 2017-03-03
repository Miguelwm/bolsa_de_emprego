Conta.create!(nome:  "Admin",
             email: "admin@seed.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activo: true)

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

perfil1.create_entidade!(nif: "123456789", actividade_profissional_id: actividade.id)


#Candidato

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



