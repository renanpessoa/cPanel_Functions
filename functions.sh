#Teste_Valida  <-- NÃO REMOVA ESSA LINHA    

<<'INFO'

Autor: Renan Pessoa

INFO

#. Adiciona cores .#
BD="\e[1m"; # Negrito
RS="\e[0;00m"; # Reseta as cores
R1="\e[31m"; # Vermelho claro
R2="\E[1;31m"; # Vermelho escuro
Y1="\e[1;33m"; # Amarelo
G1="\e[1;32m" ; # Verde escuro
G2="\e[90m"; # Verde claro
B1="\e[1m \e[34m"; #Azul


func_valida_dominio()
{

        dominio=$1

        #. Transforma qualquer caractere em maiusculo para minusculo .#
        dominio=$(echo $dominio | tr [:upper:] [:lower:]);

        #. Caso o usuário digite um espaco em branco .#
        [[ -z "$dominio" ]] && echo -e "Não faz sentido enviar um espaço em branco..." && return 1;

        verifica_dominio=$(grep "^$dominio:" /etc/userdomains | grep -v ": nobody$");
               
        #. Se o domínio não existir entra nesse if .#
        if [[ -z "$verifica_dominio" ]];then

            echo -e "O domínio "$Y1""$dominio""$RS" não existe ou não foi encontrado.";
            return 1;

        else

            #. Se o domínio digitado for válido é retornado 0 .#
            return 0;
        fi
}


func_valida_usuario()
{
        usuario=$1

        #. Transforma qualquer caractere em maiusculo para minusculo .#
        usuario=$(echo $usuario | tr [:upper:] [:lower:]);

        #. Caso o usuário digite um espaco em branco .#
        [[ -z "$usuario" ]] && echo -e "Não faz sentido enviar um espaço em branco..." && return 1;
         
        #. Se o usuário não existir entra nesse if .#
        if [[ ! -e /var/cpanel/users/$usuario ]];then

            echo -e "O usuário "$Y1""$usuario""$RS" não existe ou não foi encontrado.";
            return 1;

        else

            #. Se o usuário digitado for válido é retornado 0 .#
            return 0;
        fi

}


func_valida_revendedor()
{
        usuario=$1

        #. Transforma qualquer caractere em maiusculo para minusculo .#
        usuario=$(echo $usuario | tr [:upper:] [:lower:]);

        #. Caso o usuário digite um espaco em branco .#
        [[ -z "$usuario" ]] && echo -e "Não faz sentido enviar um espaço em branco..." && return 1;
         
        #. Se o usuário não existir entra nesse if .#
        if [[ ! -e /var/cpanel/users/$usuario ]];then

            echo -e "O usuário "$Y1""$usuario""$RS" não existe ou não foi encontrado.";
            return 1;
        fi

        if [[ -z `cut -d: -f2 /etc/trueuserowners | grep -w "$usuario"` ]];then

             echo -e "O usuário "$Y1""$usuario""$RS" existe porém não é um revendedor.";
             return 1;
        fi

            #. Se o usuário digitado for válido é retornado 0 .#
            return 0;

}

func_citacao_aleatoria()
{

    while :;do

        #. Salva uma frase na variavel 'frase'.#
        frase=$(curl https://pensador.uol.com.br/blog.php?t=fs 2>/dev/null | cut -d'"' -f2 | sed 's/<b>//;s/<\/b>//;s/<br\/>//;s/<br\/>//;s/\./\. /');

        #. Se na frase possuir '<' o loop é executado novamente .#
        [[ ! -z  `echo "$frase" | egrep "<"` ]] && continue
        
        #. Conta a quantidade de pontos(.) .#
        contador=$(echo "$frase" | xargs -n1 | grep -c "\.");
        
        #. Se existir mais de 1 ponto o loop é executado novamente .#
        [[ $contador -gt 1 ]] && continue
        
        #. Se a frase passar nos testes acima o loop é interrompido .#
        break

    done

    #. A frase é exibida .#
    echo -e "$frase"
}


func_usuario_tamanho()
{

    usuario=$1
    
    #. Remove barra do final do usuário, se for digitado: $usuario/ .#
    usuario=$(echo "$usuario" | sed 's/\/$//')

    #. Se não for passado nenhum parâmetro .#
    if [[ -z "$usuario" ]];then
	    echo -e "Utilização: func_usuario_tamanho usuario";
	    return 1
    fi

    #. Se o diretório da conta não existir .#
    if [[ ! -e /home/$usuario ]];then
	    echo -e "O usuário informado não existe.";
	    return 1;
    fi 

    #. Salva o espaço em disco da conta a partir do cache .#
    quota_usuario=$(quota -s $usuario 2> /dev/null | awk 'NR==3' | awk '{print $2}');

    #. Se o cache da conta existir é exibido .#
    if [[ ! -z $quota_usuario ]]; then
	
	    echo -e "$quota_usuario  $usuario" | sed 's/\*//';
    else 
	    #. Se não existir cache é calculado o tamanho da conta .#
	    du -sh /home/$usuario;
    fi

}
