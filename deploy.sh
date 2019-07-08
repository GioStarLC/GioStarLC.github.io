#! /bin/bash

cd ~/LcWorkbench/blog

git add .
git commit -m "gitPush successfully from Mac"
git push origin src

mv public public-temp
hugo
mv public-temp/.git public/
mv public-temp/CNAME public/
rm -r public-temp
cd public
git status

echo ""
echo "重要！如果不想gitPush，请按 Ctrl+C "

read -p "Enter your comment: " comment

if [ -z ${comment} ];
then
    git add .
    git commit -m "gitPush successfully from Mac"
    git push origin master

else
    git add .
    git commit -m "${comment}"
    git push origin master
fi
sleep 5

