***This was originally a fork of https://github.com/jianan0099/GTAP_MRIOT_mapping.***
 
# Construction of a multi-regional input-output table (MRIOT) based on the GTAP Data Base

The GTAP Data Base does not provide input-output tables directly. This project helps guide the construction of a multi-regional input-output table based on GTAP databases in the new data format (v7) (https://www.gtap.agecon.purdue.edu/databases/default.asp). 

The structure of the global multi-regional input–output table is shown below (example). We need to (1) use the raw data provided by the GTAP Data Base to construct the raw MRIOT with raw Z, F, and VA, and (2) balance the raw MRIOT.

![Nesting a city input–output table in a multiregional framework: a case example with the city of Bogota | Journal of Economic Structures | Full Text](https://media.springernature.com/lw685/springer-static/image/art%3A10.1186%2Fs40008-020-0185-8/MediaObjects/40008_2020_185_Fig1_HTML.png)

(Figure source: https://media.springernature.com/lw685/springer-static/image/art%3A10.1186%2Fs40008-020-0185-8/MediaObjects/40008_2020_185_Fig1_HTML.png)

### Constructing the raw MRIOT based on the GTAP data base

Raw data stored in the GTAP data base are GDX files, which can be opened and inspected in GAMS Studio (https://www.gams.com/latest/docs/T_STUDIO.html). We use basic prices in constructing the MRIOT. The GTAP data necessary to construct a MRIOT is summarized in Table 4.2 in https://www.researchgate.net/publication/352325597_Income-based_carbon_responsibility (based on the version 7.1 of the GTAP database). 

The mapping of GTAP codes between GTAP dataset versions v6 and v7 is as follows: 

| MRIOT |GTAP dataset versions v6 |GTAP dataset versions v7 |
|----------------|-------------------------------|-----------------------------|
|Domestic Z|vdfm|VDFB|
|Domestic F|vdpm|VDPB|
|Domestic F |vdgm|VDGB|
|Domestic F |vdkm|VDIB|
|Domestic F |vst|VST|
|International Z & F|vxmd|VXSB|
|International Z & F|vifm|VMFB|
|International Z & F|vims|VMSB|
|International Z & F|vipm|VMPB|
|International Z & F|vigm|VMGB|
|International Z & F|vikm|VMIB|
|Value added|vfm|EVFM|

A .gms script helps extract the required variables from the GTAP distributed GDX files and stores them as .csv in the directory named **raw_gtap_dataset**. Following https://www.tandfonline.com/doi/epdf/10.1080/09535314.2011.563234?needAccess=true&role=button and https://www.researchgate.net/publication/352325597_Income-based_carbon_responsibility, we construct the raw MRIOT based on the proportionality assumption. The function **get_raw_MRIOT()** in **contruct_mriot_from_gtap.py** is used to construct the raw MRIOT from the GTAP database.

Simplified mapping between the GTAP database and the MRIOT can be found on Page 20 in https://www.unescwa.org/sites/default/files/event/materials/introduction_to_key_data_inputs_for_global_cge_modeling.pdf.

#### Run **construct_mriot_from_gtap.py** to construct a MRIOT based on raw data from GTAP .

  ### Balancing the raw MRIOT
Following https://www.nature.com/articles/s41597-021-01023-5, we apply the RAS algorithm to balance the raw MRIOT. A simple example of the RAS algorithm can be found in https://blogs.sas.com/content/iml/2020/09/08/matrix-balancing.html. We implement the RAS algorithm in **utils.MRIOT_adjust(Z_, VA_, F_, num_comm_)**. Balanced MRIOT satisfies the following conditions:

  - $$Y_{i} = \sum_j Z_{ij} + \sum_j F_{ij} = \sum_k Z_{ki} + VA_i$$,

- $$\sum_i F_{ij} = \sum_{\text{i is located in region j}}VA_i $$.

### Saving results

Processed GTAP data (MRIOT) is stored in the directory named **processed_gtap**. **processed_gtap/adjusted_MRIOT_df.pkl** contain annual trade flows (in real millions of US dollars indexed at the GTAP base year).