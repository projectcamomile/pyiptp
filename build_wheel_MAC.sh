#!/bin/sh
__conda_setup="$('/Users/idina/Desktop/fabio/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/idina/Desktop/fabio/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/idina/Desktop/fabio/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/idina/Desktop/fabio/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup

OK_STATUS=0
if [ $# -eq 1 ]
then
	ENV_DIR=$1
else
	ENV_DIR="./py_envs/posix"
	echo "Env directory set to $ENV_DIR"
fi
for CONDA_ENV in "cp36" "cp37" "cp38" "cp39"
do 
	echo working on $CONDA_ENV
	conda env create -f "$ENV_DIR/$CONDA_ENV.yml"
	if [ $? -ne 0 ]
	then
		echo "Conda env creation failed with exit status: $?"
		OK_STATUS=1
		break
	fi
	conda activate $CONDA_ENV
	python -m pip install --upgrade build
	python -m build
	conda deactivate
	conda remove --name $CONDA_ENV --all -y
	echo done
done
exit $OK_STATUS
