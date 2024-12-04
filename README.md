# Missão
- Possibilidade de retirar os subjects da cloud da 42
- Quando for preciso so escolher qual subject quer fazer download
- Mais tarde
	- Catalogar os subjects em categorias (c and cpp-modules)
	- Atualização ocasional de novos subjects
	- Mais tarde ser compativel com todos os tipos de pdfs

## Objetivos

#### Fazer previamente (criação do ficheiro db.txt):
- Fazer o download dos pdfs com o id no logs.txt
- Atualizar a db.txt com os valores de $ID $NAME

#### Arranjar maneira de guardar e atualizar um ficheiro na cloud com um api

#### Para o user:
- Estando o db.txt completo, sacar da cloud para local
- Executar grep \<projecto> | tail -n 1
- Fazer get request com \<antes>\<id>\<depois>
