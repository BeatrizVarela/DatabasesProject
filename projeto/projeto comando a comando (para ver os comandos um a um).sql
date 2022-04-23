CREATE DATABASE projeto;

CREATE TABLE tripulacao(
    ii CHAR(30) PRIMARY KEY,
    nome CHAR(30),
    idade INT(2),
    sexo CHAR(30),
    morada TEXT,
    categoria CHAR(30),
    senioridade CHAR(30)
);

CREATE TABLE pilotos(
    ii CHAR(30) PRIMARY KEY,
    horas_de_voo INT(15),
    num_de_aterragens INT(15),
    num_de_descolagens INT(15),
    num_de_licenca_de_pilotagem INT(15),
    data_de_emissao_licenca_pilotagem DATE,
    marca_de_avioes_pilotaveis CHAR(30),
    modelo_de_avioes_pilotaveis CHAR(30),
    FOREIGN KEY (ii) REFERENCES tripulacao(ii)
);

CREATE TABLE comadantes(
    ii CHAR(30) PRIMARY KEY,
    horas_em_comando INT(15),
    data_de_promocao DATE,
    FOREIGN KEY (ii) REFERENCES pilotos(ii)
);

CREATE TABLE copilotos(
    ii CHAR(30) PRIMARY KEY,
    FOREIGN KEY (ii) REFERENCES pilotos(ii)
);

CREATE TABLE pessoal_de_cabine(
    ii CHAR(30) PRIMARY KEY,
    FOREIGN KEY (ii) REFERENCES tripulacao(ii)
);

CREATE TABLE chefes_de_cabine(
    ii CHAR(30) PRIMARY KEY,
    FOREIGN KEY (ii) REFERENCES tripulacao(ii)
);

CREATE TABLE avioes(
    matricula CHAR(30) PRIMARY KEY,
    nome CHAR(30),
    marca CHAR(30),
    modelo CHAR(30),
    data_de_aquisicao DATE,
    num_de_passageiros_classe_executiva INT(5),
    num_de_passageiros_classe_turistica INT(5),
    tripulacao_requerida INT(3),
    carga_suportada INT(20),
    autonomia_milhas INT(6),
    autonomia_horas INT(4)
);

CREATE TABLE empresas(
    nome CHAR(100) PRIMARY KEY,
    data_de_entrega DATE,
    tempo_de_manutençao INT(10),
    preco_pago INT(30)
);

CREATE TABLE manutencao(
    matricula CHAR(30) NOT NULL,
    nome_empresa CHAR(100) NOT NULL,
    data_da_ultima_manutencao DATE,
    num_de_milhas_voadas INT(15),
    horas_de_voo INT(10),
    num_de_aterragens INT(10),
    relatorio_da_ult_manutencao LONGTEXT,
);

ALTER TABLE manutencao 
ADD PRIMARY KEY (matricula,nome_empresa), 
ADD FOREIGN KEY (matricula) REFERENCES avioes(matricula), 
ADD FOREIGN KEY (nome_empresa) REFERENCES empresas(nome);

CREATE TABLE trabalha_em(
    ii CHAR(30) NOT NULL,
    matricula CHAR(30) NOT NULL
);

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('123', 'Beatriz', 21, 'feminino', 'rua da rua lote 15', 'assistente de bordo', 'escalao A');

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES
('abc123', 'joao', 'Boeing', '747', '2021-01-26', 123, 123, 20, 10000000, 10000, 40);

INSERT INTO `trabalha_em` (`ii`, `matricula`) VALUES
('123', 'abc123');

CREATE TABLE rotas(
    cidade_de_inicio CHAR(30) NOT NULL,
    cidade_de_fim CHAR(30) NOT NULL,
    num_de_milhas INT(10)
);

ALTER TABLE rotas
ADD PRIMARY KEY (cidade_de_inicio,cidade_de_fim);

CREATE TABLE cumpre(
    matricula CHAR(30),
    cidade_de_inicio CHAR(30),
    cidade_de_fim CHAR(30)
);

ALTER TABLE cumpre
ADD PRIMARY KEY (matricula,cidade_de_inicio,cidade_de_fim),
ADD FOREIGN KEY (matricula) REFERENCES avioes(matricula),
ADD FOREIGN KEY (cidade_de_inicio,cidade_de_fim) REFERENCES rotas(cidade_de_inicio,cidade_de_fim);

INSERT INTO `rotas`(`cidade_de_inicio`,`cidade_de_fim`,`num_de_milhas`) VALUES ('Lisboa','Londres','1000');
INSERT INTO `cumpre`(`matricula`, `cidade_de_inicio`, `cidade_de_fim`) VALUES ('abc123','Lisboa','Londres');

CREATE TABLE escalas(
    cidade_de_inicio CHAR(30),
    cidade_de_fim CHAR(30),
    codigo_do_aeroporto CHAR(15),
    designacao_do_local CHAR(30),
    pais CHAR(30)
);

ALTER TABLE escalas
ADD PRIMARY KEY (cidade_de_inicio,cidade_de_fim),
ADD FOREIGN KEY (cidade_de_inicio,cidade_de_fim) REFERENCES rotas(cidade_de_inicio,cidade_de_fim)

INSERT INTO `rotas`(`cidade_de_inicio`,`cidade_de_fim`,`num_de_milhas`) VALUES ('Lisboa','Tokyo','5000');
INSERT INTO `escalas`(`cidade_de_inicio`, `cidade_de_fim`, `codigo_do_aeroporto`, `designacao_do_local`, `pais`) VALUES ('Lisboa','Tokyo','AMS','Amesterdão','Holanda');

CREATE TABLE voos(
    id CHAR(10),
    cidade_de_inicio CHAR(30),
    cidade_de_fim CHAR(30)
);

ALTER TABLE voos
ADD PRIMARY KEY (id,cidade_de_inicio,cidade_de_fim),
ADD FOREIGN KEY (cidade_de_inicio,cidade_de_fim) REFERENCES rotas(cidade_de_inicio,cidade_de_fim);

CREATE TABLE voos_planeados(
    id CHAR(10),
    cidade_de_inicio CHAR(30),
    cidade_de_fim CHAR(30),
    data_prevista DATE,
    hora_prevista TIME
);

ALTER TABLE voos_planeados
ADD PRIMARY KEY (id,cidade_de_inicio,cidade_de_fim),
ADD FOREIGN KEY (id) REFERENCES voos(id),
ADD FOREIGN KEY (cidade_de_inicio,cidade_de_fim) REFERENCES rotas(cidade_de_inicio,cidade_de_fim);


CREATE TABLE cancelados(
    id CHAR(10),
    cidade_de_inicio CHAR(30),
    cidade_de_fim CHAR(30),
    ii_de_quem_cancelou CHAR(30),
    razao LONGTEXT
);

ALTER TABLE cancelados
ADD PRIMARY KEY (id,cidade_de_inicio,cidade_de_fim),
ADD FOREIGN KEY (id) REFERENCES voos(id),
ADD FOREIGN KEY (cidade_de_inicio,cidade_de_fim) REFERENCES rotas(cidade_de_inicio,cidade_de_fim);

CREATE TABLE em_curso(
    id CHAR(10),
    cidade_de_inicio CHAR(30),
    cidade_de_fim CHAR(30),
    data_realizada DATE,
    hora_prevista_chegada TIME
);

ALTER TABLE em_curso
ADD PRIMARY KEY (id,cidade_de_inicio,cidade_de_fim),
ADD FOREIGN KEY (id) REFERENCES voos(id),
ADD FOREIGN KEY (cidade_de_inicio,cidade_de_fim) REFERENCES rotas(cidade_de_inicio,cidade_de_fim);

CREATE TABLE realizados(
    id CHAR(10),
    cidade_de_inicio CHAR(30),
    cidade_de_fim CHAR(30),
    data_realizada DATE,
    hora_realizada TIME
);

ALTER TABLE realizados
ADD PRIMARY KEY (id,cidade_de_inicio,cidade_de_fim),
ADD FOREIGN KEY (id) REFERENCES voos(id),
ADD FOREIGN KEY (cidade_de_inicio,cidade_de_fim) REFERENCES rotas(cidade_de_inicio,cidade_de_fim);

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES
('def456', 'Starfire', 'Airbus', 'A380', '2020-10-31', 10, 843, 50, 40700900, 50000, 90);

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES 
('ghi789', 'Long Daddy', 'Boeing', '777X', '2021-01-26', 54, 814, 68, 60900000, 70000, 110);

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES 
('jkl100', 'High Banshee', 'Embraer', '175', '2019-12-31', 25, 50, 15, 1900000, 10000, 20);

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES 
('mno101', 'Major Mosquito', 'Antonov', 'An-225', '2020-02-10', 35, 950, 110, 90900900, 900000, 200);

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES 
('pqr102', 'Proud Boomerang', 'Bombardier', 'CRJ700', '2020-03-15', 12, 22, 31, 1200000, 120000, 30);

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES 
('stu103', 'Sweet Rocket', 'Dassault', 'Falcon 20F-5', '2020-04-29', 10, 19, 30, 1100900, 110500, 30);

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES 
('vwx104', 'Mellow Mommy', 'Boeing', '777', '2019-06-09', 16, 16, 45, 1290000, 120500, 45);

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES 
('xyz105', 'Thunderlight', 'Boeing', '717', '2018-09-12', 17, 25, 35, 1300400, 130000, 55);

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES 
('aaa106', 'Evil Duchess', 'Boeing', '737NG', '2020-11-19', 18, 29, 36, 1400400, 130500, 59);

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('124', 'Miguel', 22, 'masculino', 'largo da cena nº 5', 'assistente de bordo', 'escalao A');

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('125', 'Liliana', 27, 'feminino', 'praça central nº 3', 'assistente de bordo', 'escalao A');

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('126', 'Alexandra', 24, 'feminino', 'avenida coisinha nº 452', 'assistente de bordo', 'escalao A');

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('127', 'Romeu', 23, 'masculino', 'praceta antes do pingo doce nº 6', 'assistente de bordo', 'escalao A');

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('128', 'Estevão', 24, 'masculino', 'beco de baixo nº 1', 'comandante', 'escalao A');

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('129', 'Duarte', 25, 'masculino', 'alameda da fonte luminosa', 'co-piloto', 'escalao A');

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('130', 'Teresa', 29, 'feminino', 'largo da ajuda nº 11', 'chefe de cabine', 'escalao A');

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('131', 'Rebeca', 24, 'feminino', 'avenida do outro lado nº 56', 'assistente de bordo', 'escalao A');

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('132', 'Lucien', 25, 'masculino', 'ruela estreita nº 2', 'assistente de bordo', 'escalao A');

INSERT INTO `pilotos` (`ii`,`horas_de_voo`,`num_de_aterragens`,`num_de_descolagens`,`num_de_licenca_de_pilotagem`,
`data_de_emissao_licenca_pilotagem`,`marca_de_avioes_pilotaveis`,`modelo_de_avioes_pilotaveis`) VALUES 
('128',10000,2000,2000,564213,'2010-10-20','Boeing','666'),('129',2000,100,100,753213,'2017-12-20','Boeing','666')

INSERT INTO `comadantes`(`ii`, `horas_em_comando`, `data_de_promocao`) VALUES ('128',1000,'2017-12-20') 

INSERT INTO `copilotos`(`ii`) VALUES ('129')

INSERT INTO `pessoal_de_cabine` VALUES ('123'),('124'),('125'),('126'),('127'),('130'),('131'),('132')

INSERT INTO `chefes_de_cabine`(`ii`) VALUES ('130')

INSERT INTO `trabalha_em`(`ii`, `matricula`) VALUES ('124','abc123'),('125','abc123'),('126','abc123'),
('127','abc123'),('128','abc123'),('129','abc123'),('130','abc123'),('131','abc123'),('132','abc123')

INSERT INTO `empresas`(`nome`, `data_de_entrega`, `tempo_de_manutençao`, `preco_pago`) VALUES ('Manu','2010-07-12',200,200000),
('Airmack','2012-08-22',100,204000),('Aeroburn','2017-02-01',10,2000000),('ManuAir','2020-03-12',500,1000),
('MexAir','2000-04-21',2000,20000),('Endireitamos','2005-02-27',20,100000),('NoEndi','2015-11-03',2,1),
('Manoh','2012-05-30',5000,50000),('Poi','2021-01-26',220,200),('NoJulgue','2014-04-12',570,202580)


INSERT INTO `manutencao`(`matricula`, `nome_empresa`, `data_da_ultima_manutencao`, `num_de_milhas_voadas`, `horas_de_voo`, `num_de_aterragens`, `relatorio_da_ult_manutencao`) VALUES 
('abc123','NoJulgue','2014-04-12',102412,467,2491,'tudo a postos para voar :)'),('abc123','ManuAir','2020-03-12',102412,467,2491,'tudo a não postos para voar :('),
('abc123','Endireitamos','2005-02-27',102412,467,2491,'tudo a mesmo postos para voar :))'),('abc123','NoEndi','2015-11-03',112,67,91,'tudo a mesmo não postos para voar :((')

INSERT INTO `rotas`(`cidade_de_inicio`, `cidade_de_fim`, `num_de_milhas`) VALUES ('Lisboa','Roma',20),('Lisboa','Amesterdão',200),('Lisboa','Barcelona',15),('Lisboa','Madrid',10),
('Lisboa','Nova Iorque',2000),('Lisboa','Budapeste',500),('Lisboa','Bucharest',550),('Lisboa','Dublin',30)

INSERT INTO `escalas`(`cidade_de_inicio`, `cidade_de_fim`, `codigo_do_aeroporto`, `designacao_do_local`, `pais`) VALUES ('Lisboa','Nova Iorque','STN','Londres-Stanstead','Reino Unido'),
('Lisboa','Bucharest','BER','Berlim-Bradenburg','Roménia'),('Lisboa','Dublin','LHR','Londres-Heathrow','Reino Unido'),
('Lisboa','Budapeste','ZHR','Zurique','Suiça')


INSERT INTO `voos`(`id`, `cidade_de_inicio`, `cidade_de_fim`) VALUES ('A111','Lisboa','Tokyo'),('A112','Lisboa','Roma'),
('A113','Lisboa','Roma'),('A114','Lisboa','Amesterdão'),('A115','Lisboa','Nova Iorque'),('A116','Lisboa','Dublin'),
('A117','Lisboa','Barcelona'),('A118','Lisboa','Madrid'),('A119','Lisboa','Bucharest'),('A120','Lisboa','Budapeste')

INSERT INTO `voos_em_curso`(`id`, `cidade_de_inicio`, `cidade_de_fim`, `data_realizada`, `hora_prevista_chegada`) VALUES ('A111','Lisboa','Tokyo','2020-02-20','18:30:00'),
('A115','Lisboa','Nova Iorque','2020-02-20','18:30:00'),('A119','Lisboa','Bucharest','2020-02-20','20:30:00')

INSERT INTO `voos_planeados`(`id`, `cidade_de_inicio`, `cidade_de_fim`, `data_prevista`, `hora_prevista`) VALUES ('A112','Lisboa','Roma','2021-01-20','15:00:00'),
('A117','Lisboa','Barcelona','2021-01-20','17:00:00'),('A120','Lisboa','Budapeste','2021-01-20','18:00:00')

INSERT INTO `voos_realizados`(`id`, `cidade_de_inicio`, `cidade_de_fim`, `data_realizada`, `hora_realizada`) VALUES ('A114','Lisboa','Amesterdão','2010-05-01','01:00:00'),
('A113','Lisboa','Roma','2018-02-26','02:00:00'),('A118','Lisboa','Madrid','2014-12-25','03:00:00'),
('A116','Lisboa','Dublin','2011-12-31','15:00:00')

INSERT INTO `cancelados`(`id`, `cidade_de_inicio`, `cidade_de_fim`, `ii_de_quem_cancelou`, `razao`) VALUES ('A120','Lisboa','Budapeste','123','não lhe apetecia')

INSERT INTO `empresas`(`nome`, `data_de_entrega`, `tempo_de_manutençao`, `preco_pago`) VALUES ('Própria','2021-01-27',20000,0)

INSERT INTO `manutencao`(`matricula`, `nome_empresa`, `data_da_ultima_manutencao`, `num_de_milhas_voadas`, `horas_de_voo`, `num_de_aterragens`, `relatorio_da_ult_manutencao`) VALUES ('abc123','Própria','2021-01-27',10000,1000,100,'tudo bom!')







