#require(httr)
#require(jsonlite)
#require(utils)


SkyServer.sqlSearch  <- function(sql,limit="10", token=NULL, dataRelease=NULL)
{

  if(is.null(dataRelease)){
    url=paste(Config.SkyServerWSurl, '/', Config.DataRelease, "/SkyServerWS/SearchTools/SqlSearch?", sep="")
  }else{
    url=paste(Config.SkyServerWSurl, '/', dataRelease, "/SkyServerWS/SearchTools/SqlSearch?", sep="")
  }
  url = paste(url,"format=csv&",sep="")
  url = paste(url,"cmd=",sql,"&",sep="")
  if(!is.null(limit)) {
    url = paste(url,"limit=",limit,"&",sep="")
  }
  url = URLencode(url)
  
  if(is.null(token)) {
    r= GET(url,accept("text/plain"))
  } else {
    r= GET(url,accept("text/plain"),add_headers('X-Auth-Token'=token))
  }
  if(r$status_code != 200) {
    stop(paste("Http Response returned status code ", r$status_code, ": ",  content(r, as="text", encoding="UTF-8")))
  } else {
    t=read.csv(textConnection(content(r, encoding="UTF-8")), comment.char = "#")
    return(t)
  }

}


SkyServer.getJpegImgCutout  <- function(ra, dec, scale=0.7, width=512, height=512, opt="", query="", token = NULL, dataRelease=NULL)
{
  
  if(is.null(dataRelease)){
    url = paste(Config.SkyServerWSurl, '/', Config.DataRelease, "/SkyServerWS/ImgCutout/getjpeg?", sep="")
  }else{
    url = paste(Config.SkyServerWSurl, '/', dataRelease, "/SkyServerWS/ImgCutout/getjpeg?", sep="")
  }
  url = paste(url,"ra=",ra,"&",sep="")
  url = paste(url,"dec=",dec,"&",sep="")
  url = paste(url,"scale=",scale,"&",sep="")
  url = paste(url,"width=",width,"&",sep="")
  url = paste(url,"height=",height,"&",sep="")
  url = paste(url,"opt=",opt,"&",sep="")
  url = paste(url,"query=",query,"&",sep="")
  
  url = URLencode(url)
  
  if(is.null(token)) {
    r= GET(url,accept("text/plain"))
  } else {
    r= GET(url,accept("text/plain"),add_headers('X-Auth-Token'=token))
  }
  if(r$status_code != 200) {
    stop(paste("Http Response returned status code ", r$status_code, ": ",  content(r, as="text", encoding="UTF-8")))
  } else {
    sdssImage = content(r)
    return(sdssImage)
  }
}

SkyServer.radialSearch  <- function(ra, dec, radius=1, coordType="equatorial", whichPhotometry="optical", limit="10", token=NULL, dataRelease=NULL)
{
  
  if(is.null(dataRelease)){
    url=paste(Config.SkyServerWSurl, '/', Config.DataRelease, "/SkyServerWS/SearchTools/RadialSearch?", sep="")
  }else{
    url=paste(Config.SkyServerWSurl, '/', dataRelease, "/SkyServerWS/SearchTools/RadialSearch?", sep="")
  }
  url = paste(url,"format=csv&",sep="")
  url = paste(url,"ra=",ra,"&",sep="")
  url = paste(url,"dec=",dec,"&",sep="")
  url = paste(url,"radius=",radius,"&",sep="")
  url = paste(url,"coordtype=",coordType,"&",sep="")
  url = paste(url,"whichphotometry=",whichPhotometry,"&",sep="")
  if(!is.null(limit)) {
    url = paste(url,"limit=",limit,"&",sep="")
  }
  url = URLencode(url)
  
  if(is.null(token)) {
    r= GET(url,accept("text/plain"))
  } else {
    r= GET(url,accept("text/plain"),add_headers('X-Auth-Token'=token))
  }
  if(r$status_code != 200) {
    stop(paste("Http Response returned status code ", r$status_code, ": ",  content(r, as="text", encoding="UTF-8")))
  } else {
    t=read.csv(textConnection(content(r, encoding="UTF-8")), comment.char = "#")
    return(t)
  }
}

SkyServer.rectangularSearch  <- function(min_ra, max_ra, min_dec, max_dec, coordType="equatorial", whichPhotometry="optical", limit="10", token=NULL, dataRelease=NULL)
{
  
  if(is.null(dataRelease)){
    url=paste(Config.SkyServerWSurl, '/', Config.DataRelease, "/SkyServerWS/SearchTools/RectangularSearch?", sep="")
  }else{
    url=paste(Config.SkyServerWSurl, '/', dataRelease, "/SkyServerWS/SearchTools/RectangularSearch?", sep="")
  }
  url = paste(url,"format=csv&",sep="")
  url = paste(url,"min_ra=",min_ra,"&",sep="")
  url = paste(url,"max_ra=",max_ra,"&",sep="")
  url = paste(url,"min_dec=",min_dec,"&",sep="")
  url = paste(url,"max_dec=",max_dec,"&",sep="")
  url = paste(url,"coordtype=",coordType,"&",sep="")
  url = paste(url,"whichphotometry=",whichPhotometry,"&",sep="")
  if(!is.null(limit)) {
    url = paste(url,"limit=",limit,"&",sep="")
  }
  url = URLencode(url)
  
  if(is.null(token)) {
    r= GET(url,accept("text/plain"))
  } else {
    r= GET(url,accept("text/plain"),add_headers('X-Auth-Token'=token))
  }
  if(r$status_code != 200) {
    stop(paste("Http Response returned status code ", r$status_code, ": ",  content(r, as="text", encoding="UTF-8")))
  } else {
    t=read.csv(textConnection(content(r, encoding="UTF-8")), comment.char = "#")
    return(t)
  }
}

SkyServer.objectSearch  <- function(objId=NULL, specObjId=NULL, apogee_id=NULL, apstar_id=NULL, ra=NULL, dec=NULL, plate=NULL, mjd=NULL, fiber=NULL, run=NULL, rerun=NULL, camcol=NULL, field=NULL, obj=NULL, token=NULL, dataRelease=NULL)
{
  
  if(is.null(dataRelease)){
    url=paste(Config.SkyServerWSurl, '/', Config.DataRelease, "/SkyServerWS/SearchTools/ObjectSearch?query=loadexplore&format=json&", sep="")
  }else{
    url=paste(Config.SkyServerWSurl, '/', dataRelease, "/SkyServerWS/SearchTools/ObjectSearch?query=loadexplore&format=json&", sep="")
  }
  if(!is.null(objId)){
    url = url + 'objid=' + toString(objId) + '&'
  }
  if(!is.null(specObjId)){
    url = url + 'specobjid=' + toString(specObjId) + '&'
  }
  if(!is.null(apogee_id)){
    url = url + 'apid=' + toString(apogee_id) + '&'
  }else{
    if(!is.null(apstar_id)){
      url = url + 'apid=' + toString(apstar_id) + '&'
    }
  }
  if(!is.null(ra)){
    url = paste(url,"ra=", toString(ra) , "&", sep="")
  }
  if(!is.null(dec)){
    url = paste(url,"dec=" , toString(dec)  , "&", sep="")
  }
  if(!is.null(plate)){
    url = paste(url,"plate=" , toString(plate)  , "&", sep="")
  }
  if(!is.null(mjd)){
    url = paste(url,"mjd=" , toString(mjd)  , "&", sep="")
  }
  if(!is.null(fiber)){
    url = paste(url,"fiber=" , toString(fiber)  , "&", sep="")
  }
  if(!is.null(run)){
    url = paste(url,"run=" , toString(run)  , "&", sep="")
  }
  if(!is.null(rerun)){
    url = paste(url,"rerun=" , toString(rerun)  , "&", sep="")
  }
  if(!is.null(camcol)){
    url = paste(url,"camcol=" , toString(camcol)  , "&", sep="")
  }
  if(!is.null(field)){
    url = paste(url,"field=" , toString(field)  , "&", sep="")
  }
  if(!is.null(obj)){
    url = paste(url,"obj=" , toString(obj)  , "&", sep="")
  }
  url = URLencode(url)
  if(is.null(token)) {
    r= GET(url,accept("text/plain"))
  } else {
    r= GET(url,accept("text/plain"),add_headers('X-Auth-Token'=token))
  }
  if(r$status_code != 200) {
    stop(paste("Http Response returned status code ", r$status_code, ": ",  content(r, as="text", encoding="UTF-8")))
  } else {
    return(content(r))
  }
}

