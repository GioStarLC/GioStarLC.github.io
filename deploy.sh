#! /bin/bash

cd ~/LcWorkbench/blog
# 备份hugo源文件
git add .
git commit -m "gitPush successfully from Mac"
git push origin src

# 备份静态网页
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
exit
