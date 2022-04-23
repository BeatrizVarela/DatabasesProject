-- 1. 
SELECT T.nome, T.apelido
FROM tripulante T
WHERE T.id IN ( SELECT P.id
               FROM piloto P
               WHERE P.tipo = 'comandante' AND P.id IN ( SELECT V.id_comandante
                                                 FROM voo V
                                                 WHERE (V.data_partida BETWEEN '2015-10-31 00:00:00' AND '2015-11-30 23:59:59') AND V.cod_rota IN ( SELECT R.cod_rota
                                                                                                                                                 FROM rota R 
                                                                                                                                                 WHERE cod_aeroporto_fim IN (SELECT A.cod_aeroporto
                                                                                                                                                 							FROM aeroporto A
                                                                                                                                                                            WHERE A.local = 'Paris'))));

-- 2. 
SELECT V.matricula, V.nome, COUNT(V.matricula)
FROM voo V 
WHERE (V.data_partida BETWEEN '2021-01-01 00:00:00' AND '2021-12-31 23:59:59') AND (V.data_chegada BETWEEN '2021-01-01 00:00:00' AND '2021-12-31 23:59:59')
GROUP BY V.matricula

-- 3. 
SELECT V.n_voo
FROM voo V
WHERE V.id_comandante IN (SELECT P.id FROM piloto P WHERE P.id IN (SELECT T.id FROM tripulante T WHERE T.nome='Abel' AND T.apelido='Antunes')) AND V.id_copiloto IN (SELECT P.id FROM piloto P WHERE P.id IN (SELECT T.id FROM tripulante T WHERE T.nome='Carlos' AND T.apelido='Caldas'))

-- 4. 
SELECT T.nome, T.apelido, H.n_licenca, H.data_licenca, H.cod_tipo
FROM tripulante T, piloto P, habilitado H
WHERE T.id=P.id AND P.id=H.id AND P.tipo='comandante' AND  H.cod_tipo IN (SELECT TA.cod_tipo
                                                                          FROM tipoaviao TA
                                                                          WHERE TA.autonomia>500)
ORDER BY T.nome, T.apelido

--5.
SELECT T.nome, T.apelido
FROM tripulante T, piloto P
WHERE T.id=P.id AND P.id NOT IN (SELECT V.id_comandante FROM voo V WHERE V.cod_rota=12345) AND P.id NOT IN (SELECT V.id_copiloto FROM voo V WHERE V.cod_rota=12345)

--6.
SELECT V.matricula FROM voo V WHERE V.cod_rota=ALL(SELECT V.cod_rota FROM voo V)

--7. 
SELECT T.nome, T.apelido, P.n_horas_voo, P.n_aterragens
FROM tripulante T, piloto P
WHERE P.n_aterragens=P.n_descolagens AND P.tipo='copiloto' AND P.n_aterragens=(SELECT MAX(P.n_aterragens) FROM piloto P WHERE P.tipo='copiloto') AND T.id=P.id

--8. 
SELECT V.n_voo
FROM voo V
WHERE (V.cod_rota IN 
       (SELECT R.cod_rota FROM rota R WHERE R.cod_aeroporto_ini=(SELECT A.cod_aeroporto FROM aeroporto A WHERE A.local='Lisboa-Portela') AND R.cod_aeroporto_fim=(SELECT A.cod_aeroporto FROM aeroporto A WHERE A.local='Paris')))
OR (V.cod_rota IN 
    (SELECT R.cod_rota FROM rota R, escala E WHERE R.cod_rota=E.cod_rota AND E.cod_aeroporto=(SELECT A.cod_aeroporto FROM aeroporto A WHERE A.local='Paris') AND R.cod_aeroporto_ini=(SELECT A.cod_aeroporto FROM aeroporto A WHERE A.local='Lisboa-Portela')))
OR ((V.cod_rota IN 
     (SELECT R.cod_rota FROM rota R, escala E WHERE (R.cod_rota=E.cod_rota) AND (E.cod_aeroporto=(SELECT A.cod_aeroporto FROM aeroporto A WHERE A.local='Paris') AND E.n_ordem=2)))=(V.cod_rota IN 
     (SELECT R.cod_rota FROM rota R, escala E WHERE (E.cod_aeroporto=(SELECT A.cod_aeroporto FROM aeroporto A WHERE A.local='Lisboa-Portela') AND E.n_ordem=1))))

--9. 
SELECT rota.cod_rota AS Rota, rota.cod_aeroporto_ini AS Aeroporto_Partida, A_1.local AS Cidade , rota.cod_aeroporto_fim AS Aeroporto_Chegada, A_2.local AS Cidade, escala.cod_aeroporto AS Escala, A_3.local AS Cidade, escala.n_ordem AS Ordem
FROM rota
JOIN escala 
ON escala.cod_rota=rota.cod_rota AND escala.cod_aeroporto IN (SELECT aeroporto.cod_aeroporto FROM aeroporto WHERE aeroporto.local="Frankfurt" OR aeroporto.local="Madrid-Barajas")
JOIN aeroporto A_1
ON A_1.local IN (SELECT A.local FROM aeroporto A WHERE A.cod_aeroporto IN (SELECT R.cod_aeroporto_ini FROM rota R WHERE R.cod_rota IN (SELECT E.cod_rota FROM escala E WHERE E.cod_aeroporto="FRA" OR E.cod_aeroporto="MAD"))) AND A_1.cod_aeroporto=rota.cod_aeroporto_ini
JOIN aeroporto A_2
ON A_2.local IN (SELECT A.local FROM aeroporto A WHERE A.cod_aeroporto IN (SELECT R.cod_aeroporto_fim FROM rota R WHERE R.cod_rota IN (SELECT E.cod_rota FROM escala E WHERE E.cod_aeroporto="FRA" OR E.cod_aeroporto="MAD"))) AND A_2.cod_aeroporto=rota.cod_aeroporto_fim
JOIN aeroporto A_3
ON A_3.local IN (SELECT a.local FROM aeroporto A WHERE A.cod_aeroporto IN (SELECT E.cod_aeroporto FROM escala E WHERE E.cod_aeroporto="FRA" OR E.cod_aeroporto="MAD")) AND A_3.cod_aeroporto=escala.cod_aeroporto
ORDER BY rota.cod_rota, escala.n_ordem