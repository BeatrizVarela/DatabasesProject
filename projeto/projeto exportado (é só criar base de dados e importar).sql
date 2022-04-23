-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28-Jan-2021 às 11:11
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avioes`
--

CREATE TABLE `avioes` (
  `matricula` char(30) NOT NULL,
  `nome` char(30) DEFAULT NULL,
  `marca` char(30) DEFAULT NULL,
  `modelo` char(30) DEFAULT NULL,
  `data_de_aquisicao` date DEFAULT NULL,
  `num_de_passageiros_classe_executiva` int(5) DEFAULT NULL,
  `num_de_passageiros_classe_turistica` int(5) DEFAULT NULL,
  `tripulacao_requerida` int(3) DEFAULT NULL,
  `carga_suportada` int(20) DEFAULT NULL,
  `autonomia_milhas` int(6) DEFAULT NULL,
  `autonomia_horas` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `avioes`
--

INSERT INTO `avioes` (`matricula`, `nome`, `marca`, `modelo`, `data_de_aquisicao`, `num_de_passageiros_classe_executiva`, `num_de_passageiros_classe_turistica`, `tripulacao_requerida`, `carga_suportada`, `autonomia_milhas`, `autonomia_horas`) VALUES
('aaa106', 'Evil Duchess', 'Boeing', '737NG', '2020-11-19', 18, 29, 36, 1400400, 130500, 59),
('abc123', 'joao', 'Boeing', '747', '2021-01-26', 123, 123, 20, 10000000, 10000, 40),
('def456', 'Starfire', 'Airbus', 'A380', '2020-10-31', 10, 843, 50, 40700900, 50000, 90),
('ghi789', 'Long Daddy', 'Boeing', '777X', '2021-01-26', 54, 814, 68, 60900000, 70000, 110),
('jkl100', 'High Banshee', 'Embraer', '175', '2019-12-31', 25, 50, 15, 1900000, 10000, 20),
('mno101', 'Major Mosquito', 'Antonov', 'An-225', '2020-02-10', 35, 950, 110, 90900900, 900000, 200),
('pqr102', 'Proud Boomerang', 'Bombardier', 'CRJ700', '2020-03-15', 12, 22, 31, 1200000, 120000, 30),
('stu103', 'Sweet Rocket', 'Dassault', 'Falcon 20F-5', '2020-04-29', 10, 19, 30, 1100900, 110500, 30),
('vwx104', 'Mellow Mommy', 'Boeing', '777', '2019-06-09', 16, 16, 45, 1290000, 120500, 45),
('xyz105', 'Thunderlight', 'Boeing', '717', '2018-09-12', 17, 25, 35, 1300400, 130000, 55);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cancelados`
--

CREATE TABLE `cancelados` (
  `id` char(10) NOT NULL,
  `cidade_de_inicio` char(30) NOT NULL,
  `cidade_de_fim` char(30) NOT NULL,
  `ii_de_quem_cancelou` char(30) DEFAULT NULL,
  `razao` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cancelados`
--

INSERT INTO `cancelados` (`id`, `cidade_de_inicio`, `cidade_de_fim`, `ii_de_quem_cancelou`, `razao`) VALUES
('A120', 'Lisboa', 'Budapeste', '123', 'não lhe apetecia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `chefes_de_cabine`
--

CREATE TABLE `chefes_de_cabine` (
  `ii` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `chefes_de_cabine`
--

INSERT INTO `chefes_de_cabine` (`ii`) VALUES
('130');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comadantes`
--

CREATE TABLE `comadantes` (
  `ii` char(30) NOT NULL,
  `horas_em_comando` int(15) DEFAULT NULL,
  `data_de_promocao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `comadantes`
--

INSERT INTO `comadantes` (`ii`, `horas_em_comando`, `data_de_promocao`) VALUES
('128', 1000, '2017-12-20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `copilotos`
--

CREATE TABLE `copilotos` (
  `ii` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `copilotos`
--

INSERT INTO `copilotos` (`ii`) VALUES
('129');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cumpre`
--

CREATE TABLE `cumpre` (
  `matricula` char(30) NOT NULL,
  `cidade_de_inicio` char(30) NOT NULL,
  `cidade_de_fim` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cumpre`
--

INSERT INTO `cumpre` (`matricula`, `cidade_de_inicio`, `cidade_de_fim`) VALUES
('abc123', 'Lisboa', 'Barcelona'),
('abc123', 'Lisboa', 'Bucharest'),
('abc123', 'Lisboa', 'Dublin'),
('abc123', 'Lisboa', 'Londres'),
('abc123', 'Lisboa', 'Madrid'),
('abc123', 'Lisboa', 'Nova Iorque');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresas`
--

CREATE TABLE `empresas` (
  `nome` char(100) NOT NULL,
  `data_de_entrega` date DEFAULT NULL,
  `tempo_de_manutençao` int(10) DEFAULT NULL,
  `preco_pago` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `empresas`
--

INSERT INTO `empresas` (`nome`, `data_de_entrega`, `tempo_de_manutençao`, `preco_pago`) VALUES
('Aeroburn', '2017-02-01', 10, 2000000),
('Airmack', '2012-08-22', 100, 204000),
('Endireitamos', '2005-02-27', 20, 100000),
('Manoh', '2012-05-30', 5000, 50000),
('Manu', '2010-07-12', 200, 200000),
('ManuAir', '2020-03-12', 500, 1000),
('MexAir', '2000-04-21', 2000, 20000),
('NoEndi', '2015-11-03', 2, 1),
('NoJulgue', '2014-04-12', 570, 202580),
('Poi', '2021-01-26', 220, 200),
('Própria', '2021-01-27', 20000, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `escalas`
--

CREATE TABLE `escalas` (
  `cidade_de_inicio` char(30) NOT NULL,
  `cidade_de_fim` char(30) NOT NULL,
  `codigo_do_aeroporto` char(15) DEFAULT NULL,
  `designacao_do_local` char(30) DEFAULT NULL,
  `pais` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `escalas`
--

INSERT INTO `escalas` (`cidade_de_inicio`, `cidade_de_fim`, `codigo_do_aeroporto`, `designacao_do_local`, `pais`) VALUES
('Lisboa', 'Bucharest', 'BER', 'Berlim-Bradenburg', 'Roménia'),
('Lisboa', 'Budapeste', 'ZHR', 'Zurique', 'Suiça'),
('Lisboa', 'Dublin', 'LHR', 'Londres-Heathrow', 'Reino Unido'),
('Lisboa', 'Nova Iorque', 'STN', 'Londres-Stanstead', 'Reino Unido'),
('Lisboa', 'Tokyo', 'AMS', 'Amesterdão', 'Holanda');

-- --------------------------------------------------------

--
-- Estrutura da tabela `manutencao`
--

CREATE TABLE `manutencao` (
  `matricula` char(30) NOT NULL,
  `nome_empresa` char(100) NOT NULL,
  `data_da_ultima_manutencao` date DEFAULT NULL,
  `num_de_milhas_voadas` int(15) DEFAULT NULL,
  `horas_de_voo` int(10) DEFAULT NULL,
  `num_de_aterragens` int(10) DEFAULT NULL,
  `relatorio_da_ult_manutencao` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `manutencao`
--

INSERT INTO `manutencao` (`matricula`, `nome_empresa`, `data_da_ultima_manutencao`, `num_de_milhas_voadas`, `horas_de_voo`, `num_de_aterragens`, `relatorio_da_ult_manutencao`) VALUES
('abc123', 'Endireitamos', '2005-02-27', 102412, 467, 2491, 'tudo a mesmo postos para voar :))'),
('abc123', 'ManuAir', '2020-03-12', 102412, 467, 2491, 'tudo a não postos para voar :('),
('abc123', 'NoEndi', '2015-11-03', 112, 67, 91, 'tudo a mesmo não postos para voar :(('),
('abc123', 'NoJulgue', '2014-04-12', 102412, 467, 2491, 'tudo a postos para voar :)'),
('abc123', 'Própria', '2021-01-27', 10000, 1000, 100, 'tudo bom!');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoal_de_cabine`
--

CREATE TABLE `pessoal_de_cabine` (
  `ii` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pessoal_de_cabine`
--

INSERT INTO `pessoal_de_cabine` (`ii`) VALUES
('123'),
('124'),
('125'),
('126'),
('127'),
('130'),
('131'),
('132');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pilotos`
--

CREATE TABLE `pilotos` (
  `ii` char(30) NOT NULL,
  `horas_de_voo` int(15) DEFAULT NULL,
  `num_de_aterragens` int(15) DEFAULT NULL,
  `num_de_descolagens` int(15) DEFAULT NULL,
  `num_de_licenca_de_pilotagem` int(15) DEFAULT NULL,
  `data_de_emissao_licenca_pilotagem` date DEFAULT NULL,
  `marca_de_avioes_pilotaveis` char(30) DEFAULT NULL,
  `modelo_de_avioes_pilotaveis` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pilotos`
--

INSERT INTO `pilotos` (`ii`, `horas_de_voo`, `num_de_aterragens`, `num_de_descolagens`, `num_de_licenca_de_pilotagem`, `data_de_emissao_licenca_pilotagem`, `marca_de_avioes_pilotaveis`, `modelo_de_avioes_pilotaveis`) VALUES
('128', 10000, 2000, 2000, 564213, '2010-10-20', 'Boeing', '666'),
('129', 2000, 100, 100, 753213, '2017-12-20', 'Boeing', '666');

-- --------------------------------------------------------

--
-- Estrutura da tabela `rotas`
--

CREATE TABLE `rotas` (
  `cidade_de_inicio` char(30) NOT NULL,
  `cidade_de_fim` char(30) NOT NULL,
  `num_de_milhas` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `rotas`
--

INSERT INTO `rotas` (`cidade_de_inicio`, `cidade_de_fim`, `num_de_milhas`) VALUES
('Lisboa', 'Amesterdão', 200),
('Lisboa', 'Barcelona', 15),
('Lisboa', 'Bucharest', 550),
('Lisboa', 'Budapeste', 500),
('Lisboa', 'Dublin', 30),
('Lisboa', 'Londres', 1000),
('Lisboa', 'Madrid', 10),
('Lisboa', 'Nova Iorque', 2000),
('Lisboa', 'Roma', 20),
('Lisboa', 'Tokyo', 5000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `trabalha_em`
--

CREATE TABLE `trabalha_em` (
  `ii` char(30) NOT NULL,
  `matricula` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `trabalha_em`
--

INSERT INTO `trabalha_em` (`ii`, `matricula`) VALUES
('123', 'abc123'),
('124', 'abc123'),
('125', 'abc123'),
('126', 'abc123'),
('127', 'abc123'),
('128', 'abc123'),
('129', 'abc123'),
('130', 'abc123'),
('131', 'abc123'),
('132', 'abc123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tripulacao`
--

CREATE TABLE `tripulacao` (
  `ii` char(30) NOT NULL,
  `nome` char(30) DEFAULT NULL,
  `idade` int(2) DEFAULT NULL,
  `sexo` char(30) DEFAULT NULL,
  `morada` text DEFAULT NULL,
  `categoria` char(30) DEFAULT NULL,
  `senioridade` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tripulacao`
--

INSERT INTO `tripulacao` (`ii`, `nome`, `idade`, `sexo`, `morada`, `categoria`, `senioridade`) VALUES
('123', 'Beatriz', 21, 'feminino', 'rua da rua lote 15', 'assistente de bordo', 'escalao A'),
('124', 'Miguel', 22, 'masculino', 'largo da cena nº 5', 'assistente de bordo', 'escalao A'),
('125', 'Liliana', 27, 'feminino', 'praça central nº 3', 'assistente de bordo', 'escalao A'),
('126', 'Alexandra', 24, 'feminino', 'avenida coisinha nº 452', 'assistente de bordo', 'escalao A'),
('127', 'Romeu', 23, 'masculino', 'praceta antes do pingo doce nº 6', 'assistente de bordo', 'escalao A'),
('128', 'Estevão', 24, 'masculino', 'beco de baixo nº 1', 'comandante', 'escalao A'),
('129', 'Duarte', 25, 'masculino', 'alameda da fonte luminosa', 'co-piloto', 'escalao A'),
('130', 'Teresa', 29, 'feminino', 'largo da ajuda nº 11', 'chefe de cabine', 'escalao A'),
('131', 'Rebeca', 24, 'feminino', 'avenida do outro lado nº 56', 'assistente de bordo', 'escalao A'),
('132', 'Lucien', 25, 'masculino', 'ruela estreita nº 2', 'assistente de bordo', 'escalao A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voos`
--

CREATE TABLE `voos` (
  `id` char(10) NOT NULL,
  `cidade_de_inicio` char(30) NOT NULL,
  `cidade_de_fim` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `voos`
--

INSERT INTO `voos` (`id`, `cidade_de_inicio`, `cidade_de_fim`) VALUES
('A111', 'Lisboa', 'Tokyo'),
('A112', 'Lisboa', 'Roma'),
('A113', 'Lisboa', 'Roma'),
('A114', 'Lisboa', 'Amesterdão'),
('A115', 'Lisboa', 'Nova Iorque'),
('A116', 'Lisboa', 'Dublin'),
('A117', 'Lisboa', 'Barcelona'),
('A118', 'Lisboa', 'Madrid'),
('A119', 'Lisboa', 'Bucharest'),
('A120', 'Lisboa', 'Budapeste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voos_em_curso`
--

CREATE TABLE `voos_em_curso` (
  `id` char(10) NOT NULL,
  `cidade_de_inicio` char(30) NOT NULL,
  `cidade_de_fim` char(30) NOT NULL,
  `data_realizada` date DEFAULT NULL,
  `hora_prevista_chegada` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `voos_em_curso`
--

INSERT INTO `voos_em_curso` (`id`, `cidade_de_inicio`, `cidade_de_fim`, `data_realizada`, `hora_prevista_chegada`) VALUES
('A111', 'Lisboa', 'Tokyo', '2020-02-20', '18:30:00'),
('A115', 'Lisboa', 'Nova Iorque', '2020-02-20', '18:30:00'),
('A119', 'Lisboa', 'Bucharest', '2020-02-20', '20:30:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voos_planeados`
--

CREATE TABLE `voos_planeados` (
  `id` char(10) NOT NULL,
  `cidade_de_inicio` char(30) NOT NULL,
  `cidade_de_fim` char(30) NOT NULL,
  `data_prevista` date DEFAULT NULL,
  `hora_prevista` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `voos_planeados`
--

INSERT INTO `voos_planeados` (`id`, `cidade_de_inicio`, `cidade_de_fim`, `data_prevista`, `hora_prevista`) VALUES
('A112', 'Lisboa', 'Roma', '2021-01-20', '15:00:00'),
('A117', 'Lisboa', 'Barcelona', '2021-01-20', '17:00:00'),
('A120', 'Lisboa', 'Budapeste', '2021-01-20', '18:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voos_realizados`
--

CREATE TABLE `voos_realizados` (
  `id` char(10) NOT NULL,
  `cidade_de_inicio` char(30) NOT NULL,
  `cidade_de_fim` char(30) NOT NULL,
  `data_realizada` date DEFAULT NULL,
  `hora_realizada` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `voos_realizados`
--

INSERT INTO `voos_realizados` (`id`, `cidade_de_inicio`, `cidade_de_fim`, `data_realizada`, `hora_realizada`) VALUES
('A113', 'Lisboa', 'Roma', '2018-02-26', '02:00:00'),
('A114', 'Lisboa', 'Amesterdão', '2010-05-01', '01:00:00'),
('A116', 'Lisboa', 'Dublin', '2011-12-31', '15:00:00'),
('A118', 'Lisboa', 'Madrid', '2014-12-25', '03:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avioes`
--
ALTER TABLE `avioes`
  ADD PRIMARY KEY (`matricula`);

--
-- Índices para tabela `cancelados`
--
ALTER TABLE `cancelados`
  ADD PRIMARY KEY (`id`,`cidade_de_inicio`,`cidade_de_fim`),
  ADD KEY `cidade_de_inicio` (`cidade_de_inicio`,`cidade_de_fim`);

--
-- Índices para tabela `chefes_de_cabine`
--
ALTER TABLE `chefes_de_cabine`
  ADD PRIMARY KEY (`ii`);

--
-- Índices para tabela `comadantes`
--
ALTER TABLE `comadantes`
  ADD PRIMARY KEY (`ii`);

--
-- Índices para tabela `copilotos`
--
ALTER TABLE `copilotos`
  ADD PRIMARY KEY (`ii`);

--
-- Índices para tabela `cumpre`
--
ALTER TABLE `cumpre`
  ADD PRIMARY KEY (`matricula`,`cidade_de_inicio`,`cidade_de_fim`),
  ADD KEY `cidade_de_inicio` (`cidade_de_inicio`,`cidade_de_fim`);

--
-- Índices para tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`nome`);

--
-- Índices para tabela `escalas`
--
ALTER TABLE `escalas`
  ADD PRIMARY KEY (`cidade_de_inicio`,`cidade_de_fim`);

--
-- Índices para tabela `manutencao`
--
ALTER TABLE `manutencao`
  ADD PRIMARY KEY (`matricula`,`nome_empresa`),
  ADD KEY `nome_empresa` (`nome_empresa`);

--
-- Índices para tabela `pessoal_de_cabine`
--
ALTER TABLE `pessoal_de_cabine`
  ADD PRIMARY KEY (`ii`);

--
-- Índices para tabela `pilotos`
--
ALTER TABLE `pilotos`
  ADD PRIMARY KEY (`ii`);

--
-- Índices para tabela `rotas`
--
ALTER TABLE `rotas`
  ADD PRIMARY KEY (`cidade_de_inicio`,`cidade_de_fim`);

--
-- Índices para tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD PRIMARY KEY (`matricula`,`ii`),
  ADD KEY `ii` (`ii`);

--
-- Índices para tabela `tripulacao`
--
ALTER TABLE `tripulacao`
  ADD PRIMARY KEY (`ii`);

--
-- Índices para tabela `voos`
--
ALTER TABLE `voos`
  ADD PRIMARY KEY (`id`,`cidade_de_inicio`,`cidade_de_fim`),
  ADD KEY `cidade_de_inicio` (`cidade_de_inicio`,`cidade_de_fim`);

--
-- Índices para tabela `voos_em_curso`
--
ALTER TABLE `voos_em_curso`
  ADD PRIMARY KEY (`id`,`cidade_de_inicio`,`cidade_de_fim`),
  ADD KEY `cidade_de_inicio` (`cidade_de_inicio`,`cidade_de_fim`);

--
-- Índices para tabela `voos_planeados`
--
ALTER TABLE `voos_planeados`
  ADD PRIMARY KEY (`id`,`cidade_de_inicio`,`cidade_de_fim`),
  ADD KEY `cidade_de_inicio` (`cidade_de_inicio`,`cidade_de_fim`);

--
-- Índices para tabela `voos_realizados`
--
ALTER TABLE `voos_realizados`
  ADD PRIMARY KEY (`id`,`cidade_de_inicio`,`cidade_de_fim`),
  ADD KEY `cidade_de_inicio` (`cidade_de_inicio`,`cidade_de_fim`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cancelados`
--
ALTER TABLE `cancelados`
  ADD CONSTRAINT `cancelados_ibfk_1` FOREIGN KEY (`id`) REFERENCES `voos` (`id`),
  ADD CONSTRAINT `cancelados_ibfk_2` FOREIGN KEY (`cidade_de_inicio`,`cidade_de_fim`) REFERENCES `rotas` (`cidade_de_inicio`, `cidade_de_fim`);

--
-- Limitadores para a tabela `chefes_de_cabine`
--
ALTER TABLE `chefes_de_cabine`
  ADD CONSTRAINT `chefes_de_cabine_ibfk_1` FOREIGN KEY (`ii`) REFERENCES `pessoal_de_cabine` (`ii`);

--
-- Limitadores para a tabela `comadantes`
--
ALTER TABLE `comadantes`
  ADD CONSTRAINT `comadantes_ibfk_1` FOREIGN KEY (`ii`) REFERENCES `pilotos` (`ii`);

--
-- Limitadores para a tabela `copilotos`
--
ALTER TABLE `copilotos`
  ADD CONSTRAINT `copilotos_ibfk_1` FOREIGN KEY (`ii`) REFERENCES `pilotos` (`ii`);

--
-- Limitadores para a tabela `cumpre`
--
ALTER TABLE `cumpre`
  ADD CONSTRAINT `cumpre_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `avioes` (`matricula`),
  ADD CONSTRAINT `cumpre_ibfk_2` FOREIGN KEY (`cidade_de_inicio`,`cidade_de_fim`) REFERENCES `rotas` (`cidade_de_inicio`, `cidade_de_fim`);

--
-- Limitadores para a tabela `escalas`
--
ALTER TABLE `escalas`
  ADD CONSTRAINT `escalas_ibfk_1` FOREIGN KEY (`cidade_de_inicio`,`cidade_de_fim`) REFERENCES `rotas` (`cidade_de_inicio`, `cidade_de_fim`);

--
-- Limitadores para a tabela `manutencao`
--
ALTER TABLE `manutencao`
  ADD CONSTRAINT `manutencao_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `avioes` (`matricula`),
  ADD CONSTRAINT `manutencao_ibfk_2` FOREIGN KEY (`nome_empresa`) REFERENCES `empresas` (`nome`);

--
-- Limitadores para a tabela `pessoal_de_cabine`
--
ALTER TABLE `pessoal_de_cabine`
  ADD CONSTRAINT `pessoal_de_cabine_ibfk_1` FOREIGN KEY (`ii`) REFERENCES `tripulacao` (`ii`);

--
-- Limitadores para a tabela `pilotos`
--
ALTER TABLE `pilotos`
  ADD CONSTRAINT `pilotos_ibfk_1` FOREIGN KEY (`ii`) REFERENCES `tripulacao` (`ii`);

--
-- Limitadores para a tabela `trabalha_em`
--
ALTER TABLE `trabalha_em`
  ADD CONSTRAINT `trabalha_em_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `avioes` (`matricula`),
  ADD CONSTRAINT `trabalha_em_ibfk_2` FOREIGN KEY (`ii`) REFERENCES `tripulacao` (`ii`);

--
-- Limitadores para a tabela `voos`
--
ALTER TABLE `voos`
  ADD CONSTRAINT `voos_ibfk_1` FOREIGN KEY (`cidade_de_inicio`,`cidade_de_fim`) REFERENCES `rotas` (`cidade_de_inicio`, `cidade_de_fim`);

--
-- Limitadores para a tabela `voos_em_curso`
--
ALTER TABLE `voos_em_curso`
  ADD CONSTRAINT `voos_em_curso_ibfk_1` FOREIGN KEY (`id`) REFERENCES `voos` (`id`),
  ADD CONSTRAINT `voos_em_curso_ibfk_2` FOREIGN KEY (`cidade_de_inicio`,`cidade_de_fim`) REFERENCES `rotas` (`cidade_de_inicio`, `cidade_de_fim`);

--
-- Limitadores para a tabela `voos_planeados`
--
ALTER TABLE `voos_planeados`
  ADD CONSTRAINT `voos_planeados_ibfk_1` FOREIGN KEY (`id`) REFERENCES `voos` (`id`),
  ADD CONSTRAINT `voos_planeados_ibfk_2` FOREIGN KEY (`cidade_de_inicio`,`cidade_de_fim`) REFERENCES `rotas` (`cidade_de_inicio`, `cidade_de_fim`);

--
-- Limitadores para a tabela `voos_realizados`
--
ALTER TABLE `voos_realizados`
  ADD CONSTRAINT `voos_realizados_ibfk_1` FOREIGN KEY (`id`) REFERENCES `voos` (`id`),
  ADD CONSTRAINT `voos_realizados_ibfk_2` FOREIGN KEY (`cidade_de_inicio`,`cidade_de_fim`) REFERENCES `rotas` (`cidade_de_inicio`, `cidade_de_fim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
