@echo off
Rem batch for buildings whells in python 3.6 - 3.9, use env dir as argument
call C:\Users\Fabio\Miniconda3\Scripts\activate.bat C:\Users\Fabio\Miniconda3
set list= cp36 cp37 cp38 cp39
(for %%e in (%list%) do (
	echo working on %%e
	call conda env create -f %1\%%e.yml
	call conda activate %%e
	call python -m pip install --upgrade build
	call python -m build
	call conda deactivate
	call conda remove --name %%e --all -y
	echo done
))