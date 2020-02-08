#!/bin/bash

# virtualenv_dir
if [ "${BASH_ARGC}" != "1" ]
then
  virtualenv_dir="__"
else
  virtualenv_dir="${BASH_ARGV[0]}"
fi

the_basename=`basename \`pwd\``

echo "\033[1;33m[INFO]\033[m virtualenv_dir: ${virtualenv_dir} the_basename: ${the_basename}"

# virtualenv
if [ ! -d ${virtualenv_dir} ]
then
  echo "\033[1;33m[INFO]\033[m no ${virtualenv_dir}. will create one"
  virtualenv -p `which python3` --prompt="[${the_basename}] " "${virtualenv_dir}"
fi

source ${virtualenv_dir}/bin/activate
the_python_path=`which python`
echo "\033[1;33m[INFO]\033[m python: ${the_python_path}"

echo "\033[1;33m[INFO]\033[m current_dir: "
pwd

# cp all to current dir
rm -rf .cc/.git*
ln -s .cc/scripts ./

# post setup - git

# gitignore
if [ ! -f .gitignore ]
then
    echo "/${virtualenv_dir}" >> .gitignore
fi

# requirements-dev.txt
echo "\033[1;33m[INFO]\033[m requirements-dev:"
if [ ! -f requirements-dev.txt ]
then
    cp .cc/requirements-dev.txt requirements-dev.txt
fi
pip install -r requirements-dev.txt

# project_dev
echo "\033[1;33m[INFO]\033[m to init project"
./scripts/project_dev.sh

# git init
echo "\033[1;33m[INFO]\033[m to git init"
git init; git add .; git commit -m "init dev"

# done
echo "\033[1;33m[INFO]\033[m done"
