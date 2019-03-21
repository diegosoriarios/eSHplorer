#!/bin/bash
FOLDER(){
    CURRENT_FOLDER=/Users/$USER
    CHECK=1
    cd $CURRENT_FOLDER
    DRAW ls
}
ABRIR_PASTA(){
    if [ -d "$CURRENT_FOLDER/$1" ]; then
        cd $CURRENT_FOLDER/$1
        CURRENT_FOLDER=$CURRENT_FOLDER/$1
        DRAW ls
    else
        cd $CURRENT_FOLDER
        DRAW ls
    fi
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
    DRAW "cat $1"
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
RENOMEAR(){
    mv $1 $2
    DRAW ls
}
VOLTAR(){
    CHECK=0
    CURRENT_FOLDER=''
    DRAW
}
COPIAR(){
    cp $1 $2
    DRAW ls
}
MOVER(){
    mv $1 $2
    DRAW ls
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
    clear
    chars="/-\|"
    COUNT=0

    while [ $COUNT -lt 3 ]; do
        for(( i=0; i<${#chars}; i++ )); do
            sleep 0.5
            clear
            echo $COLOR $CLINES
            date +" </>                            %H:%M%t%d-%m-%y"
            echo $CLINES "\n"
            echo "                                  DESLIGANDO                             <${chars:$i:1}>" "\r"
            echo "\n"$CEQUAL '\033[39m\n\n'
        done
        ((COUNT++))
    done
    sleep 1s
    clear
    exit 1
}
DRAW(){
    clear
    echo $COLOR $CLINES
    date +" </>                            %H:%M%t%d-%m-%y"
    echo $CLINES
    $1
    echo "\n"$CEQUAL '\033[39m\n\n'
    MENU
}
MENU(){
    if [ $CHECK = 1 ]
        then
        echo '0 - Voltar\t\t1 - Pasta inicial'
        echo '2 - Abrir pasta\t\t3 - Nova pasta'
        echo '4 - Remover pasta\t5 - Novo arquivo'
        echo '6 - Abrir arquivo\t7 - Remover arquivo'
        echo '8 - Renomear arquivo\t9 - Copiar'
        echo '10 - Copiar'
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
            8)  echo "Qual arquivo/pasta renomear"
                read arq_ini
                echo "Digite o novo nome"
                read arq_novo
                RENOMEAR_ARQUIVO $arq_ini $arq_novo;;
            9)  echo "Digite o nome do arquivo/pasta para copiar"
                read copy
                echo "Digite o diretório para ser copiado"
                read copy_dir
                COPIAR $copy $copy_dir;;
            10) echo "Digite o nome do arquivo/pasta para copiar"
                read move
                echo "Digite o diretório para ser copiado"
                read move_dir
                MOVER $move $move_dir;;
            0)  VOLTAR;;
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
CLINES=''
CEQUAL=''
COLUMNS="tput cols"
for(( i=0; i<80; i++ )); do
    NEW='-'
    CLINES="$CLINES$NEW"
done
for(( i=0; i<80; i++ )); do
    NEWE='='
    CEQUAL="$CEQUAL$NEWE"
done
DRAW