
--1) Targa e Marca delle Auto di cilindrata superiore a 2000 cc o di potenza superiore a 120 CV	select * from auto

SELECT	Targa, Marca 
 FROM	[AUTO] 
WHERE	(Cilindrata > 2000 OR Potenza > 120) 

--2)Nome del proprietario e Targa delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV	
SELECT		A.Targa, A.Marca, P.Nome
 FROM		[AUTO] A 
INNER JOIN	Proprietari P
 ON			A.CodF = P.CodF 
WHERE		(A.Cilindrata > 2000 OR A.Potenza > 120)
--3) Targa e Nome del proprietario delle Auto di cilindrata superiore a 2000 cc oppure di potenza superiore a 120 CV, assicurate presso la “SARA”
SELECT		A.Targa, P.Nome
 FROM		[AUTO]	A  
INNER JOIN	Proprietari P 
 ON			A.CodF = P.CodF
INNER JOIN	Assicurazioni ASS 
 ON			ASS.CodAss = A.CodAss
WHERE		(A.Cilindrata > 2000 OR A.Potenza > 120) 
AND ASS.Nome = 'SARA'
--4) Targa e Nome del proprietario delle Auto assicurate presso la “SARA” e coinvolte in sinistri il 20/01/02	

SELECT		A.Targa, P.Nome
 FROM		AUTO A 
INNER JOIN	Proprietari P 
  ON		A.CodF = P.CodF
INNER JOIN	Assicurazioni ASS 
  ON		ASS.CodAss = A.CodAss
INNER JOIN	Autocoinvolte AC 
  ON		AC.Targa = A.Targa
INNER JOIN	Sinistri S ON S.CodS = AC.CodS 
WHERE		ASS.Nome = 'SARA'
 AND		S.Data = '2002-01-20'
--5) Per ciascuna Assicurazione, il nome, la sede ed il numero di auto assicurate		
SELECT		ASS.Nome, ASS.Sede, Count(A.CodAss) as NumeroAuto
 FROM		[AUTO] A 
INNER JOIN	ASSICURAZIONI ASS 
  ON		ASS.CodAss = A.CodAss 
GROUP BY	A.CodAss ,ASS.Nome,ASS.Sede
--6) Per ciascuna auto “Fiat”, la targa dell’auto ed il numero di sinistri in cui è stata coinvolta		

SELECT		A.Targa, Count(AC.CodS) NumeroSinistri
 FROM		[AUTO] A 
INNER JOIN	AUTOCOINVOLTE AC 
 ON			AC.Targa = A.Targa
WHERE		A.Marca = 'Fiat'
GROUP BY	A.Targa

--7) Per ciascuna auto coinvolta in più di un sinistro, la targa dell’auto, il nome dell’Assicurazione, ed il totale dei danni riportati	

SELECT		A.TARGA, (SELECT Nome FROM ASSICURAZIONI WHERE CodASS = A.CodAss) as NomeAssicurazione, SUM(AC.ImportoDelDanno)
 FROM		AUTOCOINVOLTE AC 
INNER JOIN	[AUTO] A 
  ON		A.Targa = AC.Targa
GROUP BY	A.TARGA,A.codass
 HAVING		Count(A.Targa) > 1
 
--8) CodF e Nome di coloro che possiedono più di un’auto	

SELECT		P.CodF, P.Nome
 FROM		PROPRIETARI P 
INNER JOIN  [AUTO] A 
 ON			A.CodF = P.CodF
GROUP BY	P.CodF, P.Nome
HAVING		Count(P.CodF) > 1 
--9) La targa delle auto che non sono state coinvolte in sinistri dopo il 20/01/01		

SELECT	A.Targa
 FROM	[AUTO] A 
WHERE	A.Targa 
NOT IN 
		      (
					SELECT		AC.TARGA 
					 FROM		AUTOCOINVOLTE AC 
		            INNER JOIN	SINISTRI S 
					  ON		(S.CodS = AC.CodS AND S.Data > '2001-01-01')
			  )
--10) Il codice dei sinistri in cui non sono state coinvolte auto con cilindrata inferiore a 2000 cc	
SELECT	CodS
FROM	AUTOCOINVOLTE
WHERE	CodS 
NOT IN(
   		 SELECT				CodS
   		  FROM				AUTOCOINVOLTE AC 
   		 LEFT OUTER JOIN	[AUTO] A 
   		  ON				A.Targa = AC.Targa 
   		 WHERE				A.Cilindrata < 2000
      )


