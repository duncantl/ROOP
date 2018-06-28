setClass("iSeq", list(start = "integer", end = "integer", by = "integer"))

iSeq = function(start, end, by = 1)
              new("iSeq", start = as.integer(start), end = as.integer(end), by = as.integer(by))

setMethod("length", "iSeq", function(x) (x@end - x@start)/x@by + 1)

setMethod("[", "iSeq", function(x, i, j, ...) {
                          if(i > length(x))
                              NA
                          else
                              x@start + (i-1)*x@by
    })

s1 = new("iSeq", start = 20L, end = 50L, by = 10L)

toInt = function(from) sapply(seq(1, length(from)), function(i) from[i])

setClass("sortedInt", contains = "integer")
#sortedInt = function(x) { o = order(x) ; new("sortedInt", structure(as.integer(x[o]), names = names(x)[o])) }
sortedInt = function(x) new("sortedInt", sort(x))


setIs("iSeq", "sortedInt", coerce = toInt)

# Constructor function for sortedInt
# Note that we use from as the parameter name so that we can use this in setAs directly w/o
# setAs() creating a wrapper to change the parameter name.
sortedInt = function(from) new("sortedInt", sort(as.integer(from)))

setAs("integer", "sortedInt", sortedInt)

irange =
function(x)
{
    if(!is(x, "sortedInt")) {
        message("expecting an object compatible with sortedInt, coercing to sortedInt")
        x = as(x, "sortedInt")
    }

     x[length(x)] - x[1]
}

tmp = c(2L, 1L, 5L)
irange(tmp)
irange(sortedInt(tmp))
irange(s1)

