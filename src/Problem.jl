# ----------------------------------------------------------------------------------- #
# Copyright (c) 2018 Varnerlab
# Robert Frederick Smith School of Chemical and Biomolecular Engineering
# Cornell University, Ithaca NY 14850
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ----------------------------------------------------------------------------------- #

# ----------------------------------------------------------------------------------- #
# Function: generate_problem_dictionary
# Description: Holds simulation and model parameters as key => value pairs in a Julia Dict()
# Generated on: 2018-03-15T00:00:56.939
#
# Output arguments:
# data_dictionary::Dict{AbstractString,Any} => Dictionary holding model and simulation parameters as key => value pairs
# ----------------------------------------------------------------------------------- #
function generate_problem_dictionary()

	# Load the stoichiometric network from disk -
	path_to_network_file = joinpath(_PATH_TO_CONFIG,"Network.dat")
	stoichiometric_matrix = readdlm(path_to_network_file);
	#print(stoichiometric_matrix)

	# What is the system dimension? -
	(number_of_species,number_of_reactions) = size(stoichiometric_matrix)
	#print(size(stoichiometric_matrix)) #shows 18x21 so input is good

	# Setup the flux bounds array -
	flux_bounds_array = zeros(number_of_reactions,2)
	# TODO: update the flux_bounds_array for each reaction in your network
	# TODO: col 1 => lower bound
	# TODO: col 2 => upper bound

	# Vmax [mmol/gdw-hr] v1
	flux_bounds_array[1,1] = 0
	flux_bounds_array[1,2] = 203*3600*0.01*(1/1000) #mmol/gDW-hr

	# Vmax [mmol/gdw-hr] v2
	flux_bounds_array[2,1] = 0
	flux_bounds_array[2,2] = 34.5*3600*0.01*(1/1000) #mmol/gDW-hr

	# Vmax [mmol/gdw-hr] v3
	flux_bounds_array[3,1] = 0
	flux_bounds_array[3,2] = 249*3600*0.01*(1/1000) #mmol/gDW-hr

	# Vmax [mmol/gdw-hr] v4
	flux_bounds_array[4,1] = 0
	flux_bounds_array[4,2] = 88.1*3600*0.01*(1/1000) #mmol/gDW-hr

	# Vmax [mmol/gdw-hr] v5f
	flux_bounds_array[5,1] = 0
	flux_bounds_array[5,2] = 13.7*3600*0.01*(1/1000) #mmol/gDW-hr

	# Vmax [mmol/gdw-hr] v5r
	flux_bounds_array[6,1] = 0
	flux_bounds_array[6,2] = 13.7*3600*0.01*(1/1000) #mmol/gDW-hr

	# Vmax [mmol/gdw-hr] 7
	flux_bounds_array[7,1] = 0
	flux_bounds_array[7,2] = 10

	# Vmax [mmol/gdw-hr] 8
	flux_bounds_array[8,1] = 0
	flux_bounds_array[8,2] = 10

	# Vmax [mmol/gdw-hr] 9
	flux_bounds_array[9,1] = 0
	flux_bounds_array[9,2] = 10

	# Vmax [mmol/gdw-hr] 10
	flux_bounds_array[10,1] = 0
	flux_bounds_array[10,2] = 10

	# Vmax [mmol/gdw-hr] 11
	flux_bounds_array[11,1] = 0
	flux_bounds_array[11,2] = 10

	# Vmax [mmol/gdw-hr] 12
	flux_bounds_array[12,1] = 0
	flux_bounds_array[12,2] = 10

	# Vmax [mmol/gdw-hr] 13
	flux_bounds_array[13,1] = 0
	flux_bounds_array[13,2] = 10

	# Vmax [mmol/gdw-hr] 14 H2O allow water exchange
	flux_bounds_array[14,1] = 0
	flux_bounds_array[14,2] = 10

	# Vmax [mmol/gdw-hr] 15	H2O allow water exchange
	flux_bounds_array[15,1] = 0
	flux_bounds_array[15,2] = 10

	# Vmax [mmol/gdw-hr] 16
	flux_bounds_array[16,1] = 0
	flux_bounds_array[16,2] = 10

	# Vmax [mmol/gdw-hr] 17
	flux_bounds_array[17,1] = 0
	flux_bounds_array[17,2] = 10

	# Vmax [mmol/gdw-hr] 18	
	flux_bounds_array[18,1] = 0
	flux_bounds_array[18,2] = 10

	# Vmax [mmol/gdw-hr] 19	
	flux_bounds_array[19,1] = 0
	flux_bounds_array[19,2] = 10

	# Vmax [mmol/gdw-hr] 20
	flux_bounds_array[20,1] = 0
	flux_bounds_array[20,2] = 10

	# Vmax [mmol/gdw-hr] 21	
	flux_bounds_array[21,1] = 0
	flux_bounds_array[21,2] = 10
	# TODO: each row is a reaction

	# Setup default species bounds array -
	species_bounds_array = zeros(number_of_species,2)
	# TODO: NOTE - we by default assume Sv = 0, so species_bounds_array should be a M x 2 array of zeros
	# TODO: however, if you formulate the problem differently you *may* need to change this 

	# Min/Max flag - default is minimum -
	is_minimum_flag = true

	# Setup the objective coefficient array -
	objective_coefficient_array = zeros(number_of_reactions)
	objective_coefficient_array[10] = -1
	# TODO: update me to maximize Urea production (Urea leaving the virtual box) 
	# TODO: if is_minimum_flag = true => put a -1 in the index for Urea export
	
	
	# =============================== DO NOT EDIT BELOW THIS LINE ============================== #
	data_dictionary = Dict{String,Any}()
	data_dictionary["stoichiometric_matrix"] = stoichiometric_matrix
	data_dictionary["objective_coefficient_array"] = objective_coefficient_array
	data_dictionary["flux_bounds_array"] = flux_bounds_array;
	data_dictionary["species_bounds_array"] = species_bounds_array
	data_dictionary["is_minimum_flag"] = is_minimum_flag
	data_dictionary["number_of_species"] = number_of_species
	data_dictionary["number_of_reactions"] = number_of_reactions
	# =============================== DO NOT EDIT ABOVE THIS LINE ============================== #
	return data_dictionary
end
