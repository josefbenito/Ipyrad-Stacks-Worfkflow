------- ipyrad params file (v.0.9.81)-------------------------------------------
cave-beetles-with-outgroup                          ## [0] [assembly_name]: Assembly name. Used to name output directories for assembly steps
/home/tangled/tbc/cave-beetle-reruns/with-outgroups/			 ## [1] [project_dir]: Project dir (made in curdir if not present)
                               ## [2] [raw_fastq_path]: Location of raw non-demultiplexed fastq files
                               ## [3] [barcodes_path]: Location of barcodes fiel
/home/tangled/tbc/cave-beetle-reruns/with-outgroups/raw/*.fastq.gz                               ## [4] [sorted_fastq_path]: Location of demultiplexed/sorted fastq files
denovo                         ## [5] [assembly_method]: Assembly method (denovo, reference)
                               ## [6] [reference_sequence]: Location of reference sequence file
pair3rad                            ## [7] [datatype]: Datatype (see docs): rad, gbs, ddrad, etc.
ATCGG,CGATCC                         ## [8] [restriction_overhang]: Restriction overhang (cut1,) or (cut1, cut2)
5                              ## [9] [max_low_qual_bases]: Max low quality base calls (Q<20) in a read
33                             ## [10] [phred_Qscore_offset]: phred Q score offset (33 is default and very standard)
10                              ## [11] [mindepth_statistical]: Min depth for statistical base calling
10                             ## [12] [mindepth_majrule]: Min depth for majority-rule base calling
1000                          ## [13] [maxdepth]: Max cluster depth within samples
0.88                           ## [14] [clust_threshold]: Clustering threshold for de novo assembly
0                              ## [15] [max_barcode_mismatch]: Max number of allowable mismatches in barcodes
2                              ## [16] [filter_adapters]: Filter for adapters/primers (1 or 2=stricter)
35                             ## [17] [filter_min_trim_len]: Min length of reads after adapter trim
2                           ## [18] [max_alleles_consens]: Max alleles per site in consensus sequences
0.05                           ## [19] [max_Ns_consens]: Max N's (uncalled bases) in consensus
0.05                           ## [20] [max_Hs_consens]: Max Hs (heterozygotes) in consensus
8                              ## [21] [min_samples_locus]: Min # samples per locus for output
0.2                            ## [22] [max_SNPs_locus]: Max # SNPs per locus
8                              ## [23] [max_Indels_locus]: Max # of indels per locus
0.5                            ## [24] [max_shared_Hs_locus]: Max # heterozygous sites per locus
15, 0, 15, 0                     ## [25] [trim_reads]: Trim raw read edges (R1>, <R1, R2>, <R2) (see docs)
0, 0, 0, 0                     ## [26] [trim_loci]: Trim locus edges (see docs) (R1>, <R1, R2>, <R2)
*                        ## [27] [output_formats]: Output formats (see docs)
                               ## [28] [pop_assign_file]: Path to population assignment file
                               ## [29] [reference_as_filter]: Reads mapped to this reference are removed in step 3


ipyrad -p params-final.txt -s 1234567 -d -c 32 -t 4


------- Process_radtags and Denovo_map -------------------------------------------


/home/uahjbb001/stacks-2.68/process_radtags -P -p /home/uahjbb001/Cave_salamander_data -o /home/uahjbb001/Cave_salamander_RADSeq/Stacks/Analysis/Test_run7_trim70_radrags --renz-1 sphI --renz-2 ecoRI -r -c -q -t 70 --threads 15 --filter-illumina

perl /home/uahjbb001/stacks-2.68/bin/denovo_map.pl -m 3 -M 3 -n 3 -T 15 -o /home/uahjbb001/Cave_salamander_RADSeq/Stacks/Analysis/Test_run8 --popmap /home/uahjbb001/Cave_salamander_RADSeq/Stacks/Analysis/Test_run8/popmap --samples /home/uahjbb001/Cave_salamander_RADSeq/Stacks/Analysis/Test_run8 --paired

populations -P /home/uahjbb001/Cave_salamander_RADSeq/Stacks/Analysis/Test_run8 -M /home/uahjbb001/Cave_salamander_RADSeq/Stacks/Analysis/Test_run8/popmap -t 15 --vcf --structure --genepop
