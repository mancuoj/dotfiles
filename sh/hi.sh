H="`date +%H`"
M="`date +%M`"
S="`date +%S`"

printf "\033[32m"
if [ $H -lt 6 ]
then
    printf "ζ»ε»η‘θ§ π‘π‘"
elif [ $H -lt 11 ]
then
    printf "δ»ε€©εζ―εζ»‘εΈζηδΈε€© π"
elif [ $H -lt 13 ]
then
    printf "δΈ­εεδΊε₯ε π"
elif [ $H -lt 18 ]
then
    printf "δΈεε°±ε«ζΈι±ΌδΊ π"
elif [ $H -lt 23 ]
then
    printf "ηδΌεΏδΉ¦ε§ π"
else
    printf "ζ»ε»η‘θ§ π‘π‘"
fi

days=$(((1671840000000-`date +%s%3N`)/1000/24/60/60))
printf " θ·η¦»θη θΏζ\033[31m $days \033[0m"
printf "\033[32mε€© πͺ\033[0m \n"

# δ»»ζδΈ­ζε°ε
curl -o ./temp 'wttr.in/ε°ε?lang=zh&1' -s
head -7 ./temp | tail -6
rm ./temp
