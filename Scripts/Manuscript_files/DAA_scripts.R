##------------------------------------
# Make heatmap
##------------------------------------

make_heatmap <- function(res,
                        counts,
                        samples,
                        SAMPLE_ID_VAR,
                        MYCOLORS,
                        VARS,
                        SIG_THRESH,
                        FC_THRESH,
                        BM_THRESH
                        ){


    sig_genes <- data.frame(res) %>% 
        filter(baseMean > BM_THRESH & padj < SIG_THRESH & abs(log2FoldChange) > FC_THRESH) %>%
        rownames()

    length(sig_genes)

    ##---------------------
    # Prepare count matrix and normalize
    mat <- counts[sig_genes,]

    ##---------------------
    # Prepare meta data and colors for annotations
    anno = samples[match(colnames(mat),samples[[SAMPLE_ID_VAR]]),] %>% 
        dplyr::select(all_of(VARS))
    rownames(anno) = colnames(mat)

    mycolors <- MYCOLORS

    color = colorRampPalette(c("#a31621","white","#023E8A"))(50)

    breaksList = seq(-3, 3, length = 51)

    mat <- t(scale(t(mat)))

    ##---------------------
    # Plot
    heatmap_plt <- pheatmap(mat,
                 # Colors
                 col=color,
                 breaks=breaksList, 
                 annotation_col=anno,
                 annotation_colors=mycolors,
                  na_col = "#FFFFFF",

                 # Fonts
                 show_colnames=F,
                 show_rownames=F,
                 fontsize=12,
                 fontsize_col=3,
                 annotation_names_col=F,
                 annotation_names_row=F,

                 # Clustering
                 clustering_distance_cols="correlation",
                 clustering_distance_rows="correlation", 
                 treeheight_row=0,
                 treeheight_col= 15,

                 # Misc.
                 border_color=NA,
                 legend=TRUE,
                 annotation_legend=TRUE)    
    return(heatmap_plt)
    }