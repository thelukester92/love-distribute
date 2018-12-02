#!/usr/local/bin/fish
set LOVE_VERSION 11.2

if [ (count $argv) -eq 0 ]
    echo Usage: distribute.fish [directory]
    exit
else
    set DIR $argv[1]
end

if [ (count $argv) -eq 2 ]
    set OUT $argv[2]
else
    set OUT (basename $argv[1])
end

set ROOT (dirname (realpath (status -f)))
set LOVE $ROOT/love/$LOVE_VERSION
set BIN $ROOT/bin

if [ ! -d $LOVE ]
    if not fish $ROOT/get_love.fish $LOVE_VERSION
        echo Failed to fetch LÖVE version $LOVE_VERSION!
    end
end

mkdir -p $BIN/$OUT

cd $DIR
zip -9 -q -r $BIN/$OUT/$OUT.love .

mkdir -p $BIN/$OUT/win32
cp $LOVE/win32/* $BIN/$OUT/win32
cat $BIN/$OUT/win32/love.exe $BIN/$OUT/$OUT.love > $BIN/$OUT/win32/$OUT.exe
rm $BIN/$OUT/win32/love.exe $BIN/$OUT/win32/lovec.exe
zip -9 -q $BIN/$OUT/$OUT-win32.zip $BIN/$OUT/win32/*

mkdir -p $BIN/$OUT/win64
cp $LOVE/win64/* $BIN/$OUT/win64
cat $BIN/$OUT/win64/love.exe $BIN/$OUT/$OUT.love > $BIN/$OUT/win64/$OUT.exe
rm $BIN/$OUT/win64/love.exe $BIN/$OUT/win64/lovec.exe
zip -9 -q $BIN/$OUT/$OUT-win64.zip $BIN/$OUT/win64/*

mkdir -p $BIN/$OUT/macos
cp -r $LOVE/macos/love.app $BIN/$OUT/macos/$OUT.app
cp $BIN/$OUT/$OUT.love $BIN/$OUT/macos/$OUT.app/Contents/Resources
zip -9 -q -r -y $BIN/$OUT/$OUT-macos.zip $BIN/$OUT/macos/$OUT.app
