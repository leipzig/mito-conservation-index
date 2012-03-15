loci := 10_ND2 19_CO2 22_ATP6 25_ND3 28_ND4 33_ND6 6_ND1 16_CO1 21_ATP8 23_CO3 27_ND4L 32_ND5 35_CYTB
MSAs := $(addsuffix .fa,$(addprefix 39MSAs/,$(loci)))
tabs := $(addsuffix .txt,$(addprefix CI_tables/,$(loci)))

tabs : $(tabs)

CI_tables/%.txt : 39MSAs/%.fa
	echo "filename=\"$<\";outfile=\"$@\";source(\"create_CI_tables.R\");" | R --vanilla

CI_tables/all.txt : $(tabs)
	perl -e 'print "loci\tcommon\taa_pos\tof39\n"' > $@
	cat $+ | grep -v loci >> $@
