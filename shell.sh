#!/bin/bash
FOLDER(){
    CURRENT_FOLDER=/Users/$USER
    CHECK=1
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
    DRAW "echo \033[4m⤬ _ ⤢ ############################################################\033[24m\n$var\n##################################################################"
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
VOLTAR(){
    CHECK=0
    CURRENT_FOLDER=''
    DRAW
}
CONFIGURACOES(){
    # FORMATAÇÃO = https://misc.flogisoft.com/bash/tip_colors_and_formatting
    echo 'MUDAR A COR'
    echo '1 - Red'
    echo '2 - Green'
    echo '3 - Yellow'
    echo '4 - Blue'
    echo '5 - Magenta'
    echo '6 - Cyan'
    echo '7 - Light gray'
    echo '8 - White'
    read color
    case $color in
        1)COLOR="\033[91m";;
        2)COLOR="\033[32m";;
        3)COLOR="\033[93m";;
        4)COLOR="\033[34m";;
        5)COLOR="\033[95m";;
        6)COLOR="\033[96m";;
        7)COLOR="\033[37m";;
        8)COLOR="\033[39m";;
        *)echo "INVALIDO"
    esac
    DRAW
}
SOBRE_MIM(){
    var="\033[1mDiego Soria Rios\033[0m\nComputer Science Student\nCurious & \033[5m︎lazy\033[0m\n\n\n\n"
    DRAW "echo \033[4m⤬ _ ⤢ ############################################################\033[0m\n$var\n##################################################################"
}
DESLIGAR(){
    echo $COLOR'------------------------------------------------------------------'
    date +" ♠                       %H:%M%t%d-%m-%y"
    echo '------------------------------------------------------------------'
    echo '                            DESLIGANDO                            '
    echo '==================================================================\033[39m\n\n'
    sleep 1s
    exit 1
}
DRAW(){
    clear
    echo $COLOR'------------------------------------------------------------------'
    date +" ♠                       %H:%M%t%d-%m-%y"
    echo '------------------------------------------------------------------'
    $1
    echo '==================================================================\033[39m\n\n'
    MENU
}
MENU(){
    if [ $CHECK = 1 ]
        then
        echo '1 - Pasta inicial'
        echo '2 - Abrir pasta'
        echo '3 - Nova pasta'
        echo '4 - Remover pasta'
        echo '5 - Novo arquivo'
        echo '6 - Abrir arquivo'
        echo '7 - Remover arquivo'
        echo '8 - Voltar'
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
            8)  VOLTAR;;
            *)echo "INVALIDO"
        esac
    else
        echo '1 - Explorer'
        echo '2 - Configurações'
        echo '3 - Sobre'
        echo '4 - Desligar'
        echo 'Option: '
        read var

        case $var in
            1)FOLDER;;
            2)  CONFIGURACOES;;
            3)  SOBRE_MIM;;
            4)  DESLIGAR;;
            *)echo "INVALIDO"
        esac
    fi
}

CURRENT_FOLDER=''
CHECK=0
COLOR=''

DRAW