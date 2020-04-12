IN=$1
OUT=$2

convert $IN \
  \( +clone  -alpha extract \
    -draw 'fill black polygon 0,0 0,15 15,0 fill white circle 15,15 15,0' \
    \( +clone -flip \) -compose Multiply -composite \
    \( +clone -flop \) -compose Multiply -composite \
  \) -alpha off -compose CopyOpacity -composite $OUT
