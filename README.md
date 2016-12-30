# Funções cPanel


## Sobre

Funções bash para aumentar a produtividade e segurança ao desenvolver scripts para ambientes cPanel, basta importar as funções no ínicio do seu script e pronto, basta utilizar ! 

Ao utilizar funções prontas e testadas você aumenta a sua produtividade pois pode focar no seu objetivo sem perder tempo escrevendo código para validar domínios, se a conta cPanel existe.... Além de deixar o código mais limpo e enxuto.

## Requerimentos


+ CentOS ou CloudLinux
+ cPanel

## Instalação

Importe o arquivo com as funções no início do seu script:

```
#!/bin/bash

curl -skL https://raw.githubusercontent.com/renanpessoa/cPanel_Functions/master/functions.sh > /tmp/funcoes_externas.sh
[[ -z `cat /tmp/funcoes_externas.sh | grep Teste_Valida` ]] && { echo -e "Não foi possível importar as funções externas.";exit;}
source /tmp/funcoes_externas.sh && rm -fr /tmp/funcoes_externas.sh;
```

Pronto, você já pode utilizar as funções disponíveis !

## Documentacão


<https://renanpessoa.github.io/>

##  Funções

  * **Validação**
    + func_valida_dominio - Valida o domínio informado
    + func_valida_usuario - Valida o usuário informado
    + func_valida_revendedor - Valida o revendedor informado
    
  * **Informação**

    
  * **Outros**
    + func_citacao_aleatoria - Exibe uma citação aleatória
