# raw innards from Scott Chamberlain's rphylopic package

image_get <- function(uuid, options=NULL, ...) {
  args <- if (!is.null(options)) list(options = paste0(options, collapse = " ")) else list()
  phy_GET(file.path('api/a/image', uuid), args, ...)$result
}


get_png <- function(x, ...) {
  tmp <- crul::HttpClient$new(url = pbase(), opts = list(...))
  res <- tmp$get(x)
  png::readPNG(res$content)
}

phy_GET <- function(path, args, ...) {
  tmp <- phy_GET2(path, args, ...)
  jsonlite::fromJSON(tmp, FALSE)
}

phy_GET2 <- function(path, args, ...) {
  cli <- crul::HttpClient$new(url = pbase(), opts = list(...))
  tt <- cli$get(path = path, query = as_null(pc(args)))
  tt$raise_for_status()
  tt$parse("UTF-8")
}

ibase <- function() "http://phylopic.org/api/a/image/"
pbase <- function() "http://phylopic.org"