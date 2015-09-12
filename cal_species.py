def read_file():
    data=open("newresult97.msm")
    count_species={}
    total_seq={}
    aaa=0
    for each_line in data:
        seq,species,identity,length,mismatch,gap,query_start,query_end,hit_start,hit_end,nonsense,score=each_line.strip().split()
        name,num=seq.split("_")
        if species not in  count_species.keys():
            count_species[species]={}
        if int(name) not in count_species[species].keys():
            count_species[species][int(name)]=0
        count_species[species][int(name)]+=1
        if int(name) not in total_seq.keys():
            total_seq[int(name)]=0
        total_seq[int(name)]+=1
        aaa+=1
    data.close()

    for k1 in count_species.keys():
        for k2 in range(1,280):
            if k2 not in count_species[k1].keys():
                count_species[k1][k2]=0

    for k3 in range(1,280):
        if k3 not in total_seq.keys():
            total_seq[k3]=0

    sort_species=sorted(count_species.items(),key=lambda (k,v):k,reverse=False)
    sort_seqs=sorted(total_seq.items(),key=lambda (k,v):k,reverse=False)

    data2=open("97_result","w")
    data2.write("Species\t")
    for k2 in range(1,280):
        data2.write("%s\t"%(k2))
    data2.write("\n")


    for k1 in range(len(sort_species)):
        # print sort_species[k1]
        data2.write("%s\t"%sort_species[k1][0])
        sorted_sample=  sorted(sort_species[k1][1].items(),key=lambda(k,v):k,reverse=False)
        # print sort_seqs
        for k2 in range(279):
            data2.write("%s\t"%sorted_sample[k2][1])
        data2.write("\n")

    data2.write("Total seqs\n")
    data2.write("%s\t"%aaa)
    for k5 in range(279):
        data2.write("%s\t"%sort_seqs[k5][1])
    data2.close()

if __name__=="__main__":
    read_file()
