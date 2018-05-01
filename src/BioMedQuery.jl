module BioMedQuery

# --------Database Utilities---------
module DBUtils
export init_mysql_database,
       assemble_vals,
       assemble_cols_and_vals_select,
       assemble_cols_and_vals,
       assemble_cols_and_vals_string,
       insert_row!,
       db_select,
       db_query,
       db_clean_string,
       create_server,
       toDataFrames,
       dfs_to_csv

include("DBUtils/DBUtils.jl")
end

#-----------PubMed----------------
module PubMed

#types
export  PubMedArticle,
        Author,
        StructuredAbstract,
        MeshQualifier,
        MeshDescriptor,
        MedlineDate,
        MeshHeading,
        MeshHeadingList,
        PubType
include("PubMed/pubmed_article.jl")

# sql utilities
export  create_tables!,
        create_pmid_table!,
        all_pmids,
        abstracts,
        get_article_mesh,
        get_article_mesh_by_concept,
        db_insert!,
        abstracts_by_year
include("PubMed/pubmed_sql_utils.jl")

# eutils -> sql
export  save_efetch!,
        save_pmids!
include("PubMed/eutils_sql_save.jl")

# eutils -> df
export toDataFrames,
        dfs_to_csv
include("PubMed/pubmed_dataframe_utils.jl")

# citation formats
export  CitationOutput,
        citations_endnote,
        citations_bibtex,
        save_efetch!
include("PubMed/citation_manager.jl")

end


#--------Clinical Trials------------
module CT
export search_ct
include("CT/CT.jl")
end
#-----------------------------------


#--------Processes------------
module Processes
export pubmed_search_and_save!,
       pubmed_pmid_search,
       pubmed_pmid_search_and_save!,
       map_mesh_to_umls_async!,
       map_mesh_to_umls!,
       umls_semantic_occurrences,
       filter_mesh_by_concept,
       export_citation,
       load_medline
include("Processes/pubmed_search_and_save.jl")
include("Processes/pubmed_mesh_to_umls_map.jl")
include("Processes/pubmed_occurrance_filtering.jl")
include("Processes/pubmed_export_citations.jl")
include("Processes/medline_load.jl")

end
#----------------------------------- d

end #BioMedQuery
