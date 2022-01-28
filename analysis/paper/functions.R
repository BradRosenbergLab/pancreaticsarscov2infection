calculate_viral_nUMIs <- function(SeuratObj, genes = viral_genes) {
  require(Matrix)
  genes_in_object <- genes[genes %in% rownames(SeuratObj)]
  if (length(genes_in_object) == 1) {
    SeuratObj@meta.data$nCount_Viral <- SeuratObj@assays$RNA@counts[genes_in_object, ]
  } else if (length(genes_in_object) == 0) {
    SeuratObj@meta.data$nCount_Viral <- rep(0)
  } else {
    SeuratObj@meta.data$nCount_Viral <- Matrix::colSums(SeuratObj@assays$RNA@counts[genes_in_object, ])
  }
  return(SeuratObj)
}

calculate_host_nUMIs <- function(SeuratObj, genes = viral_genes) {
  require(Matrix)
  host_genes <- rownames(SeuratObj)[!rownames(SeuratObj) %in% genes]
  SeuratObj$nCount_Host <- Matrix::colSums(SeuratObj@assays$RNA@counts[host_genes, ])
  return(SeuratObj)
}

add_cell_barcodes <- function(SeuratObj) {
  SeuratObj$Cell_BC <- rownames(SeuratObj@meta.data)
  return(SeuratObj)
}

calculate_viral_nFeatures <- function(SeuratObj, genes = viral_genes) {
  require(Matrix)
  SeuratObj$nFeature_Viral <- Matrix::colSums(SeuratObj@assays$RNA@counts[genes, ] > 0)
  return(SeuratObj)
}

calculate_host_nFeatures <- function(SeuratObj, genes = viral_genes) {
  require(Matrix)
  host_genes <- rownames(SeuratObj)[!rownames(SeuratObj) %in% genes]
  SeuratObj$nFeature_Host <- Matrix::colSums(SeuratObj@assays$RNA@counts[host_genes, ] > 0)
  return(SeuratObj)
}

classify_infection_status_k_medoid <- function(Seurat_Obj,
                                               genes = viral_genes,
                                               k = 2) {
  ### Exclude gRNA from viral_genes
  genes <- genes[genes != "gRNA"]
  ### Perform k medoids clustering with pam
  classification <- cluster::pam(
    x = t(Seurat_Obj@assays$RNA@scale.data[as.character(genes), ]),
    k = k,
    diss = FALSE,
    metric = "euclidean"
  )

  ### Order cluster ids with cell BC in Seurat Obj
  ordered_annotations <- match(
    names(classification$cluster),
    rownames(Seurat_Obj@meta.data)
  )

  ### Collect cluster ids per cell
  ordered_annotations <- classification$cluster[ordered_annotations]

  ### Add cluster id to Seurat Obj
  Seurat_Obj <- AddMetaData(Seurat_Obj,
    ordered_annotations,
    col.name = paste("Infection_Classification_K_Medoid",
      k,
      sep = "_"
    )
  )

  return(Seurat_Obj)
}
