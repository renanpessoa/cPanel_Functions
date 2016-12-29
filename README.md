Funções cPanel
===============

Sobre
-----

Funções bash para aumentar a produtividade e segurança ao desenvolver scripts para ambientes cPanel, basta importar as funções no ínicio do seu script e pronto, basta utilizar ! 

Ao utilizar funções prontas e testadas você aumenta a sua produtividade pois pode focar no seu objetivo sem perder tempo escrevendo código para validar domínios, se a conta cPanel existe.... Além de deixar o código mais limpo e enxuto.

Requerimentos
------------

+ CentOS ou CloudLinux
+ cPanel

Instalação
------------

Importe o arquivo com as funções no início do seu script:

<pre>
#!/bin/bash

curl -skL $LINK > /tmp/funcoes_externas.sh
[[ -z `cat /tmp/funcoes_externas.sh | grep Teste_Valida` ]] && { echo -e "Não foi possível importar as funções externas.";exit;}
source /tmp/funcoes_externas.sh && rm -fr /tmp/funcoes_externas.sh;
</pre>

Pronto, você já pode utilizar as funções disponíveis !

Documentação
-------------

https://renanpessoa.github.io/

