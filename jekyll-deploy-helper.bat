set folder_name=sun123zxy.github.io
set branch_origin=working
set branch_publish=website
set update_log=%DATE:~0,10% %TIME:~0,5% deployed from branch %branch_origin%

echo BOTH LOCAL AND REMOTE "%branch_publish%" will be OVERRIDED by _site, continue?

pause

cd %folder_name%
  git switch %branch_origin%
  git switch %branch_publish%
  git reset HEAD^^1 --hard
  xcopy "_site" "%cd%" /S
  git add .
  git commit -m "%update_log%"
  git push -f
  git switch %branch_origin%
cd ..
echo "Done"
pause