#' Full text search of Elasticsearch - URI requests
#'
#' @import httr
#' @export
#'
#' @template all
#' @template searchparams
#'
#' @examples \dontrun{
#' es_search(index="twitter")
#' es_search(index="twitter", type="tweet")
#' es_search(index="twitter", type="mention")
#' es_search(index="twitter", type="tweet", q="what")
#' es_search(index="twitter", type="tweet", sort="message")
#'
#' res <- es_search(index="mran", q="snapshotDate>='2013-10-01'")
#' res$hits$total
#'
#' es_search(index="shakespeare", q="what")
#' res <- es_search(index="shakespeare", q="snapshotDate>='2013-10-01'")
#' es_search(index="shakespeare", q="createdTime>='2013-10-01'")
#' es_search(index="shakespeare", size=3, explain=TRUE)
#'
#' # Get raw data
#' es_search(index="twitter", type="tweet", raw=TRUE)
#'
#' # Curl debugging
#' library('httr')
#' es_search(index="twitter", type="tweet", callopts=verbose())
#' 
#' es_search(index="shakespeare", size=0, aggs = )
#' }

es_search <- function(index=NULL, type=NULL, raw=FALSE, callopts=list(), ...)
{
  elastic_GET(path = "_search",
              index = index,
              type = type,
              metric = NULL,
              node = NULL,
              clazz = 'elastic_search',
              raw = raw,
              callopts = callopts, ...)
}
