for f in *.pdf
do
  echo "converting - $f"
  convert $f -define pdf:use-cropbox=true -density 300 $f.png
done