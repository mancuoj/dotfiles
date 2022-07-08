H="`date +%H`"
M="`date +%M`"
S="`date +%S`"

printf "\033[32m"
if [ $H -gt 6 ] && [ $H -lt 11 ]
then
    printf "今天又是充满希望的一天 😆"
elif [ $H -lt 13 ]
then
    printf "中午吃了啥呀 🍚"
elif [ $H -lt 18 ]
then
    printf "下午就别摸鱼了 🐟"
elif [ $H -lt 23 ]
then
    printf "看会儿书吧 📑"
else 
    printf "滚去睡觉 😡😡"
fi

days=$(((1671840000000-`date +%s%3N`)/1000/24/60/60))
printf " 距离考研还有\033[31m $days \033[0m"
printf "\033[32m天 💪\033[0m \n"

# 任意中文地名
curl -o ./temp 'wttr.in/地名?lang=zh&1' -s
head -7 ./temp | tail -6
rm ./temp
