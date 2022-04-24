ls -A | while read dir
do
    rm -rf "$HOME/$dir"
    ln -s "$(pwd)/$dir" "$HOME/$dir"
done