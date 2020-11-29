set folder_name=sun123zxy.github.io
set branch_origin=working
set branch_publish=website
set update_log=%DATE:~0,10% %TIME:~0,5% deployed from branch %branch_origin%

pause

cd %folder_name%
  git switch %branch_origin%
cd ..

xcopy "%folder_name%/_site" "_site" /S

cd %folder_name%
  git switch %branch_publish%
cd ..

xcopy "_site" "%folder_name%" /S
rmdir /s _site

cd %folder_name%
git add .
git commit -m "%update_log%"
git push

git switch %branch_origin%

pause