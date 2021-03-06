#' Generate a list melting character (comma) separated field values into multiple
#' records
#'
#' Builds a list, melting character (comma) separated field values given a data frame
#' with a field with repeating values
#'
#' @param data data frame containing a data columns with character(comma) separated values
#' @param melt Field name with character(comma) separated values
#' @param sepchar Character separator between the data items. Default is comma
#' @return a data frame with separate records for each value in field specified
#' @examples \dontrun{
#'scnames <- c("Abrothrix longipilis", "Abrothrix jelskii")
#'syn_list <- list_itis_syn(scnames)
#'cs_syn_list <- cast_cs_field(syn_list ,"Name","Syn")
#'syn_list_new <- melt_cs_field(cs_syn_list,"Syn")
#'}
#'
#' @family List functions
#' @export
melt_cs_field <- function(data,melt,sepchar=","){
  tdata <- data
  colnames(tdata)[which(colnames(tdata) == melt)] <- 'pri'
  if(!is.null(tdata)){
    tdata$pri <- as.character(tdata$pri)
    retdat <- NULL
    for(i in 1:dim(tdata)[1]){
      crec <- tdata[i,]
      if(tdata$pri[i]!="" & !is.na(tdata$pri[i])){
        items <- strsplit(tdata$pri[i],sepchar)[[1]]
        for (j in 1:length(items)){
          addrec <- crec
          addrec$pri <- items[j]
          retdat <- rbind(retdat,addrec)
        }
      } else {
        addrec <- crec
        retdat <- rbind(retdat,addrec)
      }
    }
    retdat <- as.data.frame(retdat)
    colnames(retdat)[which(colnames(retdat) == 'pri')] <- melt
    rownames(retdat) <- NULL
    return(retdat)
  }  else {
    return(NULL)
  }
}
