## cliente.sql
```[dbo].[KRTSP_SelCliente]  - Select cliente```

**Obejtivo** Retornar um ou mais registros da tabela cliente

**Parâmetros inseridos:** id

**Tabelas acessadas:** cliente 

**Tabelas sensibilizadas:** --

**Campos retornados:** id, razaoSocial, nomeFantasia, CNPJ, inscricaoEstadual, inscricaoMunicipal, rua, numero, bairro, cidade, UF, CEP, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela cliente

---

```[dbo].[KRTSP_InsCliente]  - Insert cliente```

**Obejtivo** Inserir um novo registro na tabela cliente

**Parâmetros inseridos** razaoSocial, nomeFantasia, CNPJ, inscricaoEstadual, inscricaoMunicipal, rua, numero, complemento, bairro, cidade, UF, CEP, usuarioCadastro 

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** cliente

**Campos retornados:** --

**Retorno:** 0 - excução ok

---

```[dbo].[KRTSP_UpdCliente]  -  Update cliente```

**Obejtivo** Atualizar um registro na tabela cliente

**Parâmetros inseridos** id, razaoSocial, nomeFantasia, CNPJ, inscricaoEstadual, inscricaoMunicipal, rua, numero, complemento, bairro, cidade, UF, CEP, usuarioUltimaAlterecao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelCliente]  -  Delete cliente```

**Obejtivo** Deletar um registro na tabela cliente

**Parâmetros inseridos** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado, 2 - esse id esta sendo mencionado em preco, 3 - esse id esta sendo mencionado em departamento

#######################################################

## departamento.sql

```[dbo].[KRTSP_SelDepartamento] - Select departamento```

**Obejtivo** Retornar um ou mais registros da tabela departamento

**Parâmetros inseridos** id

**Tabelas acessadas:** departamento

**Tabelas sensibilizadas:** --

**Campos retornados:** id, idCliente, nome, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela departamento

---

```[dbo].[KRTSP_InsDepartamento] - Insert departamento```

**Obejtivo** Inserir um novo registro na tabela departamento

**Parâmetros inseridos** idCliente, nome, usuarioCadastro

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** departamento

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdDepartamento] - Update departamento```

**Obejtivo** Atualizar um registro na tabela departamento

**Parâmetros inseridos** id, idCliente, nome, usuarioUltimaAlteracao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelDepartamento] - Delete departamento```

**Obejtivo** Deletar um registro na tabela departamento

**Parâmetros inseridos** id

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - Execução ok, 1 - id não encontrado, 2 - id mencionado na tabela contato

#######################################################

## contato.sql

```[dbo].[KRTSP_SelContato] - Select contato```

**Objetivo:** Retornar um ou mais registros da tabela contato

**Parâmetros inseridos:** id

**Tabelas acessadas:** contato

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** select da tabela contato

---

```[dbo].[KRTSP_InsContato] - Insert contato```

**Objetivo:** Inserir um novo registro na tabela contato

**Parâmetros inseridos:** idDepartamento, nome, email, usuarioCadastro

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** contato

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdContato] - Update contato```

**Objetivo:** Atualizar um registro na tabela contato

**Parâmetros inseridos:** id, idDepartamento, nome, email, usuarioCadastro, usuarioUltimaAlteracao 

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelContato] - Delete contato```

**Objetivo:** Deletar um registro na tabela contato

**Parâmetros inseridos:** id

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado, 2 - id mencionado na tabela projetoAtividade, 3 - id mencionado na tabela contatoTelefone, 4 - id mencionado na tabela aprovacao

#######################################################

## contatoTelefone.sql

```[dbo].[KRTSP_SelContatoTelefone]  - Select contatoTelefone```

**Objetivo:** Retornar um ou mais registros da tabela contatoTelefone

**Parâmetros inseridos:** id

**Tabelas acessadas:** contatoTelefone 

**Tabelas sensibilizadas:** --

**Campos retornados:** id, idTipoTelefone idContato, DDD, numero, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela contatoTelefone

---

```[dbo].[KRTSP_InsContatoTelefone]  - Insert contatoTelefone```

**Objetivo:** Inserir um novo registro na tabela contatoTelefone

**Parâmetros inseridos:** idTipoTelefone, idContato, DDD, numero, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** contatoTelefone

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdContatoTelefone]  - Update contatoTelefone```

**Objetivo:** Atualizar um registro na tabela contatoTelefone

**Parâmetros inseridos:** id, idTipoTelefone, idContato, DDD, numero, usuarioUltimaAlteracao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelContatoTelefone]  - Delete contatoTelefone```

**Objetivo:** Deletar um registro na tabela contatoTelefone

**Parâmetros inseridos:** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

#######################################################

## tipoTelefone.sql

```[dbo].[KRTSP_SeltipoTelefone]  - Select tipoTelefone```

**Objetivo:** Retornar um ou mais registros da tabela tipoTelefone

**Parâmetros inseridos:** id

**Tabelas acessadas:** tipoTelefone 

**Tabelas sensibilizadas:** --

**Campos retornados:** id, nome

**Retorno:** select da tabela tipoTelefone

#######################################################

```[dbo].[KRTSP_SelAtividade] - Select Atividade```

**Objetivo:** Procedure que realiza o select de uma atividade especifica ou de todas as atividades

**Tabelas acessadas:** atividade

**Campos retornados:** nome

**Retorno:** valores retornados do select

## atividade.sql

```[dbo].[KRTSP_SelAtividade] - Select atividade```

**Objetivo:** Mostrar todos os dados da tabela atividade

**Parâmetros inseridos:** id

**Tabelas acessadas:** atividade 

**Tabelas sensibilizadas:** --

**Campos retornados:** nome

**Retorno:** select da tabela atividade

#######################################################

## projetoAtividade.sql

```[dbo].[KRTSP_SelProjetoAtividade]  - Select projetoAtividade```

**Objetivo:** Retornar um ou mais registros da tabela projetoAtividade

**Parâmetros inseridos:** idProjetoAtividade, idContato ,idProjeto ,idAtividade

**Tabelas acessadas:** projetoAtividade, contato, projeto, atividade

**Tabelas sensibilizadas:** --

**Campos retornados:** projetoAtividade.id, contato.nome, projeto.nome, atividade.nome, projetoAtividade.usuarioCadastro, projetoAtividade.dataCadastro

**Retorno:** select com inner join das tabelas projetoAtividade + contato + projeto + atividade

---

```[dbo].[KRTSP_InsProjetoAtividade] - Insert projetoAtividade```

**Objetivo:** Inserir um novo registro na tabela projetoAtividade

**Parâmetros inseridos:** idContato, idProjeto, idAtividade, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** projetoAtividade

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_DelProjetoAtividade]  - Delete projetoAtividade```

**Objetivo:** Deletar um registro na tabela projetoAtividade

**Parâmetros inseridos:** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

#######################################################

## preco.sql

```[dbo].[KRTSP_SelPreco]  - Select preco```

**Objetivo:** Retornar um ou mais registros da tabela preco

**Parâmetros inseridos:** idProjetoTipo, idCliente

**Tabelas acessadas:** preco, projetoTipo 

**Tabelas sensibilizadas:** --

**Campos retornados:** preco.id, projetoTipo.nome, preco.dataValidade, preco.valorHora

**Retorno:** select com inner join das tabelas preco + projetoTipo

---

```[dbo].[KRTSP_InsPreco]  - Insert preco```

**Objetivo:** Inserir um novo registro na tabela preco

**Parâmetros inseridos:** idCliente, idProjetoTipo, dataValidade, valorHora, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** preco

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdPreco]  - Update preco```

**Objetivo:** Atualizar um registro na tabela preco

**Parâmetros inseridos:** id, novaDataValidade, valorHora, usuarioUltimaAlteracao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado, 2 - não podemos mudar pois preço esta sendo utilizado

#######################################################

## projeto.sql

```[dbo].[KRTSP_SelProjeto] - Select projeto```

**Objetivo:** Retornar um ou mais registros da tabela projeto

**Parâmetros inseridos:** id

**Tabelas acessadas:** projeto

**Tabelas sensibilizadas:** --

**Campos retornados:**id, idPreco, nome, descricao, dataEntrada, quantidadeTotalMinutos, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela projeto

---

```[dbo].[KRTSP_InsProjeto] - Insert projeto```

**Objetivo:** Inserir um novo registro na tabela projeto

**Parâmetros inseridos:** idPreco, nome, descricao, dataEntrada, quantidadeTotalMinutos, usuarioCadastro

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** projeto

**Campos retornados:**  --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdProjeto] - Update projeto```

**Objetivo:** Atualizar um registro na tabela projeto

**Parâmetros inseridos:** id, idPreco, nome, descricao, quantidadeTotalMinutos, usuarioUltimaalteracao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelProjeto] - Deletar projeto```

**Objetivo:** Deletar um registro na tabela projeto

**Parâmetros inseridos:** id

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado, 2 - id mencionado na tabela projetoAtividade, 3 - id mencionado na tabela projetoDocumento, 4 - id mencionado na tabela entrega, 5 - id mencionado na tabela projetoEtapa

#######################################################

## projetoTipo.sql

```[dbo].[KRTSP_SelProjetoTipo]  - Select projetoTipo```

**Objetivo:** Retornar um ou mais registros da tabela projetoTipo

**Parâmetros inseridos:** id

**Tabelas acessadas:** projetoTipo 

**Tabelas sensibilizadas:** --

**Campos retornados:** id, nome

**Retorno:** select da tabela projetoTipo

#######################################################

## projetoDocumento.sql

```[dbo].[KRTSP_SelProjetoDocumento]  - Select projetoDocumento```

**Objetivo:** Retornar um ou mais registros da tabela projetoDocumento

**Parâmetros inseridos:** idProjeto

**Tabelas acessadas:** projetoDocumento

**Tabelas sensibilizadas:** --

**Campos retornados:** idProjeto, idDocumento

**Retorno:** select da tabela projetoDocumento

#######################################################

## projetoEtapa.sql

```[dbo].[KRTSP_SelProjetoEtapa] - Select projetoEtapa```v

**Objetivo:** Retornar um ou mais registros da tabela projetoEtapa

**Parâmetros inseridos:** id

**Tabelas acessadas:** projeto

**Tabelas sensibilizadas:** --

**Campos retornados:**id, idEtapaTipo, idProjeto, dataInicioPrevista, dataInicio, dataTermino, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela projetoEtapa

---

```[dbo].[KRTSP_InsProjetoEtapa] - Insert projetoEtapa```

**Objetivo:** Inserir um novo registro na tabela projetoEtapa

**Parâmetros inseridos:** idEtapaTipo, idProjeto, dataInicioPrevista, dataInicio, dataTermino, usuarioCadastro

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** projetoEtapa

**Campos retornados:**  --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdProjeto] - Update projetoEtapa```

**Objetivo:** Atualizar um registro na tabela projetoEtapa

**Parâmetros inseridos:** id, idEtapaTipo, idProjeto, dataInicioPrevista, dataInicio, dataTermino, usuarioUltimaAlteracao, dataUltimaAlteracao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelProjetoEtapa] - Delete projetoEtapa```

**Objetivo:** Deletar um registro na tabela projetoEtapa

**Parâmetros inseridos:** id

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

#######################################################

## etapaTipo.sql

```[dbo].[KRTSP_SelEtapaTipo] - Select etapaTipo```

**Objetivo:** Retornar um ou mais registros da tabela etapaTipo

**Parâmetros inseridos:** id

**Tabelas acessadas:** etapaTipo

**Tabelas sensibilizadas:** --

**Campos retornados:** nome

**Retorno:** select da tabela etapaTipo

#######################################################

## documento.sql

```[dbo].[KRTSP_SelDocumento]  - Select documento```

**Objetivo:** Retornar um ou mais registros da tabela documento

**Parâmetros inseridos:** id

**Tabelas acessadas:** documento 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** select da tabela documento

---

```[dbo].[KRTSP_InsDocumento]  - Insert documento```

**Objetivo:** Inserir um novo registro na tabela documento

**Parâmetros inseridos:** idDocumentoTipo, idColaborador, nome, descricao, dataCriacao, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** documento

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdDocumento]  - Update documento```

**Objetivo:** Atualizar um registro na tabela documento

**Parâmetros inseridos:** id, idDocumentoTipo, idColaborador, nome, descricao, usuarioUltimaAlteracao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelDocumento]  - Delete documento```

**Objetivo:** Deletar um registro na tabela documento

**Parâmetros inseridos:** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

#######################################################

## documentoTipo.sql

```[dbo].[KRTSP_SeldoCumentoTipo]  - Select documentoTipo```

**Objetivo:** Retornar um ou mais registros da tabela documentoTipo

**Parâmetros inseridos:** id

**Tabelas acessadas:** documentoTipo 

**Tabelas sensibilizadas:** --

**Campos retornados:** id, nome

**Retorno:** select da tabela documentoTipo

#######################################################

## entrega.sql

```[dbo].[KRTSP_SelEntrega] - Select entrega```

**Objetivo:** Retornar um ou mais registros da tabela entrega

**Parâmetros inseridos:** id

**Tabelas acessadas:** entrega

**Campos retornados:** id, idProjeto, dataEntrega, descricao, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela entrega

---

```[dbo].[KRTSP_InsEntrega] - Insert entrega```

**Objetivo:** Inserir um novo registro na tabela entrega

**Parâmetros inseridos:** idProjeto, dataEntrega, descricao, usuarioCadastro

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** entrega

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdEntrega] - Update entrega```

**Objetivo:** Atualizar um registro na tabela entrega

**Parâmetros inseridos:** id, idProjeto, dataEntrega, descricao, usuarioUltimaAlteracao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelEntrega] - Update entrega```

**Objetivo:** Deletar um registro na tabela entrega

**Parâmetros inseridos:** id

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado, 2 - O id está sendo mencionado na tabela aprovacao, 3 - O id está sendo mencionado na tabela colaboradorEntrega, 4 - O id está sendo mencionado na tabela itemNotaFiscal

#######################################################

## colaboradorEntrega.sql

```[dbo].[KRTSP_SelColaboradorEntrega]  - Select colaboradorEntrega ```

**Objetivo:** Retornar um ou mais registros da tabela colaboradorEntrega

**Parâmetros inseridos:** id

**Tabelas acessadas:** colaboradorEntrega 

**Tabelas sensibilizadas:** --

**Campos retornados:** idColaborador, idEntrega, quantidadeMinutosCobrados, quantidadeMinutosNaoCobrados, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela colaboradorEntrega

---

```[dbo].[KRTSP_InsColaboradorEntrega]  - Insert colaboradorEntrega```

**Objetivo:** Insere os colaboradores

**Parâmetros inseridos:** idColaborador, idEntrega, quantidadeMinutosCobrados, quantidadeMinutosNaoCobrados, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** colaboradorEntrega

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdColaboradorEntrega]  - Update colaboradorEntrega```

**Objetivo:** Atualizar um registro na tabela colaboradorEntrega

**Parâmetros inseridos:** id, idColaborador, idEntrega, quantidadeMinutosCobrados, quantidadeMinutosNaoCobrados, usuarioUltimaAlterecao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelColaboradorEntrega]  - Delete colaboradorEntrega```

**Objetivo:** Deletar um registro na tabela colaboradorEntrega

**Parâmetros inseridos:** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

#######################################################

## entregaDocumento.sql

```[dbo].[KRTSP_SelEntregaDocumento] - Select entregaDocumento```

**Objetivo:** Retornar um ou mais registros da tabela entregaDocumento

**Parâmetros inseridos:** idEntrega

**Tabelas acessadas:** entregaDocumento 

**Tabelas sensibilizadas:** --

**Campos retornados:** idEntrega, idDocumento

**Retorno:** select da tabela entregaDocumento

#######################################################

## aprovacao.sql

```[dbo].[KRTSP_SelAprovacao] - Select aprovacao```

**Objetivo:** Retornar um ou mais registros da tabela aprovacao

**Parâmetros inseridos:** id

**Tabelas acessadas:** aprovacao 

**Tabelas sensibilizadas:** --

**Campos retornados:** id, idContato, idEntrega, dataAprovacao, suarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela aprovacao

---

```[dbo].[KRTSP_InsAprovacao] - Insert aprovacao```

**Objetivo:** Inserir um novo registro na tabela aprovacao

**Parâmetros inseridos:** idContato, idEntrega, dataAprovacao, usuarioCadastro

**Tabelas acessadas:** --  

**Tabelas sensibilizadas:** aprovacao

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdAprovacao] - Update aprovacao```

**Objetivo:** Atualizar um registro na tabela aprovacao

**Parâmetros inseridos:** id, idContato, idEntrega, dataAprovacao, usuarioUltimaAlteracao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelAprovacao] - Delete aprovacao```

**Objetivo:** Deletar um registro na tabela aprovacao

**Parâmetros inseridos:** id

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

#######################################################

## parametrizacao.sql

```[dbo].[KRTSP_SelParametrizacao]  - Select parametrizacao```

**Objetivo:** Retornar um ou mais registros da tabela parametrizacao

**Parâmetros inseridos:** id

**Tabelas acessadas:** parametrizacao 

**Tabelas sensibilizadas:** --

**Campos retornados:** id, percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela parametrizacao

---

```[dbo].[KRTSP_InsParametrizacao]  - Insert parametrizacao```

**Objetivo:** Inserir um novo registro na tabela parametrizacao

**Parâmetros inseridos:** percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** parametrizacao

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdParametrizacao]  - Update parametrizacao```

**Objetivo:** Atualizar um registro na tabela parametrizacao

**Parâmetros inseridos:** id, percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioUltimaAlteracao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelParametrizacao]  - Delete parametrizacao```

**Objetivo:** Deletar um registro na tabela parametrizacao

**Parâmetros inseridos:** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok

#######################################################

## parametricaoHistorico.sql

```[dbo].[KRTSP_SelParametrizacaoHistorico]  - Select parametricaoHistorico```

**Objetivo:** Retornar um ou mais registros da tabela parametrizacaoHistorico

**Parâmetros inseridos:** --

**Tabelas acessadas:** parametricaoHistorico 

**Tabelas sensibilizadas:** --

**Campos retornados:** idParametrizacao, percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela parametrizacaoHistorico

---

```[dbo].[KRTSP_InsParametrizacaoHistorico]  - Insert parametricaoHistorico```

**Objetivo:** Inserir um novo registro na tabela parametrizacaoHistorico

**Parâmetros inseridos:** idParametrizacao, percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** parametricaoHistorico

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdParametrizacaoHistorico]  - Update parametricaoHistorico```

**Objetivo:** Atualizar um registro na tabela parametrizacaoHistorico

**Parâmetros inseridos:** id, idParametrizacao, percentualBonificacao, percentualTeto, contadorGatilho, dataValidade, usuarioUltimaAlteracao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado

#######################################################

## login.sql

```[dbo].[KRTSP_Login] - Login```

**Objetivo:** Realizar a autenticação de um usuário usando email e senha

**Parâmetros inseridos:** email, senha

**Tabelas acessadas:** usuario

**Tabelas sensibilizadas** --

**Campos retornados:** senha, dataExpiracaoSenha, dataBloqueio

**Retorno:** 0 - execução ok

---

```[dbo].[RKTSP_InsTrocaSenha] - Trocar Senha```

**Objetivo:** Trocar a senha do usuário no caso dela estar expirada ou por outro motivo. Quando a senha é trocada a dataExpiracaoSenha é atualizada para os próximos 6 meses. A senha é guardada criptografada e a comparação é feita com a senha inserida depois da criptografada.

**Parâmetros inseridos:** email, senhaAtual, novaSenha

**Tabelas acessadas:** usuario

**Tabelas sensibilizadas** --

**Campos retornados:** id, senha

**Retorno:** 0 - execução ok, 1 - email incorreto, 2 - senha atual incorreta

---

```[dbo].[KRTSP_EsqueciSenha] - Esqueci Senha```

**Objetivo:** Procedure para mudar senha. Um link de redirecionamento será mandado para o email afim de atualizar a senha.

**Parâmetros inseridos:** email, novaSenha

**Tabelas acessadas:** Nenhuma

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - email não cadastrado

---

```[dbo].[KRTSP_BloquearUsuario] - Bloquear Usuario```

**Objetivo:** Procedure para bloquear o usuário caso ele erre 3x a senha

**Parâmetros inseridos:** email, usuarioUltimaAlteracao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - email não encontrado

#######################################################

## usuario.sql

```[dbo].[KRTSP_SelUsuario] - Select usuario```

**Objetivo**: Retornar um ou mais registros da tabela usuario

**Parâmetros inseridos:** id

**Tabelas acessadas:** usuario

**Tabelas sensibilizadas:** --

**Campos retornados:** id, email, dataBloqueio, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela usuario

---

```[dbo].[KRTSP_InsUsuario] - Insert usuario```

**Objetivo:** Inserir um novo registro na tabela usuario

**Parâmetros inseridos:** email, dataBloqueio, usuarioCadastro

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** usuario

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - email de usuario já existe

---

```[dbo].[KRTSP_UpdUsuario] - Update usuario```

**Objetivo:** Atualizar um registro na tabela usuario

**Parâmetros inseridos:** id, email, usuarioUltimaAlteracao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado, 2 - email de usuario já existente

---

```[dbo].[KRTSP_DelOpcoesSistema] - Delete usuario```

**Objetivo:** Deletar um registro na tabela usuario

**Parâmetros inseridos:** id

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado, 2 - id esta sendo mencionado na tabela usuarioOpcao, 3 - id esta sendo mencionado na tabela colaborador

#######################################################

## opcoesSistema.sql

```[dbo].[KRTSP_SelOpcaoSistema] - Select opcaoSistema```

**Objetivo:** Retorna os dados da tabela 'opcoesSistema'. Retorna as opções do sistema e suas opçoes mãe, ou seja, de onde ela é derivada.

**Parâmetros inseridos:** idOpcaoMae

**Tabelas acessadas:** opcaoSistema

**Tabelas sensibilizadas:** --

**Campos retornados:** id, idOpcaoMae, descricao, usuarioCadastro

**Retorno:** select da tabela opcaoSistema

---

```[dbo].[RKTSP_InsOpcaoSistema] - Insert opcaoSistema```

**Objetivo:** Insere na tabela 'opcoesSistema' um registro de uma nova opção de sistema e se é uma opção raiz ou derivada de outra opção.

**Parâmetros inseridos:** idOpcaoMae, descricao, usuarioCadastro

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** opcaoSistema

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdOpcaoSistema] - Update opcaoSistema```

**Objetivo:** Atualiza os valores de um registro existente da tabela opcapSistema para mudar a descrição de uma opção ou se ela é opção derivada ou opção mãe usando o id do registro.

**Parâmetros inseridos:** idOpcaoMae, descricao, usuarioUltimaAlteracao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelOpcaoSistema] - Delete opcaoSistema```

**Objetivo:** Deletar um registro na tabela opcaoSistema

**Parâmetros inseridos:** id

**Tabelas acessadas:** --

**Tabelas sensibilizadas** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado, 2 - essa empresa esta sendo mencionada em notaFiscal

#######################################################

## usuarioOpcao.sql

```[dbo].[KRTSP_SelUsuarioOpcao] - Select usuarioOpcao```

**Objetivo:** Retornar um ou mais registros da tabela usuarioOpcao

**Parâmetros inseridos:** idUsuario

**Tabelas acessadas:** usuarioOpcao

**Tabelas sensibilizadas:** --

**Campos retornados:** idUsuario, isOpcaoSistema, usuarioCadastro, dataCadastro

**Retorno:** select da tabela usuarioOpcao

---

```[dbo].[RKTSP_InsUsuarioOpcao] - Insert usuarioOpcao```

**Objetivo:** Inserir um novo registro na tabela usuarioOpcao

**Parâmetros inseridos:** idUsuario, idOpcaoSistema, usuarioCadastro

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** usuarioOpcao

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_DelUsuarioOpcao] - Delete usuarioOpcao```

**Objetivo:** Deletar um registro na tabela usuarioOpcao

**Parâmetros inseridos:** idUsuario, idOpcao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não en contrado

#######################################################

## unidade.sql

```[dbo].[KRTSP_SelUnidade] - Select unidade```

**Objetivo:** Retornar um ou mais registros da tabela unidade

**Parâmetros inseridos:** nome

**Tabelas acessadas:** unidade

**Tabelas sensibilizadas:** --

**Campos retornados:** id, nome

**Retorno:** select da tabela unidade

#######################################################

## funcao.sql

```[dbo].[KRTSP_SelFuncao] - Select funcao```

**Objetivo:** Retornar um ou mais registros da tabela funcao

**Parâmetros inseridos:** id

**Tabelas acessadas:** funcao

**Tabelas sensibilizadas:** --

**Campos retornados:** id, nome, usuarioCadastrlo

**Retorno:** select da tabela funcao

#######################################################

## faixaSalarial.sql

```[dbo].[KRTSP_SelFaixaSalarial] - Select FaixaSalarial```

**Objetivo:** Retornar um ou mais registros da tabela faixaSalarial

**Parâmetros inseridos:** id

**Tabelas acessadas:** faixaSalarial

**Tabelas sensibilizadas:** --

**Campos retornados:** id, nome, valor, CLTouPJ, dataValidade, usuarioCadastro

**Retorno:** select da tabela faixaSalarial

---

```[dbo].[KRTSP_SelFaixaSalarial] - Update faixaSalarial```

**Objetivo:** Atualizar um registro na tabela faixaSalarial

**Parâmetros inseridos:** id, nome, valor, CLTouPJ, dataValidade, usuarioUltimaAlteracao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

#######################################################

CARGO SALÁRIO

#######################################################

CARGO SALARIO HISTORICO

#######################################################

## qualificacao.sql

```[dbo].[KRTSP_SelQualificacao] - Select qualificacao```

**Objetivo:** Retornar um ou mais registros da tabela qualificacao 

**Parâmetros inseridos:** idColaborador

**Tabelas acessadas:** qualificacao, colaborador, unidade, funcao, faixaSalarial

**Tabelas sensibilizadas:** --

**Campos retornados:** qualificacao.id, colaborador.nome, unidade.nome, funcao.nome, faixaSalarial.nome, qualificacao.dataInicio, qualificacao.dataFim, qualificacao.usuarioCadastro

**Retorno:** select com inner join das tabelas qualificacao + colaborador + unidade + funcao + faixaSalarial

---

```[dbo].[KRTSP_InsQualificacao] - Insert qualificacao```

**Objetivo:** Inserir um novo registro na tabela qualificacao

**Parâmetros inseridos:** idUnidade, idColaborador, idFuncao, idFaixaSalarial, dataInicio, dataFim 

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** qualificacao

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdQualificacao] - Update qualificacao```

**Objetivo:** Atualizar um registro na tabela qualificacao

**Parâmetros inseridos:** id, idUnidade, idColaborador, idFuncao, idFaixaSalarial, dataInicio, dataFim, usuarioUltimaAlteracao

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado, 2 - data inválida

---
 
```[dbo].[KRTSP_DelQualificacao] - Delete qualificacao```

**Objetivo:** Deletar um registro na tabela qualificacao

**Parâmetros inseridos:** id

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

#######################################################

## colaborador.sql

```[dbo].[KRTSP_SelColaborador] - Select colaborador```

**Objetivo:** Faz um select para mostrar todos os dados da tabela colaborador.

**Parâmetros inseridos:** id

**Tabelas acessadas:** colaborador 

**Tabelas sensibilizadas:** --

**Campos retornados:** id, idUsuario, nome, email, dataAdmissao, dataDemissao, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela colaborador

---

```[dbo].[KRTSP_InsColaborador]  - Insert colaborador```

**Objetivo:** Inserir um novo registro na tabela colaborador

**Parâmetros inseridos:** idUsuario, nome, email, dataAdmissao, dataDemissao, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** colaborador

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - email já existente

---

```[dbo].[KRTSP_UpdColaborador]  - Update colaborador```

**Objetivo:** Atualiza os colaboradores

**Parâmetros inseridos:** id, idUsuario, nome, email, dataAdmissao, usuarioUltimaAlterecao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelColaborador]  - Delete colaborador```

**Objetivo:** Deletar um registro na tabela colaborador

**Parâmetros inseridos:** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado, 2 - essa id esta sendo mencionada em qualificação, 3 - essa id esta sendo mencionada em colaboradorTelefone, 4 - essa id esta sendo mencionada em colaboradorEntrega, 5 - essa id esta sendo mencionada em documento

#######################################################

## colaboradorTelefone.sql

```[dbo].[KRTSP_SelColaboradorTelefone]  - Select colaboradorTelefone ```

**Objetivo:** Retornar um ou mais registros da tabela colaboradorTelefone

**Parâmetros inseridos:** id

**Tabelas acessadas:** colaboradorTelefone 

**Tabelas sensibilizadas:** --

**Campos retornados:** colaboradorTelefone.id, tipoTelefone.nome, colaboradorTelefone.idColaborador, colaboradorTelefone.DDD, colaboradorTelefone.numero, colaboradorTelefone.usuarioCadastro, colaboradorTelefone.dataCadastro, colaboradorTelefone.usuarioUltimaAlteracao, colaboradorTelefone.dataUltimaAlteracao

**Retorno:** select com inner join das tabelas colaboradorTelefone + tipoTelefone

---

```[dbo].[KRTSP_InsColaboradorTelefone]  - Insert colaboradorTelefone```

**Objetivo:** Inserir um novo registro na tabela colaboradorTelefone

**Parâmetros inseridos:** idTipoTelefone, idColaborador, DDD, numero, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** colaboradorTelefone

**Campos retornados:** --

**Retorno:** 0 - excução ok

---

```[dbo].[KRTSP_UpdColaboradorTelefone]  - Update colaboradorEntrega```

**Objetivo:** Atualizar um registro na tabela colaboradorTelefone

**Parâmetros inseridos:** id, idTipoTelefone, idColaborador, DDD, numero, usuarioUltimaAlteracao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado, 2 - id de tipo telefone não encontrado

---

```[dbo].[KRTSP_DelColaboradorTelefone]  - Delete colaboradorEntrega```

**Objetivo:** Deletar um registro na tabela colaboradorTelefone

**Parâmetros inseridos:** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado

#######################################################

## empresa.sql

```[dbo].[KRTSP_SelEmpresa]  - Select empresa```

**Objetivo:** Retornar um ou mais registros da tabela empresa

**Parâmetros inseridos:** id

**Tabelas acessadas:** empresa 

**Tabelas sensibilizadas:** --

**Campos retornados:** razaoSocial, nomeFantasia, CNPJ, inscricaoEstadual, inscricaoMunicipal, rua, numero, bairro, cidade, UF, CEP, usuarioCadastro, dataCadastro, usuarioUltimaAlteracao, dataUltimaAlteracao

**Retorno:** select da tabela empresa

---
```[dbo].[KRTSP_InsEmpresa]  - Insert empresa```

**Objetivo:** Inserir um novo registro na tabela empresa

**Parâmetros inseridos:** razaoSocial, nomeFantasia, CNPJ, inscricaoEstadual, inscricaoMunicipal, rua, numero, complemento, bairro, cidade, UF, CEP, usuarioCadastro

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** empresa

**Campos retornados:** --

**Retorno:** 0 - execução ok

---
```[dbo].[KRTSP_UpdEmpresa]  - Update empresa```

**Objetivo:** Atualizar um registro na tabela empresa

**Parâmetros inseridos:** id, razaoSocial, nomeFantasia, CNPJ, inscricaoEstadual, inscricaoMunicipal, rua, numero, complemento, bairro, cidade, UF, CEP, 
usuarioUltimaAlteracao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado

---
```[dbo].[KRTSP_DelEmpresa]  - Delete empresa```

**Objetivo:** Deletar um registro na tabela aprovacao

**Parâmetros inseridos:** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - excução ok, 1 - id não encontrado, 2 - essa empresa esta sendo mencionada em notaFiscal

#######################################################

## notaFiscal.sql

```[dbo].[KRTSP_SelNotaFiscal]  - Select notaFiscal```

**Objetivo:** Retornar um ou mais registros da tabela notaFiscal

**Parâmetros inseridos:** idCliente, idNota, idEmpresa, idProjeto,  idEntrega

**Tabelas acessadas:** empresa, itemNotaFiscal, entrega, projeto, preco, cliente

**Tabelas sensibilizadas:** --

**Campos retornados:** cliente.razaoSocial, notaFiscal.id, empresa.razaoSocial, notaFiscal.dataEmissao, notaFiscal.dataVencimento, notaFiscal.anoCompetencia, notaFiscal.mesCompetencia, notaFiscal.usuarioCadastro

**Retorno:** select com inner join das tabelas notaFiscal + empresa + itemNotaFiscal + entrega + projeto + preco + cliente

---

```[dbo].[KRTSP_InsNotaFiscal]  - Insert notaFiscal```

**Objetivo:** Inserir um novo registro na tabela notaFiscal

**Parâmetros inseridos:** idEmpresa, dataEmissao, dataVencimento, anoCompetencia, mesCompetencia, usuarioCadastro

**Tabelas acessadas:** --

**Tabelas sensibilizadas:** notaFiscal

**Campos retornados:** --

**Retorno:** 0 - execução ok

---

```[dbo].[KRTSP_UpdNotaFiscal]  - Update notaFiscal```

**Objetivo:** Atualizar um registro na tabela notaFiscal

**Parâmetros inseridos:** id, idEmpresa, dataEmissao, dataVencimento, anoCompetencia, mesCompetencia, usuarioUltimaAlteracao

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado

---

```[dbo].[KRTSP_DelNotaFiscal]  - Delete notaFiscal```

**Objetivo:** Deletar um registro na tabela notaFiscal

**Parâmetros inseridos:** id

**Tabelas acessadas:** -- 

**Tabelas sensibilizadas:** --

**Campos retornados:** --

**Retorno:** 0 - execução ok, 1 - id não encontrado, 2 - esse registro tem uma relação com a tabela itemNotaFiscal

#######################################################

ITEM NOTA FISCAL