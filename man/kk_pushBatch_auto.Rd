% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kk.R
\name{kk_pushBatch_auto}
\alias{kk_pushBatch_auto}
\title{自动推送标准答，用于自动同步}
\usage{
kk_pushBatch_auto(
  conn_kms,
  conn_r = tsda::conn_rds("rdbe"),
  app_id = "caas",
  time = 0.02
)
}
\arguments{
\item{conn_kms}{py连接}

\item{conn_r}{r连接}

\item{app_id}{程序}

\item{time}{时间间隔}
}
\value{
返回值
}
\description{
自动推送标准答，用于自动同步
}
\examples{
kk_pushBatch_auto()
}
