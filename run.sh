CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate wext
python process_mutations.py -m data.csv -ct NA -o data.json
python compute_mutation_probabilities.py -mf data.json -np 1000 -nc 6 -wf weights.npy -v 1
python find_sets.py -mf data.json -wf weights.npy -s exclusivity -k 4 -c 6 -o results
conda deactivate
