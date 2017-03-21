echo "Enter the help path (e.g. /Applications/MATLAB_R2017a.app/help): "
read path
echo "Enter the version number (e.g. r2017a): "
read version

cp dashing.json $path
cp icon.png $path
cp post-process.go $path

pwd=$PWD
cd $path

sed -i .bak 's/VERSION/'$version'/' dashing.json
rm dashing.json.bak

dashing build

go run post-process.go

clear
echo "The docset is "$path/matlab.docset
