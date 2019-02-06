# raw innards from Scott Chamberlain's rphylopic package


image_get <- function(uuid, options=NULL, ...) {
  
  
  args <- if (!is.null(options)) list(options = paste0(options, collapse = " ")) else list()
  path <- file.path('api/a/image', uuid)
  cli <- crul::HttpClient$new(url = pbase(), opts = list(...))
  tt <- cli$get(path = path, query = as_null(pc(args)))
  tt$raise_for_status()
  tmp <- tt$parse("UTF-8")
  x <- jsonlite::fromJSON(tmp, FALSE)
  x$result

  
  }


get_png <- function(x, ...) {

  tmp <- crul::HttpClient$new(url = pbase(), opts = list(...))
  res <- tmp$get(x)
  png::readPNG(res$content)

  }

phy_GET <- function(path, args, ...) {

}

phy_GET2 <- function(path, args, ...) {

}

ibase <- function() "http://phylopic.org/api/a/image/"
pbase <- function() "http://phylopic.org"


# from https://scrogster.wordpress.com/2014/06/02/adding-phylopic-org-silhouettes-to-r-plots/
foxurl<-"http://phylopic.org/assets/images/submissions/51b1b6e4-129d-41a6-bbbd-c3fab459c25f.1024.png"
raburl<-"http://phylopic.org/assets/images/submissions/1e15411c-5394-4a9d-a209-76c8ac0c331d.1024.png"
fox_logo <-  readPNG(getURLContent(foxurl))
rab_logo <-  readPNG(getURLContent(raburl))



