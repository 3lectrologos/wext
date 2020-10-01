echo "WExT k = $1"
echo "PID = $2"
PID=$2
FDATA="data_$PID.csv"
FJSON="data_$PID.json"
FWEIGHTS="weights_$PID.npy"
FRESULT="results_$PID"
CONDA_BASE=$(conda info --base)

source $CONDA_BASE/etc/profile.d/conda.sh
conda activate wext
python process_mutations.py -m $FDATA -ct NA -o $FJSON
python compute_mutation_probabilities.py -mf $FJSON -np 1000 -nc 1 -wf $FWEIGHTS -v 1
python find_sets.py -mf $FJSON -wf $FWEIGHTS -s exclusivity -k $1 -c 1 -o $FRESULT
conda deactivate
rm $FDATA $FJSON $FWEIGHTS
