path_to_network_file = joinpath(_PATH_TO_CONFIG,"Network.dat")
stoichiometric_matrix = readdlm(path_to_network_file);

path_to_network_file = joinpath(_PATH_TO_CONFIG,"Atom.dat")
atom_matrix = readdlm(path_to_network_file);

S = stoichiometric_matrix
A = atom_matrix

check = transpose(A)*S
print(check)

#ended up doing the check on excel and by hand instead