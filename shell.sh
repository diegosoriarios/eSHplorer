#!/bin/bash
FOLDER(){
    CURRENT_FOLDER=/Users/$USER
    cd $CURRENT_FOLDER
    DRAW ls
}
ABRIR_PASTA(){
    cd $CURRENT_FOLDER/$1
    CURRENT_FOLDER=$CURRENT_FOLDER/$1
    DRAW ls
}
CRIAR_PASTA(){
    cd $CURRENT_FOLDER
    mkdir $1
    DRAW ls
}
REMOVE_PASTA(){
    echo "Isso irá apagar todo o conteudo"
    echo "Apagar mesmo assim? [S/N]"
    read opt
    if  [ "$opt" = "S" ] || [ "$opt" = "s" ]
    then
        rm -rf $1
        DRAW ls
    else
        MENU
    fi
}
CRIA_ARQUIVO(){
    touch $1
    DRAW ls   
}
ABRIR_ARQUIVO(){
    var="$(cat $1)"
    DRAW "echo ⤬ _ ⤢ ############################################################\n$var\n##################################################################"
}
REMOVE_ARQUIVO(){
    echo "Isso irá deletar permanentemente"
    echo "Apagar mesmo assim? [S/N]"
    read opt
    if  [ "$opt" = "S" ] || [ "$opt" = "s" ]
    then
        rm $s1
        DRAW ls
    else
        MENU
    fi
}
DRAW(){
    clear
    echo '------------------------------------------------------------------'
    date +"                         %H:%M%t%d-%m-%y"
    echo '------------------------------------------------------------------'
    $1
    echo '------------------------------------------------------------------\n\n'
    MENU
}

MENU(){
    echo '1 - Pasta inicial'
    echo '2 - Abrir pasta'
    echo '3 - Nova pasta'
    echo '4 - Remover pasta'
    echo '5 - Novo arquivo'
    echo '6 - Abrir arquivo'
    echo '7 - Remover arquivo'
    echo 'Option: '
    read var

    case $var in
        1)FOLDER;;
        2)  echo "Ir para a pasta: "
            read pasta
            ABRIR_PASTA $pasta;;
        3)  echo "Digite o nome da pasta: "
            read nome
            CRIAR_PASTA $nome;;
        4)  echo "Qual pasta remover: "
            read rem_pasta
            REMOVE_PASTA $rem_pasta;;
        5)  echo "Digite o nome do arquivo e extensão: "
            read arquivo
            CRIA_ARQUIVO $arquivo;;
        6)  echo "Abrir o arquivo: "
            read opn_arquivo
            ABRIR_ARQUIVO $opn_arquivo;;
        7)  echo "Qual arquivo pra ser excluido"
            read del_arquivo
            REMOVE_ARQUIVO $del_arquivo;;
        *)echo "INVALIDO"
    esac
}

CURRENT_FOLDER=''

DRAW