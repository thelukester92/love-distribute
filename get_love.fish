#!/usr/local/bin/fish

if [ (count $argv) -eq 0 ]
    echo Usage: get_love.fish [version]
    exit
else
    set VERSION $argv[1]
end

set ROOT (dirname (realpath (status -f)))
mkdir -p $ROOT/love/$VERSION

curl -sL https://bitbucket.org/rude/love/downloads/love-$VERSION-win32.zip > $ROOT/love/$VERSION/win32.zip
unzip -qq $ROOT/love/$VERSION/win32.zip -d $ROOT/love/$VERSION/win32
mv $ROOT/love/$VERSION/win32/love-$VERSION.0-win32/* $ROOT/love/$VERSION/win32
rmdir $ROOT/love/$VERSION/win32/love-$VERSION.0-win32
rm $ROOT/love/$VERSION/win32.zip

curl -sL https://bitbucket.org/rude/love/downloads/love-$VERSION-win64.zip > $ROOT/love/$VERSION/win64.zip
unzip -qq $ROOT/love/$VERSION/win64.zip -d $ROOT/love/$VERSION/win64
mv $ROOT/love/$VERSION/win64/love-$VERSION.0-win64/* $ROOT/love/$VERSION/win64
rmdir $ROOT/love/$VERSION/win64/love-$VERSION.0-win64
rm $ROOT/love/$VERSION/win64.zip

curl -sL https://bitbucket.org/rude/love/downloads/love-$VERSION-macos.zip > $ROOT/love/$VERSION/macos.zip
unzip -qq $ROOT/love/$VERSION/macos.zip -d $ROOT/love/$VERSION/macos
rm $ROOT/love/$VERSION/macos.zip
