#3d_gnome(Directory Folder)
dir.create("/mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/APRE_19")

#3d_gnome(Cluster File)
file = read.delim(file = "/mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/merged_cluster_chr8/APRE_19_cluster_chr8.bedpe",header = F)
#file_1 =  file[-c(8)]
file_o = file[order(file$V2),]
write.table(file_o,file ="/mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/APRE_19/cluster.bedpe" ,row.names = F, sep = "\t", quote = F, col.names = F)

#3d_gnome(Anchor File)
file_a = file_o
file_c =  file_a[c(1:3)]
file_d = file_a[c(4:6)]
colnames(file_c) = c("V1","V2","V3")
colnames(file_d) = c("V1","V2","V3")
file_f = rbind(file_c,file_d)
file_f$V4 = "N"
file_u = unique(file_f)
file_ao = file_u[order(file_u$V2),]
write.table(file_ao,file = "/mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/APRE_19/anchor.txt", row.names = F, sep = "\t", quote = F, col.names = F)

#3d_gnome(Segment File)
file_s  = read.delim(file = "/mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/merged_ccd_chr8/APRE_19_ccd_chr8.bed",header = F)
file_s$V3 = file_s$V2
write.table(file_s,file = "/mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/APRE_19/segment.txt", row.names=F, sep = " ", quote = F, col.names = F)

#3d_gnome(singletone)
file_sng = read.delim(file = "/mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/merged_singleton_chr8/APRE_19_Singletone_chr8.bedpe",header = F)
write.table(file_sng,file = "/mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/APRE_19/sng.bedpe",row.names = F, sep = "\t", quote = F, col.names = F)

#3d_gnome(o/p Folder)
dir.create("/mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/APRE_19/APRE_19")

#3D-gnome ..
# ./3dnome -s stg.ini -c chr8:1682860-146224351 -o /mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/H1_hESC/H1_hESC/

##hcm2txt ..
# python3 hcm2txt.py -i /mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/3dg_output/loops_chr8_1682860_146224351.hcm -m flatten -v 3
# python3 hcm2txt.py -i /mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/3dg_output/loops_chr8_1682860_146224351.hcm -m smooth -v 1000

##txt2pdp ..
# python3 xyz2pdb.py -i /mnt/raid/abhishek/abhishek_Cohesin_ChIA-PET/3dgenome_mmc/3dg_output/loops_chr8_1682860_146224351.hcm.flatten.txt
