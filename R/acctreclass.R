#' 核算维度_重分类更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteChe_acctreclass()
deleteChe_acctreclass<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("Delete from rds_hrv_src_md_acctreclass_input Where FNumber in(select FNumber from rds_hrv_src_md_acctreclass)")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}
#' 核算维度_重分类更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' insertChe_acctreclass()
insertChe_acctreclass <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("Insert into rds_hrv_src_md_acctreclass
    Select * from rds_hrv_src_md_acctreclass_input ")

  res=tsda::sql_insert2(token = token,sql_str = sql)
  return(res)

}

#' 核算维度_重分类更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteAllche_acctreclass()
deleteAllche_acctreclass <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("truncate table rds_hrv_src_md_acctreclass_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}
